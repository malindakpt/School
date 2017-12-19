<%@ page import="entity.ClassRoom" %>
<%@ page import="entity.Entity" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Course" %>
<%
    String courseId = request.getParameter("courseId");
    List<Entity> courses = EntityManager.getEntities(Course.class);

%>
<select class="w3-select" name="option" id="classSelector" onchange="onClassRoomChange()">
    <option value="" disabled selected>Select a Class</option>
    <%
        for (Entity e1 : courses) {
            ClassRoom classRoom = (ClassRoom) e1;
    %>
    <option value="<%=classRoom.getClassRoomId()%>"><%=classRoom.getClassRoomName()%></option>
    <%
        }
    %>
</select>