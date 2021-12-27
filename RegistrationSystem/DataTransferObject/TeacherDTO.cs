using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RegistrationSystem.DataTransferObject
{
    public class TeacherDto: UserDto
    {
        public int TeacherId { get; set; }
        public string FullName { get; set; }
    }
}