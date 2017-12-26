<div>
    <div class="w3-container widget-header">
        <h4>Register a new Student</h4>
    </div>
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
        <label>Father Name</label>
        <input class="w3-input" type="text" id="fatherName">
        <label>Father Mobile</label>
        <input class="w3-input" type="text" id="fatherMobile">
        <label>Mother Name</label>
        <input class="w3-input" type="text" id="motherName">
        <label>Mother Mobile</label>
        <input class="w3-input" type="text" id="motherMobile">
        <label>Guardian Name</label>
        <input class="w3-input" type="text" id="guardinaName">
        <label>Guardian Mobile</label>
        <input class="w3-input" type="text" id="guardianMobile">

       <jsp:include page="../components/imageUploader.jsp"/>

        <button onclick="saveStudent()" type="button" class="w3-button w3-theme button-ok"><i class="fa fa-pencil"></i>
             Save
        </button>
    </div>
</div>


<script>
    function saveStudent() {
        $.post('AddStudent', {
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

