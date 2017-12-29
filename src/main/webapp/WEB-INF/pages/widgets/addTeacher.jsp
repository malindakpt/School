<div>
    <jsp:include page="../components/header.jsp?header=Add/Edit Teachers"/>
    <div class="w3-container">
        <br>
        <label>First Name</label>
        <input class="w3-input" type="text" id="firstName">
        <label>Last Name</label>
        <input class="w3-input" type="text" id="lastName">
        <label>Full Name</label>
        <input class="w3-input" type="text" id="fullName">
        <label>Birthday</label>
        <input class="w3-input" type="date" id="birthday">
        <label>Address</label>
        <input class="w3-input" type="text" id="address">
        <label>Phone</label>
        <input class="w3-input" type="text" id="phone">
        <label>Available Periods</label>
        <input class="w3-input" type="number" id="availablePeriods">

        <label>NIC</label>
        <input class="w3-input" type="text" id="nic">

        <jsp:include page="../components/imageUploader.jsp"/>



        <button onclick="saveTeacher()" type="button" class="w3-button w3-green btn-right">Add Teacher</button>

    </div>

    <%
        String t56 = request.getParameter("t56");
    %>
    <jsp:include page="../widgets/listTeachers.jsp?t56=<%=t56%>"/>
</div>


<script>
    function saveTeacher() {
        $.post('AddTeacher', {
                firstName: $('#firstName').val(),
                lastName: $('#lastName').val(),
                fullName: $('#fullName').val(),
                birthday: $('#birthday').val(),
                address: $('#address').val(),
                phone: $('#phone').val(),
                nic: $('#nic').val(),
                image: $('#imgPreview').attr('src'),
                availablePeriods: $('#availablePeriods').val(),
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


<p class="wid-id">addTeacher</p>

