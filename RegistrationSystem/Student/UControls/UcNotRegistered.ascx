<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UcNotRegistered.ascx.cs" Inherits="RegistrationSystem.Student.UControls.UcNotRegistered" %>
<div class="card text-center">
    <div class="card-body">
        <h5 class="card-title">Registration required</h5>
        <span class="material-icons-outlined md-64">badge</span>
        <p class="card-text">
          You haven't completed the registration process yet!
        </p>

        <a href="~/Student/Registration" class="btn btn-primary rounded-pill" runat="server">complete registration</a>
    </div>
</div>
