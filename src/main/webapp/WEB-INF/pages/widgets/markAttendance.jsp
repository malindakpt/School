
<%
    String t56 = request.getParameter("t56");
%>
<jsp:include page="../components/classRoomSelector4Teacher.jsp?t56<%=t56%>"/>
<br><br>
<div id="filterStud"></div>

<script>
    function onClassRoomChange() {
        w3_close();
        busyOn();
        $.post('CompStudentsInClass?t56='+t56+'&id=' + $('#classSelector').val(), {},
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