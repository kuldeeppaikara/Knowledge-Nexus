using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KnowledgeNexus
{
    public partial class Author : System.Web.UI.Page
    {
        DBConnect dbcon = new DBConnect();
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

            if(!IsPostBack)
            {
                BindRepeater();
            }
            if (Session["role"] == null || Session["role"].ToString().Equals(""))
            {
                Response.Redirect("~/default.aspx");
            }
        }
        protected void BindRepeater()
        {
            cmd = new SqlCommand("sp_getAuthor", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            dbcon.OpenCon();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
        }
        private void SearchDataForUpdate(string idd)
        {
            cmd = new SqlCommand("getAuthorById", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@id", idd);
            dbcon.OpenCon();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            // DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            da.Fill(ds, "dt");
            dbcon.CloseCon();
            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["AuthorID"] = ds.Tables[0].Rows[0]["author_id"].ToString();
                txtAuthorId.Text = ds.Tables[0].Rows[0]["author_id"].ToString();
                txtAuthorName.Text = ds.Tables[0].Rows[0]["author_name"].ToString();
                btnAdd.Visible = false;
                btnUpdate.Visible = true;
                btnCancel.Visible = true;
                txtAuthorId.ReadOnly = true;
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Error", "swal('Error!','No record Found, Try again..','error')", true);
                //Response.Write("<script>alert('Error! No Record Found Try Again.'); </Script>");
            }
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
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
                DeleteAuthor(id);
            }
        }
        private void DeleteAuthor(string idd)
        {
            cmd = new SqlCommand("DELETE FROM dbo.AuthorMaster WHERE author_id=@author_id;", dbcon.GetCon());
            //cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@author_id", idd);

            dbcon.OpenCon();
            try
            {
                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected == 1)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alertt", "swal('Success!','Author Data Deleted Successfully','success')", true);
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
                dbcon.CloseCon();
            }          
        }
        private void clrcontrole()
        {
            txtAuthorId.Text = txtAuthorName.Text = String.Empty;
            txtAuthorId.Focus();
        }

        protected bool AuthorDuplicacy()
        {
            cmd = new SqlCommand("SELECT COUNT(*) AS IdCount FROM AuthorMaster WHERE author_id =@author_id", dbcon.GetCon());
            cmd.Parameters.AddWithValue("@author_id", txtAuthorId.Text.Trim());
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
        private void InsertAuhtor()
        {
            cmd = new SqlCommand("sp_AuthorInfo", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("author_id", txtAuthorId.Text);
            cmd.Parameters.AddWithValue("author_name", txtAuthorName.Text);
            dbcon.OpenCon();

            try
            {
                int rowsAffected = cmd.ExecuteNonQuery();
                if(rowsAffected == 1)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alertt", "swal('Success','Author Data Inserted Successfully','success')", true);
                    //Response.Write("<script>alert('Author Data Inserted Successfully');</script>");                  
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
                BindRepeater();
                dbcon.CloseCon();
            }
        }
        protected void UpdateAuthor()
        {
            cmd = new SqlCommand("sp_UpdateAuthor", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("author_id", txtAuthorId.Text);
            cmd.Parameters.AddWithValue("author_name", txtAuthorName.Text);
            dbcon.OpenCon();
            try
            {
                int rowsAffected = cmd.ExecuteNonQuery();
                if(rowsAffected == 1)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alertt", "swal('Success','Author Data Updated Successfully','success')", true);
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
                txtAuthorId.ReadOnly = false;
                btnAdd.Visible = true;
                btnCancel.Visible = false;
                btnUpdate.Visible = false;
            }            
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (AuthorDuplicacy())
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alertt", "swal('Erorr!','Author already exits with this ID','error')", true);
                //ClientScript.RegisterClientScriptBlock(this.GetType(), "Duolicacy", "swal('Erorr','Author already exits with this Id!','warning')", true);
                //Response.Write("<script>alert('Author Already exist with this Id');</script>");
                clrcontrole();
            }
            else
            {
                InsertAuhtor();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            UpdateAuthor();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtAuthorId.ReadOnly = false;
            txtAuthorId.Text = txtAuthorName.Text = String.Empty;
            btnAdd.Visible = true;
            btnCancel.Visible = false;
            btnUpdate.Visible = false;
        }
    }
}