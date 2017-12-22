<%@ page import="entity.ClassRoom" %>
<%@ page import="entity.Entity" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.User" %>
<%@ page import="util.Helper" %>
<%
    User user = new Helper().getUser(request);
    List<Entity> classRooms = EntityManager.getEntities(ClassRoom.class, user.getSchool());
%>
<select class="w3-select" name="option" id="classSelector" onchange="onClassRoomChange()">
    <option value="" disabled selected>Select a Class</option>
    <%
        for (Entity e1 : classRooms) {
            ClassRoom classRoom = (ClassRoom) e1;
    %>
    <option value="<%=classRoom.getClassRoomId()%>"><%="Grade "+classRoom.getGrade()+"-"+classRoom.getClassRoomName()+"  "+classRoom.getBatch()%></option>
    <%
        }
    %>
</select>