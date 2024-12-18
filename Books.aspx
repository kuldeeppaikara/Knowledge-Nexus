<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Books.aspx.cs" Inherits="KnowledgeNexus.Books" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-6" style="margin-left: -10%; margin-right:1%">
                <br />
                <br />
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Book Details</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img id="imgview" height="150px" width="120px" src="../BookImg/Book1.jpg" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col mb-3">
                                <label>Upload Cover Image:</label>
                                <%--<asp:FileUpload onchange="readURL(this);" class="form-control" ID="FileUpload1" runat="server" />--%>
                                <asp:FileUpload onchange="readURL(this);" class="form-control" ID="CoverImage" runat="server" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <label>Book ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" required="true" ID="txtBookId" runat="server" placeholder="Book ID" Width="50px"></asp:TextBox>
                                        &nbsp
                                        <asp:Button class="form-control btn btn-primary" ID="btnGO" runat="server" Text="Go" Width="15px" OnClick="btnGO_Click" /><!--Get Book By Id-->
                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Enter Book ID" Display="Dynamic" ControlToValidate="TextBox1" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8 mb-3">
                                <label>Book Title</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtBookTitle" runat="server" placeholder="Book Title"></asp:TextBox>
                                    <%--                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* Enter Book Name" Display="Dynamic" ControlToValidate="TextBox2" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <label>Language</label>
                                <div class="form-group mb-3">
                                    <asp:DropDownList class="form-control" ID="txtLanguage" runat="server">
                                        <asp:ListItem Text="English" Value="English" />
                                        <asp:ListItem Text="Hindi" Value="Hindi" />
                                        <%--<asp:ListItem Text="Marathi" Value="Marathi" />
                                        <asp:ListItem Text="French" Value="French" />
                                        <asp:ListItem Text="German" Value="German" />
                                        <asp:ListItem Text="Urdu" Value="Urdu" />--%>
                                    </asp:DropDownList>

                                </div>
                                <label>Publisher Name</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txtPublisher" runat="server" placeholder="Publisher Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label>Author Name</label>
                                <div class="form-group mb-3">
                                    <asp:TextBox class="form-control" ID="txtAuthor" runat="server" placeholder="Author Name"></asp:TextBox>
                                </div>
                                <label>Publish Year</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtPublishYear" runat="server" placeholder="Publish Year"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label>Category</label>
                                <div class="form-group">
                                    <asp:DropDownList CssClass="form-control" ID="txtCategory" runat="server">
                                        <asp:ListItem Text="Action" Value="Action" />
                                        <asp:ListItem Text="Adventure" Value="Adventure" />
                                        <asp:ListItem Text="Comic Book" Value="Comic Book" />
                                        <asp:ListItem Text="Self Help" Value="Self Help" />
                                        <asp:ListItem Text="Motivation" Value="Motivation" />
                                        <asp:ListItem Text="Healthy Living" Value="Healthy Living" />
                                        <asp:ListItem Text="Wellness" Value="Wellness" />
                                        <asp:ListItem Text="Crime" Value="Crime" />
                                        <asp:ListItem Text="Drama" Value="Drama" />
                                        <asp:ListItem Text="Engineering" Value="Engineering" />
                                        <asp:ListItem Text="Fantasy" Value="Fantasy" />
                                        <asp:ListItem Text="Horror" Value="Horror" />
                                        <asp:ListItem Text="Poetry" Value="Poetry" />
                                        <asp:ListItem Text="Personal Development" Value="Personal Development" />
                                        <asp:ListItem Text="Romance" Value="Romance" />
                                        <asp:ListItem Text="Science Fiction" Value="Science Fiction" />
                                        <asp:ListItem Text="Suspense" Value="Suspense" />
                                        <asp:ListItem Text="Thriller" Value="Thriller" />
                                        <asp:ListItem Text="Art" Value="Art" />
                                        <asp:ListItem Text="Autobiography" Value="Autobiography" />
                                        <asp:ListItem Text="Encyclopedia" Value="Encyclopedia" />
                                        <asp:ListItem Text="Health" Value="Health" />
                                        <asp:ListItem Text="History" Value="History" />
                                        <asp:ListItem Text="Math" Value="Math" />
                                        <asp:ListItem Text="Textbook" Value="Textbook" />
                                        <asp:ListItem Text="Science" Value="Science" />
                                        <asp:ListItem Text="Travel" Value="Travel" />
                                    </asp:DropDownList>
                                </div>
                                <label>Edition</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtEdition" runat="server" placeholder="Edition"></asp:TextBox>
                                    <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Enter Edition" Display="Dynamic" ControlToValidate="TextBox9" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col mb-3">
                                <label>Upload PDF: </label>
                                <%--<asp:FileUpload onchange="readURL(this);" class="form-control" ID="FileUpload1" runat="server" />--%>
                                <asp:FileUpload class="form-control" ID="pdfFile" runat="server" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 mb-3">
                                <label>Book Description</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtBookDescription" runat="server" placeholder="Book Description" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                    <br />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="btnAdd" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="btnAdd_Click"/>
                                <asp:Button ID="btnUpdate" Visible="false" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="btnDelete" Visible="false" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="btnDelete_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="btnClear" Visible="false" class="btn btn-lg btn-block btn-danger" runat="server" Text="Clear" OnClick="btnClear_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <a href="#"><< Back to Home</a><br>
            </div>
            <br>
            <div class="col-md-7" style="">
                <br />
                <br />
                <asp:GridView CssClass="table table-striped table-bordered" ID="GridViewBookCard" runat="server" DataSourceID="GridViewDs" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-lg-10">
                                            <div class="row">
                                                <div class="col-12">
                                                    <asp:Label ID="gvTitle" runat="server" Text='<%# Eval("Title") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12">
                                                    Author -
                                                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# Eval("Authors") %>'></asp:Label>
                                                    &nbsp;|&nbsp; Genre -
                                                            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# Eval("Category") %>'></asp:Label>
                                                    &nbsp;|&nbsp; Language -
                                                            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# Eval("Language") %>'></asp:Label>
                                                    &nbsp;
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12">
                                                    Publisher -
                                                            <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# Eval("Publisher") %>'></asp:Label>
                                                    &nbsp; |&nbsp; Publish Year -
                                                            <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# Eval("PublicationYear") %>'></asp:Label>
                                                    &nbsp; |&nbsp; Edition -
                                                            <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# Eval("Edition") %>'></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12">
                                                    Book Description -
                                                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Smaller" ForeColor="#333333" Text='<%# Eval("BookDescription") %>' Font-Italic="True"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-2">
                                            <asp:Image CssClass="img-fluid" ID="Image2" runat="server" ImageUrl='<%# Eval("CoverImgLink") %>' />
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="GridViewDs" runat="server" ConnectionString="Data Source=MSI\SQLEXPRESS;Initial Catalog=LibrarySystem;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [BooksMaster]"></asp:SqlDataSource>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </div>
        </div>

    </div>

</asp:Content>
