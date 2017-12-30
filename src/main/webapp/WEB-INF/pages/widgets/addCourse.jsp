<h3>Enter Course Name</h3><label>  (Eg: Grade 1, Grade 2, Maths Section, Commerce Section, etc...)</label>
<input class="w3-input" type="text" id="addCourseName">
<%--<br>--%>
<%--<label>Course for Grade</label>--%>
<%--<input class="w3-input" type="number" id="courseGrade">--%>
<br>
<h3>Selects Subjects List</h3>
<br>
<div id="addCourseInputs">
    <%
        String t56 = request.getParameter("t56");
    %>
    <jsp:include page="../components/subjectCheckList.jsp?t56=<%=t56%>"/>
</div>
<br><br>
<div>
    <button onclick="saveCourse()" type="button" class="w3-btn w3-teal">Add Course</button>
</div>


<script>
    function saveCourse() {
        var subList = [];
        var subjectCountList = [];
        $("#addCourseInputs input[type=checkbox]").each(function () {
            if (this.checked) {
                subList.push(this.id);
                subjectCountList.push($('#cnt'+this.id).val());
            }
        });

        $.post('AddCourseSubjects', {
                name: $('#addCourseName').val(),
                subjectList: subList,
                subjectCountList:subjectCountList,
                grade: $('#courseGrade').val(),
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

</script>
<p class="wid-id">addCourse</p>
