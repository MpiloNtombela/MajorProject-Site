<%@ Page Title="Student Registration" Language="C#" MasterPageFile="~/Student/StudentMaster.master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="RegistrationSystem.Student.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ExtraStyles" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="container-xl card shadow-0 bg-light h-100">
<asp:HiddenField ID="ErrorField" runat="server"/>
<asp:HiddenField ID="Subs" runat="server"/>
<ul id="StepperForm" class="stepper linear horizontal h-100" runat="server">
<li class="step active">
    <div class="step-title waves-effect">Personal Details</div>
    <div class="step-content ms-4 me-2" style="height: 100%">
        <h1 class="lead text-center">Fill-in personal details</h1>
        <div class="card col-sm-12 col-md-10 col-lg-8 mx-auto shadow-sm">
            <div class="row card-body justify-content-center">
                <div class="col-sm-12 col-md-6">
                    <small class="d-block fw-bold mb-3">Personal Details</small>
                    <mpilo:RequiredTextBox runat="server" ID="FirstName" Label="First Name" MinLength="3" MaxLength="50" Name="fname" AutoComplete="given-name"/>
                    <mpilo:RequiredTextBox runat="server" ID="LastName" Label="Last Name" MinLength="3" MaxLength="50" Name="lname" AutoComplete="family-name"/>
                    <mpilo:RequiredTextBox runat="server" ID="EmailAddress" TextMode="Email" Label="Email Address" Name="email" AutoComplete="email"/>
                    <%--<mpilo:RequiredTextBox runat="server" ID="PhoneNumber" Label="Phone Number" TextMode="Phone" MinLength="10" MaxLength="12" Name="phone" AutoComplete="tel" />--%>
                    <mpilo:RequiredTextBox runat="server" AutoComplete="identity" ID="IDNumber" Label="ID Number" TextMode="Number" MinLength="13" MaxLength="13"/>
                    <%--<mpilo:RequiredTextBox runat="server" ID="DateOfBirth" Label="Date of Birth" CssClass="datepicker active" AutoComplete="bday" />--%>
                    <div class="input-field m-0">
                        <asp:DropDownList ID="Gender" runat="server" required="true">
                            <asp:ListItem Value="M">Male</asp:ListItem>
                            <asp:ListItem Value="F">Female</asp:ListItem>
                        </asp:DropDownList>
                        <label>Select Gender</label>
                        <asp:RequiredFieldValidator ID="GenderValidator" runat="server" ControlToValidate="Gender"
                                                    CssClass="text-danger tiny-text" ErrorMessage="The field is required."/>
                    </div>
                </div>
                <div class="col-sm-12 col-md-5">

                    <%--<mpilo:RequiredTextBox runat="server" ID="Gender" Label="Gender" />--%>
                    <small class="d-block fw-bold mb-3">Home Address</small>
                    <mpilo:RequiredTextBox runat="server" ID="PostalAddress" Label="Postal Address" MinLength="3" MaxLength="120" AutoComplete="street-address"/>
                    <mpilo:RequiredTextBox runat="server" ID="SubVill" Label="Suburb / Village" MinLength="3" MaxLength="70" AutoComplete="address-level3"/>
                    <mpilo:RequiredTextBox runat="server" ID="CityTown" Label="City / Town" MinLength="3" MaxLength="70" AutoComplete="address-level2"/>
                    <mpilo:RequiredTextBox runat="server" ID="Zip" TextMode="Number" Label="Zip / Postal code" MinLength="4" MaxLength="5" Min="1000" Max="99999" AutoComplete="postal-code"/>
                </div>
            </div>
            <div class="d-flex justify-content-end px-2 pb-2">
                <!-- Here goes your actions buttons -->
                <button type="button" class="waves-effect waves-dark me-2 rounded-pill btn btn-secondary next-step">continue</button>
            </div>
        </div>
        <%--<div class="step-actions">
                        <!-- Here goes your actions buttons -->
                    </div>--%>
    </div>
