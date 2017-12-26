<%@ page import="entity.Student" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="java.text.SimpleDateFormat" %>
<div class="w3-card w3-round w3-white">
    <div class="w3-container">
        <%
            String id = request.getParameter("id");
            Student student= (Student) EntityManager.getEntity(Student.class,"studentId", id);
            if(student!=null){
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
        %>
            Student Not Found

        <%
            }
        %>
    </div>
</div>


<p class="wid-id">profile</p>