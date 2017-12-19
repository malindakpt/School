<%@ page import="entity.Student" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Assesment" %>
<h3>Student Report Card</h3>
<%--<input type="text" id="studentId" placeholder="Student Id"/>--%>
<%--<input type="text" id="examId" placeholder="Exam Id"/>--%>

<%
    String studentId = request.getParameter("studentId");
%>

<input id="studentId" value="<%=studentId%>"/>
<jsp:include page="../components/examSelectorForStudent.jsp?studentId=<%=studentId%>"/>
<br>
<button class="w3-button" onclick="getAndSetPage('PageReportCard?studentId='+$('#studentId').val()+'&examId='+$('#examSelector').val(), 'reportContiner')"> Search </button>

<div id="reportContiner">

</div>

<script>
    function onExamChange () {

    }
</script>
