<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Entity" %>
<%@ page import="entity.ClassRoom" %>

<div id="addStudContainer">
<div class="w3-container">

    <h3>Add Students to class</h3>
    <button class="w3-button w3-red btn-right" onclick="loadAllStud()">Show All Students</button>

    <br><br>
    <div class="w3-responsive" id="classStudents">
        <table class="w3-table-all">
            <tr>
                <th>Student Name</th>
                <th>Should change the Class</th>
            </tr>
            <%
                boolean showAll = Boolean.parseBoolean(request.getParameter("showAll"));
                List<Entity> students = EntityManager.getEntities(Student.class);
                for (Entity item : students) {
                    Student student = (Student) item;

                    if(student.getClassRoom()!=null && !showAll)
                        continue;

            %>
            <tr>
                <td>
                    <%=
                    student.getFirstName() + " " + student.getLastName()
                    %>
                </td>
                <td>
                    <input checked="checked" class="w3-check" type="checkbox" id="<%=student.getStudentId()%>"/>
                </td>
            </tr>
            <%
                }
            %>
        </table>

    </div>

    <br>
    <jsp:include page="../components/classRoomSelector.jsp"/>
    <br>
    <button onclick="classStudentsSave()" type="button" class="w3-button w3-theme button-ok">
         Save
    </button>
</div>
</div>
</div>

<script>

    function onClassRoomChange () {

    }

    function loadAllStud() {
        getAndSetPage("PageAddClassStudents?showAll=true","addStudContainer");
    }

    function classStudentsSave() {
        var classRoom = $('#classSelector').val();
        var studArr = [];
        $("#classStudents input").each(function () {
            studArr.push(this.id);
        });
        $.post('AddClassStudent', {
                classRoom: classRoom,
                studArr: studArr
            },
            function (result) {
                alert("Success " + result);

            }).fail(function () {
                alert("error");
            }
        );
    }
</script>



