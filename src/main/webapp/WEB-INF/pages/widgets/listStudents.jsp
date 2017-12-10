<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Entity" %>
<h1>
    STUDENTS
</h1>

<div class="w3-container">

    <h2>Responsive Table</h2>
    <div class="w3-responsive">
        <table class="w3-table-all">
            <tr>
                <th>Points</th>
                <th>Points</th>

            </tr>


                <% List<Entity> students = EntityManager.getEntities(Student.class);
                    for(Entity item : students){
                        Student student = (Student)item;
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
            </tr>
                <%
                    }
                %>


        </table>
    </div>
</div>



