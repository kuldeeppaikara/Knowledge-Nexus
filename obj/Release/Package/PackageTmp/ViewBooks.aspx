<%@ Page Title="View Books" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewBooks.aspx.cs" Inherits="KnowledgeNexus.ViewBooks" %>


<asp:Content ID="header" ContentPlaceHolderID="header" runat="server">
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid">
        <div class="row">
            <asp:SqlDataSource ID="GridViewDs" runat="server" ConnectionString="Data Source=MSI\SQLEXPRESS;Initial Catalog=LibrarySystem;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [BooksMaster]"></asp:SqlDataSource>

            <asp:GridView CssClass="table table-striped table-bordered" ID="GridViewBookCard" runat="server" DataSourceID="GridViewDs" AutoGenerateColumns="False" OnItemCommand="GridView_ItemCommand">
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
                                        <div class="row">
                                            <div class="col-4">
                                            </div>
                                            <div class="col-4">
                                                <br />
                                                <%-- <asp:LinkButton ID="lnkEdit" CssClass="table-link text-primary" runat="server" Text="View" CommandArgument='<%#Eval("BookId") %>' CommandName="edit" ToolTip="view"></asp:LinkButton>--%>

                                                <%-- <asp:Button ID="viewPdf" class="btn btn-primary" Width="150px" runat="server" CommandArgument="<%#Eval("BookId")%>" Text="View" OnClick="viewPdf_Click" />--%>
                                                <asp:Button ID="viewPdf" class="btn btn-primary" Width="150px" runat="server"
                                                    CommandArgument='<%# Eval("BookId") %>' Text="View" OnClick="viewPdf_Click" />
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

        </div>
    </div>



</asp:Content>
