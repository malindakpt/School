<div class="w3-sidebar w3-bar-block w3-animate-left" style="display:none;z-index:5; top: 0px; background: #263137;color:white;" id="mySidebar">
    <button class="w3-bar-item w3-button w3-large" onclick="w3_close()">Close &times;</button>





    <a href="#" class="w3-bar-item w3-button" onclick="getAndSetPage('PageTeacherDashBoard?t56='+t56)">Home</a>
    <a href="#" class="w3-bar-item w3-button" onclick="getAndSetPage('PageAnalize?t56='+t56)">Analize</a>
    <a href="#" class="w3-bar-item w3-button" onclick="getAndSetPage('PageRateStudent?t56='+t56)">Rate Student</a>


    <div class="w3-dropdown-hover">
        <button class="w3-button">Students<i class="fa fa-caret-down" style="margin-left: 10px;"></i></button>
        <div class="w3-dropdown-content w3-bar-block">
            <a href="#" class="w3-bar-item w3-button" onclick="getAndSetPage('PageAddStudent')">Add Student</a>
            <a href="#" class="w3-bar-item w3-button" onclick="getAndSetPage('PageListStudents?t56='+t56)">Show Students</a>

        </div>
    </div>


    <a href="#" class="w3-bar-item w3-button" onclick="getAndSetPage('PageAddTeacher?t56='+t56)">Teachers</a>





    <div class="w3-dropdown-hover">
        <button class="w3-button">Examinations<i class="fa fa-caret-down" style="margin-left: 10px;"></i></button>
        <div class="w3-dropdown-content w3-bar-block">
            <a href="#" class="w3-bar-item w3-button" onclick="getAndSetPage('PageAddExam?t56='+t56)">Add Exam for Course</a>
            <a href="#" class="w3-bar-item w3-button" onclick="getAndSetPage('PageAddExamMarks?t56='+t56)">Exam Marks</a>
            <%--<a href="#" class="w3-bar-item w3-button" onclick="getAndSetPage('PageViewExamMarks?t56='+t56)">View Exam Marks</a>--%>
        </div>
    </div>

    <div class="w3-dropdown-hover">
        <button class="w3-button">Courses<i class="fa fa-caret-down" style="margin-left: 10px;"></i></button>
        <div class="w3-dropdown-content w3-bar-block">
            <a href="#" class="w3-bar-item w3-button" onclick="getAndSetPage('PageAddCourse?t56='+t56)">Add Course</a>
            <a href="#" class="w3-bar-item w3-button" onclick="getAndSetPage('PageCoursesList?t56='+t56)">Show Courses</a>
        </div>
    </div>


    <div class="w3-dropdown-hover">
        <button class="w3-button">Settings<i class="fa fa-caret-down" style="margin-left: 10px;"></i></button>
        <div class="w3-dropdown-content w3-bar-block">
            <a href="#" class="w3-bar-item w3-button" onclick="getAndSetPage('PageAddClassRoom?t56='+t56)">Create New Class</a>
            <a href="#" class="w3-bar-item w3-button" onclick="getAndSetPage('PageEditClassRoom?t56='+t56)">Change Class Room</a>
            <a href="#" class="w3-bar-item w3-button" onclick="getAndSetPage('PageSubjectTeacher')">Change Subjects of Teachers</a>
            <a href="#" class="w3-bar-item w3-button" onclick="getAndSetPage('PageAddSubject?t56='+t56)">Subjects</a>
            <a href="#" class="w3-bar-item w3-button" onclick="getAndSetPage('PageAddClassStudents?t56='+t56)">Assign Students to class</a>
            <%--<a href="#" class="w3-bar-item w3-button" onclick="getAndSetPage('PageListSubjects')">Show Subjects</a>--%>
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