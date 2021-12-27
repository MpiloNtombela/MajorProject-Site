<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Account/AccountBase.master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RegistrationSystem.Account.Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="FormTitle" ContentPlaceHolderID="FormTitle"><%: Title %></asp:Content>
<asp:Content runat="server" ID="FormIcon" ContentPlaceHolderID="FormIcon">
    <asp:Label ID="Icon" runat="server" class="material-icons-outlined md-48" Visible="true">fingerprint</asp:Label>
    <asp:Label ID="ErrorIcon" runat="server" class="material-icons-outlined md-48 text-danger" Visible="false">fingerprint</asp:Label>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="FormFields">

    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
        <p class="note note-danger tiny-text mb-4">
            <asp:Literal runat="server" ID="FailureText" />
        </p>
    </asp:PlaceHolder>

    <mpilo:RequiredTextBox ID="Email" Label="Email Address" TextMode="Email" runat="server" />

    <mpilo:RequiredTextBox ID="Password" Label="Password" TextMode="Password" runat="server" />

    <div class="m-0">
        <label>
            <asp:CheckBox runat="server" ID="RememberMe" />
            <span>Remember me?</span>
        </label>
    </div>

    <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-primary btn-block rounded-pill my-3" />

    <p class="text-center text-uppercase fw-bold small">
        <asp:HyperLink CssClass="text-secondary" runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Create new account</asp:HyperLink>
    </p>


    <%--<p> Enable this once you have account confirmation enabled for password reset functionality
               <asp:HyperLink runat="server" ID="ForgotPasswordHyperLink" ViewStateMode="Disabled">Forgot your password?</asp:HyperLink>
  </p>--%>
</asp:Content>
