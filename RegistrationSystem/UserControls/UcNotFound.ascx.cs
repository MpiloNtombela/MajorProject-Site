using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistrationSystem.UserControls
{
    public partial class UcNotFound : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string Url
        {
            get
            {
                return redirect.HRef;
            }
            set
            {
                redirect.HRef = value;
            }
        }

        public string Name
        {
            get
            {
                return redirect.InnerText;
            }
            set
            {
                redirect.InnerText = $"Go to {value} page";
            }
        }
    }
}