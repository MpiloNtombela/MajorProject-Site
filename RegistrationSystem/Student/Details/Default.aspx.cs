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

namespace RegistrationSystem.Student.Details
{
    public partial class Default : System.Web.UI.Page
    {
        private readonly IStudentRepo _studentRepo;
        private readonly IExtrasRepo _extrasRepo;

        public Default(IExtrasRepo extrasRepo)
        {
            _extrasRepo = extrasRepo;
        }

        public Default(IStudentRepo studentRepo, IExtrasRepo extrasRepo)
        {
            _studentRepo = studentRepo;
            _extrasRepo = extrasRepo;
        }

        public StudentDetail Student { get; set; }
        public Guardian Guardian { get; set; }
        public ApplicationUser CurrentUser { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            Student = _studentRepo.GetStudentDetail(userId: User.Identity.GetUserId());
            CurrentUser = manager.FindById(User.Identity.GetUserId());
            if (Student == null)
            {
                Response.Redirect("/Student");
            }

            Guardian = _studentRepo.GetGuardian(Student.StudentID);

            if (!IsPostBack)
            {
                var ms = Request.QueryString["ms"];
                var md = Request.QueryString["md"];
                var me = Request.QueryString["me"];
                if (Helpers.NotNull(ms))
                {
                    // Strip the query string from action
                    SuccessMessage.Value =
                        ms == "BankDetailsSuccess" ? "Banking Details added successfully"
                        : ms == "RegSuccess" ? "Registration details captured successfully"
                        : ms == "PaySuccess" ? "Payment captured successfully"
                        : ms == "UpdateSuccess" ? "Details updated successfully"
                        : string.Empty;
                }

                if (Helpers.NotNull(md))
                {
                    DefaultMessage.Value =
                        md == "BankExist" ? "Banking Details already exist"
                        : md == "RegSuccess" ? "Registration details captured successfully"
                        : string.Empty;
                }

                if (Helpers.NotNull(me))
                {
                    DefaultMessage.Value =
                        me == "UpdateError"
                            ? "Error trying to update details"
                            : string.Empty;
                }
            }
        }

        protected void UpdateAddress_Click(object sender, EventArgs e)
        {
            DataAccess.Student student = _studentRepo.GetStudent(id: Student.StudentID);
            if (student != null)
            {
                student.HomeAddress = $"{PostalAddress.Text} {SubVill.Text}, {CityTown.Text} {Zip.Text}";
                if (_studentRepo.SaveChanges())
                {
                    Notification notification = new DataAccess.Notification
                    {
                        UserId = Student.Id,
                        Trash = false,
                        Title = "Details Update",
                        Message = $"You have successfully changed your address",
                        Seen = false,
                        Timestamp = DateTime.Now,
                        Url = "/Student/Details"
                    };
                    _extrasRepo.SendNotification(notification);
                    _extrasRepo.SaveChanges();
                    Response.Redirect("/Student/Details?ms=UpdateSuccess");
                }
            }

            Response.Redirect("/Student/Details?me=UpdateError");
        }
    }
}