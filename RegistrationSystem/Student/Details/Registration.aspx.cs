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
    public partial class Registration : System.Web.UI.Page
    {
        private readonly IStudentRepo _studentRepo;
        private readonly ISubjectRepo _subjectRepo;
        private readonly IExtrasRepo _extrasRepo;


        public Registration(IStudentRepo studentRepo, ISubjectRepo subjectRepo, IExtrasRepo extrasRepo)
        {
            _studentRepo = studentRepo;
            _subjectRepo = subjectRepo;
            _extrasRepo = extrasRepo;
        }
        public DataAccess.Registration Reg { get; set; }
        public DataAccess.RegisteredSubject RegisteredSubject { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            DataAccess.Student student = _studentRepo.GetStudent(userId: User.Identity.GetUserId());
            if (student == null)
            {
                Response.Redirect("/Student");
            }
            else
            {
                Reg = _studentRepo.GetRegistration(studentId: student.StudentID);
                if (Reg.IsApproved)
                {
                    RegSubjectRepeater.DataSource = _studentRepo.GetRegisteredSubjects(studentId: student.StudentID);
                    RegSubjectRepeater.DataBind();
                    MakePayment.Visible = Utills.Validators.PaymentRequired(Reg);
                    NextPaymentCard.Visible = Reg.AmountPayed < Reg.AmountDue;
                }
                else
                {
                    Response.Redirect("/Student");
                }
            }
        }
    }
}