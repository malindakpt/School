<label>Course Name</label>
<input class="w3-input" type="text" id="addCourseName">

<h3>Subject List</h3>
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
        $("#addCourseInputs input[type=checkbox]").each(function () {
            if (this.checked) {
                subList.push(this.id);
            }
        });
        $.post('AddCourseSubjects', {
                name: $('#addCourseName').val(),
                subjectList: subList,
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
