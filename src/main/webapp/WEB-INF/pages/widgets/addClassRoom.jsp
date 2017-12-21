<%@ page import="entity.Teacher" %>
<%@ page import="java.util.Set" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Entity" %>
<div>
    <div class="w3-container widget-header">
        <h4>Add Class Batch/Room</h4>
    </div>
    <form class="w3-container">
        <br>
        <label>Batch</label>
        <input class="w3-input" type="text" id="batch">
        <label>Grade</label>
        <input class="w3-input" type="text" id="grade">
        <label>Class Name/ (A,B...)</label>
        <input class="w3-input" type="text" id="classRoomName">

        <br>
        <jsp:include page="../components/teacherSelector.jsp"/>

        <button class="w3-button w3-red btn-right" onclick="save()">Add Batch</button>
    </form>
</div>


<script>
    function save() {
        $.post('AddClassRoom', {
                batch: $('#batch').val(),
                grade: $('#grade').val(),
                classRoomName: $('#classRoomName').val(),
                classTeacher: $('#classTeacher').val(),
            },
            function (result) {
                if (result === "") {
                    alert("Success");
                } else {
                    alert("Error");
                }

            }).fail(function () {
                alert("error");
            }
        );
    }
</script>

