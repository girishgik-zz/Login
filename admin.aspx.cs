using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

namespace Login
{
    public partial class admin : System.Web.UI.Page
    {
       private SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\workspace\Login\Login\App_Data\userinformation.mdf;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadStores();
        }
    }
    protected void loadStores()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("Select * from info", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        int count = ds.Tables[0].Rows.Count;
        con.Close();
        if (ds.Tables[0].Rows.Count > 0)
        {
            gridView.DataSource = ds;
            gridView.DataBind();
        }
        else
        {
            ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
            gridView.DataSource = ds;
            gridView.DataBind();
            int columncount = gridView.Rows[0].Cells.Count;
            lblmsg.Text = " No data found !!!";
        }
    }
    protected void gridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gridView.EditIndex = e.NewEditIndex;
        loadStores();
    }
    protected void gridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string Uid = gridView.DataKeys[e.RowIndex].Values["Uid"].ToString();
        TextBox Username = (TextBox)gridView.Rows[e.RowIndex].FindControl("txtUsername");
        TextBox Password = (TextBox)gridView.Rows[e.RowIndex].FindControl("txtPassword");
        TextBox Email = (TextBox)gridView.Rows[e.RowIndex].FindControl("txtEmail");
        con.Open();
        SqlCommand cmd = new SqlCommand("update info set Username='" + Username.Text + "', Password='" + Password.Text + "', Email='" + Email.Text + "' where Uid=" + Uid, con);
        cmd.ExecuteNonQuery();
        con.Close();
        lblmsg.BackColor  = Color.Blue ;
        lblmsg.ForeColor = Color.White ;
        lblmsg.Text = Uid +   "        Updated successfully........    ";
        gridView.EditIndex = -1;
        loadStores();
    }
    protected void gridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gridView.EditIndex = -1;
        loadStores();
    }
    protected void gridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string Uid= gridView.DataKeys[e.RowIndex].Values["Uid"].ToString();
        con.Open();
        SqlCommand cmd = new SqlCommand("delete from info where Uid=" + Uid, con);
        int result = cmd.ExecuteNonQuery();
        con.Close();
        if (result == 1)
        {
            loadStores();
            lblmsg.BackColor  = Color.Red;
            lblmsg.ForeColor = Color.White ;
            lblmsg.Text = Uid + "      Deleted successfully.......    ";
        }
    }
    protected void gridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string Uid = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "Uid"));
            Button lnkbtnresult = (Button)e.Row.FindControl("ButtonDelete");
            if (lnkbtnresult != null)
            {
                lnkbtnresult.Attributes.Add("onclick", "javascript:return deleteConfirm('" + Uid + "')");
            }
        }
    }
    protected void gridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("AddNew"))
        {
            TextBox inUid = (TextBox)gridView.FooterRow.FindControl("inUid");
            TextBox inUsername = (TextBox)gridView.FooterRow.FindControl("inUsername");
            TextBox inPassword = (TextBox)gridView.FooterRow.FindControl("inPassword");
            TextBox inEmail = (TextBox)gridView.FooterRow.FindControl("inEmail");
            con.Open();
            SqlCommand cmd =
                new SqlCommand(
                    "insert into info(Uid,Username,Password,Email) values('" + inUid.Text + "','" +
                    inUsername.Text + "','" + inPassword.Text + "','" + inEmail.Text + "')", con);
            int result = cmd.ExecuteNonQuery();
            con.Close();
            if (result == 1)
            {
                loadStores();
                lblmsg.BackColor = Color.Green;
                lblmsg.ForeColor = Color.White ;
                lblmsg.Text = inUid.Text + "      Added successfully......    ";
            }
            else
            {
                lblmsg.BackColor = Color.Red;
                lblmsg.ForeColor = Color.White;
                lblmsg.Text = inUid.Text + " Error while adding row.....";
            }
        }
    }

        protected void Signout_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void modifyAppBTN_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void manageLibraryBTN_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void manageUsersBTN_Click(object sender, EventArgs e)
        {
            headPanelManageUsersPanel.Visible = true;
            headPanelManageUsersUpdatePanel.Update();
        }

        protected void gridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}