<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Entity" %>
<%@ page import="entity.Teacher" %>
<%@ page import="entity.User" %>
<%@ page import="util.Helper" %>
<h3>
   Teacher Directory
</h3>

<div class="w3-container">

    <div class="w3-responsive">
        <table class="w3-table-all">
            <%
                User user = new Helper().getUser(request);
                List<Entity> teachers = EntityManager.getEntities(Teacher.class, user.getSchool());
                for(Entity item : teachers){
                    Teacher teacher = (Teacher)item;
            %>
            <tr>
                <td>
                    <%=
                    teacher.getTeacherId()
                    %>
                </td>
                <td>
                    <%=
                    teacher.getFirstName()
                    %>
                </td>
                <td>
                   Available Today
                </td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
</div>



