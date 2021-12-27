<%@ Page Title="Register" Language="C#" MasterPageFile="~/Account/AccountBase.master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="RegistrationSystem.Account.Register" %>

<asp:Content runat="server" ID="Title" ContentPlaceHolderID="FormTitle"><%: Title %></asp:Content>
<asp:Content runat="server" ID="Icon" ContentPlaceHolderID="FormIcon">
    <span class="material-icons-outlined md-48">account_circle</span>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="FormFields">

    <asp:Label CssClass="note note-danger tiny-text d-block mb-4" runat="server" ID="ErrorMessage" Visible="false" />

    <div class="pb-3">
        <asp:ValidationSummary runat="server" CssClass="note note-danger tiny-text" />
        <mpilo:RequiredTextBox ID="FirstName" Label="First Name" TextMode="SingleLine" runat="server" />
        <mpilo:RequiredTextBox ID="LastName" Label="Last Name" TextMode="SingleLine" runat="server" />
        <mpilo:RequiredTextBox ID="Email" Label="Email Address" TextMode="Email" runat="server" />

        <div class="mb-3">
            <div class="form-outline">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:Label runat="server" AssociatedControlID="Password" CssClass="form-label">Password</asp:Label>
            </div>
            <asp:RequiredFieldValidator ID="PasswordValidator" runat="server" ControlToValidate="Password"
                CssClass="text-danger tiny-text" ErrorMessage="The Password is required." />
        </div>

        <div class="mb-3">
            <div class="form-outline">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="form-label">Confirm Password</asp:Label>
            </div>

            <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                CssClass="text-danger tiny-text" Display="Dynamic" ErrorMessage="The confirm password field is required." />
            <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                CssClass="text-danger tiny-text" ErrorMessage="The password and confirmation password do not match." />
        </div>

        <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-primary btn-block rounded-pill" />
        <p class="fw-bold text-uppercase text-center small mt-4">
            <a class="text-secondary" runat="server" href="~/Account/Login">Have an Account? Log In</a>
        </p>
    </div>
</asp:Content>
