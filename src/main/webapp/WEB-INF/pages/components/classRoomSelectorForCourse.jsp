<%@ page import="entity.ClassRoom" %>
<%@ page import="entity.Entity" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Course" %>
<%@ page import="entity.examination.Exam" %>
<%@ page import="util.Helper" %>
<%

    Helper helper = new Helper();
    String examId = request.getParameter("examId");
    Exam exam = (Exam) EntityManager.getEntity(Exam.class,"examId",examId);
    Course course = exam.getCourse();
%>
<select class="w3-select" name="option" id="classSelector" onchange="onClassRoomChange()">
    <option value="" disabled selected>Select a Class</option>
    <%
        for (ClassRoom classRoom : course.getClassRooms()) {
    %>
    <option value="<%=classRoom.getClassRoomId()%>"><%="Grade "+helper.getCurrentCourse(classRoom).getName()+"-"+classRoom.getClassRoomName()+"-"+classRoom.getBatch()%></option>
    <%
        }
    %>
</select>