</li>
<%-- guardian details --%>
<li class="step">
    <div class="step-title waves-effect">Guardian Details</div>
    <div class="step-content ms-4 me-2" style="height: 100%">
        <h1 class="lead text-center">Fill-in guardian details</h1>
        <div class="card col-sm-12 col-md-10 col-lg-8 mx-auto shadow-sm">
            <div class="row card-body justify-content-center">
                <div class="col-sm-12 col-md-6">
                    <small class="d-block fw-bold mb-3">Personal Details</small>
                    <mpilo:RequiredTextBox runat="server" ID="GuardianFirstName" Label="First Name" MinLength="3" MaxLength="50" Name="fname" AutoComplete="given-name"/>
                    <mpilo:RequiredTextBox runat="server" ID="GuardianLastName" Label="Last Name" MinLength="3" MaxLength="50" Name="lname" AutoComplete="family-name"/>
                    <mpilo:RequiredTextBox runat="server" ID="GuardianPhoneNumber" TextMode="Phone" Label="Phone Number" MinLength="10" MaxLength="12" Name="phone" AutoComplete="tel"/>
                    <mpilo:RequiredTextBox TextMode="Number" AutoComplete="identity" runat="server" ID="GuardianID" Label="ID Number" MinLength="13" MaxLength="13"/>
                </div>
                <div class="col-sm-12 col-md-5">
                    <small class="d-block fw-bold mb-3">Home Address</small>
                    <mpilo:RequiredTextBox runat="server" ID="GuardianPostalAddress" Label="Postal Address" MinLength="3" MaxLength="120" AutoComplete="street-address"/>
                    <mpilo:RequiredTextBox runat="server" ID="GuardianSubVill" Label="Suburb / Village" MinLength="3" MaxLength="70" AutoComplete="address-level3"/>
                    <mpilo:RequiredTextBox runat="server" ID="GuardianCityTown" Label="City / Town" MinLength="3" MaxLength="70" AutoComplete="address-level2"/>
                    <mpilo:RequiredTextBox runat="server" ID="GuardianZip" TextMode="Number" Label="Zip / Postal code" MinLength="4" MaxLength="5" AutoComplete="postal-code"/>
                </div>
            </div>
            <div class="d-flex justify-content-end px-2 pb-2">
                <!-- Here goes your actions buttons -->
                <button type="button" class="waves-effect waves-dark me-2 rounded-pill btn btn-outline-secondary previous-step">previous</button>
                <button type="button" class="waves-effect waves-dark me-2 rounded-pill btn btn-secondary next-step">continue</button>
            </div>
        </div>
        <%--<div class="step-actions">
                        <!-- Here goes your actions buttons -->
                        <button type="button" class="waves-effect waves-dark btn btn-outline-secondary previous-step">BACK</button>
                        <button type="button" class="waves-effect waves-dark btn btn-secondary next-step">CONTINUE</button>
                    </div>--%>
    </div>
