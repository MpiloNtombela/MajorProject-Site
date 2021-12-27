<%@ Page Title="Student Details" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="RegistrationSystem.Admin.Students.View" EnableEventValidation="false" %>

<%@ Register Src="~/Admin/UcControls/UcUserSearch.ascx" TagPrefix="uc" TagName="UserSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ExtraStyles" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="SuccessMessage" runat="server"/>
    <asp:HiddenField ID="DefaultMessage" runat="server"/>
    <asp:HiddenField ID="ErrorMessage" runat="server"/>
    <asp:PlaceHolder ID="StudentDetails" runat="server">
        <div class="card">
            <h1 class="h2 mt-2 text-gradient text-center"><%: Title %></h1>
            <div class="card-body text-start px-3 px-sm-5">
                <%--  ----------other details---------  --%>
                <div class="h5 text-center fw-bold main-gradient white-text rounded-pill my-4 py-2">
                    Personal details
                </div>
                <div class="px-3 px-sm-3">

                    <div class="row">
                        <p runat="server" class="card-text col-sm-5 fw-bold text-start">First Name</p>
                        <p id="RegFirstName" runat="server" class="card-text col-sm-7 text-start"><%= Student.FirstName %></p>
                    </div>
                    <div class="row">
                        <p class="card-text col-sm-5 fw-bold text-start">Last Name</p>
                        <p id="RegLastName" runat="server" class="card-text col-sm-7 text-start"><%= Student.LastName %></p>
                    </div>
                    <div class="row">
                        <p class="card-text col-sm-5 fw-bold text-start">Date of birth</p>
                        <p id="Regdateofbirth" runat="server" class="card-text col-sm-7 text-start"><%= Student.DateOfBirth %></p>
                    </div>
                    <div class="row">
                        <p class="card-text col-sm-5 fw-bold text-start">Identification Number</p>
                        <p id="RegIdnumber" runat="server" class="card-text col-sm-7 text-start"><%= Student.IDNumber %></p>
                    </div>
                    <div class="row">
                        <p class="card-text col-sm-5 fw-bold text-start">Email Address</p>
                        <p id="RegEmail" runat="server" class="card-text col-sm-7 text-start"><%= Student.Email %></p>
                    </div>
                    <div class="row">
                        <p class="card-text col-sm-5 fw-bold text-start">Home Address</p>
                        <p id="RegAddress" runat="server" class="card-text col-sm-7 text-start"><%= Student.HomeAddress %></p>

                    </div>
                    <div class="row">
                        <p class="card-text col-sm-5 fw-bold text-start">Gender</p>
                        <div class="col-sm-7 d-flex">
                            <span class="text-capitalize"><%= Student.Gender.ToLower() == "m" ? "male" : "female" %></span>
                            (
                            <span class="material-icons-outlined md-24 red-text text-start">
                                <%= Student.Gender.ToLower() == "m" ? "male" : "female" %>
                            </span>)
                        </div>
                    </div>
                </div>

                <div class="h5 fw-bold text-center main-gradient white-text rounded-pill my-4 py-2">
                    Registration details
                </div>
                <div class="px-0 px-sm-3">
                    <div class="row">
                        <p class="card-text col-sm-5 fw-bold text-start">Registration Date</p>
                        <p id="P3" runat="server" class="card-text col-sm-7 text-start"><%= Registration.RegistrationDate.ToString("dd MMMM yyyy") %></p>
                    </div>
                    <div class="row">
                        <p class="card-text col-sm-5 fw-bold text-start">Amount Due</p>
                        <p id="P2" runat="server" class="card-text red-text col-sm-7 text-start"><%= Registration.AmountDue.ToString("C") %></p>
                    </div>
                    <div class="row">
                        <p class="card-text col-sm-5 fw-bold  text-start">Amount Payed</p>
                        <p id="P1" runat="server" class="card-text col-sm-7 green-text text-start"><%= Registration.AmountPayed.ToString("C") %></p>
                    </div>
                    <div class="row">
                        <p class="card-text col-sm-5 fw-bold text-start">Payment Plan</p>
                        <p id="P4" runat="server" class="card-text col-sm-7 text-start"><%= Registration.PaymentPlanID %></p>
                    </div>
                    <div class="row">
                        <p class="card-text col-sm-5 fw-bold text-start">Date of Approval</p>
                        <p id="P5" runat="server" class="card-text col-sm-7 text-start"><%= Registration.ApproveDate.ToString() %></p>
                    </div>
                </div>
                <div class="h5 fw-bold text-center main-gradient white-text rounded-pill my-4 py-2">
                    Registered Subjects
                </div>
                <div class="px-3 px-sm-3">
                    <div class="row gy-3 mb-5">
                        <asp:Repeater ID="RegSubjectRepeater" runat="server">
                            <ItemTemplate>
                                <div class="col-sm-6 col-md-4">
                                    <div class="card reg-sub-cont h-100">
                                        <div class="card-body">
                                            <h5 class="card-title"><%#DataBinder.Eval(Container.DataItem, "Subject.SubjectName") %></h5>
                                            <p class="card-text">
                                                <%#DataBinder.Eval(Container.DataItem, "Subject.SubjectDescription") %>
                                            </p>
                                        </div>
                                        <div class="purple darken-3 hover-overlay ripple rounded-bottom">
                                            <p runat="server"
                                               data-subcode='<%#DataBinder.Eval(Container.DataItem, "SubjectCode") %>'
                                               data-submark='<%#DataBinder.Eval(Container.DataItem, "MatricMark") %>'
                                               class="h5 m-0 reg-sub text-light">
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <div class="h5 fw-bold main-gradient text-center white-text rounded-pill my-4 py-2">
                    Supporting Documents
                </div>
                <div class="px-3 px-sm-3">
                    <div class="row">
                        <asp:Repeater ID="SupportingDocs" runat="server">
                            <ItemTemplate>
                                <div class="col-sm-6 col-md-4">
                                    <div class="card border border-primary shadow-0">
                                        <div class="card-body p-2 position-relative" data-mdb-toggle="tooltip"
                                             title='<%# ((bool) DataBinder.Eval(Container.DataItem, "IsVerified")) ? "verified" : "unverified" %>'>
                                            <h1 class="h6"><%# DataBinder.Eval(Container.DataItem, "FileType") %></h1>
                                            <h2 class="small text-muted"><%# DataBinder.Eval(Container.DataItem, "FileName") %></h2>
                                            <span class='material-icons-outlined
                                            position-absolute 
                                            top-0 end-0 me-2 mt-2
                                            <%# ((bool) DataBinder.Eval(Container.DataItem, "IsVerified")) ? "text-success" : "text-danger" %>'>
                                                <%# ((bool) DataBinder.Eval(Container.DataItem, "IsVerified")) ? "task_alt" : "cancel" %>
                                            </span>
                                            <div runat="server" id="btns" class="text-end no-text-wrap">
                                                <asp:HiddenField ID="Doc" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "SupportingDocumentID") %>'/>
                                                <button type="button" id="btn" runat="server" class="btn btn-sm btn-outline-primary rounded-pill px-3 view-btn">open</button>
                                                <asp:Button ID="VerifyBtn" CssClass="btn btn-sm btn-primary rounded-pill shadow-0"
                                                            CommandArgument='<%# DataBinder.Eval(Container.DataItem, "SupportingDocumentID") %>'
                                                            Text="verify" runat="server"
                                                            OnCommand="VerifyBtn_Command"
                                                            Visible='<%# (!(bool) DataBinder.Eval(Container.DataItem, "IsVerified")) %>'/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
        <div class="card-footer text-end">
            <asp:Button CssClass="btn btn-success btn-lg rounded-pill" ID="ApproveRegBtn" runat="server" Text="Approve Registration" OnClick="ApproveRegBtn_Click"/>
            <asp:Label ID="RegApprovedDate" CssClass="h6 text-muted" runat="server" Visible="false"/>
        </div>
        <div
            class="modal fade bg-transparent shadow-0 w-100 mh-100"
            id="supportDocModal"
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
    </asp:PlaceHolder>

    <asp:PlaceHolder ID="NotFound" runat="server" Visible="false">
        <div class="card text-center shadow-sm">
            <div class="card-body py-5">
                <img height="250" src="~/Content/Static/empty.svg" runat="server" alt="empty"/>
                <h1 class="h2 my-4">Oops... looks like there is no student with that ID</h1>
                <div class="d-flex w-100 justify-content-center">
                    <uc:UserSearch runat="server"/>
                </div>
                <a class="btn btn-secondary btn-sm rounded-pill d-inline-block py-0 px-5" href="~/Admin/Students/Default.aspx" runat="server" style="line-height: 36px">
                    <i class="material-icons-round left">arrow_back</i>
                    Go Back
                </a>
            </div>
        </div>
    </asp:PlaceHolder>
