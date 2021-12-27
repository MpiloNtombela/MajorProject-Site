<%@ Page Title="Error: 404 Not Found" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="RegistrationSystem.Account.Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ExtraStyles" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <mpilo:NotFound URL="~/Account/Manage" Name="Account" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ClientContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ExtraScript" runat="server">
</asp:Content>
