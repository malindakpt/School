<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Entity" %>
<%@ page import="entity.Student" %>
<%@ page import="java.util.List" %>

<jsp:include page="classRoomSelector.jsp"/>
<br><br>
<div id="filterStud"></div>

<script>
    function onClassRoomChange() {
            w3_close();
            busyOn();
            $.post('CompStudentsInClass?id=' + $('#classSelector').val(), {},
                function (result) {
                    $('#filterStud').html(result);
                    busyOff();

                }).fail(function () {
                    alert("error");
                    busyOff();
                }
            );
    }
</script>