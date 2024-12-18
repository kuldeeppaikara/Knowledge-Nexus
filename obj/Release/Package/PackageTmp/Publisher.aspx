<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Publisher.aspx.cs" Inherits="KnowledgeNexus.Publisher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="container-fluid">
    <div class="row">
        <div class="col-4 border">
            <div class="row">
                <div class="col-12">
                    <h4>Add Publisher</h4>
                    <div class="form-group">
                        <asp:TextBox ID="txtPublisherId" required="true" CssClass="form-control" placeholder="Publisher Id" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtPublisherName" required="true" CssClass="form-control" placeholder="Publisher Name" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="btnAdd" CssClass="btn-success" Height="30px" Width="80px" runat="server" Text="Add"  OnClick="btnAdd_Click" />
                        <asp:Button ID="btnUpdate" CssClass="btn-info" Visible="true" Height="30px" Width="80px" runat="server" Text="Update" OnClick="btnUpdate_Click"  />
                        <asp:Button ID="btnDelete" CssClass="btn-danger" Visible="true" Height="30px" Width="80px" runat="server" Text="Cancel"  OnClick="btnDelete_Click" />
                    </div>
                </div>
            </div>
            
        </div>
        <div class="col-8">
            <div class="table table-responsive">
                <h4>show all publisher List:</h4>
                <asp:Repeater ID="PublisherRepeater" runat="server" OnItemCommand="PublisherRepeater_ItemCommand">
                    <HeaderTemplate>
                        <table class="table table-bordered table-hover">
                            <thead class="alert-info ">
                                <tr>
                                    <th><span>Publisher ID</span></th>
                                    <th><span>Publisher Name</span></th>
                                    <th>&nbsp;</th>
                                </tr>

                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("publisher_id") %></td>
                            <td><%# Eval("publisher_name") %></td>
                            <td style="width: 18%">
                                <asp:LinkButton ID="lnkEdit" CssClass="table-link text-primary" runat="server" CommandArgument='<%# Eval("publisher_id") %>' CommandName="edit" ToolTip="Edit Record">
                <span class="fa-stack">
                    <i class="fa fa-square fa-stack-2x"></i>
                    <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
                </span>
                                </asp:LinkButton>
                                <asp:LinkButton ID="lnkDelete" CssClass="table-link text-danger" runat="server" CommandArgument='<%# Eval("publisher_id") %>' CommandName="delete" ToolTip="Delete Record" OnClientClick="return ConfirmDeactivate()">
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
    </div>
</div>
</asp:Content>