</asp:Content>
<asp:Content ContentPlaceHolderID="ExtraScript" runat="server">
    <asp:PlaceHolder ID="DocScript" runat="server">
        <script>
            (() => {
                const base64Field = document.getElementById("<%= MDocReader.DocBase64FieldId %>");
                const docNameField = document.getElementById("<%= MDocReader.DocNameFieldId %>");
                const supportDocModalEl = document.getElementById('supportDocModal');
                const filePrevModal = new window.mdb.Modal(supportDocModalEl);
                const viewButtons = document.querySelectorAll(".view-btn");

                let docs = [];
                const urlParams = new URLSearchParams(window.location.search);
                window.axios.get(`/api/students/${urlParams.get("id")}/docs`).then(res => {
                    docs = res.data;
                }).catch(err => {
                    console.log(err.response.data);
                });
                for (let btn of viewButtons) {
                    btn.addEventListener("click",
                        (e) => {
                            if (docs) {
                                const el = e.target.parentElement.querySelector("input[type=hidden]");
                                if (el) {
                                    const doc = docs.find(docx => {
                                            return docx.SupportingDocumentId === Number.parseInt(el.value);
                                        }
                                    );
                                    if (doc) {
                                        base64Field.value = `data:${doc['ContentType']};base64,${doc.File}`;
                                        docNameField.value = doc['FileType'];
                                        base64Field.dispatchEvent(new Event("change"));
                                        filePrevModal.show();
                                    }
                                }
                            }
                        });
                }
            })()
        </script>
    </asp:PlaceHolder>
    <asp:PlaceHolder runat="server">
        <script>
            (() => {
                const msg = document.getElementById("<%= SuccessMessage.ClientID %>");
                const dMsg = document.getElementById("<%= DefaultMessage.ClientID %>");
                const errMsg = document.getElementById("<%= ErrorMessage.ClientID %>");
                if (msg) {
                    if (msg.value.trim().length > 0) {
                        toast(message =
                            `<span class="d-flex align-items-center"><span class="material-icons-outlined">task_alt</span ><span class="d-inline-block ms-1">${msg.value}</span></span>
                        <button class="btn-flat toast-action" onClick="javascript:(()=> {location.replace(location.href.split('&')[0])})()">ok</button>`,
                            classes = "bg-success");
                    }
                }

                if (dMsg) {
                    if (dMsg.value.trim().length > 0) {
                        toast(message =
                            `<span class="d-flex align-items-center"><span class="material-icons-outlined">info</span ><span class="d-inline-block ms-1">${dMsg.value}</span></span>
                        <button class="btn-flat toast-action" onClick="javascript:(()=> {location.replace(location.href.split('&')[0])})()">ok</button>`);
                    }
                }
                if (errMsg) {
                    if (errMsg.value.trim().length > 0) {
                        toast(message =
                            `<span class="d-flex align-items-center"><span class="material-icons-outlined">info</span ><span class="d-inline-block ms-1">${errMsg.value}</span></span>
                        <button class="btn-flat toast-action" onClick="javascript:(()=> {location.replace(location.href.split('&')[0])})()">ok</button>`,
                            classes = "bg-danger");
                    }
                }

                function toast(message, classes) {
                    return window.M.toast({ html: message, classes: classes ? classes : "bg-dark" });
                }
            })()
        </script>
    </asp:PlaceHolder>
</asp:Content>