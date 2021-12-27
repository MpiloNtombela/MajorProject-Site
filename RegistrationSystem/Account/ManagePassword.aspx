<%@ Page Title="Manage Password" Language="C#" MasterPageFile="~/Account/AccountBase.master" AutoEventWireup="true" CodeBehind="ManagePassword.aspx.cs" Inherits="RegistrationSystem.Account.ManagePassword" %>

<asp:Content runat="server" ContentPlaceHolderID="FormTitle"><%: Title %></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="FormIcon">
    <span class="material-icons-outlined md-48">password</span>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="FormFields" runat="server">
    <section id="passwordForm">
        <asp:PlaceHolder runat="server" ID="setPassword" Visible="false">
            <p class="lead">
                You do not have a local password for this site. Add a local
                        password so you can log in without an external login.
            </p>
            <div class="form-horizontal">
                <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="note note-danger tiny-text" />

                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="password" CssClass="col-md-2 control-label">Password</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="password" TextMode="Password" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="password"
                            CssClass="text-danger" ErrorMessage="The password field is required."
                            Display="Dynamic" ValidationGroup="SetPassword" />
                        <asp:ModelErrorMessage runat="server" ModelStateKey="NewPassword" AssociatedControlID="password"
                            CssClass="text-danger" SetFocusOnError="true" />
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="confirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="confirmPassword" TextMode="Password" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="confirmPassword"
                            CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required."
                            ValidationGroup="SetPassword" />
                        <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="confirmPassword"
                            CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match."
                            ValidationGroup="SetPassword" />

                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-2 col-md-10">
                        <asp:Button runat="server" Text="Set Password" ValidationGroup="SetPassword" OnClick="SetPassword_Click" CssClass="btn btn-default" />
                    </div>
                </div>
            </div>
        </asp:PlaceHolder>

        <asp:PlaceHolder runat="server" ID="changePasswordHolder" Visible="false">
            <div class="form-horizontal">
                <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="note note-danger tiny-text" />
                <mpilo:RequiredTextBox runat="server" ID="CurrentPassword" TextMode="Password" Label="Current Passoword" />

                <div class="mb-3">
                    <div class="form-outline">
                        <asp:TextBox runat="server" ID="NewPassword" TextMode="Password" CssClass="form-control" />
                        <asp:Label runat="server" ID="NewPasswordLabel" AssociatedControlID="NewPassword" CssClass="form-label">New password</asp:Label>
                    </div>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="NewPassword"
                        CssClass="text-danger tiny-text" ErrorMessage="The new password is required."
                        ValidationGroup="ChangePassword" />
                </div>
                <div class="mb-3">
                    <div class="form-outline">
                        <asp:TextBox runat="server" ID="ConfirmNewPassword" TextMode="Password" CssClass="form-control" />
                        <asp:Label runat="server" ID="ConfirmNewPasswordLabel" AssociatedControlID="ConfirmNewPassword" CssClass="form-label">Confirm new password</asp:Label>
                    </div>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmNewPassword"
                        CssClass="text-danger tiny-text" Display="Dynamic" ErrorMessage="Confirm new password is required."
                        ValidationGroup="ChangePassword" />
                    <asp:CompareValidator runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword"
                        CssClass="text-danger tiny-text" Display="Dynamic" ErrorMessage="The new password and confirmation password do not match."
                        ValidationGroup="ChangePassword" />
                </div>
                <asp:Button runat="server" Text="Change Password" ValidationGroup="ChangePassword" OnClick="ChangePassword_Click" CssClass="btn btn-primary btn-block rounded-pill" />

            </div>
        </asp:PlaceHolder>
    </section>
</asp:Content>
