<label>Year</label>
<input class="w3-input" type="text" id="examYear">
<br>
<label>Exam Name</label>
<input class="w3-input" type="text" id="examName">

<br>
<%
    String t56 = request.getParameter("t56");
%>
<jsp:include page="../components/courseSelector.jsp?t56=<%=t56%>"/>
<br>
<br>
<div id="classSelector">

</div>


<button class="w3-button w3-black" style="float: right" onclick="addExam()">Add Exam</button>



<script>
    function onCourseChange() {
        //getAndSetPage('', 'classSelector');
    }
    function addExam() {
        var name = $('#examName').val();
        var year = $('#examYear').val();
        var courseId = $('#courseSelector').val();

        $.post('AddExam', {
                name: name,
                year: year,
                courseId: courseId,
                t56:t56
            },
            function (result) {
                alert("Success " + result);

            }).fail(function () {
                alert("error");
            }
        );
    }
</script>


<p class="wid-id">addExam</p>

