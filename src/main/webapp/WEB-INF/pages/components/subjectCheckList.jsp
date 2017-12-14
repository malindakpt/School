<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Subject" %>
<%@ page import="entity.Entity" %>
<%@ page import="java.util.List" %>
<%
    List<Entity> entityList = EntityManager.getEntities(Subject.class);
%>
<%
    for (Entity subjectEntity : entityList) {
        Subject subject = (Subject) subjectEntity;
%>
<div style="width: 30%; float: left;">
    <input id="<%=subject.getSubjectId()%>" type="checkbox" class="w3-check"/>
    <label><%= subject.getCode() + " " + subject.getName()%>
    </label>
</div>
<%
    }
%>
