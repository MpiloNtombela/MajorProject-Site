<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RegistrationSystem.Admin.Students.Default" %>

<%@ Register Src="~/Admin/UcControls/UcUserSearch.ascx" TagPrefix="uc" TagName="UserSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ExtraStyles" runat="server">
    <style>
        .students {
            background: var(--mdb-secondary);
            color: #ffffff;
            border-bottom: 2px solid var(--mdb-secondary)
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="position-relative">
        <h1 class="text-gradient h3">Registered Students</h1>
        <div class="d-flex align-items-baseline">
            <div class="flex-grow-1 d-flex justify-content-center me-3">
                <uc:UserSearch runat="server" />
            </div>
            <div class="dropdown">
                <a
                    href="#"
                    class="chip bg-secondary white-text text-uppercase dropdown-toggle"
                    type="button"
                    id="filterMenu"
                    data-mdb-toggle="dropdown"
                    aria-expanded="false">
                    <span class="chip-text material-icons-outlined purple darken-1 darken-2 white-text" style="font-size: 1.5rem">tune</span>
                    <strong class="d-none d-sm-inline">filter</strong>
                </a>
                <ul class="dropdown-menu" aria-label="filter students">
                    <li><a class="dropdown-item" href="~/Admin/Students/Default.aspx?approved=true" runat="server">Approved Students</a></li>
                    <li><a class="dropdown-item" runat="server" href="~/Admin/Students/Default.aspx?approved=false">Unapproved Students</a></li>
                    <li class="bg-light"><a class="dropdown-item fw-bold" runat="server" href="~/Admin/Students/Default.aspx">Clear Filters</a></li>
                </ul>
            </div>
        </div>
        <div class="row">
            <asp:Repeater ID="RegStudents" runat="server">
                <ItemTemplate>
                    <div class="col-sm-6 col-md-4 col-lg-3">
                        <div class="card text-center rounded-lg position-relative">
                            <div style="z-index: 1" class="d-flex justify-content-center align-items-center my-3 position-relative">
                                <span runat="server" style="height: 75px; width: 75px" class="d-flex justify-content-center align-items-center rounded-circle main-gradient fs-3 text-light">
                                    <span class="material-icons-outlined md-64 white-text">
                                        <%# (DataBinder.Eval(Container.DataItem,"Student.Gender")).ToString().ToLower() == "m" ? "male" : "female" %>
                                    </span>
                                </span>
                            </div>
                            <div style="height: 55px" class='m<%#DataBinder.Eval(Container.DataItem,"Registration.PaymentPlanID")%> rounded-top w-100 position-absolute top-0 left-0 right-0'></div>
                            <h1 class="h5 m-0 text-gradient">
                                <%#DataBinder.Eval(Container.DataItem,"Student.FirstName")%>
                                <%#DataBinder.Eval(Container.DataItem,"Student.LastName")%>
                            </h1>
                            <p class="text-muted text-tiny m-0">
                                <%#DataBinder.Eval(Container.DataItem,"Student.Email")%>
                            </p>
                            <div class="mt-2 p-2">
                                <h6 class="h6 m-0">Registration Date</h6>
                                <p class="badge rounded-pill tiny-text px-3 grey white-text">
                                    <%#((DateTime)DataBinder.Eval(Container.DataItem,"Registration.RegistrationDate")).ToString("dd MMMM yyyy (ddd)")%>
                                </p>
                                <h6 class="h6 m-0">Registration Status</h6>
                                <p class='badge rounded-pill 
                                tiny-text px-3
                                white-text 
                                <%# ((bool)DataBinder.Eval(Container.DataItem,"Registration.IsApproved")) ? "bg-success" : "bg-danger" %>'>
                                    <%# ((bool)DataBinder.Eval(Container.DataItem,"Registration.IsApproved")) ? "Approved" : "Not Approved" %>
                                </p>
                            </div>
                            <div class="pb-3 px-4">
                                <asp:HyperLink CssClass="btn btn-outline-primary btn-block rounded-pill no-text-wrap"
                                    NavigateUrl='<%# string.Format("~/Admin/Students/View?id={0}", DataBinder.Eval(Container.DataItem, "Student.StudentID")) %>'
                                    runat="server">view details</asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:PlaceHolder Visible='<%# ((Repeater)Container.NamingContainer).Items.Count == 0 %>' runat="server">
                        <div class="text-center">
                            <img height="200" src="~/Content/Static/empty.svg" runat="server" />
                            <h1 class="h3 my-4">Oops... No Students found</h1>
                        </div>
                    </asp:PlaceHolder>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
