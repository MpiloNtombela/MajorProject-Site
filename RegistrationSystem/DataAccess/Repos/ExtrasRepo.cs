using RegistrationSystem.Utills;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Linq;

namespace RegistrationSystem.DataAccess.Repos
{
    public class ExtrasRepo : IExtrasRepo
    {
        private readonly DataEntities _extrasEntities;

        public ExtrasRepo(DataEntities extraEntities) => _extrasEntities = extraEntities;

        public BankDetail AddBankingDetails(BankDetail details)
        {
            if (details == null)
            {
                throw new ArgumentNullException(nameof(details));
            }

            return _extrasEntities.BankDetails.Add(details);
        }

        public DbContextTransaction DbTransaction()
        {
            _extrasEntities.Database.CommandTimeout = 120;
            return _extrasEntities.Database.BeginTransaction();
        }

        public BankDetail GetBankDetails(int studentId) =>
            _extrasEntities.BankDetails.FirstOrDefault(bank => bank.StudentID == studentId);

        public IEnumerable<PaymentPlan> GetPaymentPlans() => _extrasEntities.PaymentPlans.ToList();

        public Notification SendNotification(Notification notification) =>
            _extrasEntities.Notifications.Add(notification);

        public IEnumerable<Notification> SendBulkNotifications(IEnumerable<Notification> notifications) =>
            _extrasEntities.Notifications.AddRange(notifications);

        public IQueryable<Notification> GetUserNotifications(string userId) =>
            _extrasEntities.Notifications.Where(n => n.UserId == userId);

        public IQueryable<Teacher> GetTeachers() => _extrasEntities.Teachers;
        public IQueryable<RegisteredSubject> GetAllRegisteredSubjects() => _extrasEntities.RegisteredSubjects;

        public bool SaveChanges()
        {
            try
            {
                return _extrasEntities.SaveChanges() >= 0;
            }
            catch (DbEntityValidationException e)
            {
                // for debug purposes
                foreach (DbEntityValidationResult eve in e.EntityValidationErrors)
                {
                    Console.WriteLine(@"Entity of type ""{0}"" in state ""{1}"" has the following validation errors:",
                        eve.Entry.Entity.GetType().Name, eve.Entry.State);
                    foreach (DbValidationError ve in eve.ValidationErrors)
                    {
                        Console.WriteLine(@"- Property: ""{0}"", Error: ""{1}""",
                            ve.PropertyName, ve.ErrorMessage);
                    }
                }

                string errMsg = e.EntityValidationErrors.First()?.ValidationErrors.First()?.ErrorMessage;
                throw new ArgumentException(Helpers.NotNull(errMsg)
                    ? errMsg
                    : "something went wrong while saving changes");
            }
        }

        public SupportingDocument GetSupportingDocument(int docId) =>
            _extrasEntities.SupportingDocuments.FirstOrDefault(doc => doc.SupportingDocumentID == docId);

        public Admin GetAdmin(string userId) => _extrasEntities.Admins.FirstOrDefault(admin => admin.UserID == userId);
    }
}