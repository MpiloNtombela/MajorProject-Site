//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace RegistrationSystem.DataAccess
{
    using System;
    using System.Collections.Generic;
    
    public partial class RegisteredSubject
    {
        public string SubjectCode { get; set; }
        public int StudentID { get; set; }
        public byte MatricMark { get; set; }
        public Nullable<byte> UpgradeMark { get; set; }
    
        public virtual Student Student { get; set; }
        public virtual Subject Subject { get; set; }
    }
}