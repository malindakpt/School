<%@ page import="entity.Subject" %>
<%@ page import="entity.Teacher" %>
<%@ page import="entity.Entity" %>
<%@ page import="java.util.List" %>
<%@ page import="entityManager.EntityManager" %>

<form id="subjectTeacher" class="w3-container w3-card-4" action="/action_page.php">
    <h2>Subscribe Teacher for Subjects</h2>

        <% List<Entity> subjects = EntityManager.getEntities(Subject.class);
            for (Entity sub : subjects) {
                Subject subject = (Subject) sub;
        %>
            <div><%= subject.getSubjectId()%> - <%=subject.getCode() + " " + subject.getName()%></div>


        <% List<Entity> teachers = EntityManager.getEntities(Teacher.class);
                for (Entity techr : teachers) {
                    Teacher teacher = (Teacher) techr;
        %>
                    <input  checked="checked" class="w3-check" type="checkbox" id="<%=teacher.getTeacherId()%>">
                    <label><%= teacher.getFirstName() + ":" + teacher.getLastName()%> </label>
        <%
                }
        %>
        <%
            }
        %>

</form>
<p>
    <button class="w3-btn w3-teal" onclick="subjectTeacher()">Register</button>
</p>
<script>

</script>