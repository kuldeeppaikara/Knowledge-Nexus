<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Author.aspx.cs" Inherits="KnowledgeNexus.Author" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container border">
        <div class="row">
            <div class="col-lg-10 px-lg4">
                <h4 class="text-base text-primary text-uppercase mb-4 text-center"> Add Author</h4>
            </div>

        </div>
        <div class="row">
            <div class="col-lg-6 px-lg-4">
                <div class="form-group mb-4">
                    <asp:TextBox ID="txtAuthorId" required="true" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Author ID" runat="server"></asp:TextBox>

                </div>
            </div>
            <div class="col-lg-6 px-lg-4">
                <div class="form-group mb-4">
                    <asp:TextBox ID="txtAuthorName" required="true" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Author Name" runat="server"></asp:TextBox>

                </div>
            </div>
            <div class="col-lg-6 px-lg-4">
                <div class="form-group mb-4">
                    <asp:Button ID="btnAdd" Text="Submit" CssClass="btn btn-success" Height="40px" Width="120px" runat="server" OnClick="btnAdd_Click"/>
                    <asp:Button ID="btnUpdate" Text="Update" CssClass="btn-info" Height="40px" Width="120px" runat="server" Visible="false" OnClick="btnUpdate_Click" />
                    <asp:Button ID="btnCancel" Text="Cancel" CssClass="btn-danger" Height="40px" Width="120px" runat="server" Visible="false" OnClick="btnCancel_Click" />

                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                <HeaderTemplate>
                    <table class="table table-bordered table-hover">
                        <thead class="alert-info ">
                            <tr>
                                <th><span>Author ID</span></th>
                                <th><span>Author Name</span></th>
                                <th>&nbsp;</th>
                            </tr>

                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("author_id") %></td>
                        <td><%#Eval("author_name") %></td>
                        <td style="width: 15%">
                            <asp:LinkButton ID="lnkEdit" CssClass="table-link text-primary" runat="server" CommandArgument='<%#Eval("author_id") %>' CommandName="edit" ToolTip="Edit Record">
                                                   <span class="fa-stack">
                                                       <i class="fa fa-square fa-stack-2x"></i>
                                                       <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
                                                   </span>
                            </asp:LinkButton>
                            <asp:LinkButton ID="lnkDelete" CssClass="table-link text-danger" runat="server" CommandArgument='<%#Eval("author_id") %>' CommandName="delete" ToolTip="Delete Record" OnClientClick="return ConfirmDeactivate()">     <!--OnClientClick="return confirmDelete('<%# Eval("author_id") %>');"-->  <!--return confirm('Do you want to delete this row?')-->
                                                   <span class="fa-stack">
                                                       <i class="fa fa-square fa-stack-2x"></i>
                                                       <i class="fa fa-trash fa-stack-1x fa-inverse"></i>

                                                   </span>
                            </asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
                                     </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>

</asp:Content>
