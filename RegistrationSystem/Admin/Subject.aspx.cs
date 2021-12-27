using Microsoft.AspNet.Identity;
using RegistrationSystem.DataAccess.Repos;
using System;
using System.Collections.Generic;
using System.Linq;
using RegistrationSystem.DataAccess;
using RegistrationSystem.DataTransferObject;
using RegistrationSystem.Models;

namespace RegistrationSystem.Admin
{
    public partial class Subject : System.Web.UI.Page
    {
        private readonly ISubjectRepo _subjectRepo;
        private readonly List<ApplicationUser> _applicationUsers;
        private readonly List<Teacher> _teachers;
        private readonly IExtrasRepo _extrasRepo;

        public Subject(ISubjectRepo subjectRepo, IExtrasRepo extrasRepo, ApplicationDbContext usersContext)
        {
            _subjectRepo = subjectRepo;
            _extrasRepo = extrasRepo;
            _teachers = extrasRepo.GetTeachers().ToList();
            _applicationUsers = usersContext.Users.ToList();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            SubjectRepeater.DataSource = _subjectRepo.GetActiveSubjects();
            SubjectRepeater.DataBind();
            InactiveSubRepeater.DataSource = _subjectRepo.GetSubjects().Where(x => x.IsActive == false).ToList();
            InactiveSubRepeater.DataBind();
            List<TeacherDto> teachersJoin = _applicationUsers.Join(_teachers,
                user => user.Id,
                teacher => teacher.UserID,
                (user, teacher) =>
                    new {ApplicationUser = user, Teacher = teacher}).Select(x => new TeacherDto
            {
                FirstName = x.ApplicationUser.FirstName,
                LastName = x.ApplicationUser.LastName,
                UserId = x.ApplicationUser.Id,
                Email = x.ApplicationUser.Email,
                FullName = $"{x.ApplicationUser.FirstName} {x.ApplicationUser.LastName}",
                TeacherId = x.Teacher.TeacherID
            }).ToList();
            TeachersList.DataSource = teachersJoin;
            TeachersList.DataTextField = "FullName";
            TeachersList.DataValueField = "TeacherID";
            TeachersList.DataBind();
        }

        protected void Creat_Subject_Btn_Click(object sender, EventArgs e)
        {
            DataAccess.Subject subject = new DataAccess.Subject
            {
                SubjectCode = Subject_Code_TextBox.Text.ToUpper(),
                TeacherID = int.Parse(TeachersList.SelectedValue),
                SubjectDescription = Subject_Description_TextBox.Text,
                SubjectName = Subject_Name_Textbox.Text,
                SubjectPrice = decimal.Parse(Subject_Price_TextBox.Text),
                IsActive = isActive.Checked
            };
            _subjectRepo.CreateSubject(subject);
            if (_subjectRepo.SaveChanges())
            {
                Notification notification = new DataAccess.Notification
                {
                    UserId = User.Identity.GetUserId(),
                    Trash = false,
                    Title = "New Subject",
                    Message = $"You have added a new subject - {subject.SubjectCode}",
                    Seen = false,
                    Timestamp = DateTime.Now,
                    Url = "/Admin/Subject"
                };
                _extrasRepo.SendNotification(notification);
                _extrasRepo.SaveChanges();
                Response.Redirect(Request.RawUrl);
            }
            else
            {
                //unsuccessful
            }
        }
    }
}