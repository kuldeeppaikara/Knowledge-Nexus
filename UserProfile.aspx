<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="KnowledgeNexus.UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid">
        <br />
        <div class="row">
            <div class="col-3">

            </div>
            <div class="col-6" style="">
                <center>
                    <img src="../Icons/profile.png" alt="User Profile" height="96px" width="72px" />
                    <h4>Your Profile</h4>
                    <label>Account Status - </label>
                    <span class="badge rounded-pill bg-success text-lg-center">
                        <asp:Label ID="txtAccStat" runat="server"></asp:Label></span>
                </center>

                <hr />
                <div class="row">
                    <div class="col-md-6">
                        <label>Full Name</label>
                        <div class="form-group">
                            <asp:TextBox ID="txtFullName" CssClass="form-control" placeholder="Full Name" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label>Date of Birth</label>
                        <div class="form-group">
                            <asp:TextBox ID="txtDOB" CssClass="form-control" placeholder="DOB" TextMode="Date" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label>Contact Number</label>
                        <div class="form-group">
                            <asp:TextBox ID="txtContactNum" CssClass="form-control" placeholder="Contact Number" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label>E-mail</label>
                        <div class="form-group">
                            <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="Email" TextMode="Email" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <lable>State</lable>
                        <div class="form-group">
                            <asp:TextBox ID="txtState" CssClass="form-control" placeholder="State" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <lable>City </lable>
                        <div class="form-group">
                            <asp:TextBox ID="txtCity" CssClass="form-control" placeholder="City" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <lable>Pin </lable>
                        <div class="form-group">
                            <asp:TextBox ID="txtPin" CssClass="form-control" placeholder="Pin" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <label>Full Address</label>
                        <div class="form-group">
                            <asp:TextBox ID="txtFullAddress" CssClass="form-control" placeholder="Full Address" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <center>
                            <span class="badge rounded-pill bg-info text-lg-center">Login Credentials</span>
                        </center>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <lable>User ID</lable>
                        <div class="form-group">
                            <asp:TextBox ID="txtUserId" ReadOnly="true" CssClass="form-control" placeholder="User ID" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <lable>Old Password </lable>
                        <div class="form-group">
                            <asp:TextBox ID="txtOldPassword" ReadOnly="true" CssClass="form-control" placeholder="Old Password" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <lable>New Password </lable>
                        <div class="form-group">
                            <asp:TextBox ID="txtNewPassword" TextMode="Password" CssClass="form-control" placeholder="New Password" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-6">
                        <asp:Button ID="btnUpdate" Width="290px" Text="Update" CssClass="btn btn-info" runat="server" />
                    </div>
                </div>
            </div>
           <%-- <div class="col-7">
            </div>--%>
        </div>
    </div>


</asp:Content>
