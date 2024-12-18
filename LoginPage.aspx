<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="KnowledgeNexus.LoginPage" %>

<asp:Content ID="head" ContentPlaceHolderID="header" runat="server"
    
></asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <br />              
                <ul class="nav nav-pills">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#userLogin">User Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#adminLogin">Admin Login</a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="tab-content">
            <div id="userLogin" class="container tab-pane active">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 mx-auto">
                            <br />
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col">
                                            <center>
                                                <br />
                                                <img width="150px" src="Icons/profile.png" />
                                            </center>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <center>
                                                <h3>Member Login</h3>
                                            </center>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <hr />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <label>Username</label>
                                            <br />
                                            <div class="form-group">
                                                <asp:TextBox ID="txtMemberId" CssClass="form-control" placeholder="Member ID" runat="server"></asp:TextBox>
                                            </div>
                                            <label>Password</label>
                                            <br />
                                            <div class="form-group">
                                                <asp:TextBox ID="txtMbrPassword" CssClass="form-control" placeholder="Password" TextMode="Password" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <asp:Button ID="btnLogin" CssClass="btn btn-success btn-lg w-100" runat="server" Text="Login" OnClick="btnLogin_Click" />
                                            </div>
                                            <div class="form-group">
                                                <a href="Signup.aspx">
                                                    <input type="button" class="btn btn-info btn-lg w-100" value="Sign Up" /></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <a href="~/default.aspx">Back to Home Screen</a>
                        </div>
                    </div>
                </div>
            </div>
            <div id="adminLogin" class="container tab-pane fade">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 mx-auto">
                            <br />
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">

                                        <div class="col">
                                            <center>
                                                <br />
                                                <img width="150px" src="Icons/AdminSignup.jpeg" />
                                            </center>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <center>
                                                <h3>Admin Login</h3>
                                            </center>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <hr />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <label>Username</label>
                                            <br />
                                            <div class="form-group">
                                                <asp:TextBox ID="txtAdminId" CssClass="form-control" placeholder="Admin ID" runat="server"></asp:TextBox>
                                            </div>
                                            <label>Password</label>
                                            <br />
                                            <div class="form-group">
                                                <asp:TextBox ID="txtAdminPassword" CssClass="form-control" placeholder="Password" TextMode="Password" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <asp:Button ID="btnLoginAdmin" CssClass="btn btn-success btn-lg w-100" runat="server" Text="Login" OnClick="btnLoginAdmin_Click" />
                                            </div>
                                            <div class="form-group">
                                                <a href="Signup.aspx">
                                                    <input type="button" class="btn btn-info btn-lg w-100" value="Sign Up" /></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <a href="~/default.aspx">Back to Home Screen</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
