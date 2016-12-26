using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Login
{
    public partial class forgetpassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void cancelBTN_click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void Signout_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            Label4.Text = "";
            Label3.Text = "";

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\workspace\Login\Login\App_Data\userinformation.mdf;Integrated Security=True");
            con.Open();
            SqlCommand com = new SqlCommand("SELECT Username,Password FROM info Where Email= '" + TextBox1.Text + "'", con);
            SqlDataReader dr = com.ExecuteReader();
            if (dr.Read())
            {
                if (sender == Submit)
                {
                    Label4.Text = "Password is:" + dr["Password"].ToString();
                }
                con.Close();
            }
            else
            {
                Label3.Text = "This Email address is not in database";
            }
        }
    }
}