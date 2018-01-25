<div>
    <%--<div class="w3-container widget-header">--%>
        <%--<h4>Add a new Location</h4>--%>
    <%--</div>--%>
    <div class="w3-container">
        <br>
        <label>Student Id</label>
        <input class="w3-input" type="text" id="studId">
        <br>
        <label><b>Subscription</b></label>
        <select class="w3-select" id="yearSelector">
            <option value="-1" selected disabled>- Select Year -</option>
            <option value="0" >2017</option>
            <option value="1" >2018</option>
            <option value="2" >2019</option>
        </select>
        <select class="w3-select" id="termSelector">
            <option value="-1" selected disabled>- Select Term-</option>
            <option value="0" >1 Term</option>
            <option value="1" >2 Term</option>
            <option value="2" >3 Term</option>
            <option value="2" >Registration Fee</option>
        </select>
        <br><br>
        <br>
        <label><b>Select Category</b></label>
        <select class="w3-select" id="categorySelector">
            <option value="-1" selected disabled>- Select -</option>
            <option value="0" >Sport Item</option>
            <option value="1" >Chemistry Lab Item</option>
            <option value="2" >Other</option>
        </select>
        <br><br>
        <label>Amount</label>
        <input class="w3-input" type="number" id="amount">

        <br><br>
        <label><b>Payment Method</b></label>
        <select class="w3-select" id="paymentMethodSelector">
            <option value="-1" selected disabled>- Select -</option>
            <option value="0" >Cache</option>
            <option value="1" >Cheque</option>
            <option value="2" >Credit Card</option>
        </select>
        <br><br>

        <br>
        <label>Reference</label>
        <input class="w3-input" type="number" id="ref">
        <br>

        <br>
        <label>Description</label>
        <input class="w3-input" type="text" id="desc">
        <br>



        <button onclick="saveInventoryItem()" type="button" class="w3-button w3-green btn-right">Save</button>
    </div>
</div>


<script>
    function saveInventoryItem() {
        $.post('AddInventoryItem', {
                name: $('#name').val(),
                description: $('#description').val(),
                category: $('#categorySelector').val(),
                owner: $('#teacherSelector').val(),
                locationId: $('#locationSelector').val(),

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

