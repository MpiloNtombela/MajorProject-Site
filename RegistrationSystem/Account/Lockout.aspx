<%@ Page Title="Locked Out" Language="C#" MasterPageFile="~/Account/AccountBase.master" AutoEventWireup="true" CodeBehind="Lockout.aspx.cs" Inherits="RegistrationSystem.Account.Lockout" %>

<asp:Content runat="server" ContentPlaceHolderID="FormTitle"><%: Title %></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="FormIcon">
    <span class="material-icons-outlined md-48">lock_clock</span>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="FormFields" runat="server">
    <h2 class="text-danger display-6 text-center">This account has been locked out, please try again later.</h2>
</asp:Content>
