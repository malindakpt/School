<%@ page import="entity.ClassRoom" %>
<%@ page import="entity.Entity" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.User" %>
<%@ page import="util.Helper" %>
<%
    Helper helper = new Helper();
    User user = helper.getUser(request);
    int teacherId = user.getUserId();
    List<Entity> classRooms = EntityManager.getEntities(ClassRoom.class, user.getSchool());
%>
<select class="w3-select" name="option" id="classSelector" onchange="onClassRoomChange()">
    <option value="" disabled selected>Select a Class</option>
    <%
        for (Entity e1 : classRooms) {
            ClassRoom classRoom = (ClassRoom) e1;
            if(classRoom.getClassTeacher()!=null && classRoom.getClassTeacher().getTeacherId()== teacherId){
    %>
    <option value="<%=classRoom.getClassRoomId()%>"><%="Grade "+helper.getCurrentCourse(classRoom).getName()+"-"+classRoom.getClassRoomName()+"  "+classRoom.getBatch()%></option>
    <%
            } }
    %>
</select>