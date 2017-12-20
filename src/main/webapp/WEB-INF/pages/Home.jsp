<%@ page import="entity.Subject" %>
<%@ page import="entity.Entity" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="java.util.List" %>
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
<script src="js/highCharts.js"></script>
<style>
    html, body, h1, h2, h3, h4, h5 {
        font-family: "Open Sans", sans-serif
    }

    .loader {
        border: 16px solid #ffffff;
        border-radius: 50%;
        border-top: 16px solid #004471;
        width: 120px;
        height: 120px;
        -webkit-animation: spin 2s linear infinite; /* Safari */
        animation: spin 2s linear infinite;

        z-index: 5;
        position: absolute;
        left: 45%;
        top: 45%;
    }

    /* Safari */
    @-webkit-keyframes spin {
        0% {
            -webkit-transform: rotate(0deg);
        }
        100% {
            -webkit-transform: rotate(360deg);
        }
    }

    @keyframes spin {
        0% {
            transform: rotate(0deg);
        }
        100% {
            transform: rotate(360deg);
        }
    }
</style>
<body>

<%
    int userId = 1;
%>

<div class="loader" id="busyIcon" style="display: none"></div>

<div class="w3-overlay w3-animate-opacity" style="cursor:pointer" style="display: block" id="myOverlay2"></div>
<!-- Sidebar -->
<jsp:include page="components/sideMenu.jsp"/>
<!-- Page Content -->
<div class="w3-overlay w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" id="myOverlay"></div>

<%--<div>--%>
<%--<button class="w3-button w3-white w3-xxlarge" onclick="w3_open()">&#9776;</button>--%>

<%--</div>--%>

<!-- Page Container -->


<!-- Navbar -->
<jsp:include page='components/menuBar.jsp'/>

<div class="w3-container w3-content" style="max-width:1400px;margin-top:80px">

    <!-- The Grid -->
    <div class="w3-row">
        <!-- Left Column -->
        <div class="w3-col m2">
            <!-- Profile -->
            <jsp:include page='widgets/profile.jsp'/>


            <br>



            <!-- Accordion -->
            <div class=" w3-hide-small">
            <jsp:include page="components/accordion.jsp"/>
            </div>



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
        <div class="w3-col m8">
            <div class="w3-row-padding">
                <div class="w3-col m12">
                    <div class="w3-card w3-round w3-white">
                        <div class="w3-container w3-padding" id="home-middle">
                            <jsp:include page='widgets/dashBoad.jsp'/>
                            <%--<jsp:include page='widgets/listStudents.jsp'/>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Right Column -->
        <div class="w3-col m2">

            <!-- Interests -->
            <jsp:include page="components/interests.jsp"/>

            <div class="w3-card w3-round w3-white w3-center">
                <div class="w3-container">
                    <p>Upcoming Events:</p>
                    <img src="img/sportmeet.jpg" alt="Forest" style="width:100%;">
                    <%--<p><strong>Sports Meet 2018</strong></p>--%>
                    <%--<p>await!</p>--%>
                    <p>
                        <button class="w3-button w3-block w3-theme-l4"><strong>Sports Meet 2018</strong></button>
                    </p>
                </div>
            </div>
            <br>

            <div class="w3-card w3-round w3-white w3-center">
                <div class="w3-container">
                    <p>Class Teacher</p>
                    <img src="img/teacher.PNG" alt="Avatar" style="width:50%"><br>

                    <div class="w3-row w3-opacity">
                        <div class="w3-full">
                            <button class="w3-button w3-block w3-green w3-section" title="Accept"><span style="color: black">Nadeeka Herath</span></button>
                        </div>
                        <%--<div class="w3-half">--%>
                            <%--<button class="w3-button w3-block w3-red w3-section" title="Decline"><i--%>
                                    <%--class="fa fa-remove"></i></button>--%>
                        <%--</div>--%>
                    </div>
                </div>
            </div>
            <br>

            <%--Removing adds--%>
            <%--<div class="w3-card w3-round w3-white w3-padding-16 w3-center">--%>
                <%--<p>ADS</p>--%>
            <%--</div>--%>
            <%--<br>--%>

            <%--Removing Empty box--%>
            <%--<div class="w3-card w3-round w3-white w3-padding-32 w3-center">--%>
                <%--<p><i class="fa fa-bug w3-xxlarge"></i></p>--%>
            <%--</div>--%>

            <!-- End Right Column -->
        </div>

        <!-- End Grid -->
    </div>

    <!-- End Page Container -->
</div>
<br>


<%--<footer class="w3-container w3-theme-d5"--%>
        <%--style="    position: fixed;    bottom: 1px;    width: 100%;    height: 30px;    line-height: 25px;">--%>
    <%--<span>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></span>--%>
<%--</footer>--%>
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
    function busyOn() {
        document.getElementById("myOverlay2").style.display = "block";
        document.getElementById("busyIcon").style.display = "block";
    }
    function busyOff() {
        document.getElementById("myOverlay2").style.display = "none";
        document.getElementById("busyIcon").style.display = "none";
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
    function subjectTeacher(ele) {
        var subList = [];
        $("#sub" + ele.id + " input[type=checkbox]").each(function () {
            if (this.checked) {
                subList.push(this.id);
            }
        });
        $.post('AddSubjectTeacher', {
                subjectId: ele.id,
                teacherList: subList
            },
            function (result) {
                if (result === "") {
                    alert("Success " + result);
                } else {
                    console.log("Error response");
                }

            }).fail(function () {
                alert("error");
            }
        );
    }


    function addMarks() {
        var marksArr = [];
        var studArr = [];
        $("#marksClassStudents input").each(function () {
            marksArr.push(this.value);
            studArr.push(this.id);
        });
        $.post('AddMarks', {
                marksArr: marksArr,
                studArr: studArr,

                subjectId: $('#assSubject').val(),
                teacherId: $('#assTeacher').val(),
                date: $('#assDate').val(),
                type: $('#assesmentType').val(),

            },
            function (result) {
                alert("Success " + result);

            }).fail(function () {
                alert("error");
            }
        );
    }
</script>

</body>
</html>
