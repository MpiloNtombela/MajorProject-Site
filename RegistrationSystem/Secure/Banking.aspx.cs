using Microsoft.AspNet.Identity;
using RegistrationSystem.DataAccess;
using RegistrationSystem.DataAccess.Repos;
using RegistrationSystem.Utills;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistrationSystem.Secure
{
    public partial class Banking : System.Web.UI.Page
    {
        private IExtrasRepo _extrasRepo;
        private IStudentRepo _studentRepo;

        public Banking(IExtrasRepo extrasRepo, IStudentRepo studentRepo)
        {
            _extrasRepo = extrasRepo;
            _studentRepo = studentRepo;
        }

        public DataAccess.StudentDetail Student { get; set; }
        public BankDetail BankDetail { get; set; }
        public IEnumerable<PaymentPlan> PaymentPlans { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            Student = _studentRepo.GetStudentDetail(userId: User.Identity.GetUserId());
            if (Student == null)
            {
                Response.Redirect("/Student/Registration");
            }

            BankDetail = _extrasRepo.GetBankDetails(studentId: Student.StudentID);
            PaymentPlans = _extrasRepo.GetPaymentPlans();
            if (BankDetail != null)
            {
                Response.Redirect("/Student/Details?md=BankExist");
            }
        }

        protected void RegisterBtn_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                if (Utills.Validators.IsValidDigits(CardNumber.Text))
                {
                    if (DateTime.TryParseExact($"01/{ExpiryDate.Text.Trim()}", "dd/MM/yy", CultureInfo.InvariantCulture,
                        DateTimeStyles.None, out DateTime date))
                    {
                        if (date >= DateTime.Now.AddMonths(6))
                        {
                            BankDetail detail = new BankDetail
                            {
                                BankName = Bank.SelectedValue,
                                CardHolder = CardHolder.Text?.Trim(),
                                CardNumber = CardNumber.Text?.Trim(),
                                Cvc = Cvc.Text?.Trim(),
                                ExpiryDate = date,
                                StudentID = Student.StudentID
                            };
                            _extrasRepo.AddBankingDetails(detail);
                            try
                            {
                                _extrasRepo.SaveChanges();
                                DataAccess.Registration registration =
                                    _studentRepo.GetRegistration(studentId: Student.StudentID);
                                if (registration != null)
                                {
                                    registration.PaymentPlanID = GetSelectedPaymentPlan(PaymentPlan).PaymentTitle;
                                    _studentRepo.SaveChanges();
                                }

                                Notification n1 = new Notification
                                {
                                    UserId = Student.Id,
                                    Trash = false,
                                    Title = "Banking Details",
                                    Message = "You have successfully added your banking details",
                                    Seen = false,
                                    Timestamp = DateTime.Now,
                                    Url = "/Student/Details/Bank"
                                };
                                _extrasRepo.SendNotification(n1);
                                _extrasRepo.SaveChanges();
                                Response.Redirect("/Student/Details?ms=BankDetailsSuccess");
                            }
                            catch (Exception ex)
                            {
                                ErrorField.Value = Helpers.GetErrorMessage(ex);
                            }
                        }
                        else
                        {
                            ErrorField.Value =
                                $"Can't use a card that has expired or expire within the next 6 months {date:dd/mm/yyyy}";
                        }
                    }
                }
                else
                {
                    ErrorField.Value = $"{CardNumber.Text} is not valid card number";
                }
            }
        }

        private PaymentPlan GetSelectedPaymentPlan(DropDownList plans)
        {
            if (Helpers.NotNull(plans.SelectedValue))
            {
                DataAccess.PaymentPlan paymentPlan = _extrasRepo.GetPaymentPlans()
                    .FirstOrDefault(plan => plan.PaymentTitle == plans.SelectedValue);
                if (paymentPlan != null)
                {
                    return paymentPlan;
                }
                else
                {
                    throw new InvalidOperationException("Selected payment plan is invalid!");
                }
            }
            else
            {
                throw new ArgumentNullException("Please choose a payment plan!");
            }
        }
    }
}