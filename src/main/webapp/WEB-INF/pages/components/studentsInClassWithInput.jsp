<%@ page import="entity.Entity" %>
<%@ page import="entity.Student" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.User" %>
<%@ page import="util.Helper" %>

<%
    User user = new Helper().getUser(request);

%>
<br>
<table class="w3-table-all">
    <tr>
        <th>Student Name</th>
        <th>Total Marks</th>
        <th>Question 1</th>
        <th>Question 2</th>
        <th>Question 3</th>
        <th>Question 4</th>
        <th>Question 5</th>
        <th>Question 6</th>
        <th>Question 7</th>
        <th>Question 8</th>
        <th>Question 9</th>
        <th>Question 10</th>


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
        <input  class="w3-input" type="number" rel="mainMarks" id="<%=student.getStudentId()%>">
    </td>
    <td>
        <input  class="w3-input" type="number" id="q1-<%=student.getStudentId()%>">
    </td>
    <td>
        <input  class="w3-input" type="number" id="q2-<%=student.getStudentId()%>">
    </td>
    <td>
        <input  class="w3-input" type="number" id="q3-<%=student.getStudentId()%>">
    </td>
    <td>
        <input  class="w3-input" type="number" id="q4-<%=student.getStudentId()%>">
    </td>
    <td>
        <input  class="w3-input" type="number" id="q5-<%=student.getStudentId()%>">
    </td>
    <td>
        <input  class="w3-input" type="number" id="q6-<%=student.getStudentId()%>">
    </td>
    <td>
        <input  class="w3-input" type="number" id="q7-<%=student.getStudentId()%>">
    </td>
    <td>
        <input  class="w3-input" type="number" id="q8-<%=student.getStudentId()%>">
    </td>
    <td>
        <input  class="w3-input" type="number" id="q9-<%=student.getStudentId()%>">
    </td>
    <td>
        <input  class="w3-input" type="number" id="q10-<%=student.getStudentId()%>">
    </td>
</tr>
<%
    }
%>
</table>


