using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KnowledgeNexus
{
    public partial class SiteMaster : MasterPage
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
           
            try
            {
                if (Session["role"].Equals(""))
                {
                    DefaultView();
                }
                else if (Session["role"].Equals("user"))
                {
                    lnk2.Visible = true;
                    lnk2.Text = "Hello " + Session["fullname"].ToString();                  
                    lnk1.Visible = true;
                    lnk3.Visible = false;
                    lnk4.Visible = false;
                    lnk5.Visible = false;
                    lnk6.Visible = false;
                    lnkBtnLogin.Visible = false;
                    lnkBtnSignup.Visible = false;
                }
                else if (Session["role"].Equals("admin"))
                {
                    lnk2.Visible = true;
                    lnk2.Text = "Admin " + Session["fullname"].ToString();
                    lnk1.Visible = true;
                    lnk3.Visible = true;
                    lnk4.Visible = true;
                    lnk5.Visible = true;
                    lnk6.Visible = true;
                    lnkBtnLogin.Visible = false;
                    lnkBtnSignup.Visible = false;
                    About.Visible = false;
                    Contact.Visible = false;
                }
            }
            catch
            {

            }
            
            //if (Request.Url.AbsolutePath.Contains("ViewBooks"))
            //{
            //    About.Visible = false;
            //    Contact.Visible = false;
            //    lnk3.Visible = true;
            //    lnk4.Visible = true;
            //    lnk5.Visible = true;
            //    lnk6.Visible = true;
            //}
        }

        protected void lnkBtnViewBook_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewBooks.aspx");
        }

        protected void lnkBtnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/LoginPage.aspx");
        }

        protected void lnkBtnSignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Signup.aspx");
        }

        protected void lnk3_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Author.aspx");
        }

        protected void lnk4_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Publisher.aspx");
        }

        protected void lnk5_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Members.aspx");
        }

        protected void lnk6_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Books.aspx");
        }

        protected void lnk1_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            //Session["role"] = "";
            //Session["fullname"] = "";
            //Session["username"] = "";
            //Session["status"] = "";
            DefaultView();
            Response.Redirect("~/default.aspx");
        }

        protected void DefaultView()
        {            
            lnk1.Visible = false;
            lnk2.Visible = false;
            lnk3.Visible = false;
            lnk4.Visible = false;
            lnk5.Visible = false;
            lnk6.Visible = false;
            About.Visible = true;
            Contact.Visible = true;
            lnkBtnSignup.Visible = true;
            lnkBtnLogin.Visible = true;
        }

        protected void lnk2_Click(object sender, EventArgs e)
        {
            if (Session["role"].ToString().Equals("user"))
            {
                Response.Redirect("~/UserProfile.aspx");
            }
            
        }
    }
}