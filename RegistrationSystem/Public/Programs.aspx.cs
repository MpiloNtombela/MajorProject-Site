using RegistrationSystem.DataAccess.Repos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistrationSystem.Public
{
    public partial class Programs : System.Web.UI.Page
    {
        private readonly ISubjectRepo _subjectRepo;
        public Programs(ISubjectRepo subjectRepo)
        {
            _subjectRepo = subjectRepo;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            SubjectRepeater.DataSource = _subjectRepo.GetActiveSubjects();
            SubjectRepeater.DataBind();
        }
    }
}