using RegistrationSystem.DataAccess.Repos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistrationSystem.Student.UControls
{
    public partial class UPaymentDue : System.Web.UI.UserControl
    {
        private IStudentRepo _studentRepo;
        private IExtrasRepo _extrasRepo;
        public UPaymentDue(IStudentRepo studentRepo, IExtrasRepo extrasRepo)
        {
            _studentRepo = studentRepo;
            _extrasRepo = extrasRepo;
        }
        public Registration Registration { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            //Registration = _studentRepo.GetRegistration(UserId: User.Identity.GetUserId())
        }
    }
}