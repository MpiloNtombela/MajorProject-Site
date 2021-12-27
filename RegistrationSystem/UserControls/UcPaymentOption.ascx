<%@ control language="C#" autoeventwireup="true" codebehind="UcPaymentOption.ascx.cs" inherits="RegistrationSystem.UserControls.UcPaymentOption" %>
<div class="card text-center">
    <div id="PaymentTitle" class="card-header" runat="server">Title</div>
    <div class="card-body">
        <h5 id="PaymentLength" class="card-title" runat="server">Card title</h5>
        <p id="PaymentDescription" class="card-text text-muted" runat="server">
            Some quick example of payment description. Some quick example of payment description,
            Some quick example of payment
        </p>
        <input id="Plan1" type="radio" class="btn-check" autocomplete="off" checked name="payPlan"/>
        <label class="btn btn-secondary" for="" runat="server">Choose Plan</label>
    </div>
    
    <div id="EstPay" class="card-footer" runat="server">estimated</div>
</div>
