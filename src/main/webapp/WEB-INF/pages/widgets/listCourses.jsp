
<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Entity" %>
<%@ page import="entity.Course" %>
<%@ page import="entity.User" %>
<%@ page import="util.Helper" %>


<%
    User user =  new Helper().getUser(request);

%>
<div class="w3-container">
    <div class="w3-responsive">
        <table class="w3-table-all">
            <tr>
                <th>Couse Name</th>
                <th>Action</th>

            </tr>


            <% List<Entity> courses = EntityManager.getEntities(Course.class, user.getSchool());
                for (Entity item : courses) {
                    Course course = (Course) item;
            %>
            <tr>
                <td>
                    <%=
                    course.getName()
                    %>
                </td>
                <td>
                    <button class="w3-button" onclick="getAndSetPage('PageEditCourse?t56=<%=request.getParameter("t56")%>&courseId=<%=course.getCourseId()%>')">Edit Course</button>
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


