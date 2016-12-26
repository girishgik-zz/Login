using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
namespace Login
{
    public partial class login : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            // txtUserName.Focus();
        }

       protected void loginBTN_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\girish.naik\Downloads\Login\Login\Login\App_Data\userinformation.mdf;Integrated Security=True");

            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("select COUNT(*)FROM info WHERE username='" + txtUserName.Text + "' and password='" + txtPassword.Text + "'");
                //SqlCommand cmd1 = new SqlCommand("select * FROM info");
                cmd.Connection = con;
                //SqlDataAdapter da = new SqlDataAdapter(cmd1);
                //DataSet ds = new DataSet();
                //da.Fill(ds);
                int OBJ = Convert.ToInt32(cmd.ExecuteScalar());
                if (OBJ >= 0)
                {
                    Session["name"] = txtUserName.Text;
                    if (txtUserName.Text == "admin")
                        Response.Redirect("admin.aspx");
                    else if (Session["name"] == txtUserName.Text)
                        Response.Redirect("default.aspx");
                }
                else
                {
                    errorMSGLBL.Text = "Invalid username or password";
                    this.errorMSGLBL.ForeColor = Color.Black;

                }
                con.Close();
            }
            catch
            {

            }
            finally
            {
                con.Close();
            }
      }
        protected void cancelBTN_Click(object sender, EventArgs e)
        {
            txtUserName.Text = "";
            txtPassword.Text = "";
            UpdatePanel1.Update();
            errorMSGLBL.Visible = false;
        }

        protected void forgetPassLBTN_Click(object sender, EventArgs e)
        {
            Response.Redirect("forgetpassword.aspx");
        }

        /*  protected void Button1_Click(object sender, EventArgs e)
           {
               stylesheet.Href = "..\\css\\Stylesheet1.css";
           }

           protected void Button2_Click(object sender, EventArgs e)
           {
               stylesheet.Href = "..\\css\\Stylesheet3.css";
           }
           */
        protected void txtUserName_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtPassword_TextChanged(object sender, EventArgs e)
        {

        }

    }
}
