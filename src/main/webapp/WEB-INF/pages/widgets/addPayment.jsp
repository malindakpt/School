<div>
    <%--<div class="w3-container widget-header">--%>
        <%--<h4>Add a new Location</h4>--%>
    <%--</div>--%>
    <div class="w3-container">
        <br>
        <label><b>Student Id</b></label>
        <input class="w3-input" type="text" id="studId">
        <br>
        <label><b>Subscription</b></label>
        <select class="w3-select" id="yearSelector">
            <option value="-1" selected disabled>- Select Year -</option>
            <option value="2017" >2017</option>
            <option value="2018" >2018</option>
            <option value="2019" >2019</option>
        </select>
        <select class="w3-select" id="termSelector">
            <option value="-1" selected disabled>- Select Term-</option>
            <option value="0" >Registration Fee</option>
            <option value="1" >1 Term</option>
            <option value="2" >2 Term</option>
            <option value="3" >3 Term</option>

        </select>
        <br><br>
        <label><b>Amount</b></label>
        <input class="w3-input" type="number" id="amount">

        <br>
        <label><b>Payment Method</b></label>
        <select class="w3-select" id="paymentMethodSelector">
            <option value="-1" selected disabled>- Select -</option>
            <option value="0" >Cache</option>
            <option value="1" >Cheque</option>
            <option value="2" >Credit Card</option>
        </select>
        <br><br>
        <label><b>Reference</b></label>
        <input class="w3-input" type="number" id="ref">
        <br>

        <label><b>Description</b></label>
        <input class="w3-input" type="text" id="desc">
        <br>



        <button onclick="savePayment()" type="button" class="w3-button w3-green btn-right">Save</button>
    </div>
</div>


<script>
    function savePayment() {
        $.post('AddPayment', {
                studId: $('#studId').val(),
                year: $('#yearSelector').val(),
                term: $('#termSelector').val(),
                cat: $('#categorySelector').val(),
                amount: $('#amount').val(),
                payMethod: $('#paymentMethodSelector').val(),
                ref: $('#ref').val(),
                desc: $('#desc').val(),
                t56: t56
            },
            function (result) {
                var resArr = result.split("##");
                if (resArr[0] === "") {
                    alert("Success");
                } else {
                    alert(resArr[1]);
                }

            }).fail(function () {
                alert("Error");
            }
        );
    }
</script>


<p class="wid-id">addInvenotryItem</p>

