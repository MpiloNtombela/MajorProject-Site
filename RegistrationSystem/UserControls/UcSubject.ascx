<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UcSubject.ascx.cs" Inherits="RegistrationSystem.UserControls.UcSubject" %>
<div id="Subject" class="card h-100" runat="server">
    <div class="card-body px-1 py-1 px-sm-2">
        <asp:HiddenField ID="SubjectNameVal" runat="server"/>
        <div class="d-flex justify-content-between p-md-1 h-100">
            <div class="d-flex flex-row">
                <div style="min-width: 80px" class="align-self-center justify-content-center me-2 main-gradient text-light h-100 d-flex px-1 px-sm-2 align-items-center rounded">
                    <asp:Label ID="SubjectCode" CssClass="fs-5 fw-bold" runat="server" Text="CODE"/>
                </div>
                <div>
                    <asp:Label ID="SubjectName" CssClass="h5" Text="Subject Name" runat="server"/>
                    <asp:Label ID="SubjectDescripition" CssClass="m-0 d-block text-muted tiny-text" Text="Subject Description" runat="server"/>
                    <asp:TextBox Style="visibility: hidden" min="0" max="100" CssClass="tiny-text mt-2 mw-70" ID="SubjectMark" TextMode="Number" placeholder="Enter matric mark(%)" runat="server"/>
                </div>
            </div>
            <div class="align-self-center h-100">
                <div class="d-flex flex-column">
                    <label class="d-block text-end">
                        <asp:CheckBox ID="SubjectCheck" runat="server"/>
                        <span class="ps-4"></span>
                    </label>
                    <asp:Label ID="SubjectPrice" CssClass="h5 mb-0 no-text-wrap" runat="server" Text="R 000.00"/>
                </div>
            </div>
        </div>
        <asp:HiddenField ID="SubjectPriceVal" runat="server"/>
        <asp:HiddenField ID="SubjectCodeVal" runat="server"/>
    </div>

</div>
<% if (Selectable)
   { %>
    <script>
        (() => {
            const subSelectBtn = document.getElementById("<%= SubjectCheck.ClientID %>");
            const subMark = document.getElementById("<%= SubjectMark.ClientID %>");
            const subSelected = (mark, selected) => {
                const evt = new CustomEvent("subSelectChange",
                    {
                        detail: {
                            subName: document.getElementById("<%= SubjectNameVal.ClientID %>").value,
                            subCode: document.getElementById("<%= SubjectCodeVal.ClientID %>").value,
                            subPrice: document.getElementById("<%= SubjectPriceVal.ClientID %>").value,
                            matricMark: mark,
                            selected: selected
                        },
                        bubbles: true
                    });
                subSelectBtn.dispatchEvent(evt);
            };

            subMark.addEventListener("change",
                (e) => {
                    subSelected(e.target.value, subSelectBtn.checked);
                });

            subSelectBtn.addEventListener("change",
                (e) => {
                    if (subSelectBtn.checked) {
                        subMark.style.visibility = "visible";
                        subMark.required = true;
                        subMark.value;
                    } else {
                        subMark.style.visibility = "hidden";
                        subMark.value = "";
                        subMark.required = false;
                    }
                    subSelected(mark = subMark.value, selected = subSelectBtn.checked);
                });

        })();
    </script>
<% } %>