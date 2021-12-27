<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UcRequiredTextBox.ascx.cs" Inherits="RegistrationSystem.UserControls.UcRequiredTextBox" %>
<div class="mb-3">
    <div class="form-outline">
        <span id="IconX" runat="server" class="material-icons-round trailing"></span>
        <asp:TextBox runat="server" ID="ControlID" CssClass="form-control" TextMode="SingleLine" required="true" />
        <asp:Label ID="ControlLabel" runat="server" AssociatedControlID="ControlID" CssClass="form-label">Control Label</asp:Label>
    </div>
    <asp:RequiredFieldValidator ID="ControlValidator" runat="server" ControlToValidate="ControlID"
        CssClass="text-danger tiny-text" ErrorMessage="The field is required." ValidationGroup="Control" />
</div>
