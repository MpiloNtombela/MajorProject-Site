<%@ Page Title="Account Confirmation" Language="C#" MasterPageFile="~/Account/AccountBase.master" AutoEventWireup="true" CodeBehind="Confirm.aspx.cs" Inherits="RegistrationSystem.Account.Confirm" Async="true" %>

<asp:Content runat="server" ContentPlaceHolderID="FormTitle"><%: Title %></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="FormIcon">
    <span id="success" runat="server" class="material-icons-outlined md-48 text-success">verified_user</span>
    <span id="error" runat="server" class="material-icons-outlined md-48 text-danger" visible="false">gpp_maybe</span>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="FormFields">
    <div>
        <asp:PlaceHolder runat="server" ID="successPanel" ViewStateMode="Disabled" Visible="true">
            <p>
                Thank you for confirming your account. Click
                <asp:HyperLink ID="login" runat="server" NavigateUrl="~/Account/Login">here</asp:HyperLink>
                to login             
            </p>
        </asp:PlaceHolder>
        <asp:Label CssClass="d-block text-danger lead text-center" runat="server" ID="errorPanel" ViewStateMode="Disabled" Visible="false">
                An error has occurred while confirming your account.
        </asp:Label>
    </div>
</asp:Content>
