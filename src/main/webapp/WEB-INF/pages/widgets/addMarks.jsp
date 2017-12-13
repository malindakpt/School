<%@ page import="entity.Subject" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Entity" %>
<%@ page import="entity.Teacher" %>
<%@ page import="entity.ClassRoom" %>
<div>
    <div class="w3-container widget-header">
        <h3>Assesment Marks</h3>
    </div>
    <form class="w3-container">
        <label>Date</label>
        <input class="w3-input" type="date" id="date">
        <br>
        <%
            List<Entity> subjectList = EntityManager.getEntities(Subject.class);
        %>
        <select class="w3-select" name="option" id="addMarks">
            <option value="" disabled selected>Select a Subject</option>
            <%
                for (Entity e1 : subjectList) {
                    Subject subject = (Subject) e1;
            %>
            <option value="<%=subject.getSubjectId()%>"><%=subject.getCode() + " " + subject.getName()%>
            </option>
            <%
                }
            %>
        </select>

        <br>
        <%
            List<Entity> teachertList = EntityManager.getEntities(Teacher.class);
        %>
        <select class="w3-select" name="option" id="addMarks">
            <option value="" disabled selected>Select a Teacher</option>
            <%
                for (Entity e2 : teachertList) {
                    Teacher teacher = (Teacher) e2;
            %>
            <option value="<%=teacher.getTeacherId()%>"><%=teacher.getFirstName() + " " + teacher.getLastName()%>
            </option>
            <%
                }
            %>
        </select>

        <br>
        <%
            List<Entity> classList = EntityManager.getEntities(ClassRoom.class);
        %>
        <select class="w3-select" name="option" id="classSelector" onchange="loadStudentsOfClass()">
            <option value="" disabled selected>Select a Class</option>
            <%
                for (Entity e3 : classList) {
                    ClassRoom classRoom = (ClassRoom) e3;
            %>
            <option value="<%=classRoom.getClassRoomId()%>"><%=classRoom.getClassRoomName()%>
            </option>
            <%
                }
            %>
        </select>

        <div id="classStudents">

        </div>
        <button onclick="saveStudent()" type="button" class="w3-button w3-theme button-ok"><i class="fa fa-pencil"></i>
             Save
        </button>
    </form>
</div>


<script>
    function loadStudentsOfClass() {
        w3_close();
        busyOn();
        $.post('PageListStudentsMarks?classRoomId='+$('#classSelector').val(), {},
            function (result) {
                $('#classStudents').html(result);
                busyOff();
            }).fail(function (result) {
                $('#classStudents').html(result);
                busyOff();
            }
        );
    }
</script>

