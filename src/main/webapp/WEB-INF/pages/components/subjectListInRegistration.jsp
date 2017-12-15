<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Subject" %>
<%@ page import="entity.Entity" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.YearRegistration" %>

<%
    String id = request.getParameter("id");
    YearRegistration yearRegistration = (YearRegistration) EntityManager.getEntity(YearRegistration.class, "yearRegistrationId", id);

%>
<select class="w3-select" name="option" id="subjectSelector" onchange="onSubjectChange()">
    <option value="" disabled selected>Select a Subject</option>
    <%
        for (Entity subjectEntity : yearRegistration.getCourse().getSubjects()) {
            Subject subject = (Subject) subjectEntity;
    %>
    <option value="<%=subject.getSubjectId()%>"><%=subject.getCode() + " " + subject.getName()%>
    </option>
    <%
        }
    %>
</select>