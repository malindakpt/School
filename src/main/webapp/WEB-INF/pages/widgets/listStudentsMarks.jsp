<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Entity" %>

<div class="w3-container">

    <h3>Enter Marks of the students</h3>
    <div class="w3-responsive">
        <table class="w3-table-all">
            <tr>
                <th>Student Name</th>
                <th>Marks</th>

            </tr>


            <%
             String classId = request.getParameter("classRoomId");
                List<Entity> students = EntityManager.getEntitySubList(Student.class, "classRoom.classRoomId" ,classId);
                for (Entity item : students) {
                    Student student = (Student) item;
            %>
            <tr>
                <td>
                    <%=
                    student.getFirstName() + " " + student.getLastName()
                    %>
                </td>
                <td>
                    <input class="w3-input" type="number" id="<%=student.getStudentId()%>">
                </td>
            </tr>
            <%
                }
            %>


        </table>
    </div>
</div>




