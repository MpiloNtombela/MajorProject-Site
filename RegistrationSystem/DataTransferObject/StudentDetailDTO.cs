using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RegistrationSystem.DataTransferObject
{
    public class StudentDetailDto : UserDto
    {
        public int StudentId { get; set; }
        public string PhoneNumber { get; set; }
        public string Gender { get; set; }
        public DateTime DateOfBirth { get; set; }
        public bool Active { get; set; }
    }
}