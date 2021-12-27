using RegistrationSystem.Utills;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistrationSystem.UserControls
{
    public partial class UcMDocReader : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Name.Value = !string.IsNullOrWhiteSpace(DocName) ? DocName : "MDoc PDF Reader";
        }

        public string Height
        {
            get { return MDocBody.Style["height"]; }
            set { MDocBody.Style.Add("height", value); }
        }

        public string DocUrl
        {
            get { return Url.Value; }
            set
            {
                Url.Value = value;
            }
        }

        public string DocUrlFieldId { get { return Url.ClientID; } }

        public string DocName
        {
            get { return Name.Value; }
            set
            {
                Name.Value = value;
            }
        }

        public string DocNameFieldId { get { return Name.ClientID; } }

        public string DocBase64
        {
            get
            {
                return Base64.Value;
            }
            set
            {
                Base64.Value = value;
            }
        }
        public string DocBase64FieldId { get { return Base64.ClientID; } }

    }
}