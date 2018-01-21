<div>
    <%--<div class="w3-container widget-header">--%>
        <%--<h4>Add a new Location</h4>--%>
    <%--</div>--%>
    <div class="w3-container">
        <br>
        <label>Inventory Item Name</label>
        <input class="w3-input" type="text" id="name">
        <br>
        <label>Description</label>
        <input class="w3-input" type="text" id="description">
        <br><br>
        <label><b>Select Category</b></label>
        <select class="w3-select" id="categorySelector">
            <option value="-1" selected disabled>- Select -</option>
            <option value="0" >Sport Item</option>
            <option value="1" >Chemistry Lab Item</option>
            <option value="2" >Other</option>
        </select>
        <br><br>
        <label><b>Select Owner</b></label>
        <jsp:include page="../components/teacherSelector.jsp"/>
        <br><br>
        <label><b>Select Location</b></label>
        <jsp:include page="../components/locationSelector.jsp"/>



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

