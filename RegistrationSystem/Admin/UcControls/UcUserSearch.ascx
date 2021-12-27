<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UcUserSearch.ascx.cs" Inherits="RegistrationSystem.Admin.UcControls.UcUserSearch" %>
<div class="my-1 w-100" style="max-width: 700px">
    <div class="input-field">
        <div class="form-outline">
            <asp:Button ID="SearchBtn" class="material-icons-round trailing pe-auto pb-2 end-0 bg-transparent border-0 text-gradient" runat="server" Text="search" OnClick="SearchBtn_Click" />
            <asp:TextBox runat="server"
                ID="AutocompleteInput"
                CssClass="autocomplete"
                TextMode="SingleLine"
                placeholder="Search Student by Fisrt/Last Name"
                autocomplete="off" />
        </div>
    </div>
</div>
<script>
    (() => {
        const data = {};
        document.addEventListener('DOMContentLoaded', function () {
            var elems = document.querySelectorAll('.autocomplete');
            window.axios.get("/api/students").then(res => {
                console.log(res.data);
                for (var i = 0; i < res.data.length; i++) {
                    data[`${res.data[i].FirstName} ${res.data[i].LastName} - ${res.data[i].StudentId}`] = null;
                }
                var instances = window.M.Autocomplete.init(elems, {
                    data: data,
                    limit: 10,
                    onAutocomplete: (val) => {
                        console.log(val);
                        const id = parseInt(val.split("-")[1].trim());
                        if (Number.isInteger(id)) {
                            window.open(`/Admin/Students/View?id=${id}`, "_self");
                        }
                    }
                });
            }).catch(err => {
                console.log(err);
            });
        });
    })()
</script>
