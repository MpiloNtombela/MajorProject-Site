using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using RegistrationSystem.Models;

namespace RegistrationSystem.Account
{
    public partial class Confirm : Page
    {
        protected string StatusMessage
        {
            get;
            private set;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            string code = IdentityHelper.GetCodeFromRequest(Request);
            string userId = IdentityHelper.GetUserIdFromRequest(Request);
            if (code != null && userId != null)
            {
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var result = manager.ConfirmEmail(userId, code);
                if (result.Succeeded)
                {
                    successPanel.Visible = true;
                    success.Visible = true;
                    error.Visible = false;
                    return;
                }
                else
                {
                    successPanel.Visible = false;
                    errorPanel.Text = "Confirmation credential might have expired";
                    errorPanel.Visible = true;
                    error.Visible = true;
                    success.Visible = false;
                }
            }
            successPanel.Visible = false;
            errorPanel.Visible = true;
            error.Visible = true;
            success.Visible = false;
        }
    }
}