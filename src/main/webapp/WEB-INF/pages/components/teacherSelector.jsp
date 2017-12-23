<%@ page import="entity.Entity" %>
<%@ page import="entity.Teacher" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.User" %>
<%@ page import="util.Helper" %>

<%
    User user = new Helper().getUser(request);
%>

<select class="w3-select" name="option" id="teacherSelector">
    <option value="-1">Select a Class Teacher</option>
    <%
        List<Entity> teachers = EntityManager.getEntities(Teacher.class,user.getSchool());
        for(Entity entity : teachers){
            Teacher teacher = (Teacher)entity;
    %>
    <option value="<%=teacher.getTeacherId()%>" ><%=teacher.getFirstName()+" "+teacher.getLastName()%></option>

    <%}%>
</select>