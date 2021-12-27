using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using RegistrationSystem.DataAccess.Repos;
using RegistrationSystem.DataTransferObject;
using RegistrationSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistrationSystem.Student.Details
{
    public partial class Payments : System.Web.UI.Page
    {
        private IStudentRepo _studentRepo;
        private IExtrasRepo _extrasRepo;

        public Payments(IStudentRepo studentRepo, IExtrasRepo extrasRepo)
        {
            _studentRepo = studentRepo;
            _extrasRepo = extrasRepo;
        }

        public IEnumerable<PaymentDto> PaymentRecs { get; set; }
        public ApplicationUser CurrentUser { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            DataAccess.Student student = _studentRepo.GetStudent(userId: User.Identity.GetUserId());
            CurrentUser = manager.FindById(User.Identity.GetUserId());

            if (student == null)
            {
                Response.Redirect("/Student");
            }
            else
            {
                PaymentRecs = _studentRepo.GetPayments(studentId: student.StudentID).Select(pay => new PaymentDto
                {
                    PaymentId = pay.PaymentID,
                    Amount = pay.Amount,
                    PaymentDescription = pay.PaymentDecription,
                    PaymentDate = pay.PaymentDate,
                    Success = pay.Success,
                });
                if (PaymentRecs == null || !PaymentRecs.Any())
                {
                    PaymentTable.Visible = false;
                    NoPayments.Visible = true;
                }
                else
                {
                    PaymentTable.Visible = true;
                    NoPayments.Visible = false;
                    PaymentsGrid.DataSource = PaymentRecs;
                    PaymentsGrid.DataBind();
                }
            }
        }
    }
}