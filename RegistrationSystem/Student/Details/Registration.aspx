<%@ Page Title="Student Portal" Language="C#" MasterPageFile="~/Student/Details/DetailsMaster.master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="RegistrationSystem.Student.Details.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ExtraStyles" runat="server">
    <style>
        .reg-active {
            border: 2px solid rgba(253,29,29,1);
            color: rgba(253,29,29,1);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class="h6">Registration details</h1>
    <div id="MakePayment" class="text-end" runat="server">
        <a href="~/Secure/Payment" class="btn btn-primary rounded-pill" runat="server">make payment</a>
    </div>
    <div class="row my-sm-3">
        <div class="col-sm-12 col-md-4">
            <div class="card text-info shadow-sm">
                <div class="card-body">
                    <h1 class="no-text-wrap h4" id="AmountDue" runat="server">Amount Due</h1>
                    <p class="mb-0"><%= Reg.AmountDue.ToString("C") %></p>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-4">
            <div class="card text-success shadow-sm">
                <div class="card-body">
                    <h1 class="no-text-wrap h4" id="H1" runat="server">Amount Payed</h1>
                    <p class="mb-0"><%= Reg.AmountPayed.ToString("C") %></p>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-4">
            <div class="card shadow-sm">
                <div class="card-body">
                    <% if (Reg.AmountDue > Reg.AmountPayed)
                        { %>
                    <h1 class="no-text-wrap h4 text-danger" runat="server">Amount Owing</h1>
                    <p id="P1" runat="server" class="mb-0 text-danger"><%= (Reg.AmountPayed - Reg.AmountDue).ToString("C") %></p>
                    <%}
                        else
                        { %>
                    <h1 class="no-text-wrap h4 text-success" runat="server">Amount Owing</h1>
                    <p id="P10" runat="server" class="mb-0 text-success"><%= (Reg.AmountPayed - Reg.AmountDue).ToString("C") %></p>
                    <%} %>
                </div>
            </div>
        </div>
    </div>
    <h1 class="lead">Registered Subjects</h1>
    <div class="row gy-3">
        <asp:Repeater ID="RegSubjectRepeater" runat="server">
            <ItemTemplate>
                <div class="col-sm-6 col-md-4">
                    <div class="card reg-sub-cont h-100">
                        <div class="bg-image purple hover-overlay ripple">
                            <p runat="server"
                                data-subcode='<%#DataBinder.Eval(Container.DataItem,"SubjectCode")%>'
                                data-submark='<%#DataBinder.Eval(Container.DataItem,"MatricMark")%>'
                                class="h5 m-0 reg-sub text-light">
                            </p>
                        </div>

                        <div class="card-body">
                            <h5 class="card-title"><%#DataBinder.Eval(Container.DataItem,"Subject.SubjectName")%></h5>
                            <p class="card-text">
                                <%#DataBinder.Eval(Container.DataItem,"Subject.SubjectDescription")%>
                            </p>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <hr />
    <div class="lead">Important Dates</div>
    <div class="row">
        <div class="col-sm-6">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between px-md-1">
                        <div class="align-self-center">
                            <span class="material-icons-outlined text-gradient md-48">app_registration</span>
                        </div>
                        <div class="text-end">
                            <h5 id="TotalStudents" runat="server">Registration Date</h5>
                            <p class="mb-0"><%= Reg.RegistrationDate.ToString("dd MMMM yyyy (dddd)") %></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between px-md-1">
                        <div class="align-self-center">
                            <span class="material-icons-outlined text-gradient md-48">task_alt</span>
                        </div>
                        <div class="text-end">
                            <h5 id="H2" runat="server">Approval Date</h5>
                            <p class="mb-0"><%= Reg.ApproveDate?.ToString("dd MMMM yyyy (dddd)") %></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="NextPaymentCard" runat="server" class="col-sm-6">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between px-md-1">
                        <div class="align-self-center">
                            <span class="material-icons-outlined text-gradient md-48">request_quote</span>
                        </div>
                        <div class="text-end">
                            <h5 id="H3" runat="server">Next Payment</h5>
                            <p class="mb-0"><%= Reg.NextPayment?.ToString("dd MMMM yyyy (dddd)") %></p>
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
</asp:Content>
