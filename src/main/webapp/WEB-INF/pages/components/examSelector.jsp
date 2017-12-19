<%@ page import="entity.Entity" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Exam" %>
<%@ page import="java.util.List" %><%
    List<Entity> entityList = EntityManager.getEntities(Exam.class);
%>
<select class="w3-select" name="option" id="examSelector" onchange="onExamChange()">
    <option value="" disabled selected>Select an Examination</option>
    <%
        for (Entity exa : entityList) {
            Exam exam = (Exam) exa;
    %>
    <option value="<%=exam.getExamId()%>"><%=exam.getYear() + " " + exam.getName()+" "+exam.getCourse().getName()%>
    </option>
    <%
        }
    %>
</select>
