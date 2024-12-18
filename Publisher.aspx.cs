using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KnowledgeNexus
{
    public partial class Publisher : System.Web.UI.Page
    {
        DBConnect dbcon = new DBConnect();
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] == null || Session["role"].ToString().Equals(""))
            {
                Response.Redirect("~/default.aspx");
            }
            BindRepeater();
        }
        protected void BindRepeater()
        {
            cmd = new SqlCommand("select publisher_id,publisher_name from dbo.PublisherMaster;", dbcon.GetCon());
            //cmd.CommandType = System.Data.CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            dbcon.OpenCon();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            PublisherRepeater.DataSource = dt;
            PublisherRepeater.DataBind();
            dbcon.CloseCon();
        }
        private void InsertPublisher()
        {
            cmd = new SqlCommand("sp_InsertPublisher", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("publisher_id", txtPublisherId.Text);
            cmd.Parameters.AddWithValue("publisher_name", txtPublisherName.Text);
            dbcon.OpenCon();
            try
            {
                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected == 1)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alertt", "swal('Success','Publisher Data Inserted Successfully','success')", true);
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "NotInserted", "swal('Error','Data Not Inserted','error')", true);
                }
            }
            catch
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Error!", "swal('Error!','An error occurred while inserting the Data.','error')", true);
            }
            finally
            {
                clrcontrole();
                dbcon.CloseCon();
            }   
        }

        protected bool PublisherDuplicacy()
        {
            cmd = new SqlCommand("SELECT COUNT(*) AS IdCount FROM dbo.PublisherMaster WHERE publisher_id =@publisher_id", dbcon.GetCon());
            cmd.Parameters.AddWithValue("@publisher_id", txtPublisherId.Text.Trim());
            dbcon.OpenCon();
            SqlDataReader reader = cmd.ExecuteReader();
            try
            {
                if (reader.Read())
                {
                    int count = (int)reader["IdCount"];
                    if (count > 0)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            finally
            {
                reader.Close();
                dbcon.CloseCon();
            }
            return false;
        }

        private void SearchDataForUpdate(string idd)
        {
            cmd = new SqlCommand("sp_getPublisherById", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@publisher_id", idd);
            dbcon.OpenCon();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            // DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            da.Fill(ds, "dt");
            dbcon.CloseCon();
            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["PublisherId"] = ds.Tables[0].Rows[0]["publisher_id"].ToString();
                txtPublisherId.Text = ds.Tables[0].Rows[0]["publisher_id"].ToString();
                txtPublisherName.Text = ds.Tables[0].Rows[0]["publisher_name"].ToString();
                btnAdd.Visible = false;
                btnUpdate.Visible = true;
                btnDelete.Visible = true;
                txtPublisherId.ReadOnly = true;
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Error", "swal('Error!','No record Found, Try again..','error')", true);
            }
        }

        private void DeletePublisher(string idd)
        {
            cmd = new SqlCommand("DELETE FROM dbo.PublisherMaster WHERE publisher_id=@publisher_id;", dbcon.GetCon());
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@publisher_id", idd);

            dbcon.OpenCon();
            try
            {
                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected == 1)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alertt", "swal('Success','Author Data Deleted Successfully','success')", true);
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "NotInserted", "swal('Error','No Data Deleted!','error')", true);

                }
            }
            catch
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Error!", "swal('Error!','An error occurred while deleting the Data.','error')", true);

            }
            finally
            {
                clrcontrole();
                BindRepeater();
            }
            
        }
        protected void clrcontrole()
        {
            txtPublisherId.Text = txtPublisherName.Text = String.Empty;
            txtPublisherId.Focus();
            btnAdd.Visible = true;
            btnDelete.Visible = false;
            btnUpdate.Visible = false;
        }
        protected void PublisherRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "edit")
            {
                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { '&' });
                string id = commandArgs[0];
                SearchDataForUpdate(id);

            }
            else if (e.CommandName == "delete")
            {

                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { '&' });
                string id = commandArgs[0];
                DeletePublisher(id);
            }

        }

        private void UpdatePublisher()
        {
            cmd = new SqlCommand("sp_UpdatePublisher", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("publisher_id", txtPublisherId.Text);
            cmd.Parameters.AddWithValue("publisher_name", txtPublisherName.Text);
            dbcon.OpenCon();

            try
            {
                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected == 1)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alertt", "swal('Success','Publisher Data Updated Successfully','success')", true);
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "NotInserted", "swal('Error','No Data Updated','error')", true);
                }
            }
            catch
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Error!", "swal('Error!','An error occurred while updating the Data.','error')", true);
            }
            finally
            {
                clrcontrole();
                BindRepeater();
                txtPublisherId.ReadOnly = false;
                btnAdd.Visible = true;
                btnDelete.Visible = false;
                btnUpdate.Visible = false;
            }
            if (cmd.ExecuteNonQuery() == 1)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alertt", "swal('Success','Publisher Data Updated Successfully','success')", true);
                clrcontrole();
                BindRepeater();
                txtPublisherId.ReadOnly = false;
                btnAdd.Visible = true;
                btnDelete.Visible = false;
                btnUpdate.Visible = false;

            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "NotInserted", "swal('Error','No Data Updated','error')", true);
                txtPublisherId.ReadOnly = false;
                btnAdd.Visible = true;
                btnDelete.Visible = false;
                btnUpdate.Visible = false;
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (PublisherDuplicacy())
            {

                ClientScript.RegisterClientScriptBlock(this.GetType(), "alertt", "swal('Erorr!','Publisher already exits with this ID','error')", true);
                clrcontrole();
            }
            else
            {
                InsertPublisher();
                BindRepeater();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            UpdatePublisher();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            clrcontrole();
        }
    }
}