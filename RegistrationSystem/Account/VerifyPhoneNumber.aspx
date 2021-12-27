<%@ Page Title="Verify Phone Number" Language="C#" MasterPageFile="~/Account/AccountBase.master" AutoEventWireup="true" CodeBehind="VerifyPhoneNumber.aspx.cs" Inherits="RegistrationSystem.Account.VerifyPhoneNumber" %>

<asp:Content runat="server" ContentPlaceHolderID="FormTitle"><%: Title %></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="FormIcon">
    <span class="material-icons-outlined md-48">pin</span>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="FormFields" runat="server">
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
    <asp:HiddenField runat="server" ID="PhoneNumber" />
    <asp:ValidationSummary runat="server" CssClass="note note-danger tiny-text" />
    <mpilo:RequiredTextBox ID="Code" runat="server" Label="Verification Code" TextMode="SingleLine" />

    <asp:Button runat="server" OnClick="Code_Click"
        Text="Submit" CssClass="btn btn-primary btn-block rounded-pill" />

</asp:Content>
