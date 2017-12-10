<div class="w3-card w3-round">
    <div class="w3-white">
        <button onclick="loadAllStudents()" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i> My Groups</button>
        <div id="Demo1" class="w3-hide w3-container">
            <p>Some text..</p>
        </div>
        <button onclick="myFunction('Demo2')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i> My Events</button>
        <div id="Demo2" class="w3-hide w3-container">
            <p>Some other text..</p>
        </div>
        <button onclick="myFunction('Demo3')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-users fa-fw w3-margin-right"></i> My Photos</button>
        <div id="Demo3" class="w3-hide w3-container">
            <div class="w3-row-padding">
                <br>
                <div class="w3-half">
                    <img src="img/lights.png" style="width:100%" class="w3-margin-bottom">
                </div>
                <div class="w3-half">
                    <img src="img/lights.png" style="width:100%" class="w3-margin-bottom">
                </div>
                <div class="w3-half">
                    <img src="img/lights.png" style="width:100%" class="w3-margin-bottom">
                </div>
                <div class="w3-half">
                    <img src="img/lights.png" style="width:100%" class="w3-margin-bottom">
                </div>
                <div class="w3-half">
                    <img src="img/lights.png" style="width:100%" class="w3-margin-bottom">
                </div>
                <div class="w3-half">
                    <img src="img/lights.png" style="width:100%" class="w3-margin-bottom">
                </div>
            </div>
        </div>
    </div>
</div>
<br>

<script>
    function loadAllStudents() {

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
</script>