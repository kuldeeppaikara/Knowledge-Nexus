using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KnowledgeNexus
{
    public partial class Signup : System.Web.UI.Page
    {
        DBConnect dbcon = new DBConnect();
        protected void Page_Load(object sender, EventArgs e)
        {
           if(!IsPostBack)
            {
                BindStatesDropdown();
            }
            
        }

        private void BindStatesDropdown()
        {
            SqlCommand cmd = new SqlCommand("SELECT id,name FROM dbo.states", dbcon.GetCon());
            dbcon.OpenCon();
            SqlDataReader dr = cmd.ExecuteReader();
            ddState.DataSource = dr;
            ddState.DataTextField = "name";
            ddState.DataValueField = "id";
            ddState.DataBind();
            ddState.Items.Insert(0, new ListItem("--Select State--"));
        }

        protected bool CheckDuplicate()
        {

            SqlCommand cmd = new SqlCommand("sp_IsUserExist", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserId", txtUserId.Text.Trim());
            cmd.Parameters.AddWithValue("@EmailId", txtEmail.Text.Trim());
            dbcon.OpenCon();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            if (dt.Rows.Count >= 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private void createAcount()
        {
            SqlCommand cmd = new SqlCommand("sp_SignUpRecord", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@FullName", txtFullName.Text);
            cmd.Parameters.AddWithValue("@Userid", txtUserId.Text);
            cmd.Parameters.AddWithValue("@UserPassword", txtPassword.Text);
            cmd.Parameters.AddWithValue("@DateOfBirth", txtDOB.Text);
            cmd.Parameters.AddWithValue("@ContactNo", txtContactNum.Text);
            cmd.Parameters.AddWithValue("@EmailId", txtEmail.Text);
            cmd.Parameters.AddWithValue("@State", ddState.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@City", txtCity.Text);
            cmd.Parameters.AddWithValue("@pinCode", txtPin.Text);
            cmd.Parameters.AddWithValue("@FullAddress", txtFullAddress.Text);
            cmd.Parameters.AddWithValue("@AccountStatus", "Pending");
            dbcon.OpenCon();

            try
            {
                int rowsAffected = cmd.ExecuteNonQuery();
                if(rowsAffected == 1)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success', 'Account Created Successfully', 'success')", true);
                    
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "Error", "swal('Error!','Error Try again!','error')", true);
                }
            }
            catch
            {
                 ClientScript.RegisterClientScriptBlock(this.GetType(), "Error!", "swal('Error!','An error occurred while creating the acount.','error')", true);
            }
            finally
            {
                clrcontrol();
                dbcon.CloseCon();
            }
        }

        private void clrcontrol()
        {
            txtFullName.Text = txtUserId.Text = txtPassword.Text = txtDOB.Text = txtContactNum.Text = txtEmail.Text = txtCity.Text = txtPin.Text = txtFullAddress.Text = String.Empty;
            ddState.SelectedIndex = 0;
            // ddDist.SelectedIndex = 0;
            txtFullName.Focus();
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            if (CheckDuplicate())
            {
                //Response.Write("<script>alert('Member already exixt with this ID and Email');</script>");

                ClientScript.RegisterClientScriptBlock(this.GetType(), "abc", "swal('Error','Member Already Exists!','error')", true);
                txtUserId.Text = txtEmail.Text = String.Empty;

            }
            else
            {
                createAcount();
            }
        }
    }
}