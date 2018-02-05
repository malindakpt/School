
<%
    String t56 = request.getParameter("t56");
%>
<jsp:include page="../components/examSelector.jsp?t56=<%=t56%>"/>

<div id="classSelectContainer"></div>

<p>Get teacher id from logged in teacher</p>

<%--<label>Date</label>--%>
<%--<input class="w3-input" type="date" id="assDate">--%>
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
        var q1Arr = [];
        var q2Arr = [];
        var q3Arr = [];
        var q4Arr = [];
        var q5Arr = [];
        var q6Arr = [];
        var q7Arr = [];
        var q8Arr = [];
        var q9Arr = [];
        var q10Arr = [];

        $("#studentList input[rel=mainMarks]").each(function () {
            marksArr.push(this.value);
            studArr.push(this.id);
            q1Arr.push($('#q1-'+this.id).val() || 0);
            q2Arr.push($('#q2-'+this.id).val() || 0);
            q3Arr.push($('#q3-'+this.id).val() || 0);
            q4Arr.push($('#q4-'+this.id).val() || 0);
            q5Arr.push($('#q5-'+this.id).val() || 0);
            q6Arr.push($('#q6-'+this.id).val() || 0);
            q7Arr.push($('#q7-'+this.id).val() || 0);
            q8Arr.push($('#q8-'+this.id).val() || 0);
            q9Arr.push($('#q9-'+this.id).val() || 0);
            q10Arr.push($('#q10-'+this.id).val() || 0);
        });

        console.log(q2Arr);

        $.post('AddMarks', {
                marksArr: marksArr,
                studArr: studArr,
                q1Arr: q1Arr,
                q2Arr: q2Arr,
                q3Arr: q3Arr,
                q4Arr: q4Arr,
                q5Arr: q5Arr,
                q6Arr: q6Arr,
                q7Arr: q7Arr,
                q8Arr: q8Arr,
                q9Arr: q9Arr,
                q10Arr: q10Arr,

                examId: $('#examSelector').val(),
                subjectId: $('#subjectSelector').val(),
                teacherId: 1,//$('#teacherSelector').val(),
                assDate: $('#assDate').val(),
                t56: t56
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
        getAndSetPage('CompStudentsInClassWithInput?t56='+t56+'&examId='+$('#examSelector').val()+'&subjectId='+$('#subjectSelector').val()+'&classId='+$('#classSelector').val(),'studentList');
    }
    function onClassRoomChange(){
        getAndSetPage('CompStudentsInClassWithInput?t56='+t56+'&examId='+$('#examSelector').val()+'&subjectId='+$('#subjectSelector').val()+'&classId='+$('#classSelector').val(),'studentList');
    }

</script>


<p class="wid-id">addExamMarks</p>