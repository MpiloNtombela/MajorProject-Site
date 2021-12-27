using Microsoft.AspNet.Identity;
using RegistrationSystem.DataAccess;
using RegistrationSystem.DataAccess.Repos;
using RegistrationSystem.Utills;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistrationSystem.Secure
{
    public partial class Payment : System.Web.UI.Page
    {
        private IStudentRepo _studentRepo;
        private IExtrasRepo _extrasRepo;
        public Payment(IStudentRepo studentRepo, IExtrasRepo extrasRepo)
        {
            _studentRepo = studentRepo;
            _extrasRepo = extrasRepo;
        }

        public DataAccess.StudentDetail Student { get; set; }
        public DataAccess.Registration Registration { get; set; }
        public DataAccess.BankDetail Bank { get; set; }
        public DataAccess.PaymentPlan Plan { get; set; }

        public decimal Total { get; set; }
        public decimal MonthlyFee { get; set; }
        private bool _complete = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            Student = _studentRepo.GetStudentDetail(userId: User.Identity.GetUserId());
            if (Student == null)
            {
                Response.Redirect("/");
            }
            Registration = _studentRepo.GetRegistration(studentId: Student.StudentID);
            Bank = _extrasRepo.GetBankDetails(Student.StudentID);
            if (Registration == null)
            {
                Response.Redirect("/Student/Registration");
            }
            else
            {
                if (!Registration.IsApproved)
                {
                    Response.Redirect("/Student");
                }
                if (Bank == null)
                {
                    Response.Redirect("/Secure/Banking");
                }
                MonthlyFee = GetFee();
                Total = GetTotal();
                if (Utills.Validators.PaymentRequired(Registration))
                {
                    NoPaymentDue.Visible = false;
                    PaymentDue.Visible = true;
                    if (Registration.PaymentCycle > 1)
                    {
                        RegFee.Visible = false;
                    }
                    else
                    {
                        RegFee.Visible = true;
                    }
                }
                else
                {
                    PaymentDue.Visible = false;
                    NoPaymentDue.Visible = true;
                }
            }
        }

        public decimal GetTotal()
        {
            decimal total;
            if (Registration.PaymentCycle <= 1)
            {
                total = GetFee() + 500;
            }
            else
            {
                total = GetFee();
            }
            return total;
        }

        public decimal GetFee()
        {
            if (Registration.AmountDue - Registration.AmountPayed < 1)
            {
                return Registration.AmountDue - Registration.AmountPayed;
            }
            else
            {
                return Registration.AmountDue / Registration.PaymentPlan.PaymentLength;
            }
        }

        protected void PayNowBtn_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                using (DbContextTransaction transaction = _studentRepo.DbTransaction())
                {
                    try
                    {
                        Registration = _studentRepo.GetRegistration(studentId: Student.StudentID);
                        if (Registration.PaymentCycle <= 1)
                        {
                            DataAccess.Payment regPayment = new DataAccess.Payment
                            {
                                RegistrationID = Registration.RegistrationID,
                                Amount = 500,
                                PaymentDecription = "Initial Registration Fee",
                                PaymentDate = DateTime.Now,
                                Success = true,
                            };
                            _studentRepo.MakePayment(regPayment);
                            _studentRepo.SaveChanges();
                        }
                        DataAccess.Payment payment = new DataAccess.Payment
                        {
                            RegistrationID = Registration.RegistrationID,
                            Amount = Registration.AmountDue - Registration.AmountPayed > 1 ? GetFee() : Registration.AmountDue - Registration.AmountPayed,
                            PaymentDecription = $"Tuition fee payment {Registration.PaymentCycle} of {Registration.PaymentPlan.PaymentLength}",
                            PaymentDate = DateTime.Now,
                            Success = true
                        };
                        _studentRepo.MakePayment(payment);
                        DataAccess.Registration registration = _studentRepo.GetRegistration(studentId: Student.StudentID);
                        registration.PaymentCycle += 1;
                        registration.NextPayment = DateTime.Now.AddMonths(1);
                        registration.AmountPayed += GetFee();
                        _studentRepo.SaveChanges();
                        transaction.Commit();
                        _complete = true;
                    }
                    catch (Exception ex)
                    {
                        _complete = false;
                        ErrorField.Value = Helpers.NotNull(ex.Message) ? Helpers.GetErrorMessage(ex) : "Payment process failed";
                        transaction.Rollback();
                    }
                }

                if (!_complete)
                {
                    return;
                }

                Notification notification = new DataAccess.Notification
                {
                    UserId = Student.Id,
                    Trash = false,
                    Title = "Payment captured",
                    Message = $"A payment of {GetFee():C} was paid for you tuition",
                    Seen = false,
                    Timestamp = DateTime.Now,
                    Url = "/Student/Details/Payments"
                };
                _extrasRepo.SendNotification(notification);
                _extrasRepo.SaveChanges();
                Response.Redirect("/Student/Details?ms=PaySuccess");
            }
            else
            {
                ErrorField.Value = "Request validation failed";
            }
        }
    }
}