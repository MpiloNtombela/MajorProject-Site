using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using RegistrationSystem.DataAccess;
using RegistrationSystem.DataAccess.Repos;
using RegistrationSystem.Models;
using RegistrationSystem.Utills;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistrationSystem.Student
{
    public partial class Default : System.Web.UI.Page
    {
        private readonly IStudentRepo _studentRepo;
        private readonly ISubjectRepo _subjectRepo;
        private readonly IExtrasRepo _extrasRepo;


        public Default(IStudentRepo studentRepo, ISubjectRepo subjectRepo, IExtrasRepo extrasRepo)
        {
            _studentRepo = studentRepo;
            _subjectRepo = subjectRepo;
            _extrasRepo = extrasRepo;
        }
        public StudentDetail Student { get; set; }
        public DataAccess.Registration Registration { get; set; }
        public Guardian Guardian { get; set; }
        public BankDetail Bank { get; set; }
        public ApplicationUser CurrentUser { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            Student = _studentRepo.GetStudentDetail(userId: User.Identity.GetUserId());
            CurrentUser = manager.FindById(User.Identity.GetUserId());
            if (Student == null)
            {
                NotApprovedCard.Visible = false;
                NotRegisteredCard.Visible = true;
            }
            else
            {
                NotRegisteredCard.Visible = false;
                Registration = _studentRepo.GetRegistration(studentId: Student.StudentID);
                Guardian = _studentRepo.GetGuardian(Student.StudentID);
                Bank = _extrasRepo.GetBankDetails(Student.StudentID);
                if (Registration.IsApproved)
                {
                    if (Bank != null)
                    {
                        NotApprovedCard.Visible = false;
                        Response.Redirect("/student/Details");
                    } else
                    {
                        NotApprovedCard.Visible = false;
                        BankingRequired.Visible = true;
                    }

                }
                else
                {
                    NotApprovedCard.Visible = true;
                    NotApproved.Reason = Helpers.NotNull(Registration.ReasonNotApproved) ? Registration.ReasonNotApproved : "Pending Admin review";
                    NotApproved.HasNumber = Student.PhoneNumberConfirmed;
                }
            }
            if (!IsPostBack)
            {
                var ms = Request.QueryString["ms"];
                var md = Request.QueryString["md"];
                if (Helpers.NotNull(ms))
                {
                    // Strip the query string from action
                    SuccessMessage.Value =
                        ms == "BankDetailsSuccess" ? "Banking Details added successfully"
                        : ms == "RegSuccess" ? "Registration details captured successfully"
                        : ms == "PaySuccess" ? "Payment captured successfully"
                        : string.Empty;
                }
                if(Helpers.NotNull(md))
                {
                    DefaultMessage.Value =
                        md == "BankExist" ? "Banking Details already exist"
                        : md == "Registered" ? "Registration already captured"
                        : string.Empty;
                }
            }

        }
    }
}