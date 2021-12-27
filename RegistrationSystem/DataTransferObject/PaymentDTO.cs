using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RegistrationSystem.DataTransferObject
{
    public class PaymentDto
    {
        public int PaymentId { get; set; }
        public decimal Amount { get; set; }
        public string PaymentDescription { get; set; }
        public DateTime PaymentDate { get; set; }
        public bool Success { get; set; }
    }
}