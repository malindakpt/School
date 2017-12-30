<%@ page import="entity.ClassRoom" %>
<%@ page import="entity.Entity" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.User" %>
<%@ page import="util.Helper" %>
<%@ page import="entity.Course" %>
<%
    User user = new Helper().getUser(request);
    List<Entity> classRooms = EntityManager.getEntities(ClassRoom.class, user.getSchool());
%>
<select class="w3-select" name="option" id="classSelector" onchange="onClassRoomChange()">
    <option value="" disabled selected>Select a Class</option>
    <%
        for (Entity e1 : classRooms) {
            ClassRoom classRoom = (ClassRoom) e1;
            int courseId = classRoom.getCurrentCourseId();
            Course course = (Course) EntityManager.getEntity(Course.class,"courseId", courseId+"");
    %>
    <option value="<%=classRoom.getClassRoomId()%>"><%=(course!=null ? course.getName():"Grade/Course not set")+" - "+classRoom.getClassRoomName()+"  batch:"+classRoom.getBatch()%> </option>
    <%
        }
    %>
</select>