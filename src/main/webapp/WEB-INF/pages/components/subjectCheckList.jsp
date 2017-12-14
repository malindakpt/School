<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Subject" %>
<%@ page import="entity.Entity" %>
<%@ page import="java.util.List" %><%
    List<Entity> entityList = EntityManager.getEntities(Subject.class);
%>

    <%
        for (Entity subjectEntity : entityList) {
            Subject subject = (Subject) subjectEntity;
    %>
    <input id="<%=subject.getSubjectId()%>" <%=subject.getCode() + " " + subject.getName()%>
    </input>
    <label><%= subject.getCode()+" "+subject.getName()%> </label>
    <%
        }
    %>
