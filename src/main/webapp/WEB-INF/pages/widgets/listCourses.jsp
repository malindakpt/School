
<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Entity" %>
<%@ page import="entity.Course" %>

<div class="w3-container">
    <div class="w3-responsive">
        <table class="w3-table-all">
            <tr>
                <th>Couse Name</th>
                <th>Action</th>

            </tr>


            <% List<Entity> courses = EntityManager.getEntities(Course.class);
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
                    <button class="w3-button" onclick="getAndSetPage('PageEditCourse?courseId=<%=course.getCourseId()%>')">Edit Course</button>
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


