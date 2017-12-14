<%@ page import="entity.Subject" %>
<%@ page import="entity.Entity" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="java.util.List" %>

<%
    List<Entity> entityList = EntityManager.getEntities(Subject.class);
%>
<select class="w3-select" name="option" id="assSubject">
    <option value="" disabled selected>Select a Subject</option>
    <%
        for (Entity e1 : entityList) {
            Subject subject = (Subject) e1;
    %>
    <option value="<%=subject.getSubjectId()%>"><%=subject.getCode() + " " + subject.getName()%>
    </option>
    <%
        }
    %>
</select>