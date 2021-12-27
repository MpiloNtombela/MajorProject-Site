<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Public/PublicMaster.master" AutoEventWireup="false" CodeBehind="About.aspx.cs" Inherits="RegistrationSystem.Public.About" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p class="fs-5 my-4">
        About us page | details about the company
    </p>
    <a class="btn btn-primary btn-sm rounded-pill d-inline-block my-1 my-sm-3 px-4 mx-1" href="~/Account/Register" style="line-height: 36px" runat="server">
        <i class="material-icons-round right">launch</i>
        Register now</a>
    <a class="btn btn-secondary btn-sm rounded-pill d-inline-block my-1 my-sm-3 px-3 mx-1" href="~/Public/Contact" style="line-height: 36px" runat="server">
        <i class="material-icons-round right">forum</i>
        Contact us now</a>
    <hr />
    <h1 class="h5 mb-4 text-gradient d-flex justify-content-center">Frequently Asked Questions <span class="material-icons-round d-inline-block ms-1">contact_support</span></h1>
    <div class="accordion" id="accordionExample">
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingTwo">
                <button
                    class="accordion-button collapsed"
                    type="button"
                    data-mdb-toggle="collapse"
                    data-mdb-target="#collapseTwo"
                    aria-expanded="false"
                    aria-controls="collapseTwo">
                    What happens when you upgrade matric?
                </button>
            </h2>
            <div
                id="collapseTwo"
                class="accordion-collapse collapse"
                aria-labelledby="headingTwo"
                data-mdb-parent="#accordionExample">
                <div class="accordion-body">
                    <%-- answer --%>
                    Once you have completed your matric upgrade and improved selected marks, 
                    you can merge the new marks with the marks you did not choose to improve. 
                    This means that all your chosen marks will be on one certificate.
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingThree">
                <button
                    class="accordion-button collapsed"
                    type="button"
                    data-mdb-toggle="collapse"
                    data-mdb-target="#collapseThree"
                    aria-expanded="false"
                    aria-controls="collapseThree">
                    Can I upgrade matric results while studying at University?
                </button>
            </h2>
            <div
                id="collapseThree"
                class="accordion-collapse collapse"
                aria-labelledby="headingThree"
                data-mdb-parent="#accordionExample">
                <div class="accordion-body">
                    <%-- answer --%>
                    Yes, you can enrol on Matric upgrade. 
                    You may choose to use lower level qualifications as University bridging courses, 
                    while upgarding your Marks required by your desired course
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingFour">
                <button
                    class="accordion-button collapsed"
                    type="button"
                    data-mdb-toggle="collapse"
                    data-mdb-target="#collapseFour"
                    aria-expanded="false"
                    aria-controls="collapseFour">
                    Do I need laptop and internet Access to be a student?
                </button>
            </h2>
            <div
                id="collapseFour"
                class="accordion-collapse collapse"
                aria-labelledby="headingFour"
                data-mdb-parent="#accordionExample">
                <div class="accordion-body">
                    <%-- answer --%>
                    No you don't need to have laptop, but internet connection is required as the country is in Lockdown as there no contact classes
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingFive">
                <button
                    class="accordion-button collapsed"
                    type="button"
                    data-mdb-toggle="collapse"
                    data-mdb-target="#collapseFive"
                    aria-expanded="false"
                    aria-controls="collapseFive">
                    How much does it cost to upgrade matric?
                </button>
            </h2>
            <div
                id="collapseFive"
                class="accordion-collapse collapse"
                aria-labelledby="headingFive"
                data-mdb-parent="#accordionExample">
                <div class="accordion-body">
                    <%-- answer --%>
                    The cost depends on the number of subjects you choose to upgrade, because all the subjects are priced individually.
                </div>
            </div>
        </div>
    </div>
</asp:Content>
