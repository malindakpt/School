<div class="w3-sidebar w3-bar-block w3-animate-left" style="display:none;z-index:5; top: 0px; background: #263137;color:white;" id="mySidebar">
    <button class="w3-bar-item w3-button w3-large" onclick="w3_close()">Close &times;</button>


    <a href="#" class="w3-bar-item w3-button" onclick="getAndSetPage('PageListStudents')">Show Students</a>


    <a href="#" class="w3-bar-item w3-button" onclick="getAndSetPage('PageStudentView?id=5')">Subject Marks Graph</a>
    <a href="#" class="w3-bar-item w3-button" onclick="getAndSetPage('PageRateStudent')">Rate Student</a>


    <a href="#" class="w3-bar-item w3-button" onclick="getAndSetPage('PageAddStudent')">Add Student</a>
    <a href="#" class="w3-bar-item w3-button" onclick="getAndSetPage('PageAddTeacher')">Add Teacher</a>
    <a href="#" class="w3-bar-item w3-button" onclick="getAndSetPage('PageAddSubject')">Add Subject</a>


    <div class="w3-dropdown-hover">
        <button class="w3-button">Show Members<i class="fa fa-caret-down" style="margin-left: 10px;"></i></button>
        <div class="w3-dropdown-content w3-bar-block">

            <a href="#" class="w3-bar-item w3-button" onclick="getAndSetPage('PageListTeachers')">Teachers</a>
            <a href="#" class="w3-bar-item w3-button" onclick="getAndSetPage('PageListSubjects')">Subjects</a>
        </div>
    </div>

    <div class="w3-dropdown-hover">
        <button class="w3-button">Examinations<i class="fa fa-caret-down" style="margin-left: 10px;"></i></button>
        <div class="w3-dropdown-content w3-bar-block">
            <a href="#" class="w3-bar-item w3-button" onclick="getAndSetPage('PageAddExam')">Add Exam for Course</a>
            <a href="#" class="w3-bar-item w3-button" onclick="getAndSetPage('PageAddExamMarks')">Add Exam Marks</a>
        </div>
    </div>

    <div class="w3-dropdown-hover">
        <button class="w3-button">Course Management<i class="fa fa-caret-down" style="margin-left: 10px;"></i></button>
        <div class="w3-dropdown-content w3-bar-block">
            <a href="#" class="w3-bar-item w3-button" onclick="getAndSetPage('PageAddCourse')">Add Course</a>
            <a href="#" class="w3-bar-item w3-button" onclick="getAndSetPage('PageCoursesList')">Show Courses</a>
        </div>
    </div>


    <div class="w3-dropdown-hover">
        <button class="w3-button">School Management<i class="fa fa-caret-down" style="margin-left: 10px;"></i></button>
        <div class="w3-dropdown-content w3-bar-block">

            <a href="#" class="w3-bar-item w3-button" onclick="getAndSetPage('PageAddClassRoom')">Create New Class</a>
            <a href="#" class="w3-bar-item w3-button" onclick="getAndSetPage('PageAddClassStudents')">Assign Students to class</a>
            <a href="#" class="w3-bar-item w3-button" onclick="getAndSetPage('PageRegisterStudent')">Change Grade/Teacher of Class</a>
            <a href="#" class="w3-bar-item w3-button" onclick="getAndSetPage('PageSubjectTeacher')">Change Subjects of Teachers</a>

        </div>
    </div>
</div>

<script>
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
</script>