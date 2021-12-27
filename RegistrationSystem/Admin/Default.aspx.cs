
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using RegistrationSystem.DataAccess;
using RegistrationSystem.DataAccess.Repos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistrationSystem.Admin
{
    public partial class Default : System.Web.UI.Page
    {
        private readonly IStudentRepo _studentRepo;
        private readonly IExtrasRepo _extrasRepo;


        public Default(IStudentRepo studentRepo, IExtrasRepo extrasRepo)
        {
            _studentRepo = studentRepo;
            _extrasRepo = extrasRepo;
        }

        public DataAccess.StudentDetail Student { get; set; }
        public DataAccess.Registration Registration { get; set; }

        public int TotalReg { get; set; }
        public int ApprovedReg { get; set; }
        public int UnapprovedReg { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated)
            {
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var user = manager.FindById(User.Identity.GetUserId());
                TotalReg = _studentRepo.GetRegistrations().Count();
                ApprovedReg = _studentRepo.GetRegistrations().Where(reg => reg.IsApproved == true).Count();
                UnapprovedReg = TotalReg - ApprovedReg;
            }
            else
            {
                Response.Redirect("/Account/Login");
            }
        }
    }
}