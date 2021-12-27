<%@ Page Title="Account Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="RegistrationSystem.Account.Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-md col-md-12 col-lg-7 mx-auto">
        <h2 class="text-center"><%: Title %></h2>
        <div class="mb-3 text-center">
            <span class="material-icons-outlined md-48">manage_accounts</span>
        </div>
        <div>
            <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
                <p class="note note-success"><%: SuccessMessage %></p>
            </asp:PlaceHolder>
        </div>
        <h3>Personal</h3>
        <div class="card mb-3">
            <div class="card-body px-2 px-sm-3">
                <div class="row justify-content-between px-md-1">
                    <% if (HasPhoneNumber)
                        { %>
                    <div class="col-sm-12 col-md-6">
                        <h4 class="lead">Phone Number</h4>
                        <p class="mb-0">
                            No Phone Number added yet
                        </p>
                    </div>
                    <div class="col-sm-12 col-md-6 text-end mt-3 mt-sm-0">
                        <asp:HyperLink NavigateUrl="/Account/AddPhoneNumber" CssClass="btn btn-sm rounded-pill btn-outline-primary" runat="server" Text="Add phone Number" />
                    </div>
                    <% }
                        else
                        { %>
                    <div class="col-sm-12 col-md-6">
                        <h4 class="lead">Phone Number</h4>
                        <p class="mb-0">
                            <asp:Label Text="" ID="PhoneNumber" runat="server" />
                        </p>
                    </div>
                    <div class="col-sm-12 col-md-6 text-end mt-3 mt-sm-0">
                        <asp:HyperLink NavigateUrl="/Account/AddPhoneNumber" CssClass="btn btn-sm rounded-pill btn-outline-primary" runat="server" Text="Change it" />
                        <asp:LinkButton CssClass="btn btn-sm rounded-pill btn-outline-danger" Text="Remove it" OnClick="RemovePhone_Click" runat="server" />
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
        <h3>Security</h3>
        <div class="card px-2 px-sm-3 py-3">
            <div class="card shadow-0 mb-3">
                <div class="card-body p-0">
                    <div class="row justify-content-between px-md-1">
                        <div class="col-sm-12 col-md-6">
                            <h4 class="lead">Access</h4>
                            <p class="mb-0">
                                Password protected
                            </p>
                        </div>
                        <div class="col-sm-12 col-md-6 text-end mt-3 mt-sm-0">
                            <asp:HyperLink CssClass="btn btn-sm rounded-pill btn-outline-danger mt-2 mt-sm-0"
                                NavigateUrl="/Account/ManagePassword" Visible="false" ID="ChangePassword" runat="server"> change password
                            </asp:HyperLink>
                            <asp:HyperLink CssClass="btn btn-sm rounded-pill btn-outline-danger mt-2 mt-sm-0"
                                NavigateUrl="/Account/ManagePassword" Visible="false" ID="CreatePassword" runat="server">
                                    Create Password
                            </asp:HyperLink>
                        </div>
                    </div>
                </div>
            </div>
            <hr />
            <div class="card shadow-0">
                <div class="card-body p-0">
                    <div class="row justify-content-between px-md-1">
                        <div class="col-sm-12 col-md-9">
                            <h4 class="lead">2Factor Authentication</h4>
                            <p class="mb-0 small">
                                This extra security measure requires you to verify your identity using a randomized 6-digit code we'll send you each time you attempt to log in.
                            </p>
                        </div>
                        <div class="col-sm-12 col-md-3 text-end mt-3 mt-sm-0">
                            <% if (TwoFactorEnabled)
                                { %>
                            <asp:LinkButton CssClass="btn btn-sm btn-danger rounded-pill" Text="Disable 2FA" runat="server" CommandArgument="false" OnClick="TwoFactorDisable_Click" />

                            <% }
                                else
                                { %>

                            <asp:LinkButton CssClass="btn btn-sm btn-success rounded-pill" Text="Enable 2FA" CommandArgument="true" OnClick="TwoFactorEnable_Click" runat="server" />

                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--        <h4 class="lead fw-bold">Personal</h4>
        <hr />--%>
        <%--<dt>External Logins:</dt>
                        <dd><%: LoginsCount %>
                            <asp:HyperLink NavigateUrl="/Account/ManageLogins" Text="[Manage]" runat="server" />

                        </dd>--%>
        <%--
                        Phone Numbers can used as a second factor of verification in a two-factor authentication system.
                        See <a href="https://go.microsoft.com/fwlink/?LinkId=403804">this article</a>
                        for details on setting up this ASP.NET application to support two-factor authentication using SMS.
                        Uncomment the following blocks after you have set up two-factor authentication
        --%>
    </div>
</asp:Content>
