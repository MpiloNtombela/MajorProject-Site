<%@ Page Title="Student Portal" Language="C#" MasterPageFile="~/Student/Details/DetailsMaster.master" AutoEventWireup="true" CodeBehind="Bank.aspx.cs" Inherits="RegistrationSystem.Student.Details.Bank" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ExtraStyles" runat="server">
    <style>
        .bank-active {
            border: 2px solid rgba(253,29,29,1);
            color: rgba(253,29,29,1);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class="h6 m-0 text-muted mb-2">Banking Details</h1>
    <div class="row">
        <div class="col-sm-12 col-md-6">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-start px-md-1 mb-4">
                        <div class="align-self-center">
                            <span class="material-icons-outlined text-gradient md-36 me-3">account_balance</span>
                        </div>
                        <div class="text-start">
                            <h5 id="H7" runat="server" class="m-0">Bank Name</h5>
                            <p id="P7" runat="server" class="mb-0"><%= BankDetail.BankName %></p>
                        </div>
                    </div>
                    <div class="d-flex justify-content-start px-md-1 mb-4">
                        <div class="align-self-center">
                            <span class="material-icons-outlined text-gradient md-36 me-3">person</span>
                        </div>
                        <div class="text-start">
                            <h5 id="H8" runat="server" class="m-0">Cardholder</h5>
                            <p id="P8" runat="server" class="mb-0"><%= BankDetail.CardHolder %></p>
                        </div>
                    </div>
                    <div class="d-flex justify-content-start px-md-1 mb-4">
                        <div class="align-self-center">
                            <span class="material-icons-outlined text-gradient md-36 me-3">credit_card</span>
                        </div> 
                        <div class="text-start">
                            <h5 id="H4" runat="server" class="m-0">Card Number</h5>
                            <p id="P4" runat="server" class="mb-0"><%= BankDetail.CardNumber %></p>
                        </div>
                    </div>
                    <div class="d-flex justify-content-start px-md-1 mb-4">
                        <div class="align-self-center">
                            <span class="material-icons-outlined text-gradient md-36 me-3">event</span>
                        </div>
                        <div class="text-start">
                            <h5 id="H1" runat="server" class="m-0">Expiry Date</h5>
                            <p id="P1" runat="server" class="mb-0"><%= BankDetail.ExpiryDate.ToString("MMMM yyyy") %></p>
                        </div>
                    </div>
                    <div class="d-flex justify-content-start px-md-1 mb-4">
                        <div class="align-self-center">
                            <span class="material-icons-outlined text-gradient md-36 me-3">pin</span>
                        </div>
                        <div class="text-start">
                            <h5 id="H6" runat="server" class="m-0">Security Number</h5>
                            <p id="P6" runat="server" class="mb-0"><%= BankDetail.Cvc %></p>
                        </div>
                    </div>
                    <hr />
                    <div class="d-flex justify-content-start px-md-1 mb-4">
                        <div class="align-self-center">
                            <span class="material-icons-outlined text-gradient md-36 me-3">credit_score</span>
                        </div>
                        <div class="text-start">
                            <h5 id="H2" runat="server" class="m-0">Payment Plan</h5>
                            <p id="P2" runat="server" class="mb-0 text-capitalize"><%= BankDetail.Student.Registrations.First().PaymentPlanID %></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-md-6">
            <h1 class="h5">Card View</h1>
            <asp:Panel ID="CardView" CssClass="mx-auto rounded-3 p-3 mw-100 mb-2 hover-shadow" Style="width: 315px; height: 190px" runat="server">
                <div class="d-flex justify-content-between align-items-start">
                    <h1 class="h5 text-start text-gradient-x d-flex align-items-center text-uppercase" style="font-weight: 800">
                        <img class="d-inline-block me-1" runat="server" src="~/Content/Static/MLogo.svg" width="25" height="25" />
                        <%= BankDetail.BankName %>
                    </h1>
                    <p class="fs-6 fw-bold text-capitalize"><%= BankDetail.Student.Registrations.First().PaymentPlanID %></p>
                </div>
                <h1 class="lead mt-4 mb-3 no-text-wrap" style="letter-spacing: .3rem">
                    <%= BankDetail.CardNumber.Substring(0, 4) %>
                    <%= BankDetail.CardNumber.Substring(4, 4) %>
                    <%= BankDetail.CardNumber.Substring(7, 4) %>
                    <%= BankDetail.CardNumber.Substring(11, 4) %>
                </h1>
                <div class="d-flex justify-content-between pe-4 ps-3 align-items-center">
                    <span class="material-icons-outlined text-muted md-36">contactless</span>
                    <small class="d-lock fw-bold fs-6 text-start m-0 text-muted" runat="server"><%= BankDetail.ExpiryDate.ToString("MM/yy") %></small>
                    <small class="d-block fw-bold fs-6 text-start m-0 text-muted" runat="server"><%= BankDetail.Cvc %></small>
                </div>
                <div class="d-flex justify-content-between align-items-end">
                    <p class="fw-bold fs-6 text-start m-0"><%= BankDetail.CardHolder %></p>
                    <div class="d-flex flex-column align-items-center">
                        <img class="d-block" runat="server" src="~/Content/Static/XeLogo.svg" width="20" height="20" />
                        <span class="tiny-text">XeCard</span>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ClientContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ExtraScript" runat="server">
</asp:Content>
