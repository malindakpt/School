<%@ page import="entity.allocation.Location" %>
<%@ page import="entity.User" %>
<%@ page import="util.Helper" %>
<%@ page import="entity.Entity" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="java.util.List" %>

<div class="w3-container">
    <div>
        <jsp:include page="../components/header.jsp?header=Location/Places Management"/>
        <button onclick="showAddLocation()" class="w3-btn btn-right w3-green">Add Location</button>
    </div>

    <div id="addInventory" class="w3-container w3-hide">
        <jsp:include page="../widgets/addLocation.jsp"/>
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
                List<Entity> locations = EntityManager.getEntities(Location.class, user.getSchool());
                for(Entity item : locations){
                    Location location = (Location)item;
            %>
            <tr>
                <td>
                    <%=
                    location.getLocationId()
                    %>
                </td>
                <td>
                    <%=
                    location.getName()
                    %>
                </td>
                <td>
                    <%=
                    location.getDescription()
                    %>
                </td>
                <td>
                    <%=
                    location.getOwner().displayName()
                    %>
                </td>
                <td>
                    <button id="<%=location.getLocationId()%>" class="w3-button w3-amber" onclick="allocateLocation(this)">Allocate</button>
                </td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
</div>




<script>
    function allocateLocation(e){
        getAndSetPage('PageChangeAllocation?t56='+t56+'&locationId='+e.id);
    }
    function showAddLocation() {
        var x = document.getElementById("addInventory");
        if (x.className.indexOf("w3-show") == -1) {
            x.className += " w3-show";
        } else {
            x.className = x.className.replace(" w3-show", "");
        }
    }
</script>