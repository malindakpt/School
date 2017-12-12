<%@ page import="entity.Teacher" %>
<%@ page import="java.util.Set" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Entity" %>
<div>
    <div class="w3-container widget-header">
        <h4>Add nSubject</h4>
    </div>
    <form class="w3-container">
        <br>
        <label>Batch</label>
        <input class="w3-input" type="text" id="batch">
        <label>Grade</label>
        <input class="w3-input" type="text" id="grade">
        <label>Class Name</label>
        <input class="w3-input" type="text" id="classRoomName">
        <%--<label>Class Teacher</label>--%>
        <%--<input class="w3-input" type="text" id="teacher">--%>

        <br>
        <select class="w3-select" name="option" id="classTeacher">
            <option value="-1">Select a Class Teacher</option>
        <%
            List<Entity> teachers = EntityManager.getEntities(Teacher.class);
        for(Entity entity : teachers){
            Teacher teacher = (Teacher)entity;
        %>
            <option value="<%=teacher.getTeacherId()%>" ><%=teacher.getFirstName()+" "+teacher.getLastName()%></option>

         <%}%>
        </select>
        <button onclick="save()" type="button" class="w3-button w3-theme button-ok"><i class="fa fa-pencil"></i>
             Add
        </button>
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

