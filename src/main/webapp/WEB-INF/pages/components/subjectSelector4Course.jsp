<%@ page import="entity.Entity" %>
<%@ page import="java.util.List" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Exam" %>
<%@ page import="entity.Course" %>
<%@ page import="entity.Subject" %>
<%
    Exam exam = (Exam)EntityManager.getEntity(Exam.class,"examId",request.getParameter("examId"));
%>
<select class="w3-select" name="option" id="subjectSelector" onchange="onSubjectChange()">
    <option value="" disabled selected>Select a Subject</option>
    <%
        for (Entity s1 : exam.getCourse().getSubjects()) {
            Subject subject = (Subject) s1;
    %>
    <option value="<%=subject.getSubjectId()%>"><%=subject.getName()%>
    </option>
    <%
        }
    %>
</select>