<%@ Page Title="Student Registration" Language="C#" MasterPageFile="~/Public/PublicMaster.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RegistrationSystem.Student.Default" %>

<%@ Register Src="~/Student/UControls/UcRegNotApproved.ascx" TagPrefix="uc" TagName="NotApproved" %>
<%@ Register Src="~/Student/UControls/UcNotRegistered.ascx" TagPrefix="uc" TagName="NotRegistered" %>
<%@ Register Src="~/Student/UControls/UcRegApproved.ascx" TagPrefix="uc" TagName="RegApproved" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="SuccessMessage" runat="server" />
    <asp:HiddenField ID="DefaultMessage" runat="server" />
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
                            <%if (CurrentUser.PhoneNumber == null && !CurrentUser.PhoneNumberConfirmed)
                              {%>
                                <a href="~/Account/AddPhoneNumber.aspx" class="btn btn-outline-secondary rounded-pill" runat="server">add phone number</a>
                            <%} %>
                        </div>
                    </div>
                    <div class="text-end d-block d-sm-none">
                        <%if (CurrentUser.PhoneNumber == null && !CurrentUser.PhoneNumberConfirmed)
                          {%>
                            <a href="~/Account/AddPhoneNumber.aspx" class="btn btn-outline-secondary rounded-pill" runat="server">add phone number</a>
                        <%} %>
                    </div>
                </div>
            </div>
        </div>
        <asp:PlaceHolder runat="server" ID="NotApprovedCard" Visible="false">
            <div class="col-12">
                <uc:NotApproved ID="NotApproved" runat="server" />
            </div>
        </asp:PlaceHolder>
        <asp:PlaceHolder runat="server" ID="NotRegisteredCard" Visible="false">
            <div class="col-12">
                <uc:NotRegistered ID="NotRegistered" runat="server" />
            </div>
        </asp:PlaceHolder>
        <asp:PlaceHolder runat="server" ID="BankingRequired" Visible="false">
            <div class="col-12">
                <uc:RegApproved ID="RegApproved" runat="server" />
            </div>
        </asp:PlaceHolder>
    </div>
</asp:Content>
<asp:Content ContentPlaceHolderID="ExtraScript" runat="server">
    <script>
        (() => {
            let msg = document.getElementById("<%= SuccessMessage.ClientID %>");
            let dMsg = document.getElementById("<%= DefaultMessage.ClientID %>");

            if (msg) {
                if (msg.value.trim().length > 0) {
                    toast(message =
                        `<span class="d-flex align-items-center"><span class="material-icons-outlined">task_alt</span ><span class="d-inline-block ms-1">${msg.value}</span></span>
                        <button class="btn-flat toast-action" onClick="javascript:(()=> {location.replace(location.href.split('?')[0])})()">ok</button>`, classes = "bg-success");
                }
            }

            if (dMsg) {
                if (dMsg.value.trim().length > 0) {
                    toast(message =
                        `<span class="d-flex align-items-center"><span class="material-icons-outlined">info</span ><span class="d-inline-block ms-1">${dMsg.value}</span></span>
                        <button class="btn-flat toast-action" onClick="javascript:(()=> {location.replace(location.href.split('?')[0])})()">ok</button>`);
                }
            }

            function toast(message, classes) {
                return window.M.toast({ html: message, classes: classes ? classes : "bg-dark" });
            }

        })()
    </script>
</asp:Content>
