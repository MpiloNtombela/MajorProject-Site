using RegistrationSystem.DataAccess.Repos;
using RegistrationSystem.Utills;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistrationSystem.Admin.Students
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
        protected void Page_Load(object sender, EventArgs e)
        {
            var status = Request.QueryString["approved"];
            var query = Request.QueryString["q"];
            if (Helpers.NotNull(status) && bool.TryParse(status.ToLower(), out bool s))
            {
                GetData(status: s);
            }
            else
            {
                if (Helpers.NotNull(query))
                {
                    GetData(query: query);
                }
                else
                {
                    GetData(status: null);
                }
            }

        }

        private void GetData([Optional]bool? status, [Optional] string query)
        {
            if (status.HasValue)
            {
                var students = _studentRepo.GetStudentsDetails()
                    .Join(_studentRepo.GetRegistrations().Where(reg => reg.IsApproved == status),
                    stu => stu.StudentID,
                    reg => reg.StudentID,
                    (stu, reg) => new { Student = stu, Registration = reg }).ToList();
                RegStudents.DataSource = students;
                RegStudents.DataBind();
            }
            else
            {
                if (query != null)
                {
                    var students = _studentRepo.GetStudentsDetails().Where(stu => stu.FirstName.Contains(query) || stu.LastName.Contains(query))
                                    .Join(_studentRepo.GetRegistrations(),
                                    stu => stu.StudentID,
                                    reg => reg.StudentID,
                                    (stu, reg) => new { Student = stu, Registration = reg }).ToList();
                    RegStudents.DataSource = students;
                    RegStudents.DataBind();
                }
                else
                {
                    var students = _studentRepo.GetStudentsDetails()
                                        .Join(_studentRepo.GetRegistrations(),
                                        stu => stu.StudentID,
                                        reg => reg.StudentID,
                                        (stu, reg) => new { Student = stu, Registration = reg }).ToList();
                    RegStudents.DataSource = students;
                    RegStudents.DataBind();
                }

            }
        }
    }
}