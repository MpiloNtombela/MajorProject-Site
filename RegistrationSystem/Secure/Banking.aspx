<%@ Page Title="Banking Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Banking.aspx.cs" Inherits="RegistrationSystem.Secure.Banking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ExtraStyles" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="ErrorField" runat="server"/>
    <div class="container">
        <h1 class="h3 text-gradient my-3">Banking Details</h1>
        <div class="row">
            <div class="col-sm-12 col-md-7 col-lg-6">
                <div runat="server" class="card shadow-sm" id="BankingForm">
                    <div class="card-body">
                        <div class="input-field m-0 mb-3 text-primary">
                            <asp:DropDownList ID="Bank" runat="server" required="true">
                                <asp:ListItem Value="">---choose your bank---</asp:ListItem>
                                <asp:ListItem Value="Bank One">Bank One</asp:ListItem>
                                <asp:ListItem Value="Capital Bank">Capital Bank</asp:ListItem>
                                <asp:ListItem Value="Netbanker">Netbanker</asp:ListItem>
                                <asp:ListItem Value="FMB Bank">FMB Bank</asp:ListItem>
                                <asp:ListItem Value="Standardize Bank">Standardize Bank</asp:ListItem>
                            </asp:DropDownList>
                            <label class="tiny-text">Your Bank(choose from valid SA Banks)</label>
                            <asp:RequiredFieldValidator ID="BankValidator" runat="server" ControlToValidate="Bank"
                                                        CssClass="text-danger tiny-text" ErrorMessage="The field is required."/>
                        </div>
                        <%--<mpilo:RequiredTextBox runat="server" ID="CardHolder" Label="Card Holder" MinLength="3" MaxLength="70" AutoComplete="cc-name" />--%>
                        <div class="mb-3">
                            <div class="form-outline">
                                <asp:TextBox runat="server" ID="CardHolder" CssClass="form-control" TextMode="SingleLine" minlength="3" MaxLength="70" required="true" auto-complete="cc-name"/>
                                <asp:Label ID="ControlLabel" runat="server" AssociatedControlID="CardHolder" CssClass="form-label">Card Holder</asp:Label>
                            </div>
                            <asp:RequiredFieldValidator ID="ControlValidator" runat="server" ControlToValidate="CardHolder"
                                                        CssClass="text-danger tiny-text" ErrorMessage="The field is required."/>
                        </div>
                        <div class="mb-3">
                            <div class="form-outline">
                                <asp:TextBox runat="server"
                                             ID="CardNumber"
                                             CssClass="form-control"
                                             TextMode="Number"
                                             required="true"
                                             amxlength="16"
                                             minlength="16"
                                             auto-complete="cc-number"
                                             pattern="^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|6(?:011|5[0-9]{2})[0-9]{12}|(?:2131|1800|35\d{3})\d{11})$"/>
                                <asp:Label ID="Label1" runat="server" AssociatedControlID="CardHolder" CssClass="form-label">Card Number</asp:Label>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="CardNumber"
                                                        CssClass="text-danger tiny-text" ErrorMessage="The field is required."/>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-8">
                                <div class="mb-3">
                                    <div class="form-outline">
                                        <asp:TextBox runat="server"
                                                     ID="ExpiryDate"
                                                     CssClass="form-control"
                                                     TextMode="SingleLine"
                                                     required="true"
                                                     auto-complete="cc-exp"/>
                                        <asp:Label runat="server" AssociatedControlID="ExpiryDate" CssClass="form-label">Expiry Date (mm/yy)</asp:Label>
                                    </div>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ExpiryDate"
                                                                CssClass="text-danger tiny-text" ErrorMessage="The field is required."/>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-4">
                                <div class="mb-3">
                                    <div class="form-outline">
                                        <asp:TextBox runat="server"
                                                     ID="Cvc"
                                                     CssClass="form-control"
                                                     TextMode="Number"
                                                     required="true"
                                                     minlength="3"
                                                     MaxLength="3"
                                                     min="100"
                                                     max="999"
                                                     auto-complete="cc-cvc"/>
                                        <asp:Label runat="server" AssociatedControlID="Cvc" CssClass="form-label">CVC Number</asp:Label>
                                    </div>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Cvc"
                                                                CssClass="text-danger tiny-text" ErrorMessage="The field is required."/>
                                </div>
                            </div>
                        </div>
                        <hr class="mb-4"/>
                        <div class="input-field m-0">
                            <asp:DropDownList ID="PaymentPlan" runat="server" required="true">
                                <asp:ListItem Value="">---choose payment plan---</asp:ListItem>
                                <asp:ListItem Value="platinum">Platinum (once)</asp:ListItem>
                                <asp:ListItem Value="gold">Gold (3 months)</asp:ListItem>
                                <asp:ListItem Value="silver">Silver (6 months)</asp:ListItem>
                            </asp:DropDownList>
                            <label class="tiny-text">Payment plan</label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PaymentPlan"
                                                        CssClass="text-danger tiny-text" ErrorMessage="payment paln is required."/>
                        </div>
                        <p id="PaymentPlanDetails" class="note note-info fs-6 text-muted d-none pe-none" runat="server"></p>
                        <div class="text-end">
                            <asp:Button ID="RegisterBtn" runat="server" Text="Add Details" CssClass="btn btn-primary rounded-pill px-4" OnClick="RegisterBtn_Click"/>
                        </div>
                    </div>
                    <div class="card-footer">
                        <h1 class="h5 d-flex justify-content-center align-items-baseline">
                            <span class="text-muted h6">Protected by </span>
                            <img class="d-inline-block ms-1" src="~/Content/Static/XeLogo.svg" height="20" runat="server"/>Pay
                        </h1>
                    </div>
                </div>
            </div>
            <%-- card --%>
            <div class="col-sm-12 col-md-5 col-lg-6">
                <div id="CardView" runat="server" class="shadow mx-auto rounded-3 p-3 mw-100 mb-2" style="width: 315px; height: 190px;">
                    <div class="d-flex justify-content-between align-items-start">
                        <h1 class="h5 text-start text-gradient-x d-flex align-items-center invisible" style="font-weight: 800">
                            <img class="d-inline-block me-1" runat="server" src="~/Content/Static/MLogo.svg" width="25" height="25"/>
                            <span id="BankNameDisplay" runat="server" class="text-uppercase">MPILO BANK</span>
                        </h1>
                        <p runat="server" class="fs-6 fw-bold text-capitalize" id="PaymentPlanDisplay"></p>
                    </div>
                    <h1 runat="server" class="lead mt-4 mb-3 text-center" style="letter-spacing: .3rem; min-height: 21px" id="CardNumberDisplay"></h1>
                    <div class="d-flex justify-content-between pe-4 ps-3 align-items-center invisible">
                        <span class="material-icons-outlined text-muted md-36">contactless</span>
                        <small id="EXPDisplay" class="d-lock fw-bold fs-6 text-start m-0 text-muted" style="min-height: 21px" runat="server"></small>
                        <small id="CVCNumDisplay" class="d-block fw-bold fs-6 text-start m-0 text-muted" style="min-height: 21px" runat="server"></small>
                    </div>
                    <div class="d-flex justify-content-between align-items-end invisible">
                        <p runat="server" id="CardHolderDisplay" class="fw-bold fs-6 text-start m-0" style="min-height: 21px"></p>
                        <div class="d-flex flex-column align-items-center">
                            <img class="d-block" runat="server" src="~/Content/Static/XeLogo.svg" width="20" height="20"/>
                            <span class="tiny-text">XeCard</span>
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
            const bankInput = document.getElementById("<%= Bank.ClientID %>");
            const cardHolderInput = document.getElementById("<%= CardHolder.ClientID %>");
            const cardNumberInput = document.getElementById("<%= CardNumber.ClientID %>");
            const expDateInput = document.getElementById("<%= ExpiryDate.ClientID %>");
            const cvcNumberInput = document.getElementById("<%= Cvc.ClientID %>");
            const paymentPlanInput = document.getElementById("<%= PaymentPlan.ClientID %>");

            const card = document.getElementById("<%= CardView.ClientID %>");
            const bankName = document.getElementById("<%= BankNameDisplay.ClientID %>");
            const paymentPlan = document.getElementById("<%= PaymentPlanDisplay.ClientID %>");
            const cardHolder = document.getElementById("<%= CardHolderDisplay.ClientID %>");
            const cardNumber = document.getElementById("<%= CardNumberDisplay.ClientID %>");
            const expDate = document.getElementById("<%= EXPDisplay.ClientID %>");
            const cvcNumber = document.getElementById("<%= CVCNumDisplay.ClientID %>");

            const errorField = document.getElementById("<%= ErrorField.ClientID %>");

            const clientBtn = document.getElementById("<%= RegisterBtn.ClientID %>");
            const payPlanDetails = document.getElementById("<%= PaymentPlanDetails.ClientID %>");

            const inputs = document.getElementById("<%= BankingForm.ClientID %>").querySelectorAll('input', 'select', 'textarear');
            clientBtn.closest("form").addEventListener("submit",
                (e) => {
                    const [m, y] = expDateInput.value.split("/");
                    if (Number.isNaN(Date.parse(`${m}/1/${y}`))) {
                        toast(`<span>Invalid expiry date</span>`);
                        e.preventDefault();
                        return;
                    } else {
                        if (new Date(`${m}/1/${y}`).getTime() - new Date().getTime() < 0) {
                            toast(`<span>This card is expired</span>`, "bg-dark text-danger");
                            e.preventDefault();
                            return;
                        }
                    }

                    if (bankInput.value.trim().length < 3 && plan.value.trim().length < 3) {
                        toast(`<span>please select your bank and payment plan</span>`, "bg-dark text-danger");
                        e.preventDefault();
                        return;
                    }

                    for (var input of inputs) {
                        let label = null;
                        try {
                            label = input.labels[0].innerText;
                        } catch (e) {
                            // do nothing
                        }
                        if (!input.checkValidity()) {
                            input.classList.remove("is-valid");
                            input.classList.add("is-invalid");
                            toast(`<span>${label ? `<b>${label}:</b>` : ""} ${input.validationMessage}}</span>`);
                            e.preventDefault();
                        } else {
                            input.classList.remove("is-nvalid");
                            input.classList.add("is-valid");
                        }
                    }

                });

            if (errorField) {
                if (errorField.value.trim().length > 0) {
                    toast(message = `<span class="d-flex align-items-center"><span class="material-icons-round">error_outline</span ><span class="d-inline-block ms-1">${errorField.value}</span></span>`, classes = "bg-dark text-danger");
                }
            }

            bankInput.addEventListener("change",
                (e) => {
                    bankName.innerText = e.target.value.trim();
                    if (e.target.value.trim() === "" || paymentPlanInput.value.trim() === "") {
                        clientBtn.classList.add("disabled");
                    } else {
                        clientBtn.classList.remove("disabled");
                    }
                    console.log(e.target.value.trim() === "" || paymentPlanInput.value.trim() === "");
                    bankName.parentElement.classList.remove("invisible");
                });

            paymentPlanInput.addEventListener("change",
                (e) => {
                    paymentPlan.innerText = e.target.value.trim();
                    if (e.target.value.trim() === "" || paymentPlanInput.value.trim() === "") {
                        clientBtn.classList.add("disabled");
                    } else {
                        clientBtn.classList.remove("disabled");
                    }
                    bankName.parentElement.classList.remove("invisible");
                    cardView(e.target.value);
                });

            cardNumberInput.addEventListener("input",
                (e) => {
                    cardNumberInput.value = e.target.value.replace(/[^\d]/g, '').substring(0, 16);
                    cardNumber.innerText = e.target.value.split(/(\d{4})/).join(' ').trim();
                });

            cardHolderInput.addEventListener("input",
                (e) => {
                    cardHolderInput.value = e.target.value.substring(0, 30);
                    updateCard("cardHolder", e.target.value);
                });

            expDateInput.addEventListener("input",
                (e) => {
                    expDateInput.value = e.target.value.replace(/^(\d\d)(\d)$/g, '$1/$2').replace(/^(\d\d\/\d\d)$/g, '$1/$2').replace(/[^\d\/]/g, '').substring(0, 5);
                    updateCard("exp", e.target.value);
                });

            cvcNumberInput.addEventListener("input",
                (e) => {
                    cvcNumberInput.value = e.target.value.replace(/[^\d]/g, '').substring(0, 3);
                    updateCard("cvc", e.target.value);
                });

            function cardView(plan) {
                switch (plan.toLowerCase()) {
                case "platinum":
                    card.classList.add(`m${plan.toLowerCase()}`);
                    card.classList.remove("mgold", "msilver");
                    payPlanDetails.classList.remove("d-none");
                    payPlanDetails.innerText = "Your tuition fee will be payed in full upfront";
                    break;
                case "gold":
                    card.classList.add(`m${plan.toLowerCase()}`);
                    card.classList.remove("mplatinum", "msilver");
                    payPlanDetails.classList.remove("d-none");
                    payPlanDetails.innerText = "Your tuition fee will be divided and payed monthly for the next 3 months";
                    break;
                case "silver":
                    card.classList.add(`m${plan.toLowerCase()}`);
                    card.classList.remove("mgold", "mplatinum");
                    payPlanDetails.classList.remove("d-none");
                    payPlanDetails.innerText = "Your tuition fee will be divided and payed monthly for the next 6 months";
                    break;
                default:
                    card.classList.remove("mgold", "mplatinum", "msilver");
                    payPlanDetails.innerText = "";
                    payPlanDetails.classList.add("d-none");
                    return;
                }
            }

            function updateCard(action, payload = null) {
                switch (action.toLowerCase()) {
                case "cvc":
                    if (payload === null) return;
                    cvcNumber.textContent = payload;
                    if (cvcNumber.textContent.trim() == "" && expDate.textContent.trim() == "") {
                        cvcNumber.parentElement.classList.add("invisible");
                    } else {
                        cvcNumber.parentElement.classList.remove("invisible");
                    }
                    break;
                case "exp":
                    if (payload === null) return;
                    expDate.textContent = payload;
                    if (cvcNumber.textContent.trim() == "" && expDate.textContent.trim() == "") {
                        cvcNumber.parentElement.classList.add("invisible");
                    } else {
                        cvcNumber.parentElement.classList.remove("invisible");
                    }
                    break;
                case "cardholder":
                    if (payload === null) return;
                    cardHolder.textContent = payload;
                    if (cardHolder.textContent.trim() == "") {
                        cardHolder.parentElement.classList.add("invisible");
                    } else {
                        cardHolder.parentElement.classList.remove("invisible");
                    }

                default:
                    return;
                }
            }

            function toast(message, classes) {
                return M.toast({ html: message, classes: classes ? classes : "bg-dark" });
            }
        })()
    </script>
</asp:Content>