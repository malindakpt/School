<%@ page import="entity.Entity" %>
<%@ page import="entity.Student" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.User" %>
<%@ page import="util.Helper" %>

<div>


    <%
        User user = new Helper().getUser(request);
    %>
    <table class="w3-table-all">
        <tr>
            <th>Student Name</th>
            <th>Checked</th>
        </tr>

        <% List<Entity> students = EntityManager.getEntitySubList(Student.class, "classRoom.classRoomId", request.getParameter("id"), user.getSchool());
            for (Entity item : students) {
                Student student = (Student) item;
        %>

        <tr>
            <td>
                <%= student.getFirstName() + " " + student.getLastName()%>
            </td>
            <td>
                <button class="w3-button" onclick="showStudent()" id="<%=student.getStudentId()%>">View</button>
            </td>
        </tr>


        <%
            }
        %>
    </table>


</div>

<script>
    function showStudent() {
        getAndSetPage("PageStudentDashBoard");
    }
</script>