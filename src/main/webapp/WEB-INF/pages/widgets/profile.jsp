<%@ page import="entity.Student" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="entity.School" %>
<div class="w3-card w3-round w3-white">
    <div class="w3-container">
        <%
            String id = request.getParameter("id");
            boolean isStudent = Boolean.parseBoolean(request.getParameter("isStudent"));

            if(isStudent){
                Student student= (Student) EntityManager.getEntity(Student.class,"studentId", id);
        %>


        <h4 class="w3-center"><%=student.getFirstName()+" "+student.getLastName()%></h4>
        <p class="w3-center"><img src="<%=student.getImage()%>" class="w3-circle" style="height:100%;width:100%" alt="Avatar"></p>
        <hr>
        <p><i class="fa fa-university fa-fw w3-margin-right w3-text-theme"></i> Grade 5-B</p>
        <p><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i> Student</p>
        <p><i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i> <%=student.getAddress()%></p>
        <p><i class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i> <%=student.getBirthday().toString().split(" ")[0]%></p>


        <%
            }else{
                School school= (School) EntityManager.getEntity(School.class,"schoolId", id);
        %>
        <p class="w3-center"><img src="<%=school.getImage()%>" class="w3-circle" style="height:100%;width:100%" alt="Avatar"></p>
        <h3><%=school.getName()%></h3>
        <%
            }
        %>
    </div>
</div>


<p class="wid-id">profile</p>
