using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistrationSystem.UserControls
{
    public partial class UcRequiredTextBox : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public override string ID
        {
            get
            {
                return ControlID.ID;
            }
            set
            {
                ControlID.ID = value;
                ControlLabel.AssociatedControlID = value;
                ControlValidator.ControlToValidate = value;
            }
        }

        public string Name
        {
            get
            {
                return ControlID.Attributes["name"];
            }
            set
            {
                ControlID.Attributes.Add("name", value);
            }
        }

        public string AutoComplete
        {
            get
            {
                return ControlID.Attributes["autocomplete"];
            }
            set
            {
                ControlID.Attributes.Add("autocomplete", value);
            }
        }

        public string Pattern
        {
            get { return ControlID.Attributes["pattern"]; }
            set
            {
                ControlID.Attributes.Add("pattern", value);
            }
        }

        public string Label
        {
            get
            {
                return ControlLabel.Text;
            }
            set
            {
                ControlLabel.Text = $"{value} *";
                ControlValidator.ErrorMessage = $"The {value} field is required.";
            }
        }

        public TextBoxMode TextMode
        {
            get
            {
                return ControlID.TextMode;
            }
            set { ControlID.TextMode = value; }
        }

        public string CssClass
        {
            get
            {
                return ControlID.CssClass;
            }
            set { ControlID.CssClass += $" {value}"; }
        }

        public string Text { get { return ControlID.Text; } set { ControlID.Text = value; } }

        public bool Enabled
        {
            get { return ControlID.Enabled; }
            set
            {
                ControlID.Enabled = value;
                ControlID.Attributes.Add("disabled", $"{!value}");
            }
        }

        public string DataType
        {
            get { return ControlID.Attributes["data-form-type"]; }
            set
            {
                ControlID.Attributes.Add("data-form-type", value);
            }
        }

        public string MinLength { get { return ControlID.Attributes["minlength"]; } set { ControlID.Attributes.Add("minlength", value); } }
        public string MaxLength { get { return ControlID.Attributes["maxlength"]; } set { ControlID.Attributes.Add("maxlength", value); } }
        public string Min { get { return ControlID.Attributes["min"]; } set { ControlID.Attributes.Add("min", value); } }
        public string Max { get { return ControlID.Attributes["max"]; } set { ControlID.Attributes.Add("max", value); } }

        public string Icon
        {
            get { return IconX.InnerText; }
            set
            {
                IconX.InnerText = value;
            }
        }

        public string ValidationGroup
        {
            get { return ControlValidator.ValidationGroup; }
            set
            {
                ControlValidator.ValidationGroup = value;
            }
        }

    }
}