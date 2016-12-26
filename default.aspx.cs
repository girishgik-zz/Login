using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Login
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                LoadApplication();
            }
        }

        protected void createNewPrjLBTN_Click(object sender, EventArgs e)
        {
            //Response.Redirect("NewProject.aspx");
            workAreaPanel.Visible = true;
            workAreaUpdatePanel.Update();
        }

        protected void openNewPrjLBTN_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void saveprojectBTN_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void deleteProjectLBTN_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
        protected void importBTN_Click(object sender, EventArgs e)
        {
            importPanel.Visible = true;
            importUpdatePanel.Update();
            //string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
            // FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Uploads/") + fileName);
            //Response.Redirect(Request.Url.AbsoluteUri);   
        }

        protected void closeWorkAreaBTN_Click(object sender, EventArgs e)
        {
            workAreaPanel.Visible = false;
            workAreaUpdatePanel.Update();
        }

        protected void Signout_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
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