</li>
<%-- support docs --%>
<li class="step">
    <div class="step-title waves-effect">Supporting Docs</div>
    <div class="step-content ms-4 me-2" style="height: 100%">
        <h1 class="lead text-center">Upload supporting documents</h1>
        <div class="card col-sm-12 col-md-10 mx-auto shadow-sm pt-md-5 pb-md-3">
            <p class="note note-info mx-3"><strong>Note: </strong>Only .pdf files are allowed</p>
            <ul class="row m-0 justify-content-between mb-3" id="ex1" role="tablist">
                <li class="col-sm-12 col-md-6 col-lg-4" role="presentation">
                    <div class="file-field input-field">
                        <div class="btn btn-outline-dark btn-block file-zone">
                            <span id="idCopyIcon" class="d-block material-icons-outlined md-48">file_download</span>
                            <span class="d-block text-zone">double-click or drag & drop</span>
                            <span class="d-block lh-1">to</span>
                            <span class="fw-bold no-text-wrap lh-1">Upload Your ID Copy</span>
                            <asp:FileUpload CssClass="file-input lh-1" ID="IDCopy" runat="server" accept="application/pdf" required="true"/>
                        </div>
                        <div class="file-path-wrapper d-none">
                            <input class="file-path" disabled type="text" placeholder="upload files">
                        </div>
                    </div>
                </li>
                <li class="col-sm-12 col-md-6 col-lg-4" role="presentation">
                    <div class="file-field input-field">
                        <div class="btn btn-outline-dark btn-block file-zone">
                            <span id="gIdCopyIcon" class="d-block material-icons-outlined md-48">file_download</span>
                            <span class="d-block text-zone">double-click or drag & drop</span>
                            <span class="d-block lh-1">to</span>
                            <span class="fw-bold no-text-wrap">Upload Guardian ID Copy</span>
                            <asp:FileUpload CssClass="file-input lh-1" ID="GuardianIDCopy" runat="server" accept="application/pdf" required="true"/>
                        </div>
                        <div class="file-path-wrapper d-none">
                            <input class="file-path" disabled type="text" placeholder="upload files">
                        </div>
                    </div>
                </li>
                <li class="col-sm-12 col-lg-4" role="presentation">
                    <div class="file-field input-field">
                        <div class="btn btn-outline-dark btn-block file-zone">
                            <span id="matricCopyIcon" class="d-block material-icons-outlined md-48 icon">file_download</span>
                            <span class="d-block text-zone">double-click or drag & drop</span>
                            <span class="d-block lh-1">to</span>
                            <span class="fw-bold no-text-wrap">Upload Matric results Copy</span>
                            <asp:FileUpload CssClass="file-input lh-1" ID="MatricStatementCopy" runat="server" accept="application/pdf" required="true"/>
                        </div>
                        <div class="file-path-wrapper d-none">
                            <input class="file-path" disabled type="text" placeholder="upload files">
                        </div>
                    </div>
                </li>
            </ul>
            <%--<div class="row w-100 mt-2 justify-content-center">
                            <div class="col-lg-10">
                            </div>
                        </div>--%>
            <div class="d-flex justify-content-end px-2 pb-2 mt-md-5">
                <button type="button" class="waves-effect waves-dark me-2 rounded-pill btn btn-outline-secondary previous-step">previous</button>
                <button type="button" class="waves-effect waves-dark me-2 rounded-pill btn btn-secondary next-step">continue</button>
            </div>
        </div>
    </div>
    <div
        class="modal fade bg-transparent shadow-0 w-100 mh-100"
        id="fileUploadModal"
        tabindex="-1"
        aria-labelledby="fileUploadModalLabel"
        data-mdb-backdrop="static"
        aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content p-0">
                <div class="modal-header py-1 fw-bold">
                    <h5 class="modal-title fs-5 fw-bold" id="fileUploadModalLabel">Uploaded Document</h5>
                    <button
                        type="button"
                        class="btn-close"
                        data-mdb-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>
                <div class="modal-body p-1">
                    <mpilo:MDocReader ID="MDocReader" runat="server" DocUrl="/Content/Static/PlaceholderFile.pdf" DocName="Test PDF file" Height="475px"/>
                </div>
            </div>
        </div>
    </div>
</li>
<%-- sub selection --%>
<li class="step">
    <div class="step-title waves-effect">
        Subject Selection
    </div>
    <div class="step-content ms-4 me-2 pt-1" style="height: 100%" id="subjectSelection">
        <div class="d-inline-block card bg-light position-sticky sticky-top" style="left: calc(100% - 5rem)">
            <div class="card-body pb-1 pt-2 position-relative">
                <span class="material-icons-outlined">backpack</span>
                <strong runat="server" id="SubNum" class="position-absolute top-0 mt-1 badge roudend-pill text-light bg-secondary">0</strong>
            </div>
        </div>
        <h1 class="lead text-center">choose one or more subjects to register</h1>
        <div class="card col-sm-12 col-md-10 mx-auto shadow-sm bg-transparent shadow-0">
            <div class="row card-body justify-content-start px-0 p-sm-2" id="AvailableSubjects" runat="server">
                <asp:Repeater ID="SubjectRepeater" runat="server">
                    <ItemTemplate>
                        <div class="col-12 col-sm-6 mb-1">
                            <mpilo:Subject
                                SubCode='<%#DataBinder.Eval(Container.DataItem, "SubjectCode") %>'
                                SubName='<%#DataBinder.Eval(Container.DataItem, "SubjectName") %>'
                                SubPrice='<%#DataBinder.Eval(Container.DataItem, "SubjectPrice") %>'
                                SubDesc='<%#DataBinder.Eval(Container.DataItem, "SubjectDescription") %>'
                                runat="server"/>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="d-flex justify-content-end px-2 pb-2">
                <!-- Here goes your actions buttons -->
                <%--<button type="button" class="waves-effect waves-dark me-2 rounded-pill btn btn-outline-secondary previous-step">previous</button>
                            <button runat="server" type="button" class="waves-effect waves-dark me-2 rounded-pill btn btn-secondary next-step">continue</button>--%>
                <button type="button" class="waves-effect waves-dark me-2 rounded-pill btn btn-outline-secondary previous-step">previous</button>
                <button class="waves-effect waves-dark me-2 rounded-pill btn btn-primary next-step" type="button">continue</button>
            </div>
        </div>
    </div>
