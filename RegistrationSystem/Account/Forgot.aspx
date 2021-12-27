<%@ Page Title="Forgot password" Language="C#" MasterPageFile="~/Account/AccountBase.master" AutoEventWireup="true" CodeBehind="Forgot.aspx.cs" Inherits="RegistrationSystem.Account.ForgotPassword" Async="true" %>

<asp:Content runat="server" ContentPlaceHolderID="FormTitle"><%: Title %></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="FormIcon">
    <span class="material-icons-outlined md-48">password</span>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="FormFields">
    <asp:PlaceHolder runat="server" ID="LoginForm">
        <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
            <p class="note note-danger tiny-text">
                <asp:Literal runat="server" ID="FailureText" />
            </p>
        </asp:PlaceHolder>
        <mpilo:RequiredTextBox runat="server" ID="Email" Label="Your Email Address" TextMode="Email" />
        <asp:Button runat="server" OnClick="Forgot" Text="Email Link" CssClass="btn btn-primary btn-block rounded-pill" />

        <p class="fw-bold text-uppercase text-center small mt-4">
            <a class="text-secondary" runat="server" href="~/Account/Login">remember it? log in</a>
        </p>
    </asp:PlaceHolder>
    <asp:PlaceHolder runat="server" ID="DisplayEmail" Visible="false">
        <p class="text-info">
            Please check your email to reset your password.
        </p>
    </asp:PlaceHolder>
</asp:Content>
