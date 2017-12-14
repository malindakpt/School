<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Entity" %>
<%@ page import="entity.ClassRoom" %>


<div class="w3-container">

    <h3>Add Students to class</h3>
    <% List<Entity> classRooms = EntityManager.getEntities(ClassRoom.class); %>
    <select class="w3-select" id="global-classRoom" style="width: 40%; float: left;">
        <option value="" disabled selected>Select Old Class</option>
        <%
            for (Entity e1 : classRooms) {
                ClassRoom classRoom = (ClassRoom) e1;
        %>
        <option value="<%=classRoom.getClassRoomId()%>"><%=classRoom.getClassRoomName()%></option>
        <%
            }
        %>
    </select>
    <select class="w3-select" id="global-classRoom" style="width: 40%; float: left;">
        <option value="" disabled selected>Select New Class</option>
        <%
            for (Entity e1 : classRooms) {
                ClassRoom classRoom = (ClassRoom) e1;
        %>
        <option value="<%=classRoom.getClassRoomId()%>"><%=classRoom.getClassRoomName()%></option>
        <%
            }
        %>
    </select>
    <br><br>
    <div class="w3-responsive" id="classStudents">
        <table class="w3-table-all">
            <tr>
                <th>Student Name</th>
                <th>Should change the Class</th>
            </tr>


            <%
//                List<Entity> classRooms = EntityManager.getEntities(ClassRoom.class);
                List<Entity> students = EntityManager.getEntities(Student.class);
                for (Entity item : students) {
                    Student student = (Student) item;
            %>
            <tr>
                <td>
                    <%=
                    student.getFirstName() + " " +student.getLastName()
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

        <button onclick="classStudents()" type="button" class="w3-button w3-theme button-ok"><i class="fa fa-pencil"></i>
             Save
        </button>
    </div>
</div>



