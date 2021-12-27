using RegistrationSystem.Utills;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistrationSystem.Admin.UcControls
{
    public partial class UcUserSearch : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            string query = AutocompleteInput.Text;
            if(Helpers.NotNull(query))
            {
                Response.Redirect($"/Admin/Students?q={query}");
            }else
            {
                Response.Redirect("/Admin/Students");
            }
        }
    }
}