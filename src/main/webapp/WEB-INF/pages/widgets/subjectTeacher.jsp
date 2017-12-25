<%@ page import="entity.Subject" %>
<%@ page import="entity.Teacher" %>
<%@ page import="entity.Entity" %>
<%@ page import="java.util.List" %>
<%@ page import="entityManager.EntityManager" %>

<jsp:include page="../components/header.jsp?header=Add/Remove Subjects for Teachers"/>


        <% List<Entity> subjects = EntityManager.getEntities(Subject.class);
            for (Entity sub : subjects) {
                Subject subject = (Subject) sub;
        %>
<div id="<%="sub"+subject.getSubjectId()%>" class="w3-panel w3-Pale Green w3-card-4">
<%--<div id="<%="sub"+subject.getSubjectId()%>" class="w3-container w3-card-4">--%>
            <h3><%= subject.getSubjectId()%> - <%=subject.getCode() + " " + subject.getName()%></h3>


        <% List<Entity> teachers = EntityManager.getEntities(Teacher.class);
                for (Entity techr : teachers) {
                    Teacher teacher = (Teacher) techr;
        %>
                    <input  <% if(Teacher.contains(subject.getTeachers(),teacher)) {%> checked="checked" <% }else{} %>
                                                                                       class="w3-check" type="checkbox" id="<%=teacher.getTeacherId()%>">
                    <label><%= teacher.getFirstName() + ":" + teacher.getLastName()%> </label>
        <%
                }
        %>
        <p>
            <button id="<%=subject.getSubjectId()%>" class="w3-btn w3-teal" onclick="subjectTeacher(this)">Save</button>
        </p>

</div>
        <%
            }
        %>


<p class="wid-id">subjectTeacher</p>

