using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RegistrationSystem.DataAccess.Repos
{
    public interface ISubjectRepo : ITransaction
    {
        /// <summary>
        /// Gets all the subjects
        /// </summary>
        /// <returns>List of subjects (IEnumerable)</returns>
        IQueryable<Subject> GetSubjects();

        /// <summary>
        /// Gets only subjects that are active
        /// </summary>
        /// <returns>List of subjects</returns>
        IEnumerable<Subject> GetActiveSubjects();

        /// <summary>
        /// Gets subject by id
        /// </summary>
        /// <param name="SubjectCode">string: subject code</param>
        /// <returns>Single Subject</returns>
        Subject GetSubject(string subjectCode);

        /// <summary>
        /// Gets all the subjects taught by teacher
        /// </summary>
        /// <param name="teacherId">int: teacherId</param>
        /// <returns>List of subjects</returns>
        IEnumerable<Subject> GetSubjectsByTeacher(int teacherId);

        /// <summary>
        /// Adds new subject to DB
        /// </summary>
        /// <param name="subject">subject</param>
        /// <returns>created subject</returns>
        Subject CreateSubject(Subject subject);

        /// <summary>
        /// Updates subject details
        /// </summary>
        /// <param name="subject">subject</param>
        /// <returns>returns updated subject</returns>
        Subject UpdateSubject(string subjectCode, Subject subject);

        bool DeleteSubject(string subjectCode);

        /// <summary>
        /// Saves Changes to the DB
        /// </summary>
        /// <returns>bool whether changes were saved</returns>
        bool SaveChanges();

    }
}
