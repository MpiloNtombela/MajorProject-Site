<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RegistrationSystem.Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12 col-md-5 col-lg-6">
                <img runat="server" src="~/Content/Static/learn.svg" class="w-100" alt="Learning Illustration"/>
            </div>
            <div class="col-sm-12 col-md-7 col-lg-6 text-center">
                <h1 class="mb-5 text-gradient">Major Project</h1>
                <h3 id="time-counter" class="border d-none border-light my-4 p-4 rounded-3"></h3>

                <p style="font-size: 3vw" class="h1 text-gradient-x">Take your skills and education to the next level. Unlock your true potential, reach new heights with us</p>
                <div class="mt-5">
                    <p class="fw-bold h5 text-muted">Get to know us or talk to us</p>

                    <a runat="server" class="btn btn-outline-primary btn-lg m-2 rounded-pill" href="~/Public/About">About Page</a>
                    <a runat="server" class="btn btn-outline-secondary btn-lg m-2 rounded-pill" href="~/Public/Contact">Contact Page</a>
                    <h1 class="h5 mt-5">Powered by XePlatform</h1>
                </div>
            </div>
        </div>
        <h6 class="my-3 text-center">Illustrations in this site are provided with ❤ by <a href="https://storyset.com" target="_blank">storyset</a></h6>
    </div>
</asp:Content>