<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Entity" %>
<%@ page import="entity.Teacher" %>
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


            <% List<Entity> teachers = EntityManager.getEntities(Teacher.class);
                for(Entity item : teachers){
                    Teacher teacher = (Teacher)item;
            %>
            <tr>
                <td>
                    <%=
                    teacher.getFirstName()
                    %>
                </td>
                <td>
                    <%=
                    teacher.getLastName()
                    %>
                </td>
            </tr>
            <%
                }
            %>


        </table>
    </div>
</div>



