using System.Collections.Generic;
using System.Linq;

namespace RegistrationSystem.DataAccess.Repos
{
    public interface IExtrasRepo : ITransaction
    {
        /// <summary>
        /// Gets the Admin Details
        /// </summary>
        /// <param name="userId">user id for admin</param>
        /// <returns>Admin Object</returns>
        Admin GetAdmin(string userId);
        

        /// <summary>
        /// adds banking details for student/user
        /// </summary>
        /// <param name="detail">bank details</param>
        /// <returns>added bank details</returns>
        BankDetail AddBankingDetails(BankDetail detail);

        /// <summary>
        /// Gets student banking details
        /// </summary>
        /// <param name="studentId">student id/pk</param>
        /// <returns>Banking details</returns>
        BankDetail GetBankDetails(int studentId);

        /// <summary>
        /// Gets all the payment plans from DB
        /// </summary>
        /// <returns>list of payment plans</returns>
        IEnumerable<PaymentPlan> GetPaymentPlans();

        /// <summary>
        /// Gets a supporting document from DB
        /// </summary>
        /// <param name="docId">document Id</param>
        /// <returns>A single Supporting Document object</returns>
        SupportingDocument GetSupportingDocument(int docId);

        /// <summary>
        /// Create a new notification for the user
        /// </summary>
        /// <param name="notification">notification object</param>
        /// <returns>returns a created notification obj</returns>
        Notification SendNotification(Notification notification);

        IEnumerable<Notification> SendBulkNotifications(IEnumerable<Notification> notifications);

        /// <summary>
        /// Gets all the notifications for the user
        /// </summary>
        /// <param name="userId">userId</param>
        /// <returns>IQueryable of Notification object</returns>
        IQueryable<Notification> GetUserNotifications(string userId);

        /// <summary>
        /// Gets all the teachers
        /// </summary>
        /// <returns>IQueryable of teachers</returns>
        IQueryable<Teacher> GetTeachers();

        IQueryable<RegisteredSubject> GetAllRegisteredSubjects();

        /// <summary>
        /// commits changes to DB
        /// </summary>
        /// <returns>true if commits were success else false</returns>
        bool SaveChanges();
    }
}