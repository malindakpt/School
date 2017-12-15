<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Subject" %>
<%@ page import="entity.Entity" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Course" %><%
    List<Entity> entityList = EntityManager.getEntities(Course.class);
%>
<select class="w3-select" name="option" id="assSubject">
    <option value="" disabled selected>Select a Course</option>
    <%
        for (Entity entity : entityList) {
            Course course = (Course) entity;
    %>
    <option value="<%=course.getCourseId()%>"><%= course.getName()+" : "+course.getCourseId() %>
    </option>
    <%
        }
    %>
</select>