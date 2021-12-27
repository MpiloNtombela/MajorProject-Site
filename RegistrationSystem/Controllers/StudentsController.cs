using Microsoft.AspNet.Identity;
using Newtonsoft.Json;
using RegistrationSystem.DataAccess;
using RegistrationSystem.DataAccess.Repos;
using RegistrationSystem.DataTransferObject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace RegistrationSystem.Controllers
{
    public class StudentsController : ApiController
    {
        private readonly IStudentRepo _studentRepo;

        public StudentsController(IStudentRepo studentRepo)
        {
            _studentRepo = studentRepo;
        }

        // GET api/<controller>
        [Authorize]
        public IHttpActionResult Get()
        {
            IEnumerable<StudentDetailDto> studentDetails = _studentRepo.GetStudentsDetails().ToList().Select(stu =>
                new StudentDetailDto
                {
                    UserId = stu.Id,
                    StudentId = stu.StudentID,
                    FirstName = stu.FirstName,
                    LastName = stu.LastName,
                    Email = stu.Email,
                    PhoneNumber = stu.PhoneNumber,
                    DateOfBirth = stu.DateOfBirth,
                    Gender = stu.Gender,
                    Active = stu.Active
                });
            return Ok(studentDetails);
        }

        [Authorize]
        [HttpGet]
        [Route("api/{students}/payments")]
        public HttpResponseMessage GetLoggedUserPayments()
        {
            DataAccess.Student student = _studentRepo.GetStudent(userId: User.Identity.GetUserId());
            if (student == null)
            {
                return Request.CreateErrorResponse(HttpStatusCode.Unauthorized, "User does not have student account");
            }
            else
            {
                IEnumerable<PaymentDto> payments = _studentRepo.GetPayments(studentId: student.StudentID).Select(pay =>
                    new PaymentDto
                    {
                        PaymentId = pay.PaymentID,
                        Amount = pay.Amount,
                        PaymentDescription = pay.PaymentDecription,
                        PaymentDate = pay.PaymentDate,
                        Success = pay.Success
                    });
                return Request.CreateResponse(HttpStatusCode.OK, payments);
            }
        }

        [Authorize]
        [HttpGet]
        [Route("api/students/{id:int}/docs")]
        public HttpResponseMessage GetSupportingDocs(int id)
        {
            IEnumerable<SupportingDocDto> docs = _studentRepo.GetSupportingDocuments(studentId: id)?.Select(doc =>
                new SupportingDocDto
                {
                    SupportingDocumentId = doc.SupportingDocumentID,
                    StudentId = doc.StudentID,
                    File = doc.File,
                    ContentType = doc.ContentType,
                    FileName = doc.FileName,
                    FileType = doc.FileType,
                    IsVerified = doc.IsVerified
                }).ToList();

            if (docs.Any())
            {
                return Request.CreateResponse(HttpStatusCode.OK, docs);
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, "No documents found");
            }
        }

        // GET api/<controller>/5
        public string Get(int id) => "value";

        // POST api/<controller>
        public HttpResponseMessage Post([FromBody] UserDto value)
        {
            if (!User.Identity.IsAuthenticated)
            {
                return Request.CreateErrorResponse(HttpStatusCode.Unauthorized, "");
            }
            else
            {
                if (ModelState.IsValid)
                {
                    return Request.CreateResponse(HttpStatusCode.Created, value);
                }
                else
                {
                    return Request.CreateErrorResponse(HttpStatusCode.BadRequest,
                        JsonConvert.SerializeObject(ModelState.Values.SelectMany(x => x.Errors)));
                }
            }
        }
    }
}