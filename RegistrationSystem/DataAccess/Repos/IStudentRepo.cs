using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace RegistrationSystem.DataAccess.Repos
{
    public interface IStudentRepo : ITransaction
    {
        /// <summary>
        /// Get student by either id or userId
        /// </summary>
        /// <param name="id">primary key for student</param>
        /// <param name="userId"> user Id from identity framework</param>
        /// <returns>Student</returns>
        Student GetStudent([Optional] string userId, int? id = null);

        /// <summary>
        /// Get Student Details (View)
        /// </summary>
        /// <param name="userId">user Id from identity framework</param>
        /// <param name="id">primary key for student</param>
        /// <returns>returns StudentDetail</returns>
        StudentDetail GetStudentDetail([Optional] string userId, int? id = null);

        /// <summary>
        /// Returns all registered students
        /// </summary>
        /// <returns>IQueryable of Students</returns>
        IQueryable<Student> GetStudents();

        /// <summary>
        /// Returns all students
        /// </summary>
        /// <returns>IQueryable of StudentDetails</returns>
        IQueryable<StudentDetail> GetStudentsDetails();


        /// <summary>
        /// Create or add a new student to DB
        /// </summary>
        /// <param name="student">Student</param>
        /// <returns>Created Student</returns>
        Student CreateStudent(Student student);

        /// <summary>
        /// Creates a guardian obj/instance
        /// </summary>
        /// <param name="guardian">guadian object</param>
        /// <returns>guardian object</returns>
        Guardian CreateGuardian(Guardian guardian);

        /// <summary>
        /// Gets the guardian details for the student
        /// </summary>
        /// <param name="studentId">student id</param>
        /// <returns>guardian obj</returns>
        Guardian GetGuardian(int studentId);

        /// <summary>
        /// adds supporting document for student
        /// </summary>
        /// <param name="document">support doc object</param>
        /// <returns>Supporting doc object if added ot null</returns>
        IEnumerable<SupportingDocument> AddSupportingDocs(IEnumerable<SupportingDocument> documents);

        /// <summary>
        /// Gets all the supporting docs for student
        /// </summary>
        /// <param name="studentId">id for student</param>
        /// <returns>list of student's Supporting documents</returns>
        IQueryable<SupportingDocument> GetSupportingDocuments(int studentId);

        /// <summary>
        /// Registers a subject for the student
        /// </summary>
        /// <param name="subject">registeredSubject object</param>
        /// <returns></returns>
        IEnumerable<RegisteredSubject> RegisterSubjects(IEnumerable<RegisteredSubject> subjects);

        /// <summary>
        /// get registered subjects for student
        /// </summary>
        /// <param name="studentId">int: studentId</param>
        /// <param name="userId">string UserId</param>
        /// <returns>returns a list/IEnumerable of subjects registered by student</returns>
        IEnumerable<RegisteredSubject> GetRegisteredSubjects([Optional] string userId, int? studentId = null);

        /// <summary>
        /// Creates a new registration for the student
        /// </summary>
        /// <param name="registration">registration obj</param>
        /// <returns>a created registration</returns>
        Registration CreateRegistration(Registration registration);

        /// <summary>
        /// get registration for a student give either userID/StudentId
        /// </summary>
        /// <param name="userId">string userId</param>
        /// <param name="studentId">int: StudentId</param>
        /// <returns>student registration details</returns>
        Registration GetRegistration([Optional] string userId, int? studentId = null);


        /// <summary>
        /// Gets all registrations
        /// </summary>
        /// <returns>IQueryable of registrations </returns>
        IQueryable<Registration> GetRegistrations();

        /// <summary>
        /// updates the student details
        /// </summary>
        /// <param name="studentId">id for the student</param>
        /// <param name="student">student obj with new values</param>
        /// <returns>updated student obj</returns>
        /// 
        Student UpdateStudent(int studentId, Student student);

        /// <summary>
        /// adds new payment rec to DB
        /// </summary>
        /// <param name="payment">payment obj</param>
        /// <returns>a payment that was made</returns>
        Payment MakePayment(Payment payment);

        /// <summary>
        /// Gets all payments made for the registration
        /// </summary>
        /// <param name="registrationId">registration id</param>
        /// <param name="StudentId">student id</param>
        /// <returns>List/ IEnum of payments</returns>
        IEnumerable<Payment> GetPayments(int? registrationId = null, int? studentId = null);

        /// <summary>
        /// Saves Changes to the DB
        /// </summary>
        /// <returns>bool whether changes were saved</returns>
        bool SaveChanges();
    }
}
