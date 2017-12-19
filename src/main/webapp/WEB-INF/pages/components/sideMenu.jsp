<div class="w3-sidebar w3-bar-block w3-animate-left" style="display:none;z-index:5; top: 0px; background: #263137;color:white;" id="mySidebar">
    <button class="w3-bar-item w3-button w3-large" onclick="w3_close()">Close &times;</button>

    <a href="#" class="w3-bar-item w3-button" onclick="loadAddExam()">Add Exam</a>
    <a href="#" class="w3-bar-item w3-button" onclick="loadAddExamMarks()">Add Exam Marks</a>
    <a href="#" class="w3-bar-item w3-button" onclick="loadStudentList()">Show Students</a>
    <a href="#" class="w3-bar-item w3-button" onclick="loadReportCard()">Report Card</a>
    <a href="#" class="w3-bar-item w3-button" onclick="loadStudentDetails()">Subject Marks</a>
    <a href="#" class="w3-bar-item w3-button" onclick="loadRateStudent()">Rate Student</a>

    <div class="w3-dropdown-hover">
        <button class="w3-button">Show Members<i class="fa fa-caret-down" style="margin-left: 10px;"></i></button>
        <div class="w3-dropdown-content w3-bar-block">

            <a href="#" class="w3-bar-item w3-button" onclick="loadTeacherList()">Teachers</a>
            <a href="#" class="w3-bar-item w3-button" onclick="loadSubjectList()">Subjects</a>
        </div>
    </div>

    <div class="w3-dropdown-hover">
        <button class="w3-button">Add Members<i class="fa fa-caret-down" style="margin-left: 10px;"></i></button>
        <div class="w3-dropdown-content w3-bar-block">
            <a href="#" class="w3-bar-item w3-button" onclick="addStudent()">Add Student</a>
            <a href="#" class="w3-bar-item w3-button" onclick="addTeacher()">Add Teacher</a>
            <a href="#" class="w3-bar-item w3-button" onclick="addSubject()">Add Subject</a>
        </div>
    </div>

    <div class="w3-dropdown-hover">
        <button class="w3-button">Class Room<i class="fa fa-caret-down" style="margin-left: 10px;"></i></button>
        <div class="w3-dropdown-content w3-bar-block">
            <a href="#" class="w3-bar-item w3-button" onclick="addClassStudents()">Class Assign Students</a>
            <a href="#" class="w3-bar-item w3-button" onclick="addMarksPage()">Add Marks</a>
        </div>
    </div>






    <div class="w3-dropdown-hover">
        <button class="w3-button">Academic Year<i class="fa fa-caret-down" style="margin-left: 10px;"></i></button>
        <div class="w3-dropdown-content w3-bar-block">
            <a href="#" class="w3-bar-item w3-button" onclick="loadRegisterStudent()">Register Student</a>
            <a href="#" class="w3-bar-item w3-button" onclick="loadAddCourse()">Add Course</a>
            <a href="#" class="w3-bar-item w3-button" onclick="addClassRoom()">Add Class Room</a>
            <a href="#" class="w3-bar-item w3-button" onclick="loadSubjectTeacher()">Change Subjects of Teachers</a>
        </div>
    </div>
</div>



