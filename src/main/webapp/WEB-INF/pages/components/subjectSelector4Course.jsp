<%@ page import="entity.Entity" %>
<%@ page import="java.util.List" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.examination.Exam" %>
<%@ page import="entity.Course" %>
<%@ page import="entity.Subject" %>
<%@ page import="entity.SubjectAsign" %>
<%
    Exam exam = (Exam)EntityManager.getEntity(Exam.class,"examId",request.getParameter("examId"));
%>
<select class="w3-select" name="option" id="subjectSelector" onchange="onSubjectChange()">
    <option value="" disabled selected>Select a Subject</option>
    <%
        for (Entity s1 : exam.getCourse().getSubjectAsigns()) {
            Subject subject = ((SubjectAsign)s1).getSubject();
    %>
    <option value="<%=subject.getSubjectId()%>"><%=subject.getName()%>
    </option>
    <%
        }
    %>
</select>