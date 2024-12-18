<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Members.aspx.cs" Inherits="KnowledgeNexus.Members" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6 border" style="margin-left:-9%">
                <br />
                    <center>
                        <img src="../Icons/profile.png" alt="User Profile" style="height:96px; width:80px;" />
                        <h4>Member Details</h4>
                    </center>
                <hr />
                <div class="row" style="margin-bottom: -15px">
                    <div class="col-sm-6 mb-3">
                        <label>User ID</label>
                        <div class="form-group">
                            <div class="input-group">
                            <asp:TextBox ID="txtMemberId" Width="10px" required="true" CssClass="form-control" ValidationGroup="B" placeholder="Member ID" runat="server"></asp:TextBox> &nbsp
                            <asp:Button ID="btnSearch" Text="Search" CssClass="btn btn-info" Height="37px" Width="70px" runat="server" OnClick="btnSearch_Click"  />
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 mb3">
                        <label>Account Status</label>
                        <div class="form-group">
                            <div class="input-group">
                                <asp:TextBox ID="txtAccountStat" CssClass="form-control" ReadOnly="true" Width="70px" runat="server"  placeholder="Account Status"></asp:TextBox> &nbsp
                                <asp:LinkButton ID="btnActive" runat="server" CssClass="btn btn-success" ValidationGroup="B" OnClick="btnActive_Click" > <i class="fa-solid fa-circle-check"></i> </asp:LinkButton>
                                <%--<asp:Button ID="btnActive" runat="server" CssClass="btn btn-success" Width="37px" Height="37px" OnClick="btnActive_Click"/>--%> &nbsp
                                <asp:LinkButton ID="btnPending" runat="server" CssClass="btn btn-warning" ValidationGroup="B" OnClick="btnPending_Click">  <i class="fa-solid fa-circle-pause"></i>  </asp:LinkButton>
                                <%--<asp:Button ID="c" runat="server" CssClass="btn btn-warning" Width="37px" Height="37px" />--%> &nbsp
                                <asp:LinkButton ID="btnDeactive" runat="server" CssClass="btn btn-danger" ValidationGroup="B" OnClick="btnDeactive_Click" > <i class="fa-solid fa-circle-xmark"></i> </asp:LinkButton>
                                <%--<asp:Button ID="btnDeactive" runat="server" CssClass="btn btn-danger" Width="37px" Height="37px" OnClick="btnDeactive_Click" />--%> 
                            </div>
                         </div>
                    </div>                    
                </div>
                <div class="row" style="margin-bottom: -15px">
                    <div class="col-sm-6 mb-3">
                        <label>Full Name</label>
                        <div class="form-group">
                            <div class="input-group">
                                <asp:TextBox ID="txtFullName" ReadOnly="true" Width="300px" CssClass="form-control" placeholder="Full Name" runat="server"></asp:TextBox> &nbsp &nbsp
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 mb-3">
                        <label>Date of Birth</label>
                        <div class="form-group">
                            <div class="input-group">
                                <asp:TextBox ID="txtDOB" ReadOnly="true" CssClass="form-control" Width="205px" placeholder="Date of Birth" TextMode="Date" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin-bottom: -15px; margin-top: -40px">
                    <div class="col-sm-6 mb-3">
                        <label>Contact Number</label>
                        <div class="form-group">
                            <div class="input-group">
                                <asp:TextBox ID="txtContactNum" ReadOnly="true" Width="205px" CssClass="form-control" placeholder="Contact Number" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 mb-3">
                        <label>E-mail ID</label>
                        <div class="form-group">
                            <div class="input-group">
                                <asp:TextBox ID="txtEmail" ReadOnly="true" Width="350px" CssClass="form-control" placeholder="Email ID" TextMode="Email" runat="server"></asp:TextBox>   &nbsp &nbsp                         
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin-bottom: 15px; margin-top: -40px">
                    <div class="col-sm-4">
                        <label>State</label>
                        <div class="form-group">
                            <div class="input-group">
                                <asp:TextBox ID="txtState" Width="170px" ReadOnly="true" CssClass="form-control" placeholder="State" runat="server"></asp:TextBox>
                            </div>
                        </div>                        
                    </div>
                    <div class="col-sm-4">
                        <label>City</label>
                        <div class="form-group">
                            <div class="input-group">
                                <asp:TextBox ID="txtCity" Width="170px" ReadOnly="true" CssClass="form-control" placeholder="City" runat="server"></asp:TextBox>
                            </div>
                        </div>                        
                    </div>
                    <div class="col-sm-4">
                        <label>Pin</label>
                        <div class="form-group">
                            <div class="input-group">
                                <asp:TextBox ID="txtPin" Width="170px" ReadOnly="true" CssClass="form-control" placeholder="Pin" runat="server"></asp:TextBox>
                            </div>
                        </div>                        
                    </div>
                </div>


                <div class="row" style="margin-bottom: -15px; margin-top: -15px">
                    <div class="col-sm-12">
                        <label>Full Address</label>
                        <div class="form-group">
                            <div class="input-group">
                                <asp:TextBox ID="txtFullAddress" ReadOnly="true" Width="570px" CssClass="form-control" placeholder="Full Address" runat="server"></asp:TextBox>
                                <asp:TextBox Visible="false" ID="txtDist" ReadOnly="true" CssClass="form-control" placeholder="Dist" runat="server"></asp:TextBox>
                            </div>
                        </div>                        
                    </div>
                </div>

                <div class="row" style="margin-top:15px">
                    <div class="col-12">
                        <div class="form-group">
                            
                            <asp:Button ID="btnClear" Visible="true" Text="Clear"  CssClass="btn" BackColor="#cc3300" ForeColor="White"  Width="525px" runat="server" OnClick="btnClear_Click" />

                        </div>
                    </div>
                </div>
                </div>
            
                
            <%--<div class="row">
                <div class="col-12">
                    <div class="form-group">
                    
                    </div>
                </div>
            </div>--%>
            <div class="col-md-7">
                <div class="container">
                    <br />
                    <ul class="nav nav-pills">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#AllMembers"> All Members</a>
                            
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#ActiveMembers"> Active Members</a>
                            
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#PendingMembers"> Pending Members</a>
                            
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#DeactivatedMembers"> Deactive Members</a>
                        </li>
                    </ul>

                    <div class="tab-content">
                        <div id="AllMembers" class="container tab-pane active">
                            <br />
                            <h3>All Members List</h3>
                            
                            <asp:Repeater id="AllMembersRepeater" runat="server" OnItemCommand="AllMembersRepeater_ItemCommand">

                                <HeaderTemplate>
                                    <table class="table table-bordered table-hover" style="max-height:50px; overflow-y:auto;">
                                        <thead>
                                            <tr>
                                                <th><span>User Name</span></th>
                                                <th><span>User Id</span></th>
                                                <th><span> Status </span></th>
                                                <th>&nbsp;</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td> <%#Eval("FullName")%> </td>
                                        <td> <%#Eval("UserId") %></td>
                                        <td><%#Eval("AccountStatus")%></td>
                                        <td >
                                            <asp:LinkButton ID="lnkEdit" CssClass="table-link text-primary" runat="server" CommandArgument='<%#Eval("UserId") %>' CommandName="edit" ToolTip="Edit">
                                                <span class="fa-stack">
                                                    <i class="fa fa-square fa-stack-2x"></i>
                                                    <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
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
                        <div id="ActiveMembers" class="container tab-pane fade">
                            
                            <h3>Active Member List</h3>

                            <asp:Repeater ID="ActiveMemberRepeater" runat="server" OnItemCommand="ActiveMemberRepeater_ItemCommand">

                                <HeaderTemplate>
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th><span>User Name</span></th>
                                                <th><span>User Id</span></th>
                                                <th><span>Status </span></th>
                                                <th>&nbsp;</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("FullName")%> </td>
                                        <td><%#Eval("UserId") %></td>
                                        <td><%#Eval("AccountStatus")%></td>
                                        <td >
                                            <asp:LinkButton ID="lnkEdit" CssClass="table-link text-primary" runat="server" CommandArgument='<%#Eval("UserId") %>' CommandName="edit" ToolTip="Edit">
                                                <span class="fa-stack">
                                                    <i class="fa fa-square fa-stack-2x"></i>
                                                    <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
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
                        <div id="PendingMembers" class="container tab-pane fade">
                            <h3>Pending Status</h3>

                            <asp:Repeater ID="PendingMemberRepeater" runat="server" OnItemCommand="PendingMemberRepeater_ItemCommand">

                        <HeaderTemplate>
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th><span>User Name</span></th>
                                        <th><span>User Id</span></th>
                                        <th><span>Status </span></th>
                                        <th>&nbsp;</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("FullName")%> </td>
                                <td><%#Eval("UserId") %></td>
                                <td><%#Eval("AccountStatus")%></td>
                                <td >
                                    <asp:LinkButton ID="lnkEdit" CssClass="table-link text-primary" runat="server" CommandArgument='<%#Eval("UserId") %>' CommandName="edit" ToolTip="Edit">
                                        <span class="fa-stack">
                                            <i class="fa fa-square fa-stack-2x"></i>
                                            <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
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
                        <div id="DeactivatedMembers" class="container tab-pane fade">
                            <h3>Deactive Members</h3>
                             <asp:Repeater ID="DeactiveMemberRepeater" runat="server" OnItemCommand="DeactiveMemberRepeater_ItemCommand">

                                <HeaderTemplate>
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th><span>User Name</span></th>
                                                <th><span>User Id</span></th>
                                                <th><span>Status </span></th>
                                                <th>&nbsp;</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("FullName")%> </td>
                                        <td><%#Eval("UserId") %></td>
                                        <td><%#Eval("AccountStatus")%></td>
                                        <td >
                                            <asp:LinkButton ID="lnkEdit" CssClass="table-link text-primary" runat="server" CommandArgument='<%#Eval("UserId") %>' CommandName="edit" ToolTip="Edit">
                                                <span class="fa-stack">
                                                    <i class="fa fa-square fa-stack-2x"></i>
                                                    <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
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
        </div>
        </div>

</asp:Content>
