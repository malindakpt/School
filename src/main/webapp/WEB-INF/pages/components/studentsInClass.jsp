<%@ page import="entity.Entity" %>
<%@ page import="entity.Student" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="java.util.List" %>

<table class="w3-table-all">
    <tr>
        <th>Student Name</th>
        <th>Checked</th>
    </tr>

<% List<Entity> students = EntityManager.getEntitySubList(Student.class,"classRoom.classRoomId",request.getParameter("id"));
    for (Entity item : students) {
        Student student = (Student) item;
%>

<tr>
    <td>
        <%= student.getFirstName() + " " + student.getLastName()%>
    </td>
    <td>
        <input  class="w3-check" type="checkbox" checked id="<%=student.getStudentId()%>">
    </td>
</tr>


<%
    }
%>
</table>