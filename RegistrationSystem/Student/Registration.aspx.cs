using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Newtonsoft.Json.Linq;
using RegistrationSystem.DataAccess;
using RegistrationSystem.DataAccess.Repos;
using RegistrationSystem.Utills;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistrationSystem.Student
{
    public partial class Registration : System.Web.UI.Page
    {
        private readonly IStudentRepo _studentRepo;
        private readonly ISubjectRepo _subjectRepo;
        private readonly IExtrasRepo _extrasRepo;
        private DataAccess.Student _student = null;
        private bool _complete = false;
        public Registration() { }

        public Registration(IStudentRepo studentRepo, ISubjectRepo subjectRepo, IExtrasRepo extrasRepo)
        {
            _studentRepo = studentRepo;
            _subjectRepo = subjectRepo;
            _extrasRepo = extrasRepo;
        }

        public IEnumerable<Subject> Subjects { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var user = manager.FindById(User.Identity.GetUserId());
            DataAccess.Registration reg = _studentRepo.GetRegistration(userId: user.Id);
            if (reg != null)
            {
                Response.Redirect("/Student?md=Registered");
            }

            FirstName.Text = user.FirstName;
            FirstName.Enabled = false;
            LastName.Text = user.LastName;
            LastName.Enabled = false;
            EmailAddress.Text = user.Email;
            EmailAddress.Enabled = false;
            SubjectRepeater.DataSource = _subjectRepo.GetActiveSubjects();
            SubjectRepeater.DataBind();
        }

        protected void RegisterBtn_Click(object sender, EventArgs e)
        {
            ErrorField.Value = string.Empty;
            Page.Validate();
            if (IsValid)
            {
                var personalId = Utills.Validators.IsValidIdentityNumber(IDNumber.Text);
                var guardianId = Utills.Validators.IsValidIdentityNumber(GuardianID.Text);
                //var cardNum = Utills.Validators.IsValidDigits(CardNumber.Text);
                if (!personalId.Item1)
                {
                    ErrorField.Value = $"{personalId.Item2} (Personal ID)";
                }
                else if (!guardianId.Item1)
                {
                    ErrorField.Value = $"{guardianId.Item2} (Guardian ID)";
                }

                if (personalId.Item1 && guardianId.Item1)
                {
                    using (DbContextTransaction transaction = _studentRepo.DbTransaction())
                    {
                        try
                        {
                            DataAccess.Student stu = new DataAccess.Student
                            {
                                IDNumber = IDNumber.Text,
                                DateOfBirth = DateTime.Parse(Helpers.GetDobFromId(IDNumber.Text)).Date,
                                HomeAddress = $"{PostalAddress.Text} {SubVill.Text}, {CityTown.Text} {Zip.Text}",
                                Gender = Gender.SelectedValue == "M" || Gender.SelectedValue == "F"
                                    ? Gender.SelectedValue
                                    : "X",
                                Active = true,
                                UserID = User.Identity.GetUserId()
                            };
                            _student = _studentRepo.CreateStudent(stu);
                            _studentRepo.SaveChanges();
                            // guardian
                            Guardian guardian = new Guardian
                            {
                                FirstName = GuardianFirstName.Text,
                                LastName = GuardianLastName.Text,
                                PhoneNumber = GuardianPhoneNumber.Text,
                                IDNumber = GuardianID.Text,
                                HomeAddress =
                                    $"{GuardianPostalAddress.Text} {GuardianSubVill.Text}, {GuardianCityTown.Text} {GuardianZip.Text}",
                                StudentID = _student.StudentID,
                            };
                            _studentRepo.CreateGuardian(guardian);
                            _studentRepo.SaveChanges();

                            JArray subs = JArray.Parse(Subs.Value);
                            List<RegisteredSubject> registeredSubjects = new List<RegisteredSubject>();
                            if (subs.HasValues && subs.Count > 0)
                            {
                                foreach (JObject sub in subs)
                                {
                                    RegisteredSubject registeredSubject = new RegisteredSubject
                                    {
                                        MatricMark =
                                            byte.Parse((byte.TryParse(sub["matricMark"].ToString(), out _)
                                                ? sub["matricMark"]
                                                : 0).ToString()),
                                        StudentID = _student.StudentID,
                                        SubjectCode = sub["subCode"].ToString()
                                    };
                                    registeredSubjects.Add(registeredSubject);
                                }
                            }
                            else
                            {
                                throw new InvalidOperationException("Please select subject(s) to register");
                            }

                            _studentRepo.RegisterSubjects(registeredSubjects);
                            _studentRepo.SaveChanges();
                            // docs

                            List<SupportingDocument> supportingDocuments = new List<SupportingDocument>
                            {
                                CreateSupportingDocument(IDCopy, "Student ID Copy"),
                                CreateSupportingDocument(GuardianIDCopy, "Guardian ID Copy"),
                                CreateSupportingDocument(MatricStatementCopy, "Matric Statement Copy")
                            };

                            _studentRepo.AddSupportingDocs(supportingDocuments);
                            _studentRepo.SaveChanges();
                            // subs

                            var regSubs = _studentRepo.GetRegisteredSubjects(studentId: _student.StudentID);
                            var registration = new DataAccess.Registration
                            {
                                StudentID = _student.StudentID,
                                AmountDue = regSubs.Sum(reg => _subjectRepo.GetSubject(reg.SubjectCode).SubjectPrice),
                                AmountPayed = 0,
                                PaymentPlanID = "platinum",
                                RegistrationDate = DateTime.Now,
                                ReasonNotApproved = "Awaiting admin review and approval",
                                PaymentCycle = 1,
                                NextPayment = DateTime.Now,
                            };
                            _studentRepo.CreateRegistration(registration);
                            _studentRepo.SaveChanges();
                            transaction.Commit();
                            _complete = true;
                        }
                        catch (Exception ex)
                        {
                            _complete = false;
                            ErrorField.Value = Helpers.NotNull(ex.Message)
                                ? Helpers.GetErrorMessage(ex)
                                : "Registartion proccess failed";
                            transaction.Rollback();
                        }
                    }

                    if (!_complete)
                    {
                        return;
                    }

                    Notification n = new DataAccess.Notification
                    {
                        UserId = User.Identity.GetUserId(),
                        Trash = false,
                        Title = "Registration Complete",
                        Message = "You have successfully completed your student registration",
                        Seen = false,
                        Timestamp = DateTime.Now,
                        Url = "/Student"
                    };
                    _extrasRepo.SendNotification(n);
                    _extrasRepo.SaveChanges();
                    Response.Redirect("/Student?ms=RegSuccess");
                }
                else
                {
                    ErrorField.Value = "Request validation failed";
                }
            }
            else
            {
            }
        }

        private SupportingDocument CreateSupportingDocument(FileUpload file, string fileType)
        {
            if (file != null && file.PostedFile.ContentType.ToLower() == "application/pdf")
            {
                SupportingDocument doc = new SupportingDocument
                {
                    FileType = fileType,
                    FileName = file.PostedFile.FileName,
                    ContentType = file.PostedFile.ContentType,
                    IsVerified = false,
                    StudentID = _student.StudentID,
                    File = HandleFiles(file)
                };
                return doc;
            }
            else
            {
                throw new InvalidOperationException("Please upload valid required file(s)");
            }
        }

        private byte[] HandleFiles(FileUpload file)
        {
            using (Stream fs = file.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    return br.ReadBytes((int)fs.Length);
                }
            }
        }
    }
}