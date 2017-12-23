<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Entity" %>
<%@ page import="entity.User" %>
<%@ page import="util.Helper" %>

<div class="w3-container">
    <div class="w3-responsive">
        <%
            User user = new Helper().getUser(request);
        %>
        <table class="w3-table-all">
            <tr>
                <th>Student Name</th>
                <th></th>
            </tr>
            <% List<Entity> students = EntityManager.getEntities(Student.class,user.getSchool());
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
                    <button class="w3-button" onclick="getAndSetPage('PageReportCardSelector?studentId=<%=student.getStudentId()%>')">Report Cards</button>
                </td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
</div>
<script>
    function showReportCards() {

    }
</script>



<p class="wid-id">listStudents</p>


