<%@ Page Title="Password Changed" Language="C#" MasterPageFile="~/Account/AccountBase.master" AutoEventWireup="true" CodeBehind="ResetPasswordConfirmation.aspx.cs" Inherits="RegistrationSystem.Account.ResetPasswordConfirmation" Async="true" %>

<asp:Content runat="server" ContentPlaceHolderID="FormTitle"><%: Title %></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="FormIcon">
    <span class="material-icons-outlined md-48 text-success">task_alt</span>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="FormFields">
    <p class="lead text-center">
        Your password has been changed. Click
            <asp:HyperLink ID="login" runat="server" NavigateUrl="~/Account/Login">here</asp:HyperLink>
        to login
    </p>
</asp:Content>
