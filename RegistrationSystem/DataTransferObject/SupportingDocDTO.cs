using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RegistrationSystem.DataTransferObject
{
    public class SupportingDocDto
    {
        public int SupportingDocumentId { get; set; }
        public int StudentId { get; set; }
        public byte[] File { get; set; }
        public string FileName { get; set; }
        public bool IsVerified { get; set; }
        public string ContentType { get; set; }
        public string FileType { get; set; }
    }
}