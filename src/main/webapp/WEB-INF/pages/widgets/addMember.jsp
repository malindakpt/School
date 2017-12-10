<div class="w3-col m7">
    <div class="w3-row-padding">
        <div class="w3-col m12">
            <div class="w3-card w3-round w3-white">
                <div class="w3-container w3-padding">


                    <div class="w3-container widget-header">
                        <h4>Register a new Member</h4>
                    </div>

                    <form class="w3-container">

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

                        <button onclick="saveStudent()" type="button" class="w3-button w3-theme button-ok"><i class="fa fa-pencil"></i>  Save</button>
                    </form>

                    <%--<p contenteditable="true" class="w3-border w3-padding">Status: Feeling Blue</p>--%>

                </div>
            </div>
        </div>
    </div>

    <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
        <img src="img/avatar.png" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
        <span class="w3-right w3-opacity">1 min</span>
        <h4>John Doe</h4><br>
        <hr class="w3-clear">
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
        <div class="w3-row-padding" style="margin:0 -16px">
            <div class="w3-half">
                <img src="img/lights.png" style="width:100%" alt="Northern Lights" class="w3-margin-bottom">
            </div>
            <div class="w3-half">
                <img src="img/lights.png" style="width:100%" alt="Nature" class="w3-margin-bottom">
            </div>
        </div>
        <button type="button" class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i>  Like</button>
        <button type="button" class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i>  Comment</button>
    </div>

    <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
        <img src="img/avatar.png" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
        <span class="w3-right w3-opacity">16 min</span>
        <h4>Jane Doe</h4><br>
        <hr class="w3-clear">
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
        <button type="button" class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i>  Like</button>
        <button type="button" class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i>  Comment</button>
    </div>

    <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
        <img src="img/avatar.png" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
        <span class="w3-right w3-opacity">32 min</span>
        <h4>Angie Jane</h4><br>
        <hr class="w3-clear">
        <p>Have you seen this?</p>
        <img src="img/lights.png" style="width:100%" class="w3-margin-bottom">
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
        <button type="button" class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i>  Like</button>
        <button type="button" class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i>  Comment</button>
    </div>

    <!-- End Middle Column -->
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

