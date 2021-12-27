using RegistrationSystem.Utills;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.IO;
using System.Linq;
using System.Text;

namespace RegistrationSystem.DataAccess.Repos
{
    public class SubjectRepo : ISubjectRepo
    {
        private readonly DataEntities _subjectEntities;

        public SubjectRepo(DataEntities subjectEntities)
        {
            _subjectEntities = subjectEntities;
        }

        public Subject CreateSubject(Subject subject)
        {
            return subject == null
                ? throw new ArgumentNullException(nameof(subject))
                : _subjectEntities.Subjects.Add(subject);
        }

        public IQueryable<Subject> GetSubjects() => _subjectEntities.Subjects;

        public Subject GetSubject(string subjectCode) =>
            _subjectEntities.Subjects.FirstOrDefault(sub => sub.SubjectCode == subjectCode);

        public IEnumerable<Subject> GetActiveSubjects() =>
            _subjectEntities.Subjects.Where(sub => sub.IsActive).ToList();

        public IEnumerable<Subject> GetSubjectsByTeacher(int teacherId)
            => _subjectEntities.Subjects.Where(sub => sub.TeacherID == teacherId);

        public Subject UpdateSubject(string subjectCode, Subject subject)
        {
            Subject sub = GetSubject(subjectCode);
            if (sub == null || subject == null)
            {
                return null;
            }

            sub.SubjectName = Helpers.NotNull(subject.SubjectName) ? subject.SubjectName : sub.SubjectName;
            sub.SubjectDescription = Helpers.NotNull(subject.SubjectDescription)
                ? subject.SubjectDescription
                : sub.SubjectDescription;
            sub.SubjectPrice = subject.SubjectPrice > 0 ? subject.SubjectPrice : sub.SubjectPrice;
            sub.IsActive = sub.IsActive || subject.IsActive;
            sub.TeacherID = subject.TeacherID > 0 ? subject.TeacherID : sub.TeacherID;

            return SaveChanges() ? sub : null;
        }

        public bool DeleteSubject(string subjectCode)
        {
            Subject sub = GetSubject(subjectCode);
            if (sub == null)
            {
                return false;
            }

            _subjectEntities.Subjects.Remove(sub);
            return SaveChanges();
        }

        public bool SaveChanges()
        {
            try
            {
                return _subjectEntities.SaveChanges() >= 0;
            }
            catch (DbEntityValidationException e)
            {
                // debug purposes
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
            }

            ;
        }

        public DbContextTransaction DbTransaction()
        {
            _subjectEntities.Database.CommandTimeout = 120;
            return _subjectEntities.Database.BeginTransaction();
        }
    }
}