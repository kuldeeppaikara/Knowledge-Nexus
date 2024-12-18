using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KnowledgeNexus
{
    public partial class ViewBooks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
                if (!Page.IsPostBack)
                {
                }
            
        }

        protected void viewPdf_Click(object sender, EventArgs e)
        {
            if (Session["role"] == null || Session["role"].ToString().Equals(""))
            {
                Response.Redirect("~/Signup.aspx");
            }
            else
            {
                Button button = (Button)sender;
                string id = button.CommandArgument.ToString();
                Session["BookId"] = id;
                Response.Redirect("~/pdfView.aspx");

            }
        }
        //protected void GridView_ItemCommand(Object source, GridViewCommandEventArgs e)
        //{
        //    if (Session["role"] == null || Session["role"].ToString().Equals(""))
        //    {
        //        Response.Redirect("~/Signup.aspx");
        //    }
        //    else
        //    {
        //        string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { '&' });
        //        string id = commandArgs[0];
        //        Session["BookId"] = id;
        //        Response.Redirect("~/pdfView.aspx");
        //        //if (Session["role"] == null || Session["role"].ToString().Equals(""))
        //        //{
        //        //    Response.Redirect("~/Signup.aspx");
        //        //}
        //        //else
        //        //{
                    
        //        //}
        //    }
        //}
    }
}