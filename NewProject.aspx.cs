using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Login
{
    public partial class NewProject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadApplication();
            }
        }

        public void LoadApplication()
        {
            ddlApplication.Items.Add("Sampling");
            ddlApplication.Items.Add("Calibration");
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {

        }
    }
}