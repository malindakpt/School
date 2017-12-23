<%@ page import="entity.Entity" %>
<%@ page import="entity.Student" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.User" %>
<%@ page import="util.Helper" %>

<%
    User user = new Helper().getUser(request);

%>

<table class="w3-table-all">
    <tr>
        <th>Student Name</th>
        <th>Checked</th>
    </tr>

<% List<Entity> students = EntityManager.getEntitySubList(Student.class,"classRoom.classRoomId",request.getParameter("classId"), user.getSchool());
    for (Entity item : students) {
        Student student = (Student) item;
%>
<tr>
    <td>
        <%= student.getFirstName() + " " + student.getLastName()%>
    </td>
    <td>
        <input  class="w3-input" type="number" id="<%=student.getStudentId()%>">
    </td>
</tr>
<%
    }
%>
</table>


