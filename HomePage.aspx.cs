using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Login
{
    public partial class HomePage : System.Web.UI.Page
    {
        private static int AppId = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadApplication();
                pnlCreate.Visible = false;
            }
        }

        public void LoadApplication()
        {
            List<string> lstOperation = new List<string>();
            lstOperation.Add("sampling_doe");
            lstOperation.Add("surrogate_modelling");
            lstOperation.Add("sensitivity_analysis");
            lstOperation.Add("optimization");
            lstOperation.Add("uncertainity_quantification");
            lstOperation.Add("optimization_under_uncertainity");
            //lstOperation.Add("calibration");
            //lstOperation.Add("example");

            ddlApplication.DataSource = lstOperation;
            ddlApplication.DataBind(); ;
        }

        protected void lnkbtnCreate_Click(object sender, EventArgs e)
        {
            ddlProjects.Visible = false;
            txtProjectName.Text = string.Empty;
            txtProjectName.Visible = true;
            UpdateApplicationLayout("Create");
            ddlApplication.Enabled = true;
            btnSave.Text = "Save";
        }

        private void UpdateApplicationLayout(string action)
        {
            pnlCreate.Visible = true;
            upnlCreate.Update();
            btnCreate.Text = action;
        }

        protected void lnkbtnOpen_Click(object sender, EventArgs e)
        {
            ddlProjects.Visible = true;
            txtProjectName.Visible = false;
            UpdateApplicationLayout("Open");
            btnSave.Text = "Close";
            GetProjects();
            ddlApplication.Enabled = false;
        }

        private void UpdateWorkArea()
        {
            try
            {
                CommonHelper.sqlConn.Open();
                List<string> lstApplication = new List<string>();
                SqlCommand cmd = new SqlCommand("select p.name, m.method from projects p inner join method m on p.id=m.ProjectId where name='" + ddlProjects.SelectedItem.ToString() + "'");
                cmd.Connection = CommonHelper.sqlConn;
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    lstApplication.Add(dr["method"].ToString());
                }
                foreach (string str in lstApplication)
                {
                    foreach (ListItem list in chklMethods.Items)
                    {
                        if (str == list.Text)
                        {
                            list.Selected = true;
                        }
                    }
                }
                dr.Close();
                lstApplication = new List<string>();
                cmd = new SqlCommand("select distinct s.submethod from projects p inner join submethod s on s.ProjectId=p.id where name='" + ddlProjects.SelectedItem.ToString() + "'");
                cmd.Connection = CommonHelper.sqlConn;
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    lstApplication.Add(dr["submethod"].ToString());
                }

                foreach (string str in lstApplication)
                {
                    foreach (ListItem list in chklSubmethods.Items)
                    {
                        if (str == list.Text)
                        {
                            list.Selected = true;
                        }
                    }
                }
            }
            finally { CommonHelper.sqlConn.Close(); }
        }

        private void GetProjects()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("select name,id from projects");
                cmd.Connection = CommonHelper.sqlConn;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                ddlProjects.DataSource = ds.Tables[0];
                AppId = ds.Tables[0].Columns["id"].Ordinal;
                ddlProjects.DataTextField = "name";
                ddlProjects.DataBind();
                ddlProjects.Items.Insert(0, "--Select--");
            }
            catch
            {

            }
            finally
            {
            }
        }

        protected void lnkbtnSave_Click(object sender, EventArgs e)
        {

        }

        protected void lnkbtnImport_Click(object sender, EventArgs e)
        {

        }

        protected void lnkbtnDelete_Click(object sender, EventArgs e)
        {

        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            try
            {
                if (btnCreate.Text == "Create")
                {
                    CommonHelper.sqlConn.Open();
                    SqlCommand cmd = new SqlCommand("insert into projects (name,appname) values ('" + txtProjectName.Text.Trim() + "','" + ddlApplication.SelectedItem + "');SELECT @@IDENTITY AS 'Identity';");
                    cmd.Connection = CommonHelper.sqlConn;
                    AppId = Convert.ToInt32(cmd.ExecuteScalar());
                }
                else if (btnCreate.Text == "Open")
                {
                    txtProjectName.Text = ddlProjects.SelectedItem.ToString();
                    if (ddlProjects.SelectedItem.ToString() == "--Select--")
                    {
                        return;
                    }
                    LoadMethods();
                    UpdateWorkArea();
                }
                if (AppId >= 0)
                {
                    pnlCreate.Visible = false;
                    upnlCreate.Update();

                    pnlWorkArea.Visible = true;
                    upnlWorkArea.Update();
                    if (btnCreate.Text != "Open")
                    {
                        txtProjectName.Text = string.Empty;
                        chklMethods.DataSource = null;
                        chklSubmethods.DataSource = null;
                        LoadMethods();
                    }
                    lblWorkAreaHeader.Text = ddlApplication.SelectedItem.ToString();
                }
            }
            catch
            {

            }
            finally
            {
                CommonHelper.sqlConn.Close();
            }
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            pnlWorkArea.Visible = false;
            upnlWorkArea.Update();

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (btnSave.Text == "Close")
            {
                pnlWorkArea.Visible = false;
                upnlWorkArea.Update();
                return;
            }
            if (chklMethods.Items != null)
            {
                List<string> lstMethodsSelected = new List<string>();
                List<string> lstSubMethodSelected = new List<string>();
                foreach (ListItem objMethod in chklMethods.Items)
                {
                    if (objMethod.Selected)
                    {
                        lstMethodsSelected.Add(objMethod.Text);
                    }
                }
                SaveMethods(lstMethodsSelected);
                if (chklSubmethods.Items != null)
                {
                    foreach (ListItem objSubMethod in chklSubmethods.Items)
                    {
                        if (objSubMethod.Selected)
                        {
                            lstSubMethodSelected.Add(objSubMethod.Text);
                        }
                    }
                    SaveSubMethods(lstSubMethodSelected);
                }
                if (lstSubMethodSelected.Count > 0)
                {
                    pnlWorkArea.Visible = false;
                    upnlWorkArea.Update();
                }
            }
        }

        private void SaveMethods(List<string> lstMethodsSelected)
        {
            CommonHelper.sqlConn.Open();
            try
            {
                foreach (string strMethod in lstMethodsSelected)
                {
                    SqlCommand cmd = new SqlCommand("insert into Method (ProjectId,method) values  (" + AppId + ",'" + strMethod + "')");
                    cmd.Connection = CommonHelper.sqlConn;
                    cmd.ExecuteScalar();
                }
            }
            catch
            {

            }
            finally
            {
                CommonHelper.sqlConn.Close();
            }
        }

        private void SaveSubMethods(List<string> lstSubMethodSelected)
        {
            CommonHelper.sqlConn.Open();
            try
            {
                foreach (string strSubMethod in lstSubMethodSelected)
                {
                    SqlCommand cmd = new SqlCommand("insert into Submethod (ProjectId,submethod) values  ('" + AppId + "','" + strSubMethod + "')");
                    cmd.Connection = CommonHelper.sqlConn;
                    cmd.ExecuteScalar();
                }
            }
            catch
            {

            }
            finally
            {
                CommonHelper.sqlConn.Close();
            }
        }

        #region Load

        public void LoadMethods()
        {
            string strMethod = ddlApplication.SelectedItem.ToString();
            switch (strMethod)
            {
                case "sampling_doe": LoadSampling();
                    break;
                case "surrogate_modelling": LoadSurrogateModelling();
                    break;
                case "sensitivity_analysis": LoadSensitivityAnalysis();
                    break;
                case "optimization": LoadOptimization();
                    break;
                case "uncertainity_quantification": LoadUncertainityQuantification();
                    break;
                case "optimization_under_uncertainity": LoadOptimizationUnderUncertainity();
                    break;
                //case "g": Console.WriteLine("You have chosen calibration");
                //    decide();
                //    break;
                //case "h": objDakota.example();
                //    break;
                //case "i": objAdd.add();
                //    break;
                default:
                    break;
            }
        }

        private void LoadSampling()
        {
            List<string> lstSampling = new List<string>();
            lstSampling.Add("classical_doe");
            lstSampling.Add("modern_doe");
            chklMethods.DataSource = lstSampling;
            chklMethods.DataBind();
        }

        private void LoadSurrogateModelling()
        {
            List<string> lstSampling = new List<string>();
            lstSampling.Add("first_order_taylor_series");
            lstSampling.Add("polynomial_surface");
            lstSampling.Add("kriging_interpolation");
            lstSampling.Add("artificial_neutral_network");
            lstSampling.Add("multivariate_adaptive_regression_surface");
            chklMethods.DataSource = lstSampling;
            chklMethods.DataBind();
        }

        private void LoadSensitivityAnalysis()
        {
            List<string> lstSampling = new List<string>();
            lstSampling.Add("parameter_study");
            lstSampling.Add("sampling_based_sensitivity");
            lstSampling.Add("global_sensitivity_analysis");
            chklMethods.DataSource = lstSampling;
            chklMethods.DataBind();
        }

        private void LoadOptimization()
        {
            List<string> lstSampling = new List<string>();
            lstSampling.Add("gradient_based_optimization");
            lstSampling.Add("non_gradient_based_optimization");
            chklMethods.DataSource = lstSampling;
            chklMethods.DataBind();
        }

        private void LoadUncertainityQuantification()
        {
            List<string> lstSampling = new List<string>();
            lstSampling.Add("reliability_methods");
            lstSampling.Add("stochastic_methods");
            chklMethods.DataSource = lstSampling;
            chklMethods.DataBind();
        }

        private void LoadOptimizationUnderUncertainity()
        {
            List<string> lstSampling = new List<string>();
            lstSampling.Add("optimization_under_uncertainity");
            lstSampling.Add("surrogate_based_optimization_under_uncertainity");
            lstSampling.Add("robust_design");
            chklMethods.DataSource = lstSampling;
            chklMethods.DataBind();
        }

        protected void chklMethods_SelectedIndexChanged(object sender, EventArgs e)
        {
            chklSubmethods.Items.Clear();
            if (chklMethods.SelectedItem != null)
            {
                foreach (ListItem method in chklMethods.Items)
                {
                    if (method.Selected)
                    {
                        LoadSubMethods(method.Text);
                    }
                }
            }
            else
            {

            }
        }

        private void LoadSubMethods(string method)
        {
            switch (method)
            {
                case "classical_doe": LoadClassicalDoe();
                    break;
                case "modern_doe": LoadModernDoe();
                    break;
                case "polynomial_surface": LoadPolynomialSurface();
                    break;
                case "kriging_interpolation": LoadKrigingInterpolation();
                    break;
                case "parameter_study": LoadParameterStudy();
                    break;
                case "gradient_based_optimization": LoadGradientOptimization();
                    break;
                case "non_gradient_based_optimization": LoadNonGradientOptimization();
                    break;
                case "reliability_methods": LoadReliabilityMethods();
                    break;
                case "stochastic_methods": LoadStochasticMethods();
                    break;
                default:
                    break;
            }
        }

        private void LoadClassicalDoe()
        {
            List<string> lstSampling = new List<string>();
            lstSampling.Add("central_composite_design");
            lstSampling.Add("box_behnken");
            lstSampling.Add("full_factorial_method");
            if (chklSubmethods.DataSource != null)
            {
                lstSampling.AddRange(chklSubmethods.DataSource as List<string>);
            }
            chklSubmethods.DataSource = lstSampling;
            chklSubmethods.DataBind();
        }

        private void LoadModernDoe()
        {
            List<string> lstSampling = new List<string>();
            lstSampling.Add("monte_carlo_sampling");
            lstSampling.Add("lhs");
            lstSampling.Add("orthogonal_array_sampling");
            lstSampling.Add("random_sampling");
            lstSampling.Add("importance_sampling");
            if (chklSubmethods.DataSource != null)
            {
                lstSampling.AddRange(chklSubmethods.DataSource as List<string>);
            }
            chklSubmethods.DataSource = lstSampling;
            chklSubmethods.DataBind();
        }

        private void LoadPolynomialSurface()
        {
            List<string> lstSampling = new List<string>();
            lstSampling.Add("polynomial_quadratic");
            lstSampling.Add("polynomial_cubic");
            if (chklSubmethods.DataSource != null)
            {
                lstSampling.AddRange(chklSubmethods.DataSource as List<string>);
            }
            chklSubmethods.DataSource = lstSampling;
            chklSubmethods.DataBind();
        }

        private void LoadKrigingInterpolation()
        {
            List<string> lstSampling = new List<string>();
            lstSampling.Add("guassian_process_kriging");
            lstSampling.Add("improved_guassian_process");
            if (chklSubmethods.DataSource != null)
            {
                lstSampling.AddRange(chklSubmethods.DataSource as List<string>);
            }
            chklSubmethods.DataSource = lstSampling;
            chklSubmethods.DataBind();
        }

        private void LoadParameterStudy()
        {
            List<string> lstSampling = new List<string>();
            lstSampling.Add("list_parameter_study");
            lstSampling.Add("vector_parameter_study");
            lstSampling.Add("multi_dimensional_parameter_study");
            if (chklSubmethods.DataSource != null)
            {
                lstSampling.AddRange(chklSubmethods.DataSource as List<string>);
            }
            chklSubmethods.DataSource = lstSampling;
            chklSubmethods.DataBind();
        }

        private void LoadGradientOptimization()
        {
            List<string> lstSampling = new List<string>();
            lstSampling.Add("linear_solver");
            lstSampling.Add("non_linear_solver");
            if (chklSubmethods.DataSource != null)
            {
                lstSampling.AddRange(chklSubmethods.DataSource as List<string>);
            }
            chklSubmethods.DataSource = lstSampling;
            chklSubmethods.DataBind();
        }

        private void LoadNonGradientOptimization()
        {
            List<string> lstSampling = new List<string>();
            lstSampling.Add("linear_solver");
            lstSampling.Add("non_linear_solver");
            if (chklSubmethods.DataSource != null)
            {
                lstSampling.AddRange(chklSubmethods.DataSource as List<string>);
            }
            chklSubmethods.DataSource = lstSampling;
            chklSubmethods.DataBind();
        }

        private void LoadReliabilityMethods()
        {
            List<string> lstSampling = new List<string>();
            lstSampling.Add("local_reliability");
            lstSampling.Add("global_reliability");
            if (chklSubmethods.DataSource != null)
            {
                lstSampling.AddRange(chklSubmethods.DataSource as List<string>);
            }
            chklSubmethods.DataSource = lstSampling;
            chklSubmethods.DataBind();
        }

        private void LoadStochasticMethods()
        {
            List<string> lstSampling = new List<string>();
            lstSampling.Add("aleatory_methods");
            lstSampling.Add("epistemic_methods");
            if (chklSubmethods.DataSource != null)
            {
                lstSampling.AddRange(chklSubmethods.DataSource as List<string>);
            }
            chklSubmethods.DataSource = lstSampling;
            chklSubmethods.DataBind();
        }

        #endregion

        protected void ddlProjects_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlProjects.SelectedItem.ToString() != "--Select--")
            {
                CommonHelper.sqlConn.Open();
                try
                {
                    SqlCommand cmd = new SqlCommand("select distinct appname from projects where name='" + ddlProjects.SelectedItem.ToString() + "'");
                    cmd.Connection = CommonHelper.sqlConn;
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        ddlApplication.SelectedValue = dr["appname"].ToString();
                    }
                }
                catch
                {

                }
                finally
                {
                    CommonHelper.sqlConn.Close();
                }
            }
        }

    }
}