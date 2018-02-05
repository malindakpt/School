<%@ page import="entity.Entity" %>
<%@ page import="entity.Student" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.User" %>
<%@ page import="util.Helper" %>
<%@ page import="entity.examination.Assesment" %>

<%
    User user = new Helper().getUser(request);

%>
<br>
<div style="overflow-x:auto; clear: both;">

<table class="w3-table w3-striped">
    <tr>
        <th style=" min-width: 150px;">Student Name</th>
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

<%
    int subjectId = -1;
    int examId = -1;
    try {
        subjectId = Integer.parseInt(request.getParameter("subjectId"));
        examId = Integer.parseInt(request.getParameter("examId"));
    }catch (Exception e){

    }

    List<Entity> students = EntityManager.getEntitySubList(Student.class,"classRoom.classRoomId",request.getParameter("classId"), user.getSchool());
    for (Entity item : students) {
        Student student = (Student) item;

        Assesment assesment = new Assesment();

        for (Assesment ass :student.getAssesments()) {
            if (ass.getSubject().getSubjectId() == subjectId && ass.getExam().getExamId() == examId ){
                assesment = ass;
            }
        }
%>
<tr>
    <td>
        <%= student.getFirstName() + " " + student.getLastName()%>
    </td>
    <td>
        <input value="<%=assesment.getMarks() == 0 ? "" : assesment.getMarks()%>"  class="w3-input" type="number" rel="mainMarks" id="<%=student.getStudentId()%>">
    </td>
    <td>
        <input value="<%=assesment.getMark1() == 0 ? "" : assesment.getMark1()%>"  class="w3-input" type="number" id="q1-<%=student.getStudentId()%>">
    </td>
    <td>
        <input value="<%=assesment.getMark2() == 0 ? "" : assesment.getMark2()%>"  class="w3-input" type="number" id="q2-<%=student.getStudentId()%>">
    </td>
    <td>
        <input value="<%=assesment.getMark3() == 0 ? "" : assesment.getMark3()%>"  class="w3-input" type="number" id="q3-<%=student.getStudentId()%>">
    </td>
    <td>
        <input value="<%=assesment.getMark4() == 0 ? "" : assesment.getMark4()%>"  class="w3-input" type="number" id="q4-<%=student.getStudentId()%>">
    </td>
    <td>
        <input value="<%=assesment.getMark5() == 0 ? "" : assesment.getMark5()%>"  class="w3-input" type="number" id="q5-<%=student.getStudentId()%>">
    </td>
    <td>
        <input value="<%=assesment.getMark6() == 0 ? "" : assesment.getMark6()%>"  class="w3-input" type="number" id="q6-<%=student.getStudentId()%>">
    </td>
    <td>
        <input value="<%=assesment.getMark7() == 0 ? "" : assesment.getMark7()%>"  class="w3-input" type="number" id="q7-<%=student.getStudentId()%>">
    </td>
    <td>
        <input value="<%=assesment.getMark8() == 0 ? "" : assesment.getMark8()%>" class="w3-input" type="number" id="q8-<%=student.getStudentId()%>">
    </td>
    <td>
        <input value="<%=assesment.getMark9() == 0 ? "" : assesment.getMark9()%>"  class="w3-input" type="number" id="q9-<%=student.getStudentId()%>">
    </td>
    <td>
        <input value="<%=assesment.getMark10() == 0 ? "" : assesment.getMark10()%>"  class="w3-input" type="number" id="q10-<%=student.getStudentId()%>">
    </td>
</tr>
<%
    }
%>
</table>
</div>


