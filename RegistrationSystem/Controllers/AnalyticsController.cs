using RegistrationSystem.DataAccess;
using RegistrationSystem.DataAccess.Repos;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web.Http;

namespace RegistrationSystem.Controllers
{
    public class Analytics
    {
        public APayments APayments;
        public IEnumerable<object> Plans { get; set; }
        public IEnumerable<object> Subjects { get; set; }
    }

    public class APayments
    {
        [DisplayName("Amount Payed")] public decimal TotalPayed { get; set; }

        [DisplayName("Amount Due")] public decimal TotalDue { get; set; }
    }

    public class AnalyticsController : ApiController
    {
        private IExtrasRepo _extrasRepo;
        private readonly IStudentRepo _studentRepo;

        public AnalyticsController(IExtrasRepo extrasRepo, IStudentRepo studentRepo)
        {
            _extrasRepo = extrasRepo;
            _studentRepo = studentRepo;
        }

        // GET api/<controller>
        public Analytics Get()
        {
            IQueryable<Registration> data = _studentRepo.GetRegistrations();
            APayments p = new APayments
            {
                TotalDue = data.Sum(x => x.AmountDue), TotalPayed = data.Sum(x => x.AmountPayed),
            };

            var plans = data.GroupBy(x => x.PaymentPlanID)
                .Select(g => new {g.Key, Count = g.Count()});

            var subs = _extrasRepo.GetAllRegisteredSubjects().GroupBy(x => x.SubjectCode)
                .Select(g => new {g.Key, Count = g.Count()});

            Analytics a = new Analytics {APayments = p, Plans = plans, Subjects = subs};
            return a;
        }

        // GET api/<controller>/5
        public string Get(int id)
        {
            return "value";
        }
    }
}