
<%
    String t56 = request.getParameter("t56");
%>
<jsp:include page="../components/examSelector.jsp?t56=<%=t56%>"/>

<div id="classSelectContainer"></div>

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
    function onExamChange() {
        getAndSetPage('CompClassRoomSelectorForCourse?examId='+$('#examSelector').val(),'classSelectContainer');
        getAndSetPage('CompSubjectSelector4Course?examId='+$('#examSelector').val(),'subjectList');
    }
    function addExamSaveMarks() {
        var marksArr = [];
        var studArr = [];
        $("#studentList input[type=number]").each(function () {
            marksArr.push(this.value);
            studArr.push(this.id);
        });

        $.post('AddMarks', {
                marksArr: marksArr,
                studArr: studArr,
                examId: $('#examSelector').val(),
                subjectId: $('#subjectSelector').val(),
                teacherId: 1,//$('#teacherSelector').val(),
                assDate: $('#assDate').val(),
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
    function onSubjectChange () {

    }
    function onClassRoomChange(){
        getAndSetPage('CompStudentsInClassWithInput?classId='+$('#classSelector').val(),'studentList');
    }

</script>


<p class="wid-id">addExamMarks</p>