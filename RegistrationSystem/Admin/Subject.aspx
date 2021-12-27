<%@ Page Title="Subject Management" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeBehind="Subject.aspx.cs" Inherits="RegistrationSystem.Admin.Subject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ExtraStyles" runat="server">
    <style>
        .page3 {
            background: var(--mdb-secondary);
            color: hsl(0 0% 100%);
            border-bottom: 2px solid var(--mdb-secondary)
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1 class="main-gradient rounded-pill white-text text-center h4 py-2">Subject Management</h1>
    <div class="text-end fixed-bottom bottom-0 end-0 me-5 mb-5" style="z-index: 1">
        <button
            type="button"
            class="btn btn-secondary rounded-pill"
            data-mdb-toggle="modal"
            data-mdb-target="#exampleModal">
            Create new Subject
        </button>
    </div>
    <%-- Load all the subjects in the database --%>
    <div class="row">
        <div class="col-lg-6">
            <h4 class="h5 my-3 text-center">Active Subjects</h4>
            <div class="row">
                <asp:Repeater ID="SubjectRepeater" runat="server">
                    <ItemTemplate>
                        <div class="col-12 col-sm-6 mb-1">
                            <mpilo:Subject
                                Selectable="false"
                                SubCode='<%#DataBinder.Eval(Container.DataItem, "SubjectCode") %>'
                                SubName='<%#DataBinder.Eval(Container.DataItem, "SubjectName") %>'
                                SubPrice='<%#DataBinder.Eval(Container.DataItem, "SubjectPrice") %>'
                                SubDesc='<%#DataBinder.Eval(Container.DataItem, "SubjectDescription") %>'
                                runat="server"/>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <div class="col-lg-6">
            <h4 class="h5 my-3 text-center">Inactive Subjects</h4>
            <div class="row">
                <asp:Repeater ID="InactiveSubRepeater" runat="server">
                    <ItemTemplate>
                        <div class="col-12 col-sm-6 mb-1">
                            <mpilo:Subject
                                Selectable="false"
                                SubCode='<%#DataBinder.Eval(Container.DataItem, "SubjectCode") %>'
                                SubName='<%#DataBinder.Eval(Container.DataItem, "SubjectName") %>'
                                SubPrice='<%#DataBinder.Eval(Container.DataItem, "SubjectPrice") %>'
                                SubDesc='<%#DataBinder.Eval(Container.DataItem, "SubjectDescription") %>'
                                runat="server"/>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    <!-- Button trigger modal -->

    <!-- Modal -->
    <div
        class="modal fade "
        id="exampleModal"
        tabindex="-1"
        aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Enter subjects details below</h5>
                    <button
                        type="button"
                        class="btn-close"
                        data-mdb-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6 fw-bold">
                            <p>Subject Code:</p>
                        </div>
                        <div class="col-md-6">
                            <mpilo:RequiredTextBox runat="server" ID="Subject_Code_TextBox" Label="e.g MATHS" MinLength="5" MaxLength="5"/>
                        </div>
                        <div class="col-md-6 fw-bold">
                            <p>Teacher Name:</p>
                        </div>
                        <div class="col-md-6 mb-3">
                            <asp:DropDownList ID="TeachersList" runat="server"></asp:DropDownList>
                        </div>
                        <div class="col-md-6 fw-bold">
                            <p>Subject Name:</p>
                        </div>
                        <div class="col-md-6">
                            <mpilo:RequiredTextBox runat="server" ID="Subject_Name_Textbox" Label="e.g Mathematics" MinLength="5" MaxLength="32"/>
                        </div>
                        <div class="col-md-6 fw-bold">
                            <p>Subject Description:</p>
                        </div>
                        <div class="col-md-6">
                            <mpilo:RequiredTextBox runat="server" ID="Subject_Description_TextBox" Label="e.g Pure mathematics for all" MinLength="5" MaxLength="700"/>
                        </div>
                        <div class="col-md-6 fw-bold">
                            <p>Subject Price:</p>
                        </div>
                        <div class="col-md-6 ">
                            <mpilo:RequiredTextBox runat="server" ID="Subject_Price_TextBox" Label="e.g R700" TextMode="Number" MinLength="2" MaxLength="5"/>

                        </div>
                        <div class="col-md-6 fw-bold">
                            <p>Subject is Active:</p>
                        </div>
                        <div class="col-md-6">
                            <label>
                                <asp:CheckBox ID="isActive" runat="server"/>
                                <span id="span">Not Active</span>
                            </label>
                        </div>
                    </div>
                    <div class="modal-footer ">
                        <asp:Button ID="Creat_Subject_Btn" CssClass="btn btb-secondary main-gradient rounded-pill white-text" runat="server" Text="Add new Subject" OnClick="Creat_Subject_Btn_Click"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ExtraScript" runat="server">


    <%-- Philani's First Script lol legendary move ha ha ha --%>
    <script>
        var Checkbox = document.getElementById("<%= isActive.ClientID %>")
        var spanlabel = document.getElementById("span")

        Checkbox.addEventListener("change",
            function() {
                if (this.checked) {

                    spanlabel.innerText = "Active"

                } else {
                    spanlabel.innerText = "Not Active"

                }


            })


    </script>
</asp:Content>