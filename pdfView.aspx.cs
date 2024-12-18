using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace KnowledgeNexus
{
    public partial class pdfView : System.Web.UI.Page
    {
        DBConnect dbcon = new DBConnect();
        HtmlGenericControl pdfViewer = new HtmlGenericControl("iframe");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] == null || Session["role"].ToString().Equals(""))
            {
                Response.Redirect("~/default.aspx");
                Fetch_Pdf();
            }
        }

        protected void Fetch_Pdf()
        {
            SqlCommand cmd = new SqlCommand("select PdfLink from BooksMaster where BookId=@BookId", dbcon.GetCon());
            cmd.Parameters.AddWithValue("@BookId", Session["BookId"].ToString());
            dbcon.OpenCon();
            SqlDataReader  reader = cmd.ExecuteReader();
            string pdfLink = "";
            if (reader.Read())
            {
                pdfLink = reader.GetString(0);
            }
            reader.Close();
            dbcon.CloseCon();
            
            pdfViewer.Attributes["src"] = pdfLink;
        }



        
    }
}