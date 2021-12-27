using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistrationSystem.Student.UControls
{
    public partial class UcRegNotApproved : System.Web.UI.UserControl
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (HasNumber)
            {
                NumMissing.Visible = false;
            }
            else
            {
                NumMissing.Visible = true;
            }
        }

        public bool HasNumber { get; set; }
        public string Reason
        {
            get { return NotApprovedReason.InnerText?.Trim(); }
            set
            {
                NotApprovedReason.InnerText = value?.Trim();
            }
        }
    }
}