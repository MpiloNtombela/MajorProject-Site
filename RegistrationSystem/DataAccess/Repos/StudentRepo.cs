using RegistrationSystem.Utills;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Linq;
using System.Runtime.InteropServices;

namespace RegistrationSystem.DataAccess.Repos
{
    public class StudentRepo : IStudentRepo
    {
        private static DataEntities _studentEntities;
        public StudentRepo(DataEntities studentEntities)
        {
            _studentEntities = studentEntities;
        }
        public Student GetStudent([Optional] string userId, int? id = null)
        {
            if (id == null && userId == null)
            {
                return null;
            }
            return id != null
                ? _studentEntities.Students.FirstOrDefault(s => s.StudentID == id)
                : _studentEntities.Students.FirstOrDefault(s => s.UserID == userId);
        }

        public IQueryable<Student> GetStudents() => _studentEntities.Students;

        public IQueryable<StudentDetail> GetStudentsDetails() => _studentEntities.StudentDetails;
        public IQueryable<Registration> GetRegistrations() => _studentEntities.Registrations;

        public StudentDetail GetStudentDetail([Optional] string userId, int? id = null)
        {
            if (id == null && userId == null)
            {
                return null;
            }
            return id != null
                ? _studentEntities.StudentDetails.FirstOrDefault(s => s.StudentID == id)
                : _studentEntities.StudentDetails.FirstOrDefault(s => s.Id == userId);
        }

        public Student CreateStudent(Student student)
        {
            switch (student)
            {
                case null:
                    throw new ArgumentNullException(nameof(student));
                default:
                    return _studentEntities.Students.Add(student);
            }
        }

        public Guardian CreateGuardian(Guardian guardian)
        {
            if (guardian == null)
            {
                throw new ArgumentNullException(nameof(guardian));
            }
            else
            {
                return _studentEntities.Guardians.Add(guardian);
            }
        }

        public Guardian GetGuardian(int studentId)
        {
            return _studentEntities.Guardians.FirstOrDefault(guardian => guardian.StudentID == studentId);
        }
        public IEnumerable<SupportingDocument> AddSupportingDocs(IEnumerable<SupportingDocument> documents)
        {
            if (documents == null)
            {
                throw new ArgumentNullException(nameof(documents));
            }
            else
            {
                return _studentEntities.SupportingDocuments.AddRange(documents);
            }
        }



        public IEnumerable<RegisteredSubject> RegisterSubjects(IEnumerable<RegisteredSubject> subjects)
        {
            return subjects == null
                       ? throw new ArgumentNullException(nameof(subjects))
                       : _studentEntities.RegisteredSubjects.AddRange(subjects);

        }

        public IEnumerable<RegisteredSubject> GetRegisteredSubjects([Optional] string userId, int? studentId = null)
        {
            return studentId == null && !Helpers.NotNull(userId)
                ? Enumerable.Empty<RegisteredSubject>()
                : studentId != null
                ? _studentEntities.RegisteredSubjects.Where(rs => rs.StudentID == studentId && rs.Student.Active).ToList()
                : _studentEntities.RegisteredSubjects.Where(rs => rs.StudentID == _studentEntities.Students.FirstOrDefault(s => s.UserID == userId && s.Active).StudentID).ToList();
        }



        public Student UpdateStudent(int studentId, Student student)
        {
            Student stu = GetStudent(id: studentId);
            if (stu == null || student == null)
            {
                throw new ArgumentNullException(nameof(student));
            }

            stu.HomeAddress = Helpers.NotNull(student.HomeAddress) ? student.HomeAddress : stu.HomeAddress;
            stu.Active = student.Active;
            stu.Gender = stu.Gender;
            stu.IDNumber = stu.IDNumber;
            stu.DateOfBirth = stu.DateOfBirth;
            stu.UserID = stu.UserID;
            return stu;
        }

        public Payment MakePayment(Payment payment)
        {
            if (payment == null)
            {
                throw new ArgumentNullException(nameof(payment));
            }
            else
            {
                return _studentEntities.Payments.Add(payment);
            }
        }

        public IEnumerable<Payment> GetPayments(int? registrationId = null, int? studentId = null)
        {
            if (registrationId == null && studentId == null)
            {
                return Enumerable.Empty<Payment>();
            }
            if (registrationId != null)
            {
                return _studentEntities.Payments.Where(pay => pay.RegistrationID == registrationId).ToList();
            }
            else
            {
                return _studentEntities.Payments.Where(pay => pay.RegistrationID == _studentEntities.Registrations.FirstOrDefault(reg => reg.StudentID == studentId).RegistrationID).ToList();
            }

        }


        public bool SaveChanges()
        {
            try
            {
                return _studentEntities.SaveChanges() >= 0;
            }
            catch (DbEntityValidationException e)
            {
                // for debug purposes
                foreach (var eve in e.EntityValidationErrors)
                {
                    Console.WriteLine(@"Entity of type ""{0}"" in state ""{1}"" has the following validation errors:",
                        eve.Entry.Entity.GetType().Name, eve.Entry.State);
                    foreach (var ve in eve.ValidationErrors)
                    {
                        Console.WriteLine(@"- Property: ""{0}"", Error: ""{1}""",
                            ve.PropertyName, ve.ErrorMessage);
                    }
                }
                return false;
            };
        }
        public DbContextTransaction DbTransaction()
        {
            _studentEntities.Database.CommandTimeout = 120;
            return _studentEntities.Database.BeginTransaction();
        }

        public Registration CreateRegistration(Registration registration)
        {
            if (registration == null)
            {
                throw new ArgumentNullException(nameof(registration));
            }
            else
            {
                return _studentEntities.Registrations.Add(registration);
            }
        }

        public Registration GetRegistration([Optional] string userId, int? studentId = null)
        {
            if (studentId == null && !Helpers.NotNull(userId))
            {
                return null;
            }

            if (studentId != null)
            {
                return _studentEntities.Registrations.FirstOrDefault(reg => reg.StudentID == studentId);
            }
            else
            {
                return _studentEntities.Registrations.FirstOrDefault(reg => reg.StudentID == _studentEntities.Students.FirstOrDefault(stu => stu.UserID == userId).StudentID);
            }
        }

        public IQueryable<SupportingDocument> GetSupportingDocuments(int studentId)
        {
            return _studentEntities.SupportingDocuments.Where(doc => doc.StudentID == studentId);
        }

    }
}