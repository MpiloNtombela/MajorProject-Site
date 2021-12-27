<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Public/PublicMaster.master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="RegistrationSystem.Public.Contact" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1 class="h3 my-4">We’d Love to Hear From You</h1>

    <p class="fs-5 text-muted">
        Whether you’re curious about what we offer, wanna know more about our plans,
        or even press —we’re ready to answer any and all questions.
    </p>
    <div class="card col-sm-12 p-3 col-md-10 col-lg-8 mx-auto my-5">
        <div class="input-field form-outline">
            <textarea class="materialize-textarea" id="TextMessage"
                data-mdb-showcounter="true"
                maxlength="249" runat="server"></textarea>
            <asp:Label AssociatedControlID="TextMessage" class="form-label" runat="server">Message*</asp:Label>
            <div class="form-helper"></div>
        </div>
        <div class="text-end mt-2">
            <a id="SendBtn" class="btn main-gradient rounded-pill text-light disabled" href="javascript:void(0)" runat="server">send us email</a>
        </div>
    </div>
    <hr />
    <h1 class="h6 mt-5 mb-3">We're are also available on various platforms to answer your all questions. Choose the one's appropriate for you.</h1>

    <!-- Linkedin -->
    <a class="btn btn-primary rounded-pill my-1" target="_blank" style="background-color: #0082ca; width: 120px" href="#!" role="button">linkedin</a>

    <!-- Twitter -->
    <a class="btn btn-primary rounded-pill my-1" target="_blank" style="background-color: #55acee; width: 120px" href="#!" role="button">twitter</a>

    <!-- Twitter -->
    <a class="btn btn-primary rounded-pill my-1" target="_blank" style="background-color: #25D366; width: 120px" href="#!" role="button">whatsapp</a>

    <!-- Instagram -->
    <a class="btn btn-primary rounded-pill my-1" target="_blank" style="background-color: #ac2bac; width: 120px" href="#!" role="button">instagram</a>

    <!-- Facebook -->
    <a class="btn btn-primary rounded-pill my-1" target="_blank" style="background-color: #3b5998; width: 120px" href="#!" role="button">facebook</a>

    <p class="fs-6 text-muted mt-3">Don't forget to #follow us on these platforms, to get our latest updates</p>
</asp:Content>
<asp:Content ContentPlaceHolderID="ExtraScript" runat="server">
    <script>
        (() => {
            const msgEl = document.getElementById("<%= TextMessage.ClientID %>");
            const sendBtn = document.getElementById("<%= SendBtn.ClientID %>");
            sendBtn.style.pointerEvents = "none";
            msgEl.addEventListener("input", (e) => {
                if (e.target.value.length > 249) {
                    msgEl.value = e.target.value.substr(0, 249);
                };
                if (e.target.value.length < 3) {
                    sendBtn.style.pointerEvents = "none";
                    sendBtn.href = "javascript:void(0)";
                    sendBtn.classList.add("disabled");
                } else {
                    sendBtn.classList.remove("disabled");
                    sendBtn.style.pointerEvents = "auto";
                    sendBtn.href = `mailto:oncht507p@relay.firefox.com?subject=from%20website&body=${e.target.value}`;
                }
            }, false);

        })();
    </script>
</asp:Content>