</li>
<%-- final --%>
<li class="step">
    <div class="step-title waves-effect">Confirmation</div>
    <div class="step-content ms-4 me-2" style="height: 100%">
        <h1 class="lead text-center">Subjects selected</h1>
        <div class="container mb-5">
            <ul class="list-group" id="SubjectPreview" runat="server">
                <%-- subjects --%>
            </ul>
        </div>
        <div class="d-flex justify-content-end px-2 pb-2">
            <button type="button" class="waves-effect waves-dark me-2 rounded-pill btn btn-outline-secondary previous-step">previous</button>
            <asp:Button ID="RegisterBtn" CssClass="me-2 rounded-pill btn btn-success d-none" runat="server" Text="Register now" OnClick="RegisterBtn_Click"/>
            <button class="waves-effect waves-dark me-2 rounded-pill btn btn-primary" id="confirmBtn" type="button">Confirm</button>
        </div>
    </div>
</li>
</ul>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ClientContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ExtraScript" runat="server">
    <script>
        (() => {
            const stepper = document.getElementById("<%= StepperForm.ClientID %>");
            let errorField = document.getElementById("<%= ErrorField.ClientID %>");

            var stepperInstance = new window.MStepper(stepper,
                {
                    // options
                    firstActive: 0,
                    stepTitleNavigation: false,
                    linearStepsNavigation: true,
                    //validate
                    validationFunction: validateInput
                });

            document.addEventListener('DOMContentLoaded',
                function() {
                    var elems = document.querySelectorAll('.datepicker');
                    var instances = M.Datepicker.init(elems);
                });

            function checkEmailDb(destroyFeedback, form, activeStepContent) {
                console.log("check mail");
                destroyFeedback(true);
            }

            var idCopy = document.getElementById("<%= IDCopy.ClientID %>");
            var idCopyIcon = document.getElementById("idCopyIcon");
            var gIdCopy = document.getElementById("<%= GuardianIDCopy.ClientID %>");
            var gIdCopyIcon = document.getElementById("gIdCopyIcon");
            var matricCopy = document.getElementById("<%= MatricStatementCopy.ClientID %>");
            var matricCopyIcon = document.getElementById("matricCopyIcon");
            var base64Field = document.getElementById("<%= MDocReader.DocBase64FieldId %>");
            var docNameField = document.getElementById("<%= MDocReader.DocNameFieldId %>");
            var fileZones = stepper.querySelectorAll(".file-zone");

            idCopy.addEventListener("change", (e) => { handleFileUpload(evt = e, icon = idCopyIcon) });
            gIdCopy.addEventListener('change', (e) => { handleFileUpload(evt = e, icon = gIdCopyIcon) });
            matricCopy.addEventListener("change", (e) => { handleFileUpload(evt = e, icon = matricCopyIcon) });

//            idCopy.addEventListener("uploadError", (e) => {
//                console.log(e);
//                toast(message = e.detail.message, classes = "bg-dark text-danger");
//            });

            const fileUploadModalEl = document.getElementById('fileUploadModal');
            const filePrevModal = new window.mdb.Modal(fileUploadModalEl);

            function handleFileUpload(evt, icon) {
                const file = evt.target.files[0];
                const btn = icon.parentElement;
                btn.classList.replace("btn-outline-success", "btn-outline-dark");
                if (file.type !== "application/pdf" || !file.name.endsWith(".pdf")) {
                    evt.target.value = "";
                    evt.target.files = null;
                    icon.innerText = "file_download";
                    //evt.target.dispatchEvent(new CustomEvent("uploadError", {
                    //    detail: {
                    //        messsage: "Only PDF files allowed"
                    //    }
                    //}))
                    return;
                }
                const reader = new FileReader();
                reader.addEventListener("load",
                    (e) => {
                        base64Field.value = e.target.result;
                        console.log(e.target.result);
                        docNameField.value = file.name;
                        base64Field.dispatchEvent(new Event('change'));
                        btn.classList.replace("btn-outline-dark", "btn-outline-success");
                        icon.innerText = "task_alt";
                        filePrevModal.show();
                    });
                reader.readAsDataURL(file);
            };

            for (var i = 0; i < fileZones.length; i++) {
                let elem = fileZones[i];
                let input = elem.querySelector(":scope > .file-input");
                let textEl = elem.querySelector(":scope > .text-zone");
                let pathEl = elem.parentElement.querySelector(":scope > .file-path-wrapper > .file-path");
                let prevText = textEl.innerText;
                elem.addEventListener("dragenter",
                    (e) => {
                        e.stopPropagation();
                        e.preventDefault();
                    },
                    false);
                elem.addEventListener("dragleave",
                    (e) => {
                        e.stopPropagation();
                        e.preventDefault();
                        elem.classList.remove("file-drag");
                        textEl.innerText = prevText;
                    },
                    false);
                elem.addEventListener("dragover",
                    (e) => {
                        e.stopPropagation();
                        e.preventDefault();
                        textEl.innerText = "You can drop file";
                        elem.classList.add("file-drag");
                    },
                    false);
                elem.addEventListener("drop",
                    (e) => {
                        e.stopPropagation();
                        e.preventDefault();
                        elem.classList.remove("file-drag");
                        textEl.innerText = prevText;
                        input.files = e.dataTransfer.files;
                        pathEl.value = e.dataTransfer.files[0].name;
                        input.dispatchEvent(new Event('change'));
                    },
                    false);

            }

            let selectedSubs = [];
            let done = false;

            const preSub = (name, amount) => {
                return (
                    `<li class="list-group-item d-flex justify-content-between align-items-center py-3">
                        ${name}
                        <span class="badge purple white-text rounded-pill px-3">R ${amount}</span>
                    </li>`
                );
            }
            let subNum = document.getElementById("<%= SubNum.ClientID %>");
            let subjectPreview = document.getElementById("<%= SubjectPreview.ClientID %>");
            const dispatch = (action, payload) => {
                if (done) return payload;
                let total = 0;
                switch (action.toLowerCase()) {
                case "add":
                    if (!payload) return payload;

                    if (selectedSubs.some(sub => sub.subCode === payload.subCode)) {
                        selectedSubs.splice(selectedSubs.findIndex(sub => sub.subCode === payload.subCode), 1, payload);
                        return payload;
                    } else {
                        selectedSubs = [...selectedSubs, payload];
                        return payload;
                    }
                case "remove":
                    if (!payload) return payload;
                    selectedSubs = selectedSubs.filter(sub => sub.subCode !== payload.subCode);
                    return payload;
                case "count":
                    subNum.innerText = selectedSubs.length;
                    return payload;
                case "update":
                    if (selectedSubs.length < 1) {
                        subjectPreview.innerHTML = `<li>
                                                        <h1 class="text-center h3">No subject(s) selected!</h1>
                                                    </li>`;
                        return payload;
                    }
                    subjectPreview.innerHTML = "";
                    total = 0;
                    for (let sub of selectedSubs) {
                        subjectPreview.innerHTML += preSub(sub.subName, sub.subPrice);
                        total += Number.parseFloat(sub.subPrice);
                    }
                    subjectPreview.innerHTML += preSub("Total Tuition Fee", total.toFixed(2));
                    return payload;
                default:
                    return payload;
                }
            };
            document.getElementById("<%= AvailableSubjects.ClientID %>").addEventListener("subSelectChange",
                (e) => {
                    if (e.detail.selected) {
                        console.log(e.detail);
                        dispatch("add", e.detail);
                    } else {
                        dispatch("remove", e.detail);
                    }
                    dispatch("count");
                    dispatch("update");
                });

            function validateInput(stepperForm, activeStepContent) {
                var inputs = activeStepContent.querySelectorAll('input', 'select', 'textarea');

                if (activeStepContent.id === "subjectSelection") {
                    if (selectedSubs.length < 1) {
                        toast("Please choose one or more subjects!");
                        return false;
                    }
                }
                return validateInputVals(inputs);
            }

            function validateValues(e, inputs) {
                if (validateInputVals(inputs)) {
                    return true;
                } else {
                    e.preventDefault();
                    return false;
                }
            }

            document.addEventListener("keyup",
                (e) => {
                    if (e.keyCode === 13) {
                        console.log("enter")
                        e.preventDefault();
                    }
                });

            function validateInputVals(inputs) {
                //return true
                for (var input of inputs) {
                    let title = null;
                    let label = null;
                    try {
                        title = input.closest(".step").querySelector(":scope > .step-title");
                    } catch (e) {
                        // do nothing
                    }
                    try {
                        label = input.labels[0].innerText;
                    } catch (e) {
                        // do nothing
                    }

                    if (!input.checkValidity()) {
                        input.classList.remove("is-valid");
                        input.classList.add("is-invalid");
                        toast(`<span>${label ? `<b>${label}:</b>` : ""} ${input.validationMessage} ${title ? `(${title.innerText})` : ""}</span>`);
                        return false;
                    }

                    if (input.hasAttribute("minlength")) {
                        let val = input.getAttribute("minlength");
                        if (val && input.value.trim().length < val) {
                            input.classList.remove("is-valid");
                            input.classList.add("is-invalid");
                            toast(`<span>${label ? `<b>${label}</b>` : ""} must not be less than ${val} chars</span>`);
                            return false;
                        }
                    }

                    if (input.hasAttribute("maxlength")) {
                        let val = input.getAttribute("maxlength");
                        if (val && input.value.trim().length > val) {
                            input.classList.remove("is-valid");
                            input.classList.add("is-invalid");
                            toast(`<span>${label ? `<b>${label}</b>` : ""} must not be more than ${val} chars</span>`);
                            return false;
                        }
                    }

                    if (input.hasAttribute("min")) {
                        let val = input.getAttribute("min");
                        if (val && parseInt(input.value.trim()) < val) {
                            input.classList.remove("is-valid");
                            input.classList.add("is-invalid");
                            toast(`<span>${label ? `<b>${label}</b>` : ""} must not be less than ${val}</span>`);
                            return false;
                        }
                    }

                    if (input.hasAttribute("max")) {
                        let val = input.getAttribute("max");
                        if (val && parseInt(input.value.trim()) > val) {
                            input.classList.remove("is-valid");
                            input.classList.add("is-invalid");
                            toast(`<span>${label ? `<b>${label}</b>` : ""} must not be greater than ${val}</span>`);
                            return false;
                        }
                    }


                    if (!input.required) {
                        continue;
                    }

                    if (input.value.trim() === "" || input.value == undefined || input.value == null) {
                        input.classList.remove("is-valid");
                        input.classList.add("is-invalid");
                        toast(`<span>${label ? `<b>${label}</b>` : ""} field is required</span>`);
                        return false;
                    }
                    input.classList.add("is-valid");
                    input.classList.remove("is-invalid");
                }
                return true;

            }

            var subs = document.getElementById("<%= Subs.ClientID %>");

            function toast(message, classes) {
                return window.M.toast({ html: message, classes: classes ? classes : "bg-dark" });
            }

            var cRegBtn = document.getElementById("confirmBtn");
            var sRegBtn = document.getElementById("<%= RegisterBtn.ClientID %>");
            var navButtons = document.querySelectorAll("button.next-step, button.previous-step");
            const inputs = stepper.querySelectorAll('input', 'select', 'textarea');
            cRegBtn.addEventListener("click",
                (e) => {
                    cRegBtn.innerText = "please wait...";
                    if (validateInput(cRegBtn.closest("form"), stepperInstance.getSteps().active.step.querySelector(".step-content"))) {
                        let input;
                        let btn;
                        if (validateValues(e, inputs)) {
                            cRegBtn.classList.add("d-none");
                            sRegBtn.classList.remove("d-none");
                            subs.value = JSON.stringify(selectedSubs);
                            for (btn of navButtons) {
                                btn.classList.add("d-none");
                                btn.disabled = true;
                            }
                            for (input of inputs) {
                                if (input.type === "submit") {
                                    continue;
                                } else {
                                    input.classList.add("disabled");
                                    // input.disabled = true;
                                }
                            }
                            done = true;
                        } else {
                            sRegBtn.classList.add("d-none");
                            cRegBtn.innerText = "complete";
                            cRegBtn.classList.remove("d-none");
                            for (btn of navButtons) {
                                btn.classList.remove("d-none");
                                btn.disabled = false;
                            }
                            for (input of inputs) {
                                input.classList.add("disabled");
                                // input.disabled = false;
                            }
                            done = false;
                        }
                    }
                    cRegBtn.innerText = "complete";
                });

            if (errorField) {
                if (errorField.value.trim().length > 0) {
                    toast(message = `<span class="d-flex align-items-center"><span class="material-icons-round">error_outline</span ><span class="d-inline-block ms-1">${errorField.value}</span></span>`, classes = "bg-dark text-danger");
                }
            }

            /////// unnecessary but cool ;-) ////////
            //const containsFiles = (event) => {
            //    if (event.dataTransfer.types) {
            //        for (var i = 0; i < event.dataTransfer.types.length; i++) {
            //            if (event.dataTransfer.types[i].toLowerCase() == "Files") {
            //                return true;
            //            }
            //        }
            //    }
            //    return false;
            //}
        })();
    </script>
</asp:Content>