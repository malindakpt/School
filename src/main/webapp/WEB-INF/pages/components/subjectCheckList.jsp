<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Subject" %>
<%@ page import="entity.Entity" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.User" %>
<%@ page import="util.Helper" %>
<%
    User user = new Helper().getUser(request);
    List<Entity> entityList = EntityManager.getEntities(Subject.class, user.getSchool());
%>
<%
    for (Entity subjectEntity : entityList) {
        Subject subject = (Subject) subjectEntity;
%>
<div style="width: 30%; float: left;">
    <input id="<%=subject.getSubjectId()%>" type="checkbox" class="w3-check"/>
    <input id="cnt<%=subject.getSubjectId()%>" type="number" class="w3-input"/>
    <label><%= subject.getCode() + " " + subject.getName()%>
    </label>
</div>
<%
    }
%>
