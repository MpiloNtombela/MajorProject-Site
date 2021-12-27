using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistrationSystem.UserControls
{
    public partial class UcPaymentOption : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string PayTitle
        {
            get { return PaymentTitle.InnerText; }
            set
            {
                PaymentTitle.InnerText = value;
            }
        }

        public string PayLength
        {
            get { return PaymentLength.InnerText; }
            set
            {
                PaymentLength.InnerText = value;
            }
        }

        public string PayDesc
        {
            get { return PaymentDescription.InnerText; }
            set
            {
                PaymentDescription.InnerText = value;
            }
        }

        //public string Name
        //{
        //    get { return Plan.Name; }
        //    set
        //    {
        //        Plan.Name = value;
        //    }
        //}
    }
}