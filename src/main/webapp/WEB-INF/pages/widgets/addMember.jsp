<div>


    <div class="w3-container widget-header">
        <h4>Register a new Member</h4>
    </div>

    <form class="w3-container">
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

        <button onclick="saveStudent()" type="button" class="w3-button w3-theme button-ok"><i class="fa fa-pencil"></i>
             Save
        </button>
    </form>


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
                guardianMobile: $('#guardianMobile').val()
            },
            function (result) {
                if (result === "") {
                    alert("success");
                } else {
                    alert("error");
                }

            }).fail(function () {
                alert("error");
            }
        );
    }
    function createAd() {
        var topic = document.getElementById("topic").value;
        var expDate = document.getElementById("expDate").value;
        var noVehi = document.getElementById("noVehi").value;
        var email = document.getElementById("email").value;
        var pwd = document.getElementById("pwd").value;
        var location = document.getElementById("location").value;

        if (topic == "" || expDate == "" || noVehi == "" || email == "" || pwd == "") {
            swal("Oops...", "You have to fill all the fields", "error");
        } else {

            swal({
                title: "Creating new advertisement",
                text: "Are  you sure ?",
                type: "info",
                showCancelButton: true,
                closeOnConfirm: false,
                showLoaderOnConfirm: true
            }, function () {
                uploadData();
            });
        }
    }
</script>

