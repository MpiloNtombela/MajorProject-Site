using Microsoft.AspNet.Identity;
using RegistrationSystem.DataAccess;
using RegistrationSystem.DataAccess.Repos;
using RegistrationSystem.Utills;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistrationSystem.Admin.Students
{
    public partial class View : Page
    {
        private readonly IStudentRepo _studentRepo;
        private readonly IExtrasRepo _extrasRepo;


        public View(IStudentRepo studentRepo, IExtrasRepo extrasRepo)
        {
            _studentRepo = studentRepo;
            _extrasRepo = extrasRepo;
        }

        public StudentDetail Student { get; set; }
        public Registration Registration { get; set; }
        public DataAccess.Admin Admin { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            Admin = _extrasRepo.GetAdmin(userId: User.Identity.GetUserId());
            var id = Request.QueryString["id"];
            if (!Helpers.NotNull(id))
            {
                Response.Redirect("/Account/Error");
            }

            if (int.TryParse(id, out int userId))
            {
                Student = _studentRepo.GetStudentDetail(id: userId);
                if (Student != null)
                {
                    StudentDetails.Visible = true;
                    NotFound.Visible = false;
                    Registration = _studentRepo.GetRegistration(studentId: Student.StudentID);
                    SupportingDocs.DataSource = Registration.Student.SupportingDocuments;
                    SupportingDocs.DataBind();
                    RegSubjectRepeater.DataSource = Registration.Student.RegisteredSubjects;
                    RegSubjectRepeater.DataBind();
                    DocScript.Visible = true;
                    if (Registration != null && Registration.IsApproved)
                    {
                        ApproveRegBtn.Visible = false;
                        RegApprovedDate.Text = $"Approved on {Registration.ApproveDate?.ToString("F")}";
                        RegApprovedDate.Visible = true;
                    }
                }
                else
                {
                    DocScript.Visible = false;
                    StudentDetails.Visible = false;
                    NotFound.Visible = true;
                }
            }

            if (!IsPostBack)
            {
                var ms = Request.QueryString["ms"];
                var md = Request.QueryString["md"];
                var me = Request.QueryString["me"];
                if (Helpers.NotNull(ms))
                {
                    // Strip the query string from action
                    SuccessMessage.Value =
                        ms == "DocVerified" ? "Document verified successfully"
                        : ms == "RegApproved" ? "Registration approved successfully"
                        : string.Empty;
                }

                if (Helpers.NotNull(md))
                {
                    DefaultMessage.Value =
                        md == "AlreadyVerified" ? "Document already verified"
                        : md == "DocVerReq" ? "Please verify All student documents first"
                        : md == "AlreadyApproved" ? "Registration already approved"
                        : string.Empty;
                }

                if (Helpers.NotNull(me))
                {
                    ErrorMessage.Value =
                        me == "VerifyError" ? "Document verification error!"
                        : me == "ApproveError" ? "Registration approval error!"
                        : string.Empty;
                }
            }
        }

        protected void VerifyBtn_Command(object sender, CommandEventArgs e)
        {
            if (IsValid)
            {
                if (Helpers.NotNull((string)e.CommandArgument))
                {
                    if (int.TryParse((string)e.CommandArgument, out int id))
                    {
                        SupportingDocument document = _extrasRepo.GetSupportingDocument(id);
                        if (!document.IsVerified)
                        {
                            document.IsVerified = true;
                            if (_extrasRepo.SaveChanges())
                            {
                                Response.Redirect($"{Request.RawUrl.Split('&')[0]}&ms=DocVerified");
                            }
                            else
                            {
                                Response.Redirect($"{Request.RawUrl.Split('&')[0]}&me=VerifyError");
                            }
                        }
                        else
                        {
                            Response.Redirect($"{Request.RawUrl.Split('&')[0]}&md=AlreadyVerified");
                        }
                    }
                }
            }

            Response.Redirect($"{Request.RawUrl.Split('&')[0]}&me=VerifyError");
        }

        protected void ApproveRegBtn_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                int docsVerNum = _studentRepo
                    .GetSupportingDocuments(studentId: Student.StudentID).Count(doc => doc.IsVerified);
                // all 3 docs must be verified
                if (docsVerNum < 3)
                {
                    Response.Redirect($"{Request.RawUrl.Split('&')[0]}&md=DocVerReq");
                }
                else
                {
                    Registration reg = _studentRepo.GetRegistration(studentId: Student.StudentID);
                    if (!reg.IsApproved)
                    {
                        reg.IsApproved = true;
                        reg.AdminID = Admin?.AdminID;
                        reg.ApproveDate = DateTime.Now;
                        if (_studentRepo.SaveChanges())
                        {
                            List<Notification> nl = new List<Notification>();
                            Notification n1 = new Notification
                            {
                                UserId = Student.Id,
                                Trash = false,
                                Title = "Registration Approved",
                                Message = "Admin has reviewed and approved your student registration",
                                Seen = false,
                                Timestamp = DateTime.Now,
                                Url = "/Student"
                            };
                            nl.Add(n1);
                            Notification n2 = new Notification
                            {
                                UserId = User.Identity.GetUserId(),
                                Trash = false,
                                Title = "Registration Approved",
                                Message = $"{Student.FirstName} {Student.LastName}'s registration has been approved",
                                Seen = false,
                                Timestamp = DateTime.Now,
                                Url = $"/Admin/Students/View?id={Student.StudentID}"
                            };
                            nl.Add(n2);
                            try
                            {
                                _extrasRepo.SendBulkNotifications(nl);
                                _extrasRepo.SaveChanges();
                            }
                            catch (Exception)
                            {
                                // ignored
                            }

                            Response.Redirect($"{Request.RawUrl.Split('&')[0]}&ms=RegApproved");
                        }
                        else
                        {
                            Response.Redirect($"{Request.RawUrl.Split('&')[0]}&me=ApproveError");
                        }
                    }
                    else
                    {
                        Response.Redirect($"{Request.RawUrl.Split('&')[0]}&md=AlreadyApproved");
                    }
                }
            }

            Response.Redirect($"{Request.RawUrl.Split('&')[0]}&me=ApproveError");
        }
    }
}