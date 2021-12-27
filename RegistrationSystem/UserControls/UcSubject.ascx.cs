using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistrationSystem.UserControls
{
    public partial class UcSubject : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public bool Selectable
        {
            get => SubjectCheck.Visible;
            set
            {
                SubjectCheck.Visible = value;
                SubjectPrice.Visible = value;
                SubjectMark.Visible = value;
            }
        }

        public string SubCode
        {
            get => SubjectCodeVal.Value;
            set
            {
                SubjectCode.Text = value;
                SubjectCodeVal.Value = value;
            }
        }

        public string SubName
        {
            get => SubjectNameVal.Value;
            set
            {
                SubjectName.Text = value;
                SubjectNameVal.Value = value;
            }
        }

        public string SubPrice
        {
            get => SubjectPriceVal.Value;
            set
            {
                SubjectPrice.Text = $"R {value}";
                SubjectPriceVal.Value = value;
            }
        }

        public string SubDesc
        {
            get => SubjectDescripition.Text;
            set => SubjectDescripition.Text = value;
        }
    }
}