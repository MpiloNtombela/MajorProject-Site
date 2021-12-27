<%@ Page Title="Two-Factor Authentication" Language="C#" MasterPageFile="~/Account/AccountBase.master" AutoEventWireup="true" CodeBehind="TwoFactorAuthenticationSignIn.aspx.cs" Inherits="RegistrationSystem.Account.TwoFactorAuthenticationSignIn" %>


<asp:Content runat="server" ContentPlaceHolderID="FormTitle"><%: Title %></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="FormIcon">
    <span class="material-icons-outlined md-48">security</span>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="FormFields" runat="server">
    <asp:PlaceHolder runat="server" ID="sendcode">
        <section>
            <h3 class="lead">Select Two-Factor Authentication Provider:</h3>
            <div class="input-field mb-4">
                <asp:DropDownList runat="server" ID="Providers">
                </asp:DropDownList>
            </div>
            <asp:Button Text="Submit" ID="ProviderSubmit" OnClick="ProviderSubmit_Click" CssClass="btn btn-primary btn-block rounded-pill" runat="server" />

        </section>
    </asp:PlaceHolder>
    <asp:PlaceHolder runat="server" ID="verifycode" Visible="false">
        <section>
            <asp:HiddenField ID="SelectedProvider" runat="server" />
            <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                <p class="note note-danger tiny-text">
                    <asp:Literal runat="server" ID="FailureText" />
                </p>
            </asp:PlaceHolder>
            <mpilo:RequiredTextBox ID="Code" Label="Verification Code" TextMode="SingleLine" runat="server" />
            <div class="m-0 mb-3">
                <label>
                    <asp:CheckBox runat="server" ID="RememberBrowser" />
                    <span>Remember this Browser</span>
                </label>
            </div>
            <asp:Button Text="Submit code" ID="CodeSubmit" OnClick="CodeSubmit_Click" CssClass="btn btn-primary btn-block rounded-pill" runat="server" />
        </section>
    </asp:PlaceHolder>
</asp:Content>
