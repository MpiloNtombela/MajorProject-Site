using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using RegistrationSystem.DataAccess;
using RegistrationSystem.DataAccess.Repos;
using RegistrationSystem.DataTransferObject;
using RegistrationSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace RegistrationSystem.Controllers
{
    public class UsersController : ApiController
    {
        private readonly IExtrasRepo _extrasRepo;

        public UsersController(IExtrasRepo extrasRepo)
        {
            _extrasRepo = extrasRepo;
        }

        [Authorize]
        [HttpGet]
        [Route("api/{users}/notifications/new")]
        public int CheckNotifications() => _extrasRepo.GetUserNotifications(User.Identity.GetUserId())
            .Count(x => x.Seen == false && x.Trash == false);

        [Authorize]
        [HttpGet]
        [Route("api/{users}/notifications")]
        public IEnumerable<Notification> GetNotifications() => _extrasRepo
            .GetUserNotifications(User.Identity.GetUserId())?.Where(x => x.Trash == false).OrderByDescending(x => x.Timestamp).ToList();

        [Authorize]
        [HttpGet]
        [Route("api/{users}/notifications/seen")]
        public void NotificationsSeen()
        {
            foreach (Notification notification in _extrasRepo.GetUserNotifications(User.Identity.GetUserId())
                .Where(x => x.Seen == false))
            {
                notification.Seen = true;
            }

            try
            {
                _extrasRepo.SaveChanges();
            }
            catch (Exception)
            {
                // ignored
            }
        }
    }
}