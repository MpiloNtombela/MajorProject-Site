<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UcRegNotApproved.ascx.cs" Inherits="RegistrationSystem.Student.UControls.UcRegNotApproved" %>
<div class="card text-center">
    <div class="card-body">
        <img height="250" src="~/Content/Static/waiting.svg" runat="server" />

        <p class="h6">
            This registration has not been approved yet
        </p>
        <p class="h3 mt-3">Reason</p>
        <p id="NotApprovedReason" runat="server" class="h4 text-danger fst-italic"></p>
        <hr />
        <asp:PlaceHolder runat="server" ID="NumMissing" Visible="false">
            <p class="d-flex justify-content-center">
                <span class="material-icons-outlined md-24">notifications</span> Get notified about registration status
            </p>
            <a href="~/Account/AddPhoneNumber.aspx" class="btn btn-outline-secondary rounded-pill" runat="server">add phone number</a>
        </asp:PlaceHolder>
        <p class="text-muted tiny-text mt-3 text-center">
            Access to Student Portal will be available once the registartion has been approved
        </p>
    </div>
</div>
