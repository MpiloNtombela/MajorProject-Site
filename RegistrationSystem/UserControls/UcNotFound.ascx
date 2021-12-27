<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UcNotFound.ascx.cs" Inherits="RegistrationSystem.UserControls.UcNotFound" %>

<div class="container d-flex justify-content-center mx-auto col-md-8 col-sm-12">
    <img width="500" class="mw-100" runat="server" src="~/Content/Static/NotFound.svg" alt="Page Not Found" />
    <div class="position-fixed fixed-bottom w-100 text-center">
        <a id="redirect" class="btn btn-secondary rounded-pill d-inline-block mb-5" href="~/" runat="server" >GO Home page</a>
    </div>
</div>
