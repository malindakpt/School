<%@ page import="entity.Entity" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Course" %>
<%@ page import="entity.User" %>
<%@ page import="util.Helper" %>
<%
    User user = new Helper().getUser(request);
    List<Entity> courseList = EntityManager.getEntities(Course.class,user.getSchool());
%>
<select class="w3-select" name="option" id="courseSelector" onchange="onCourseChange()">
    <option value="" disabled selected>Select a Course</option>
    <%
        for (Entity c1 : courseList) {
            Course course = (Course) c1;
    %>
    <option value="<%=course.getCourseId()%>"><%=course.getName()%>
    </option>
    <%
        }
    %>
</select>
