<%@ page import="entity.Subject" %>
<%@ page import="entity.Teacher" %>
<%@ page import="entity.Entity" %>
<%@ page import="java.util.List" %>
<%@ page import="entityManager.EntityManager" %>

<form id="subjectTeacher" class="w3-container w3-card-4" action="/action_page.php">
    <h2>Subscribe Teacher for Subjects</h2>
    <select class="w3-select w3-border" name="option" id="teacher">
        <option value="" disabled selected>Select a teacher</option>
        <% List<Entity> teachers = EntityManager.getEntities(Teacher.class);
            for (Entity item : teachers) {
                Teacher teacher = (Teacher) item;
        %>
        <option value="<%= teacher.getTeacherId()%>"><%=teacher.getFirstName() + " " + teacher.getLastName()%>
        </option>
        <%
            }
        %>
    </select>
    <p>

    </p>
    <% List<Entity> subjects = EntityManager.getEntities(Subject.class);
        for (Entity item : subjects) {
            Subject subject = (Subject) item;
    %>
    <input class="w3-check" type="checkbox" id="<%=subject.getSubjectId()%>">
    <label><%= subject.getCode() + ":" + subject.getName()%>
    </label>
    </option>

    <%
        }
    %>

</form>
<p>
    <button class="w3-btn w3-teal" onclick="subjectTeacher()">Register</button>
</p>
<script>

</script>