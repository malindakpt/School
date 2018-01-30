<%@ page import="entity.Entity" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.examination.Exam" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.User" %>
<%@ page import="util.Helper" %>
<%
    User user = new Helper().getUser(request);
    List<Entity> entityList = EntityManager.getEntities(Exam.class, user.getSchool());
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
