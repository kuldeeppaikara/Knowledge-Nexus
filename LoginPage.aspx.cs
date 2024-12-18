using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KnowledgeNexus
{
    
    
    public partial class LoginPage : System.Web.UI.Page
    {
        DBConnect dbcon = new DBConnect();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("UserLogin", dbcon.GetCon());
            dbcon.OpenCon();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserId", txtMemberId.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", txtMbrPassword.Text.Trim());
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                if (dr.Read())
                {
                    string AccountStatus = dr.GetValue(2).ToString();

                    if (AccountStatus.Equals("Active", StringComparison.OrdinalIgnoreCase))
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "Success", "swal('Login Successful!','','success')", true);
                        //Response.Write("<script> alert('Login Successful') </script>");
                        Session["role"] = "user";
                        Session["fullname"] = dr.GetValue(0).ToString();
                        Session["username"] = dr.GetValue(1).ToString();
                        Session["status"] = dr.GetValue(2).ToString();
                        Response.Redirect("default.aspx");
                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Account not active!','Please contact administrator','warning')", true);
                        //Response.Write("<script> alert('Your account is not active. Please contact administrator.') </script>");
                    }
                }
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Error", "swal('Error!','Invalid Username/Password','error')", true);
                //Response.Write("<script> alert('Invalid Username/Password') </script>");
            }
            dr.Close();
            dbcon.CloseCon();

        }

        protected void btnLoginAdmin_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("sp_AdminLogin", dbcon.GetCon());
            dbcon.OpenCon();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@username", txtAdminId.Text.Trim());
            cmd.Parameters.AddWithValue("@password", txtAdminPassword.Text.Trim());
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "Success", "swal('Login Successful!','','success')", true);
                    //Response.Write("<script> alert('Login Successful') </script>");
                    Session["role"] = "admin";
                    Session["username"] = dr.GetValue(0).ToString();
                    Session["fullname"] = dr.GetValue(2).ToString();
                    //Session["status"] = dr.GetValue(3).ToString();
                }
                Response.Redirect("~/default.aspx");
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Error", "swal('Error!','Invalid Username/Password','error')", true);
                //Response.Write("<script> alert('Invalid Username/Password') </script>");
            }

        }
    }
}