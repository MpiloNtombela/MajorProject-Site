using Microsoft.AspNet.Identity;
using RegistrationSystem.DataAccess.Repos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistrationSystem.Student
{
    public partial class StudentMaster : System.Web.UI.MasterPage
    {

        private readonly IStudentRepo _studentRepo;

        public StudentMaster(IStudentRepo studentRepo)
        {
            _studentRepo = studentRepo;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            DataAccess.Student student = _studentRepo.GetStudent(userId: Page.User.Identity.GetUserId());
            PortalNav.Visible = student != null;
            PortalNavScript.Visible = student != null;
        }
    }
}