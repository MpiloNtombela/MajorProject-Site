<%@ Page Title="Student Portal" Language="C#" MasterPageFile="~/Student/Details/DetailsMaster.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RegistrationSystem.Student.Details.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ExtraStyles" runat="server">
    <style>
        .def-active {
            border: 2px solid rgba(253, 29, 29, 1);
            color: rgba(253, 29, 29, 1);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="SuccessMessage" runat="server"/>
    <asp:HiddenField ID="DefaultMessage" runat="server"/>
    <asp:HiddenField ID="ErrorMessage" runat="server"/>
    <h3 class="h6 m-0 text-muted">Student Details</h3>
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between p-md-1">
                        <div class="d-flex flex-row">
                            <div class="align-self-center">
                                <span class="material-icons-outlined text-gradient md-64">sentiment_satisfied_alt</span>
                            </div>
                            <div class="text-start">
                                <h3 id="CurrentUserName" runat="server"><%= CurrentUser.FirstName %> <%= CurrentUser.LastName %></h3>
                                <p id="CurrentUserEmail" runat="server" class="mb-0"><%= CurrentUser.Email %></p>
                            </div>
                        </div>
                        <div class="align-self-center d-none d-sm-block">
                            <% if (CurrentUser.PhoneNumber == null && !CurrentUser.PhoneNumberConfirmed)
                               { %>
                                <a href="~/Account/AddPhoneNumber.aspx" class="btn btn-outline-secondary rounded-pill" runat="server">add phone number</a>
                            <% } %>
                        </div>
                    </div>
                    <div class="text-end d-block d-sm-none">
                        <% if (CurrentUser.PhoneNumber == null && !CurrentUser.PhoneNumberConfirmed)
                           { %>
                            <a href="~/Account/AddPhoneNumber.aspx" class="btn btn-outline-secondary rounded-pill" runat="server">add phone number</a>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-lg-6">
            <div class="card">
                <div class="card-title">Personal Details</div>
                <div class="card-body text-start">
                    <div class="d-flex justify-content-start px-md-1 mb-4">
                        <div class="align-self-center">
                            <span class="material-icons-outlined text-gradient md-36 me-3">smartphone</span>
                        </div>
                        <div class="text-start">
                            <h5 id="H1" runat="server" class="m-0">Contact</h5>
                            <% if (Student.PhoneNumber != null)
                               { %>
                                <p id="P1" runat="server" class="mb-0"><%= Student.PhoneNumber %></p>
                            <% }
                               else
                               { %>
                                <a href="~/Account/AddPhoneNumber.aspx" class="btn btn-link px-0 bg-transparent" runat="server">add phone number</a>
                            <% } %>
                        </div>
                    </div>
                    <div class="d-flex justify-content-start px-md-1 mb-4">
                        <div class="align-self-center">
                            <span class="material-icons-outlined text-gradient md-36 me-3">today</span>
                        </div>
                        <div class="text-start">
                            <h5 id="H5" runat="server" class="m-0">Date of Birth</h5>
                            <p id="P5" runat="server" class="mb-0"><%= Student.DateOfBirth.ToString("dd MMMM yyyy") %></p>
                        </div>
                    </div>
                    <div class="d-flex justify-content-start px-md-1 mb-4">
                        <div class="align-self-center">
                            <span class="material-icons-outlined text-gradient md-36 me-3">badge</span>
                        </div>
                        <div class="text-start">
                            <h5 id="H2" runat="server" class="m-0">Identity Nummber</h5>
                            <p id="P2" runat="server" class="mb-0"><%= Student.IDNumber %></p>
                        </div>
                    </div>
                    <div class="d-flex justify-content-start px-md-1 mb-4">
                        <div class="align-self-center">
                            <span class="material-icons-outlined text-gradient md-36 me-3">place</span>
                        </div>
                        <div class="text-start">
                            <h5 id="H3" runat="server" class="m-0">Home Address</h5>
                            <p id="P3" runat="server" class="mb-0"><%= Student.HomeAddress %></p>
                            <div class="dropdown">
                                <button
                                    class="btn btn-link px-0 bg-transparent dropdown-toggle"
                                    type="button"
                                    data-mdb-toggle="dropdown"
                                    aria-expanded="false">
                                    update address
                                </button>
                                <div class="dropdown-menu p-3 g-morph-dark white-text" style="width: 320px">
                                    <!-- Email input -->
                                    <div class="bg-light rounded px-2 pt-2">
                                        <mpilo:RequiredTextBox runat="server" ID="PostalAddress" Label="Postal Address" ValidationGroup="StudentAddress" MinLength="3" MaxLength="120" AutoComplete="street-address"/>
                                    </div>
                                    <div class="bg-light rounded px-2 pt-2">
                                        <mpilo:RequiredTextBox runat="server" ID="SubVill" Label="Suburb / Village" MinLength="3" ValidationGroup="StudentAddress" MaxLength="70" AutoComplete="address-level3"/>
                                    </div>
                                    <div class="bg-light rounded px-2 pt-2">
                                        <mpilo:RequiredTextBox runat="server" ID="CityTown" Label="City / Town" ValidationGroup="StudentAddress" MinLength="3" MaxLength="70" AutoComplete="address-level2"/>
                                    </div>
                                    <div class="bg-light rounded px-2 pt-2">
                                        <mpilo:RequiredTextBox runat="server" ID="Zip" TextMode="Number" ValidationGroup="StudentAddress" Label="Zip / Postal code" MinLength="4" MaxLength="5" Min="1000" Max="99999" AutoComplete="postal-code"/>
                                    </div>
                                    <asp:Button CssClass="btn btn-primary btn-block rounded-pill" ID="UpdateAddress" runat="server" Text="Update Address" ValidationGroup="StudentAddress" OnClick="UpdateAddress_Click"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-lg-6">
            <%-- Next of kin --%>
            <div class="card">
                <div class="card-title">Next of Kin</div>
                <div class="card-body">
                    <div class="d-flex justify-content-start px-md-1 mb-4">
                        <div class="align-self-center">
                            <span class="material-icons-outlined text-gradient md-36 me-3">person</span>
                        </div>
                        <div class="text-start">
                            <h5 id="H7" runat="server" class="m-0">Full Name</h5>
                            <p id="P7" runat="server" class="mb-0"><%= Guardian.FirstName %> <%= Guardian.LastName %></p>
                        </div>
                    </div>
                    <div class="d-flex justify-content-start px-md-1 mb-4">
                        <div class="align-self-center">
                            <span class="material-icons-outlined text-gradient md-36 me-3">smartphone</span>
                        </div>
                        <div class="text-start">
                            <h5 id="H8" runat="server" class="m-0">Contact</h5>
                            <p id="P8" runat="server" class="mb-0"><%= Guardian.PhoneNumber %></p>
                        </div>
                    </div>
                    <div class="d-flex justify-content-start px-md-1 mb-4">
                        <div class="align-self-center">
                            <span class="material-icons-outlined text-gradient md-36 me-3">badge</span>
                        </div>
                        <div class="text-start">
                            <h5 id="H4" runat="server" class="m-0">Identity Number</h5>
                            <p id="P4" runat="server" class="mb-0"><%= Guardian.IDNumber %></p>
                        </div>
                    </div>
                    <div class="d-flex justify-content-start px-md-1 mb-4">
                        <div class="align-self-center">
                            <span class="material-icons-outlined text-gradient md-36 me-3">place</span>
                        </div>
                        <div class="text-start">
                            <h5 id="H6" runat="server" class="m-0">Home Address</h5>
                            <p id="P6" runat="server" class="mb-0"><%= Guardian.HomeAddress %></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ClientContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ExtraScript" runat="server">
    <script>
        (() => {
            let msg = document.getElementById("<%= SuccessMessage.ClientID %>");
            let dMsg = document.getElementById("<%= DefaultMessage.ClientID %>");
            let eMsg = document.getElementById("<%= ErrorMessage.ClientID %>");

            if (msg) {
                if (msg.value.trim().length > 0) {
                    toast(message =
                        `<span class="d-flex align-items-center"><span class="material-icons-outlined">task_alt</span ><span class="d-inline-block ms-1">${msg.value}</span></span>
                        <button class="btn-flat toast-action" onClick="javascript:(()=> {location.replace(location.href.split('?')[0])})()">ok</button>`,
                        classes = "bg-success");
                }
            }

            if (dMsg) {
                if (dMsg.value.trim().length > 0) {
                    toast(message =
                        `<span class="d-flex align-items-center"><span class="material-icons-outlined">info</span ><span class="d-inline-block ms-1">${dMsg.value}</span></span>
                        <button class="btn-flat toast-action" onClick="javascript:(()=> {location.replace(location.href.split('?')[0])})()">ok</button>`);
                }
            }
            if (eMsg) {
                if (eMsg.value.trim().length > 0) {
                    toast(message =
                        `<span class="d-flex align-items-center"><span class="material-icons-outlined">info</span ><span class="d-inline-block ms-1">${eMsg.value}</span></span>
                        <button class="btn-flat toast-action" onClick="javascript:(()=> {location.replace(location.href.split('?')[0])})()">ok</button>`,
                        classes = "bg-danger");
                }
            }

            function toast(message, classes) {
                return M.toast({ html: message, classes: classes ? classes : "bg-dark" });
            }

        })()
    </script>
</asp:Content>