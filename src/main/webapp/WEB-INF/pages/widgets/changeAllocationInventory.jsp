<%@ page import="java.util.HashMap" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.allocation.Location" %>
<%@ page import="util.Helper" %>
<%@ page import="entity.allocation.InventoryItem" %>
<%

    String inventoryId = request.getParameter("inventoryId");
    Helper helper = new Helper();
    HashMap<String, String> map = null;
    InventoryItem inventoryItem = (InventoryItem) EntityManager.getEntity(InventoryItem.class, "inventoryId", inventoryId);
    String placeName = inventoryItem.getName();
    String allocString = inventoryItem.getAllocationMap();
    if( allocString != null){
        map = helper.getAllocationMap(allocString);
    }else{
        map = new HashMap<String, String>();
    }

%>

<jsp:include page="../components/header.jsp?header=Weekly allocation for Inventory"/>

<table class="w3-table-all">
    <tr  class="w3-indigo">
        <th>Monday</th>
        <th>Tuesday</th>
        <th>Wednesday</th>
        <th>Thursday</th>
        <th>Friday</th>
    </tr>
    <%
        for( int s=0 ;s<8;s++){
    %>
    <tr>
        <%
            for( int d=0 ;d<5;d++){
                String val = map.get(d+"%"+s);

                if(val != null){
        %>
        <td>
            <span onclick="showAllocationPopup('<%=d%>%<%=s%>')">
                <span class="w3-tooltip">Assigned..<span class="w3-text"><%=val.split("%")[1]%></span></span>
                <%--<div><i class="fa fa-edit" ></i></div>--%>
            </span>

        </td>
        <%
                }else{
        %>
        <td><button class="w3-button w3-green" onclick="showAllocationPopup('<%=d%>%<%=s%>')">Allocate</button></td>
        <%
                }
            }
        %>
    </tr>
    <%
        }
    %>

</table>

<div id="locAllocWindow" class="w3-modal">
    <div class="w3-modal-content"  style="width:500px;top: 200px;">
        <header class="w3-container w3-blue">
        <span onclick="document.getElementById('locAllocWindow').style.display='none'"
              class="w3-button w3-display-topright">&times;</span>
            <h3>Specify a Teacher and Description</h3>
        </header>
        <div class="w3-container">
            <p><jsp:include page="../components/teacherSelector.jsp"/></p>
            <p><input class="w3-input" id = "desc" type="text" placeholder="Dscription" name="name" class="field" /></p>
        </div>
        <footer class="w3-container w3-light-grey w3-padding">
            <p><button class="w3-button w3-right w3-white w3-border" onclick="saveAllocation()">Save</button></p>
        </footer>
    </div>
</div>

<script>


    var inventoryId = <%=inventoryId%>;
    var dayPeriod = '';

    function showAllocationPopup(dayPer){
        dayPeriod = dayPer;
        $('#locAllocWindow').show();
    }

    function saveAllocation() {
        $.post('SaveAllocationInventory', {
                dayPeriod: dayPeriod,
                inventoryId: inventoryId,
                desc: $('#desc').val(),
                teacherId: $('#teacherSelector').val(),
                t56: t56
            },
            function (result) {
                var resArr = result.split("##");
                if (resArr[0] === "") {
                    alert("Success");
                    getAndSetPage('PageChangeAllocationInventory?t56='+t56+'&inventoryId='+inventoryId);
                } else {
                    alert(resArr[1]);
                }

            }).fail(function () {
                alert("Error");
            }
        );
    }
</script>