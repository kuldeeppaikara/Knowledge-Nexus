<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="KnowledgeNexus.Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



    <div class="container">
        <div class="row">
            <div class="col-md-12 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="150px" src="Icons/SignupUser.jpg" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Signup User</h3>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-4">
                                <label>Full Name </label>
                                <br />
                                <div class="form-group">
                                    <asp:TextBox ID="txtFullName" CssClass="form-control" placeholder="Full Name" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ErrorMessage="*Enter First Name" ControlToValidate="txtFullName" Display="Dynamic" ForeColor="Red" ValidationGroup="groupA" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>

                                <label>Date Of Birth</label>
                                <br />
                                <div class="form-group">
                                    <asp:TextBox ID="txtDOB" CssClass="form-control" placeholder="Date of Birth" TextMode="Date" runat="server"></asp:TextBox>
                                </div>
                                <label>State </label>
                                <br />
                                <div class="form-group">
                                    <asp:DropDownList ID="ddState" CssClass="form-control" runat="server" AutoPostBack="true"></asp:DropDownList>
                                </div>

                            </div>
                            <div class="col-4">
                                <label>User ID</label>
                                <br />
                                <div class="form-group">
                                    <asp:Label ID="lblUserIdError" runat="server" ForeColor="Red" />
                                    <asp:TextBox ID="txtUserId" CssClass="form-control" placeholder="Member ID" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvUserId" runat="server" ErrorMessage="*Valid Username" ControlToValidate="txtUserId" Display="Dynamic" ForeColor="Red" ValidationGroup="groupA" SetFocusOnError="True"></asp:RequiredFieldValidator>

                                </div>


                                <label>Contact Number </label>
                                <br />
                                <div class="form-group">
                                    <asp:TextBox ID="txtContactNum" CssClass="form-control" placeholder="Contact Number" runat="server"></asp:TextBox>
                                </div>
                                <label>City</label>
                                <br />
                                <div class="form-group">
                                    <asp:TextBox ID="txtCity" CssClass="form-control" placeholder="City" runat="server"></asp:TextBox>
                                </div>

                            </div>
                            <div class="col-4">
                                <label>Password</label>
                                <br />
                                <div class="form-group">
                                    <asp:TextBox ID="txtPassword" CssClass="form-control" placeholder="Password" TextMode="Password" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="*Enter a password" ControlToValidate="txtPassword" Display="Dynamic" ForeColor="Red" ValidationGroup="groupA" SetFocusOnError="True"></asp:RequiredFieldValidator>

                                </div>


                                <label>Email ID</label>
                                <br />
                                <div class="form-group">
                                    <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="Email ID" TextMode="Email" runat="server"></asp:TextBox>
                                    <%--<asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="*Enter a valid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>--%>
                                </div>
                                <label>Pin</label>
                                <br />
                                <div class="form-group">
                                    <asp:TextBox ID="txtPin" CssClass="form-control" placeholder="Pin" runat="server"></asp:TextBox>
                                </div>


                            </div>

                        </div>
                        <div class="row">
                            <div class="col-8">
                                <label>Full Address</label>
                                <br />
                                <div class="form-group">
                                    <asp:TextBox ID="txtFullAddress" CssClass="form-control" placeholder="Full Address" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-3"></div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Button ID="btnSignup" CssClass="btn btn-success btn-lg w-100" runat="server" Text="Sign Up" ValidationGroup="groupA" OnClick="btnSignup_Click"  />
                                </div>
                                <div class="form-group">
                                    <a href="LoginPage.aspx">
                                        <input type="button" class="btn btn-info btn-lg w-100" value="Login" /></a>
                                </div>
                            </div>

                        </div>

                        <a href="#">Back to Home Screen</a>
                    </div>
                </div>
            </div>
            <!--form end-->

        </div>

    </div>
    </div>


</asp:Content>
