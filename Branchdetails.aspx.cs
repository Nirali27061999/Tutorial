using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Specialized;

namespace WebApplication4
{
    public partial class Branchdetails : System.Web.UI.Page
    {
        String Connection = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillgridview();
            }
        }
        void fillgridview()
        {
            string user = string.Empty;
            SqlConnection con = new SqlConnection(Connection);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter("branchviewall", con);
            sda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sda.SelectCommand.Parameters.AddWithValue("@isall", 0);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
                if (Convert.ToInt32(dt.Rows[0]["isactive"]) == 0)
                {
                    user = "no";
                }
                else
                {
                    user = "yes";
                }
            }
            else
            {
                dt.Rows.Add(dt.NewRow());
                GridView1.DataSource = dt;
                GridView1.DataBind();
                GridView1.Rows[0].Cells.Clear();
                GridView1.Rows[0].Cells.Add(new TableCell());
                GridView1.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                GridView1.Rows[0].Cells[0].Text = "no data found";
                GridView1.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
            con.Close();

        }
        public void clear()
        {
            txtbmname.Text = "";
            rbyes.Checked = true;
        }
        protected void txtsearch_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtsearch.Text.Trim()))
            {
                fillgridview();
            }
            else
            {
                SqlConnection con = new SqlConnection(Connection);

                con.Open();
                SqlCommand cmd = new SqlCommand("branchsearch", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@branchname", txtsearch.Text.Trim());

                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }




        protected void btnsbt_Click(object sender, EventArgs e)
        {
            DateTime createdDate = DateTime.Now;

            int active = 0;
            if (rbyes.Checked)
            {
                active = 1;
            }
            try
            {
                if (HiddenField1.Value == "")
                {
                    SqlConnection con = new SqlConnection(Connection);

                    con.Open();
                    SqlCommand cmd = new SqlCommand("branchcreate", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id", (HiddenField1.Value == "" ? 0 : Convert.ToInt32(HiddenField1.Value)));
                    cmd.Parameters.AddWithValue("@branchname", txtbmname.Text.Trim());
                    cmd.Parameters.AddWithValue("@createddate", createdDate);
                    cmd.Parameters.AddWithValue("@modifieddate", 0);
                    cmd.Parameters.AddWithValue("@isactive", active);
                    cmd.Parameters.AddWithValue("@isdeleted", 0);


                    cmd.ExecuteNonQuery();
                    con.Close();
                    fillgridview();
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>confirm('Saved Sucessfully')</script>");
                    clear();


                }
                else
                {
                    SqlConnection con = new SqlConnection(Connection);

                    con.Open();
                    SqlCommand cmd = new SqlCommand("branchupdate", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id", (HiddenField1.Value == "" ? 0 : Convert.ToInt32(HiddenField1.Value)));
                    cmd.Parameters.AddWithValue("@branchname", txtbmname.Text.Trim());
                    cmd.Parameters.AddWithValue("@modifieddate", DateTime.Now);
                    cmd.Parameters.AddWithValue("@isactive", active);


                    cmd.ExecuteNonQuery();
                    con.Close();
                    fillgridview();

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>confirm('Update Sucessfully')</script>");
                    clear();


                }
            }
            catch (Exception ex)
            {
                throw ex;
            }




        }

        protected void btnclear_Click(object sender, EventArgs e)
        {
            clear();
        }

        

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            fillgridview();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());


            if (e.CommandName == "ActiveClick")
            {
                string confirmValue = Request.Form["confirm_value"];
                if (confirmValue == "Yes")
                {
                    SqlConnection con = new SqlConnection(Connection);
                    con.Open();

                    SqlDataAdapter sdaQuery = new SqlDataAdapter("branchbyid", con);
                    sdaQuery.SelectCommand.CommandType = CommandType.StoredProcedure;
                    sdaQuery.SelectCommand.Parameters.AddWithValue("@id", id);
                    DataTable dtQuery = new DataTable();
                    sdaQuery.Fill(dtQuery);
                    int isactive = Convert.ToInt32(dtQuery.Rows[0]["isactive"]);

                    SqlDataAdapter sda = new SqlDataAdapter("branchactivechange", con);
                    sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                    sda.SelectCommand.Parameters.AddWithValue("@isactive", 1 - isactive);
                    sda.SelectCommand.Parameters.AddWithValue("@id", id);
                    sda.SelectCommand.Parameters.AddWithValue("@modifieddate", DateTime.Now);

                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    con.Close();
                    fillgridview();
                }
                else
                {
                    fillgridview();
                }
            }
            if (e.CommandName == "Edit")
            {
                SqlConnection con = new SqlConnection(Connection);
                con.Open();

                SqlDataAdapter sda = new SqlDataAdapter("branchbyid", con);
                sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                sda.SelectCommand.Parameters.AddWithValue("@id", id);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                con.Close();
                HiddenField1.Value = id.ToString();
                txtbmname.Text = dt.Rows[0]["branchname"].ToString();
                if (Convert.ToInt32(dt.Rows[0]["isactive"]) == 0)
                {
                    rbno.Checked = true;
                    rbyes.Checked = false;
                }
                else
                {
                    rbyes.Checked = true;
                    rbno.Checked = false;
                }
            }
            if (e.CommandName == "Delete")
            {
                SqlConnection con = new SqlConnection(Connection);
                con.Open();
                SqlCommand cmd = new SqlCommand("branchdeletebyid", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);
                cmd.ExecuteNonQuery();


                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>confirm(' Delete Successfully ')</script>");
                fillgridview();

            }

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            e.Cancel = true;
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void btnIsActive_Click(object sender, EventArgs e)
        {

        }
    }
}