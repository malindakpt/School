<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Entity" %>

<div class="w3-container">
    <div class="w3-responsive">
        <table class="w3-table-all">
            <tr>
                <th>Student Name</th>
                <th>Marks</th>

            </tr>


            <% List<Entity> students = EntityManager.getEntities(Student.class);
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


