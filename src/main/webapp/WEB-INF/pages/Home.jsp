<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%--<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">--%>
<link rel="stylesheet" href="css/W3.css">
<link rel="stylesheet" href="css/w3-theme-blue-grey.css">
<link rel='stylesheet' href="css/font-sans.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel='stylesheet' href="css/custom.css">
<script src="js/jQuery.js"></script>
<style>
    html,body,h1,h2,h3,h4,h5 {font-family: "Open Sans", sans-serif}
</style>
<body>


<!-- Sidebar -->
<div class="w3-sidebar w3-bar-block w3-animate-left" style="display:none;z-index:5; top: 0px;" id="mySidebar">
    <button class="w3-bar-item w3-button w3-large" onclick="w3_close()">Close &times;</button>
    <a href="#" class="w3-bar-item w3-button" onclick="loadStudentList()">Load Students</a>
    <a href="#" class="w3-bar-item w3-button" onclick="loadTeacherList()">Load Teachers</a>
    <a href="#" class="w3-bar-item w3-button" onclick="loadSubjectList()">Load Subjects</a>
    <a href="#" class="w3-bar-item w3-button" onclick="addStudent()">Add Student</a>
    <a href="#" class="w3-bar-item w3-button" onclick="addTeacher()">Add Teacher</a>
    <a href="#" class="w3-bar-item w3-button" onclick="addSubject()">Add Subject</a>
</div>

<!-- Page Content -->
<div class="w3-overlay w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" id="myOverlay"></div>

<%--<div>--%>
    <%--<button class="w3-button w3-white w3-xxlarge" onclick="w3_open()">&#9776;</button>--%>

<%--</div>--%>

<!-- Page Container -->


    <!-- Navbar -->
    <jsp:include page='widgets/menuBar.jsp'/>

    <div class="w3-container w3-content" style="max-width:1400px;margin-top:80px">

        <!-- The Grid -->
        <div class="w3-row">
            <!-- Left Column -->
            <div class="w3-col m3">
                <!-- Profile -->
                <jsp:include page='widgets/profile.jsp'/>

                <br>

                <!-- Accordion -->
                <jsp:include page="widgets/accordion.jsp"/>

                <!-- Interests -->
                <div class="w3-card w3-round w3-white w3-hide-small">
                    <div class="w3-container">
                        <p>Interests</p>
                        <p>
                            <span class="w3-tag w3-small w3-theme-d5" onclick="loadStudentList()">News</span>
                            <span class="w3-tag w3-small w3-theme-d4">W3Schools</span>
                            <span class="w3-tag w3-small w3-theme-d3">Labels</span>

                        </p>
                    </div>
                </div>
                <br>

                <!-- Alert Box -->
                <div class="w3-container w3-display-container w3-round w3-theme-l4 w3-border w3-theme-border w3-margin-bottom w3-hide-small">
            <span onclick="this.parentElement.style.display='none'" class="w3-button w3-theme-l3 w3-display-topright">
              <i class="fa fa-remove"></i>
            </span>
                    <p><strong>Hey!</strong></p>
                    <p>People are looking at your profile. Find out who.</p>
                </div>

                <!-- End Left Column -->
            </div>

            <!-- Middle Column -->
            <div class="w3-col m7">
                <div class="w3-row-padding">
                    <div class="w3-col m12">
                        <div class="w3-card w3-round w3-white">
                            <div class="w3-container w3-padding" id="home-middle">
            <jsp:include page='widgets/addMember.jsp'/>
            <%--<jsp:include page='widgets/listStudents.jsp'/>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right Column -->
            <div class="w3-col m2">
                <div class="w3-card w3-round w3-white w3-center">
                    <div class="w3-container">
                        <p>Upcoming Events:</p>
                        <img src="img/lights.png" alt="Forest" style="width:100%;">
                        <p><strong>Holiday</strong></p>
                        <p>Friday 15:00</p>
                        <p><button class="w3-button w3-block w3-theme-l4">Info</button></p>
                    </div>
                </div>
                <br>

                <div class="w3-card w3-round w3-white w3-center">
                    <div class="w3-container">
                        <p>Friend Request</p>
                        <img src="img/avatar.png" alt="Avatar" style="width:50%"><br>
                        <span>Jane Doe</span>
                        <div class="w3-row w3-opacity">
                            <div class="w3-half">
                                <button class="w3-button w3-block w3-green w3-section" title="Accept"><i class="fa fa-check"></i></button>
                            </div>
                            <div class="w3-half">
                                <button class="w3-button w3-block w3-red w3-section" title="Decline"><i class="fa fa-remove"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
                <br>

                <div class="w3-card w3-round w3-white w3-padding-16 w3-center">
                    <p>ADS</p>
                </div>
                <br>

                <div class="w3-card w3-round w3-white w3-padding-32 w3-center">
                    <p><i class="fa fa-bug w3-xxlarge"></i></p>
                </div>

                <!-- End Right Column -->
            </div>

            <!-- End Grid -->
        </div>

        <!-- End Page Container -->
    </div>
    <br>


<footer class="w3-container w3-theme-d5" style="    position: fixed;    bottom: 1px;    width: 100%;    height: 30px;    line-height: 25px;">
    <span>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></span>
</footer>
</div>
<script>

    function w3_open() {
        document.getElementById("mySidebar").style.display = "block";
        document.getElementById("myOverlay").style.display = "block";
    }
    function w3_close() {
        document.getElementById("mySidebar").style.display = "none";
        document.getElementById("myOverlay").style.display = "none";
    }
    // Accordion
    function myFunction(id) {


    }

    // Used to toggle the menu on smaller screens when clicking on the menu button
    function openNav() {
        var x = document.getElementById("navDemo");
        if (x.className.indexOf("w3-show") == -1) {
            x.className += " w3-show";
        } else {
            x.className = x.className.replace(" w3-show", "");
        }
    }

    function addStudent() {
        w3_close();
        $.post('PageAddStudent', {},
            function (result) {
                $('#home-middle').html(result);

            }).fail(function (result) {
            $('#home-middle').html(result);
            }
        );
    }
    function addTeacher(){
        w3_close();
        $.post('PageAddTeacher', {},
            function (result) {
                $('#home-middle').html(result);

            }).fail(function (result) {
                $('#home-middle').html(result);
            }
        );
    }
    function addSubject(){
        w3_close();
        $.post('PageAddSubject', {},
            function (result) {
                $('#home-middle').html(result);

            }).fail(function (result) {
                $('#home-middle').html(result);
            }
        );
    }
    function loadStudentList() {
        w3_close();
        $.post('PageListStudents', {},
            function (result) {
                $('#home-middle').html(result);

            }).fail(function () {
                alert("error");
            }
        );
    }
    function loadTeacherList() {
        w3_close();
        $.post('PageListTeachers', {},
            function (result) {
                $('#home-middle').html(result);

            }).fail(function () {
                alert("error");
            }
        );
    }
    function loadSubjectList() {
        w3_close();
        $.post('PageListSubjects', {},
            function (result) {
                $('#home-middle').html(result);

            }).fail(function () {
                alert("error");
            }
        );
    }
</script>

</body>
</html>
