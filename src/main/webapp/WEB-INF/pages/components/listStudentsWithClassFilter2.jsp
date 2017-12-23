
<%
    String t56 = request.getParameter("t56");
%>
<jsp:include page="classRoomSelector.jsp?t56<%=t56%>"/>
<br><br>
<div id="filterStud"></div>

<script>
    function onClassRoomChange() {
            w3_close();
            busyOn();
            $.post('CompStudentsInClass2?t56='+t56+'&id=' + $('#classSelector').val(), {},
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