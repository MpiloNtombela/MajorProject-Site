using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistrationSystem
{
    public partial class Default : Page
    {
        //private readonly IStudentRepo _studentRepo;
        //public _Default(IStudentRepo studentRepo)
        //{
        //    _studentRepo = studentRepo;
        //}

        protected void Page_Load(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            //GridView1.DataSource = _studentRepo.GetStudents();
            //GridView1.DataBind();

            if (User.Identity.IsAuthenticated)
            {
                if(User.IsInRole(role: "student") || User.IsInRole(role: "Student"))
                {
                    Response.Redirect("/Student");
                }
                if (User.IsInRole(role: "admin") || User.IsInRole(role: "Admin"))
                {
                    Response.Redirect("/Admin");
                }
            }
            
        }
    }
}