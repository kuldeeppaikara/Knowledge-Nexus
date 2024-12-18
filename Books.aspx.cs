using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KnowledgeNexus
{
    public partial class Books : System.Web.UI.Page
    {
        DBConnect dbcon = new DBConnect();
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] == null || Session["role"].ToString().Equals(""))
            {
                Response.Redirect("~/default.aspx");
            }

        }


        protected void InsertBook()
        {
            string imgPath = Server.MapPath("~/BookImg/");
            string pdfPath = Server.MapPath("~/PDFs/");
            string imgFilename = Path.GetFileName(CoverImage.PostedFile.FileName);
            string imgExtension = Path.GetExtension(CoverImage.PostedFile.FileName);
            string pdfFilename = Path.GetFileName(pdfFile.PostedFile.FileName);
            string pdfExtension = Path.GetExtension(pdfFile.PostedFile.FileName);

            string imgUniqueFilename = Guid.NewGuid().ToString() + imgExtension;
            string imgFullpath = Path.Combine(imgPath, imgUniqueFilename);

            string pdfUniqueFilename = Guid.NewGuid().ToString() + pdfExtension;
            string pdfFullPath = Path.Combine(pdfPath, pdfUniqueFilename);

            
            cmd = new SqlCommand("sp_insertBook", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@BookId", txtBookId.Text);//1
            cmd.Parameters.AddWithValue("@Title", txtBookTitle.Text);//2
            cmd.Parameters.AddWithValue("@Authors", txtAuthor.Text);//3
            cmd.Parameters.AddWithValue("@PublicationYear", txtPublishYear.Text);//4
            cmd.Parameters.AddWithValue("@Publisher", txtPublisher.Text);//5
            cmd.Parameters.AddWithValue("@Category", txtCategory.SelectedValue);//6
            cmd.Parameters.AddWithValue("@Language", txtLanguage.SelectedValue);//7
            cmd.Parameters.AddWithValue("@Edition", txtEdition.Text);//8                                                               
            cmd.Parameters.AddWithValue("@BookDescription", txtBookDescription.Text);//11
            cmd.Parameters.AddWithValue("@ImgLink", "~/BookImg/" + imgUniqueFilename);//p12 imgfilepath
            cmd.Parameters.AddWithValue("@pdfLink", "PDFs/" + pdfUniqueFilename);//13 pdfFilepath
            dbcon.OpenCon();
            try
            {
                
                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected == 1)
                {
                    CoverImage.SaveAs(imgFullpath);
                    pdfFile.SaveAs(pdfFullPath);
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alertt", "swal('Success!','Book Data Inserted Successfully','success')", true);
                }
                else
                {
                    // Database insertion failed, remove temporary files
                    if (File.Exists(imgFullpath))
                    {
                        File.Delete(imgFullpath);
                    }
                    if (File.Exists(pdfFullPath))
                    {
                        File.Delete(pdfFullPath);
                    }
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alertt", "swal('Error!','Book Data Not Inserted','error')", true);
                }
            }
            
            catch (Exception ex)
            {         
                 ClientScript.RegisterClientScriptBlock(this.GetType(), "Error!", "swal('Error!','An error occurred while inserting the details.','error')", true);

                // Database insertion failed, remove temporary files
                if (File.Exists(imgFullpath))
                {
                    File.Delete(imgFullpath);
                }
                if (File.Exists(pdfFullPath))
                {
                    File.Delete(pdfFullPath);
                }
            }
            finally
            {
                dbcon.CloseCon();
                clearControl();
               

            }
        }

        protected void SearchBook()
        {
            
            cmd = new SqlCommand("SELECT * FROM dbo.BooksMaster WHERE BookId=@BookId", dbcon.GetCon());
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@BookId", txtBookId.Text);

            dbcon.OpenCon();

            try
            {
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0) // Check for empty tables
                {
                    Session["BookId"] = ds.Tables[0].Rows[0]["BookId"].ToString();
                    txtBookTitle.Text = ds.Tables[0].Rows[0]["Title"].ToString();
                    txtLanguage.Text = ds.Tables[0].Rows[0]["Language"].ToString();
                    txtAuthor.Text = ds.Tables[0].Rows[0]["Authors"].ToString();
                    txtCategory.SelectedValue = ds.Tables[0].Rows[0]["Category"].ToString();
                    txtPublisher.Text = ds.Tables[0].Rows[0]["Publisher"].ToString();
                    txtPublishYear.Text = ds.Tables[0].Rows[0]["PublicationYear"].ToString();
                    txtEdition.Text = ds.Tables[0].Rows[0]["Edition"].ToString();
                    txtBookDescription.Text = ds.Tables[0].Rows[0]["BookDescription"].ToString();


                    txtBookId.ReadOnly = true;
                    Switch();
                }
                else
                {
                    // No record found, display message
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "Error", "swal('Error!','No record found for Book ID: ' + '" + txtBookId.Text + "', 'error')", true);
                    // Clear textboxes (optional)
                    txtBookTitle.Text = "";
                    // ... clear other textboxes
                }
            }
            
            catch (Exception ex)
            {
                // Log the error for debugging
                Console.WriteLine("Error: " + ex.Message);

                // Display error message on the label
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Error", "document.getElementById('" + Label1.ClientID + "').innerHTML = '" + ex.Message + "';", true);
            }
            finally
            {

                dbcon.CloseCon();
            }
        }
        protected bool DuplicateBook()
        {
            cmd = new SqlCommand("SELECT COUNT(*) AS IdCount FROM BooksMaster WHERE BookId =@BookId", dbcon.GetCon());
            cmd.Parameters.AddWithValue("@BookId", txtBookId.Text);
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
        private void Switch()
        {
            txtBookId.ReadOnly = true;
            btnAdd.Visible = false;
            btnClear.Visible = true;
            btnDelete.Visible = true;
            btnUpdate.Visible = true;
            CoverImage.Visible = false;
            pdfFile.Visible = false;
        }
        private void SwitchBack()
        {
            txtBookId.ReadOnly = false;
            btnAdd.Visible = true;
            btnClear.Visible = false;
            btnDelete.Visible = false;
            btnUpdate.Visible = false;
            CoverImage.Visible = true;
            pdfFile.Visible = true;
        }
        protected void clearControl()
        {
            txtBookId.Text = txtBookTitle.Text = txtAuthor.Text = txtPublisher.Text = String.Empty;
            txtPublishYear.Text = txtEdition.Text = txtBookDescription.Text = String.Empty;
            txtLanguage.SelectedIndex = 0;
            txtCategory.SelectedIndex = 0;
        }

        protected void UpdateBook()
        {
            
            cmd = new SqlCommand("sp_updateBook", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@BookId", txtBookId.Text);//1
            cmd.Parameters.AddWithValue("@Title", txtBookTitle.Text);//2
            cmd.Parameters.AddWithValue("@Authors", txtAuthor.Text);//3
            cmd.Parameters.AddWithValue("@PublicationYear", txtPublishYear.Text);//4
            cmd.Parameters.AddWithValue("@Publisher", txtPublisher.Text);//5
            cmd.Parameters.AddWithValue("@Category", txtCategory.SelectedValue);//6
            cmd.Parameters.AddWithValue("@Language", txtLanguage.SelectedValue);//7
            cmd.Parameters.AddWithValue("@Edition", txtEdition.Text);//                                                                   
            cmd.Parameters.AddWithValue("@BookDescription", txtBookDescription.Text);//11
            dbcon.OpenCon();
            try
            {
                int rowsAfftected = cmd.ExecuteNonQuery();
                if (rowsAfftected == 1)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alertt", "swal('Success!','Book Data Updated Successfully','success')", true);
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alertt", "swal('Error!','Book Data Not Updated','error')", true);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);

                // Display error message on the label
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Error", "document.getElementById('" + Label1.ClientID + "').innerHTML = '" + ex.Message + "';", true);
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Error!", "swal('Error!','An error occurred while updating the details.','error')", true);
            }
            finally
            {
                SwitchBack();
                clearControl();
                dbcon.CloseCon();
            }

        }
        protected void DeleteBook()
        {
            cmd = new SqlCommand("DELETE FROM BooksMaster WHERE BookId=@BookId;", dbcon.GetCon());
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@BookId", txtBookId.Text);
            dbcon.OpenCon();
            try
            {
                int rowAffected = cmd.ExecuteNonQuery();
                if (rowAffected == 1)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alertt", "swal('Success!','Book Record Deleted Successfully','success')", true);
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alertt", "swal('Error!','Book Record Not Deleted','error')", true);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);

                // Display error message on the label
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Error", "document.getElementById('" + Label1.ClientID + "').innerHTML = '" + ex.Message + "';", true);
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Error!", "swal('Error!','An error occurred while deleting the record.','error')", true);
            }
            finally
            {
                dbcon.CloseCon();
            }



        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (DuplicateBook())
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alertt", "swal('Erorr!','Book already exits with this ID','error')", true);
            }
            else
            {
                InsertBook();
                
                //BindRepeater();
            }

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            UpdateBook();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            DeleteBook();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtBookId.ReadOnly = false;
            clearControl();
            SwitchBack();
        }

        protected void btnGO_Click(object sender, EventArgs e)
        {
            SearchBook();
        }
    }
}