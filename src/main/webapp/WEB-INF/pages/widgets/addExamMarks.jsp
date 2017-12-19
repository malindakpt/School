<jsp:include page="../components/classRoomList.jsp"/>
<jsp:include page="../components/examSelector.jsp"/>

<h3>Get teacher id from logged in teacher</h3>

<label>Date</label>
<input class="w3-input" type="date" id="assDate">
<br>

<div id="subjectList">

</div>


<div id="studentList">

</div>
<br>
<button class="w3-button w3-red"  onclick="addExamSaveMarks()">Save Marks</button>

<script>
//    function addExamSaveMarks() {
//        var subList = [];
//        $("#sub" + ele.id + " input[type=checkbox]").each(function () {
//            if (this.checked) {
//                subList.push(this.id);
//            }
//        });
//        $.post('AddSubjectTeacher', {
//                subjectId: ele.id,
//                teacherList: subList
//            },
//            function (result) {
//                if (result === "") {
//                    alert("Success " + result);
//                } else {
//                    console.log("Error response");
//                }
//
//            }).fail(function () {
//                alert("error");
//            }
//        );
//    }
    function onSubjectChange () {

    }
    function onClassRoomChange(){
        w3_close();
        busyOn();
        var classId = $('#classSelector').val();
        $.post('CompStudentsInClassWithInput?classId='+classId, {
            },
            function (result) {
                $('#studentList').html(result);
                busyOff();
            }).fail(function () {
                alert("error");
                busyOff();
            }
        );
    }
    function onExamChange() {
        w3_close();
        busyOn();
        var examId = $('#examSelector').val();
        $.post('CompSubjectSelector4Course?examId='+examId, {
            },
            function (result) {
                $('#subjectList').html(result);
                busyOff();

            }).fail(function () {
                alert("error");
                busyOff();
            }
        );
    }

</script>