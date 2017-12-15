<%@ page import="entity.Entity" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.YearRegistration" %>
<% String id = request.getParameter("id");%>

<%
    Student student = (Student) EntityManager.getEntity(Student.class, "studentId", id);
%>
<select class="w3-select" name="option" id="registrationSelector" onchange="onYearRegistrationChange()">
    <option value="" disabled selected>Select a Year Registration</option>
    <%
        for (YearRegistration entity : student.getYearRegistrations()) {
    %>
    <option value="<%=entity.getYearRegistrationId()%>"><%=entity.getCourse().getName()%>
    </option>
    <%
        }
    %>
</select>