<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UcRegApproved.ascx.cs" Inherits="RegistrationSystem.Student.UControls.UcRegApproved" %>
<div class="card text-center">
    <div class="card-body">
        <h5 class="card-title">Registration Status</h5>
        <span class="material-icons-outlined text-success md-64">task_alt</span>
        <p class="h5 w-75 mx-auto">
            Your registration has been approved by admin, you can proceed to add your banking details for registration payments
        </p>
        <div class="mb-5 mt-4">
            <a href="~/Secure/Banking.aspx" class="btn btn-primary rounded-pill" runat="server">add banking details</a>
        </div>
        <p class="text-muted tiny-text mt-3 text-center">
            Access to Student Portal will be available once all required details are captured
        </p>
    </div>
</div>
