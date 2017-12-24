
<%
    String t56 = request.getParameter("t56");
%>
<jsp:include page="../components/classRoomSelector4Teacher.jsp?t56<%=t56%>"/>
<br><br>
<input id=markDate type="date"/>
<div id="filterStud"></div>


<button class="w3-button" onclick="saveAttendance()">Save Attendance</button>

<script>
    
    function saveAttendance() {
        var studArr = [];
        $("#filterStud input[type=checkbox]").each(function () {
            if(!this.checked){
                studArr.push(this.id);
                console.log(this.id);
            }
        })

        $.post("MarkAttendance?t56="+t56,
            {
                studArr: studArr,
                date: $('#markDate').val()
            },
            function (result) {
                alert("Done");
                busyOff();

            }).fail(function () {
                alert("error");
                busyOff();
            }
        );
    }
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