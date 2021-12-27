<%@ Page Title="Our Programs" Language="C#" MasterPageFile="~/Public/PublicMaster.master" AutoEventWireup="true" CodeBehind="Programs.aspx.cs" Inherits="RegistrationSystem.Public.Programs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%--<h1 class="h4">subjects we offer</h1>--%>
    <p class="fs-5 my-4">
        We currently only offer these subjects for upgrade, more will be added as demand for them increases
    </p>
    <div class="row">
        <asp:Repeater ID="SubjectRepeater" runat="server">
            <ItemTemplate>
                <div class="col-12 col-sm-6 mb-1 text-start">
                    <mpilo:Subject
                        Selectable="false"
                        SubCode='<%#DataBinder.Eval(Container.DataItem, "SubjectCode") %>'
                        SubName='<%#DataBinder.Eval(Container.DataItem, "SubjectCode") %>'
                        SubPrice='<%#DataBinder.Eval(Container.DataItem, "SubjectCode") %>'
                        SubDesc='<%#DataBinder.Eval(Container.DataItem, "SubjectCode") %>'
                        runat="server"/>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <a class="btn btn-primary btn-sm rounded-pill d-inline-block mt-3 mb-5 px-5 mx-1" href="~/Account/Register.aspx" style="line-height: 36px" runat="server">
        <i class="material-icons-round right">launch</i>
        Register now
    </a>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ExtraScript" runat="server">
</asp:Content>