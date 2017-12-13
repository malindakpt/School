<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Entity" %>
<%@ page import="entity.ClassRoom" %>


<div class="w3-container">

    <h3>Add Students to class</h3>
    <div class="w3-responsive" id="classStudents">
        <table class="w3-table-all">
            <tr>
                <th>Points</th>
                <th>Points</th>
                <th>Points</th>

            </tr>


            <%
                List<Entity> classRooms = EntityManager.getEntities(ClassRoom.class);
                List<Entity> students = EntityManager.getEntities(Student.class);
                for (Entity item : students) {
                    Student student = (Student) item;
            %>
            <tr>
                <td>
                    <%=
                    student.getFirstName()
                    %>
                </td>
                <td>
                    <%=
                    student.getLastName()
                    %>
                </td>
                <td>
                    <select class="w3-select" name="option" id="<%=student.getStudentId()%>">
                        <%
                            for (Entity e1 : classRooms) {
                                ClassRoom classRoom = (ClassRoom) e1;
                        %>
                        <option value="<%=classRoom.getClassRoomId()%>"><%=classRoom.getClassRoomName()%></option>
                        <%
                            }
                        %>
                    </select>
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



