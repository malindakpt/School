<div class="w3-container">

    <h2>Accordions</h2>
    <p>An accordion is used to show (and hide) HTML content:</p>

    <button onclick="showAddInventory()" class="w3-btn w3-block w3-black w3-left-align">Add Inventory Item</button>
    <div id="addInventory" class="w3-container w3-hide">
        <jsp:include page="../widgets/addInventoryItem.jsp"/>
    </div>

</div>
<script>
    function showAddInventory() {
        var x = document.getElementById("addInventory");
        if (x.className.indexOf("w3-show") == -1) {
            x.className += " w3-show";
        } else {
            x.className = x.className.replace(" w3-show", "");
        }
    }
</script>