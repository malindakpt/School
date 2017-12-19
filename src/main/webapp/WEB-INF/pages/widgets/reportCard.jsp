<%@ page import="entity.Student" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Assesment" %>
<h3>Student Report Card</h3>

<table class="w3-table-all">

<tr>
    <th>Subject</th>
    <th>Marks</th>
</tr>

<%
    String examId = "3";
    String studentId = "1";
    Student student = (Student) EntityManager.getEntity(Student.class,"studentId",studentId);

    for(Assesment assesment : student.getAssesments()){
        if(assesment.getExam().getExamId() == Integer.parseInt(examId)){
%>
       <tr>
           <td>
               <%=assesment.getSubject().getName()%>
           </td>
           <td>
               <%=assesment.getMarks()%>
           </td>
       </tr>
<%
        }
    }
%>


</table>