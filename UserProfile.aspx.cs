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
    public partial class UserProfile : System.Web.UI.Page
    {
        DBConnect dbcon = new DBConnect();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] == null || Session["role"].ToString().Equals(""))
            {
                Response.Redirect("~/default.aspx");
            }
            GetUserDetail();
        }
        protected void GetUserDetail()
        {
            SqlCommand cmd = new SqlCommand("select * from UserMaster where UserId=@UserId", dbcon.GetCon());
            cmd.Parameters.AddWithValue("@userId", Session["username"].ToString());
            dbcon.OpenCon();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);    
            dbcon.CloseCon();
            if (ds.Tables[0].Rows.Count > 0)
            {
                txtAccStat.Text = ds.Tables[0].Rows[0]["AccountStatus"].ToString();
                txtFullName.Text = ds.Tables[0].Rows[0]["FullName"].ToString(); ;
                txtDOB.Text = ds.Tables[0].Rows[0]["DateOfBirth"].ToString(); ;
                txtContactNum.Text = ds.Tables[0].Rows[0]["ContactNo"].ToString(); ;
                txtEmail.Text = ds.Tables[0].Rows[0]["EmailId"].ToString(); ;
                txtState.Text = ds.Tables[0].Rows[0]["State"].ToString(); ;
                txtCity.Text = ds.Tables[0].Rows[0]["City"].ToString(); ;
                txtPin.Text = ds.Tables[0].Rows[0]["PinCode"].ToString(); 
                txtFullAddress.Text = ds.Tables[0].Rows[0]["FullAddress"].ToString();
                txtUserId.Text = ds.Tables[0].Rows[0]["UserId"].ToString(); ;
                txtOldPassword.Text = ds.Tables[0].Rows[0]["UserPassword"].ToString(); ;
            }

        }

    }
}