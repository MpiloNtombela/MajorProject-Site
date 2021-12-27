<%@ Page Title="Add a phone number" Language="C#" MasterPageFile="~/Account/AccountBase.master" AutoEventWireup="true" CodeBehind="AddPhoneNumber.aspx.cs" Inherits="RegistrationSystem.Account.AddPhoneNumber" %>

<asp:Content runat="server" ContentPlaceHolderID="FormTitle"><%: Title %></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="FormIcon">
    <span class="material-icons-outlined md-48">dialpad</span>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="FormFields" runat="server">
    <asp:ValidationSummary runat="server" CssClass="note note-danger tiny-text" />
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
    <mpilo:RequiredTextBox ID="PhoneNumber" Label="Phone Number" TextMode="Phone" runat="server" />
    <asp:Button runat="server" OnClick="PhoneNumber_Click"
        Text="Submit" CssClass="btn btn-primary btn-block rounded-pill" />
</asp:Content>
