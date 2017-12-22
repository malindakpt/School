<%
    String sessionId = request.getParameter("t56");
%>


<div id="studentSelector">
<jsp:include page="../components/classRoomSelector.jsp?<%=sessionId%>"/>
</div>
<jsp:include page="../components/courseSelector.jsp?<%=sessionId%>"/>
<br>
<jsp:include page="../components/teacherSelector.jsp?<%=sessionId%>"/>
<br>
<div>
    <button onclick="onRegisterClick()" type="button" class="w3-button w3-green btn-right">Change Class Room</button>
</div>


<script>
    function onRegisterClick() {
        $.post('RegisterStudents', {
                courseId: $('#courseSelector').val(),
                classId: $('#classSelector').val()
            },
            function (result) {
                if (result === "") {
                    alert("Success " + result);
                } else {
                    console.log("Error response");
                }

            }).fail(function () {
                alert("error");
            }
        );
    }

    function onCourseChange () {
        
    }
    function onClassRoomChange() {
        
    }
</script>