using Microsoft.AspNet.Identity;
using RegistrationSystem.DataAccess.Repos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistrationSystem.Student.Details
{
    public partial class Bank : System.Web.UI.Page
    {
        private IStudentRepo _studentRepo;
        private IExtrasRepo _extrasRepo;

        public Bank(IStudentRepo studentRepo, IExtrasRepo extrasRepo)
        {
            _studentRepo = studentRepo;
            _extrasRepo = extrasRepo;
        }

        public DataAccess.BankDetail BankDetail { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            DataAccess.Student student = _studentRepo.GetStudent(userId: User.Identity.GetUserId());
            if (student == null)
            {
                Response.Redirect("/Student");
            }
            else
            {
                BankDetail = _extrasRepo.GetBankDetails(studentId: student.StudentID);
                if (BankDetail == null)
                {
                    Response.Redirect("/Student");
                }
                else
                {
                    CardView.CssClass += $" m{student.Registrations.First().PaymentPlanID}";
                }
            }
        }
    }
}