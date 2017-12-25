<%@ page import="entity.Teacher" %>
<%@ page import="entityManager.EntityManager" %>
<div>
    <jsp:include page="../components/header.jsp?header=Edit Teacher"/>

    <%
        String teacherId = request.getParameter("teacherId");
        Teacher teacher = (Teacher) EntityManager.getEntity(Teacher.class, "teacherId", teacherId);
    %>
    <div class="w3-container">
        <br>
        <label>First Name</label>
        <input class="w3-input" type="text" id="firstName" value="<%=teacher.getFirstName()%>">
        <label>Last Name</label>
        <input class="w3-input" type="text" id="lastName" value="<%=teacher.getLastName()%>">
        <label>Full Name</label>
        <input class="w3-input" type="text" id="fullName" value="<%=teacher.getFullName()%>">
        <label>Birthday</label>
        <input class="w3-input" type="date" id="birthday" value="<%=teacher.getBirthday().toString().split(" ")[0]%>">
        <label>Address</label>
        <input class="w3-input" type="text" id="address" value="<%=teacher.getAddress()%>">
        <label>Phone</label>
        <input class="w3-input" type="text" id="phone" value="<%=teacher.getPhone()%>">

        <label>NIC</label>
        <input class="w3-input" type="text" id="nic" value="<%=teacher.getNic()%>">



        <button onclick="editTeacher()" type="button" class="w3-button w3-green btn-right">Edit Teacher</button>
    </div>
</div>


<script>
    var teacherId = "<%=teacher.getTeacherId()%>";

    function editTeacher() {
        $.post('EditTeacher', {
                teacherId: teacherId,
                firstName: $('#firstName').val(),
                lastName: $('#lastName').val(),
                fullName: $('#fullName').val(),
                birthday: $('#birthday').val(),
                address: $('#address').val(),
                phone: $('#phone').val(),
                nic: $('#nic').val(),
                t56: t56,

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


<p class="wid-id">editTeacher</p>

