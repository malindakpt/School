<%@ page import="entity.allocation.Location" %>
<%@ page import="entity.User" %>
<%@ page import="util.Helper" %>
<%@ page import="entity.Entity" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.allocation.InventoryItem" %>

<div class="w3-container">
    <div>
        <jsp:include page="../components/header.jsp?header=Inventory Management"/>
        <%--<button onclick="showAddLocation()" class="w3-btn btn-right w3-green">Add Inventory Item</button>--%>
        <button onclick="showInventoryItem()" class="w3-btn btn-right w3-circle w3-green"><b>+</b></button>
    </div>

    <div id="addInventory" class="w3-container w3-hide">
        <jsp:include page="../widgets/addInventoryItem.jsp"/>
    </div>

</div>

<div class="w3-container">

    <div class="w3-responsive">
        <table class="w3-table-all">
            <thead>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Owner</th>
                <th>    </th>
            </thead>
            <%
                User user = new Helper().getUser(request);
                List<Entity> items = EntityManager.getEntities(InventoryItem.class, user.getSchool());
                for(Entity item : items){
                    InventoryItem inventoryItem = (InventoryItem)item;
            %>
            <tr>
                <td>
                    <%=
                    inventoryItem.getInventoryId()
                    %>
                </td>
                <td>
                    <%=
                    inventoryItem.getName()
                    %>
                </td>
                <td>
                    <%=
                    inventoryItem.getDescription()
                    %>
                </td>
                <td>
                    <%=
                    inventoryItem.getOwner().displayName()
                    %>
                </td>
                <td>
                    <button id="<%=inventoryItem.getInventoryId()%>" class="w3-button w3-amber" onclick="allocateInventoryItem(this)">Allocate</button>
                </td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
</div>

<script>
    function allocateInventoryItem(e){
        getAndSetPage('PageChangeAllocationInventory?t56='+t56+'&inventoryId='+e.id);
    }
    function showInventoryItem() {
        var x = document.getElementById("addInventory");
        if (x.className.indexOf("w3-show") == -1) {
            x.className += " w3-show";
        } else {
            x.className = x.className.replace(" w3-show", "");
        }
    }
</script>