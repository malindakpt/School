<%@ page import="entity.Student" %>
<%@ page import="entityManager.EntityManager" %>
<div>

<%
	String studentId = request.getParameter("studentId");
	Student student = (Student) EntityManager.getEntity(Student.class,"studentId",studentId);

%>
    <div class="w3-container widget-header">
        <h4>Register a new Student</h4>
    </div>
    <div class="w3-container">
        <br>
        <label>First Name</label>
        <input class="w3-input" type="text" id="firstName" value="<%=student.getFirstName()%>">
        <label>Last Name</label>
        <input class="w3-input" type="text" id="lastName" value="<%=student.getLastName()%>">
        <label>Full Name</label>
        <input class="w3-input" type="text" id="fullName" value="<%=student.getFullName()%>">
        <label>Birthday</label>
        <input class="w3-input" type="date" id="birthday" value="<%=student.getBirthday().toString().split(" ")[0]%>">
        <label>Address</label>
        <input class="w3-input" type="text" id="address" value="<%=student.getAddress()%>">
        <label>Phone</label>
        <input class="w3-input" type="text" id="phone" value="<%=student.getPhone()%>">
        <label>Father Name</label>
        <input class="w3-input" type="text" id="fatherName" value="<%=student.getFatherName()%>">
        <label>Father Mobile</label>
        <input class="w3-input" type="text" id="fatherMobile" value="<%=student.getFatherMobile()%>">
        <label>Mother Name</label>
        <input class="w3-input" type="text" id="motherName" value="<%=student.getMotherName()%>">
        <label>Mother Mobile</label>
        <input class="w3-input" type="text" id="motherMobile" value="<%=student.getMotherMobile()%>">
        <label>Guardian Name</label>
        <input class="w3-input" type="text" id="guardinaName" value="<%=student.getGuardinaName()%>">
        <label>Guardian Mobile</label>
        <input class="w3-input" type="text" id="guardianMobile" value="<%=student.getGuardianMobile()%>">

       <jsp:include page="../components/imageUploader.jsp"/>

        <button onclick="saveStudent()" type="button" class="w3-button w3-green btn-right">Edit Student</button>
    </div>
</div>


<script>

	var studentId = "<%=student.getStudentId()%>";
    function saveStudent() {
        $.post('EditStudent', {
                firstName: $('#firstName').val(),
                lastName: $('#lastName').val(),
                fullName: $('#fullName').val(),
                birthday: $('#birthday').val(),
                address: $('#address').val(),
                phone: $('#phone').val(),
                fatherName: $('#fatherName').val(),
                fatherMobile: $('#fatherMobile').val(),
                motherName: $('#motherName').val(),
                motherMobile: $('#motherMobile').val(),
                guardinaName: $('#guardinaName').val(),
                guardianMobile: $('#guardianMobile').val(),
                image: $('#imgPreview').attr('src'),
				studentId: studentId,

                t56: t56
            },
            function (result) {
                var resArr = result.split("##");
                if (resArr[0] === "") {
                    alert("Success");
                } else {
                    alert(resArr[1]);
                }

            }).fail(function () {
                alert("Error");
            }
        );
    }
</script>


<p class="wid-id">addStudents</p>

