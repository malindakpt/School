<%@ page import="entity.Student" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Assesment" %>
<h3>Student Report Card</h3>
<%--<input type="text" id="studentId" placeholder="Student Id"/>--%>
<%--<input type="text" id="examId" placeholder="Exam Id"/>--%>

<%
    String studentId = request.getParameter("studentId");
    String examId = request.getParameter("examId");
%>


<table class="w3-table-all">

    <tr>
        <th>Subject</th>
        <th>Marks</th>
    </tr>

    <%
        if (examId != null && studentId != null) {
            Student student = (Student) EntityManager.getEntity(Student.class, "studentId", studentId);

            for (Assesment assesment : student.getAssesments()) {
                if (assesment.getExam().getExamId() == Integer.parseInt(examId)) {
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
        }
    %>


</table>


