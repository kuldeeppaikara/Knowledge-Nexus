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
    public partial class Members : System.Web.UI.Page
    {
        DBConnect dbcon = new DBConnect();
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] == null || Session["role"].ToString().Equals(""))
            {
                Response.Redirect("~/default.aspx");
            }
            BindAll();
        }

        protected void SearchUser()
        {
            cmd = new SqlCommand("sp_MemberIdDetail", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@UserId", txtMemberId.Text);
            dbcon.OpenCon();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "dt");
            dbcon.CloseCon();
            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["FullName"] = ds.Tables[0].Rows[0]["FullName"].ToString();
                txtMemberId.Text = ds.Tables[0].Rows[0]["UserId"].ToString();
                txtFullName.Text = ds.Tables[0].Rows[0]["FullName"].ToString();
                txtEmail.Text = ds.Tables[0].Rows[0]["EmailId"].ToString();
                txtContactNum.Text = ds.Tables[0].Rows[0]["ContactNo"].ToString();
                txtState.Text = ds.Tables[0].Rows[0]["State"].ToString();
                txtDist.Text = ds.Tables[0].Rows[0]["District"].ToString();
                txtCity.Text = ds.Tables[0].Rows[0]["City"].ToString();
                txtPin.Text = ds.Tables[0].Rows[0]["PinCode"].ToString();
                txtFullAddress.Text = ds.Tables[0].Rows[0]["FullAddress"].ToString();
                // btnSearch.Visible = false;
                btnClear.Visible = true;
                // btnActive.Visible = true;
                // btnDeactive.Visible = true;
                txtMemberId.ReadOnly = true;
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Error", "swal('Error!','No record Found, Try again..','error')", true);
            }
        }
        protected void SearchUser(string id)
        {
            cmd = new SqlCommand("sp_MemberIdDetail", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@UserId", id);
            dbcon.OpenCon();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "dt");
            dbcon.CloseCon();
            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["FullName"] = ds.Tables[0].Rows[0]["FullName"].ToString();
                txtMemberId.Text = ds.Tables[0].Rows[0]["UserId"].ToString();
                txtFullName.Text = ds.Tables[0].Rows[0]["FullName"].ToString();
                txtEmail.Text = ds.Tables[0].Rows[0]["EmailId"].ToString();
                txtContactNum.Text = ds.Tables[0].Rows[0]["ContactNo"].ToString();
                txtState.Text = ds.Tables[0].Rows[0]["State"].ToString();
                txtDist.Text = ds.Tables[0].Rows[0]["District"].ToString();
                txtCity.Text = ds.Tables[0].Rows[0]["City"].ToString();
                txtPin.Text = ds.Tables[0].Rows[0]["PinCode"].ToString();
                txtFullAddress.Text = ds.Tables[0].Rows[0]["FullAddress"].ToString();
                //  btnSearch.Visible = false;
                btnClear.Visible = true;

                txtMemberId.ReadOnly = true;
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Error", "swal('Error!','No record Found, Try again..','error')", true);
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            SearchUser();
        }

        protected void ActivateUser()
        {

            cmd = new SqlCommand("sp_ActivateUser", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserId", txtMemberId.Text);

            dbcon.OpenCon();
            try
            {
                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected == 1)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alertt", "swal('Success!','User Account Activated','success')", true);
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "Error!", "swal('Error!','User Not Activated','error')", true);
                }
            }
            catch
            {
                // Handle exceptions, e.g., log the error or display a user-friendly message
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Error!", "swal('Error!','An error occurred while activating the user.','error')", true);
            }
            finally
            {
                dbcon.CloseCon();
                ClearControle();
                btnSearch.Visible = true;
                btnClear.Visible = false;
                // btnActive.Visible = false;
                // btnDeactive.Visible = false;
                txtMemberId.ReadOnly = false;
                BindAll();
            }
        }
        protected void DeactivateUser()
        {
            cmd = new SqlCommand("sp_DeactivateUser", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserId", txtMemberId.Text);

            dbcon.OpenCon();
            try
            {
                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected == 1)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alertt", "swal('Success!','User Account Deactivated','success')", true);
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "Error!", "swal('Error!','User Not Deactivated','error')", true);
                }
            }
            catch
            {
                // Handle exceptions, e.g., log the error or display a user-friendly message
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Error!", "swal('Error!','An error occurred while activating the user.','error')", true);
            }
            finally
            {
                dbcon.CloseCon();
                ClearControle();
                btnSearch.Visible = true;
                btnClear.Visible = false;
                // btnActive.Visible = false;
                // btnDeactive.Visible = false;
                txtMemberId.ReadOnly = false;
                BindAll();

            }
        }
        protected void MakePending()
        {
            cmd = new SqlCommand("sp_MakePending", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserId", txtMemberId.Text);

            dbcon.OpenCon();
            try
            {
                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected == 1)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alertt", "swal('Success!','User Account Status set to Pending','success')", true);
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "Error!", "swal('Error!','An error occurred, please try again...','error')", true);
                }
            }
            catch
            {
                // Handle exceptions, e.g., log the error or display a user-friendly message
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Error!", "swal('Error!','An error occurred please try again..','error')", true);
            }
            finally
            {
                dbcon.CloseCon();
                ClearControle();
                btnSearch.Visible = true;
                btnClear.Visible = false;
                // btnActive.Visible = false;
                // btnDeactive.Visible = false;
                txtMemberId.ReadOnly = false;
                BindAll();

            }
        }
        protected void ClearControle()
        {
            txtMemberId.Text = txtFullName.Text = txtEmail.Text = String.Empty;
            txtContactNum.Text = txtState.Text = txtDist.Text = String.Empty;
            txtCity.Text = txtPin.Text = txtFullAddress.Text = String.Empty;
            txtMemberId.ReadOnly = false;
        }
        protected void AllMembersRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "edit")
            {
                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { '&' });
                string id = commandArgs[0];
                SearchUser(id);
            }
        }

        protected void ActiveMemberRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { '&' });
            string id = commandArgs[0];
            SearchUser(id);
        }

        protected void PendingMemberRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { '&' });
            string id = commandArgs[0];
            SearchUser(id);
        }

        protected void DeactiveMemberRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { '&' });
            string id = commandArgs[0];
            SearchUser(id);
        }
        protected void BindRepeaterAllMember()
        {
            cmd = new SqlCommand("sp_AllMember", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            dbcon.OpenCon();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            AllMembersRepeater.DataSource = dt;
            AllMembersRepeater.DataBind();
        }
        protected void BindActiveMember()
        {
            cmd = new SqlCommand("sp_ActiveMember", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            dbcon.OpenCon();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            ActiveMemberRepeater.DataSource = dt;
            ActiveMemberRepeater.DataBind();
        }
        protected void BindPendingMember()
        {
            cmd = new SqlCommand("sp_PendingMember", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            dbcon.OpenCon();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            PendingMemberRepeater.DataSource = dt;
            PendingMemberRepeater.DataBind();
        }
        protected void BindDeactiveMember()
        {
            cmd = new SqlCommand("sp_DeactiveMember", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            dbcon.OpenCon();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            DeactiveMemberRepeater.DataSource = dt;
            DeactiveMemberRepeater.DataBind();
        }
        protected void BindAll()
        {
            BindRepeaterAllMember();
            BindActiveMember();
            BindPendingMember();
            BindDeactiveMember();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearControle();
            btnSearch.Visible = true;
            btnClear.Visible = false;
            // btnActive.Visible= false;
            //  btnDeactive.Visible= false;
            txtMemberId.ReadOnly = false;
        }

        protected void btnActive_Click(object sender, EventArgs e)
        {
            ActivateUser();
        }

        protected void btnPending_Click(object sender, EventArgs e)
        {
            MakePending();
        }

        protected void btnDeactive_Click(object sender, EventArgs e)
        {
            DeactivateUser();
        }
    }
}