<%@ Page Title="Payment Gateway" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="RegistrationSystem.Secure.Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="ErrorField" runat="server"/>
    <div class="container-sm mx-auto text-center mt-3">
        <div class="card pt-3">
            <h1 class="text-gradient"><%: Page.Title %></h1>
            <div class="card-body row align-items-center">
                <div class="col-sm-12 col-md-5 col-lg-6">
                    <img alt="transact" src="~/Content/Static/transact.svg" runat="server" class="mx-100"/>
                </div>
                <div class="col-sm-12 col-md-7 col-lg-6">
                    <asp:PlaceHolder runat="server" ID="NoPaymentDue" Visible="false">
                        <span class="material-icons-outlined md-64 purple-text">thumb_up_alt</span>
                        <h1 class="h5 mb-3">You are all set, no payment is due today!</h1>
                        <a class="btn btn-lg btn-primary rounded-pill" href="~/Student/Default.aspx" runat="server">Open Student Portal</a>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" ID="PaymentDue" Visible="false">
                        <div class="card bg-light px-2 shadow-sm">
                            <div class="card-header">
                                <h1 class="h4">Payment</h1>
                            </div>
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <h5 id="H1" runat="server" class="lead d-flex align-items-center">
                                        Tuition Fee
                                        <%--(<%= Registration.AmountDue.ToString("C")%> / <%= Registration.PaymentPlan.PaymentLength %>)--%>
                                        <a
                                            tabindex="0"
                                            class="material-icons-outlined md-18 text-muted d-inline-block ms-1 cursor-help"
                                            data-mdb-toggle="popover"
                                            data-mdb-trigger="focus"
                                            title="Tuition calculation"
                                            data-mdb-content='Tuition Amount / Payment plan length: <%= Registration.AmountDue.ToString("C") %> / <%= Registration.PaymentPlan.PaymentLength %>'>
                                            info
                                        </a>
                                    </h5>
                                    <p id="P1" runat="server" class="h6"><%= MonthlyFee.ToString("C") %></p>
                                </div>
                                <asp:PlaceHolder runat="server" ID="RegFee">
                                    <div class="d-flex justify-content-between">
                                        <h5 id="H5" runat="server" class="lead">Registration Fee</h5>
                                        <p id="P5" runat="server" class="h6"><%= 500.ToString("C") %></p>
                                    </div>
                                    <p class="text-muted tiny-text text-start m-0">*please note <b>registration fee</b> is a mandatory one time fee</p>
                                </asp:PlaceHolder>
                            </div>
                            <div class="card-footer">
                                <div class="d-flex justify-content-between">
                                    <h5 id="H2" runat="server" class="lead">Total</h5>
                                    <p id="P2" runat="server" class="h6 text-success"><%= Total.ToString("C") %></p>
                                </div>
                                <div class="text-end mt-3">
                                    <asp:Button ID="PayNowBtn" CssClass="btn btn-primary rounded-pill px-5 shadow-0" Text="Pay now" OnClick="PayNowBtn_Click" runat="server"/>
                                </div>
                            </div>
                            <p class="tiny-text mt-4 mb-3">
                                <span>Card used for payment:</span>
                                <strong class="no-text-wrap">
                                    <%= Bank.CardNumber.Substring(0, 4) %>
                                    * * * * * * * *
                                    <%= Bank.CardNumber.Substring(13, 3) %>
                                </strong>
                            </p>
                        </div>
                    </asp:PlaceHolder>
                </div>
            </div>
            <div class="card-footer pb-0">
                <h1 class="h5 d-flex justify-content-center align-items-baseline">
                    <span class="text-muted h6">Powered by </span>
                    <img class="d-inline-block ms-1" src="~/Content/Static/XeLogo.svg" height="20" runat="server" alt="logo"/>Pay
                </h1>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ExtraScript" runat="server">
    <script>
        (() => {
            const errorField = document.getElementById("<%= ErrorField.ClientID %>");
            if (errorField) {
                if (errorField.value.trim().length > 0) {
                    toast(message = `<span class="d-flex align-items-center"><span class="material-icons-round">error_outline</span ><span class="d-inline-block ms-1">${errorField.value.trim()}</span></span>`, classes = "bg-dark text-danger");
                }
            }

            function toast(message, classes) {
                return window.M.toast({ html: message, classes: classes ? classes : "bg-dark" });
            }
        })()
    </script>
</asp:Content>