<script>


    function addStudent() {
        w3_close();
        busyOn();
        $.post('PageAddStudent', {},
            function (result) {
                $('#home-middle').html(result);
                busyOff();
            }).fail(function (result) {
                $('#home-middle').html(result);
                busyOff();
            }
        );
    }
    function addTeacher() {
        w3_close();
        busyOn();
        $.post('PageAddTeacher', {},
            function (result) {
                $('#home-middle').html(result);
                busyOff();
            }).fail(function (result) {
                $('#home-middle').html(result);
                busyOff();
            }
        );
    }
    function addSubject() {
        w3_close();
        busyOn();
        $.post('PageAddSubject', {},
            function (result) {
                $('#home-middle').html(result);
                busyOff();

            }).fail(function (result) {
                $('#home-middle').html(result);
                busyOff();
            }
        );
    }
    function loadStudentList() {
        w3_close();
        busyOn();
        $.post('PageListStudents', {},
            function (result) {
                $('#home-middle').html(result);
                busyOff();

            }).fail(function () {
                alert("error");
                busyOff();
            }
        );
    }

    function getAndSetPage(page, to) {
        w3_close();
        busyOn();
        $.post(page, {},
            function (result) {
                if(to){
                    $('#'+to+'').html(result);
                }else{
                    $('#home-middle').html(result);
                }

                busyOff();

            }).fail(function () {
                alert("error");
                busyOff();
            }
        );
    }
    function loadTeacherList() {
        w3_close();
        busyOn();
        $.post('PageListTeachers', {},
            function (result) {
                $('#home-middle').html(result);
                busyOff();
            }).fail(function () {
                alert("error");
                busyOff();
            }
        );
    }
    function loadSubjectList() {
        w3_close();
        busyOn();
        $.post('PageListSubjects', {},
            function (result) {
                $('#home-middle').html(result);
                busyOff();

            }).fail(function () {
                alert("error");
                busyOff();
            }
        );
    }

    function addClassRoom() {
        w3_close();
        busyOn();
        $.post('PageAddClassRoom', {},
            function (result) {
                $('#home-middle').html(result);
                busyOff();
            }).fail(function () {
                alert("error");
                busyOff();
            }
        );
    }
    function addClassStudents() {
        w3_close();
        busyOn();
        $.post('PageAddClassStudents', {},
            function (result) {
                $('#home-middle').html(result);
                busyOff();

            }).fail(function () {
                alert("error");
                busyOff();
            }
        );
    }
    function loadRegisterStudent() {
        w3_close();
        busyOn();
        $.post('PageRegisterStudent', {},
            function (result) {
                $('#home-middle').html(result);
                busyOff();

            }).fail(function () {
                alert("error");
                busyOff();
            }
        );
    }
    function loadAddCourse() {
        w3_close();
        busyOn();
        $.post('PageAddCourse', {},
            function (result) {
                $('#home-middle').html(result);
                busyOff();

            }).fail(function () {
                alert("error");
                busyOff();
            }
        );
    }
    function loadRateStudent() {
        w3_close();
        busyOn();
        $.post('PageRateStudent', {},
            function (result) {
                $('#home-middle').html(result);
                busyOff();

            }).fail(function () {
                alert("error");
                busyOff();
            }
        );
    }

    function loadAddExam() {
        w3_close();
        busyOn();
        $.post('PageAddExam', {},
            function (result) {
                $('#home-middle').html(result);
                busyOff();

            }).fail(function () {
                alert("error");
                busyOff();
            }
        );
    }
    function loadAddExamMarks() {
        w3_close();
        busyOn();
        $.post('PageAddExamMarks', {},
            function (result) {
                $('#home-middle').html(result);
                busyOff();

            }).fail(function () {
                alert("error");
                busyOff();
            }
        );
    }
    function loadReportCard() {
        w3_close();
        busyOn();
        $.post('PageReportCard?studentId=1&examId=3', {},
            function (result) {
                $('#home-middle').html(result);
                busyOff();

            }).fail(function () {
                alert("error");
                busyOff();
            }
        );
    }
    function loadStudentDetails() {
        w3_close();
        busyOn();
        $.post('PageStudentView?id=5', {},
            function (result) {
                $('#home-middle').html(result);
                busyOff();

            }).fail(function () {
                alert("error");
                busyOff();
            }
        );

    }

    function addMarksPage() {
        w3_close();
        busyOn();
        $.post('PageAddMarks', {},
            function (result) {
                $('#home-middle').html(result);
                busyOff();
            }).fail(function () {
                alert("error");
                busyOff();
            }
        );
    }
    function loadSubjectTeacher() {
        w3_close();
        busyOn();
        $.post('PageSubjectTeacher', {},
            function (result) {
                $('#home-middle').html(result);
                busyOff();

            }).fail(function () {
                alert("error");
                busyOff();
            }
        );
    }
</script>