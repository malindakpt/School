<%@ page import="entity.Entity" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Course" %>
<%@ page import="entity.User" %>
<%@ page import="util.Helper" %>
<%@ page import="entity.Student" %>
<%
    User user = new Helper().getUser(request);
    String studentId = request.getParameter("studentId");
    Student student = (Student) EntityManager.getEntity(Student.class,"studentId",studentId);
%>
<select class="w3-select" name="option" id="courseSelector" onchange="onCourseChange()">
    <% if(student.getClassRoom()!=null && student.getClassRoom().getCourses()!=null ){ %>
    <option value="" selected>All courses</option>
    <%

        for (Course course : student.getClassRoom().getCourses()) {

    %>
    <option value="<%=course.getCourseId()%>"><%=course.getName()%>
    </option>
    <%
        }
    }else{
        %>
        <option value="" selected>No courses available for this student</option>
    <%
    }
    %>


</select>
