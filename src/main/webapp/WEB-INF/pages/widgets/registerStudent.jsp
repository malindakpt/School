<select class="w3-select" name="option" id="yearSelector">
    <option value="" disabled selected>Select a Year</option>
    <option value="2017" >2017</option>
    <option value="2016" >2016</option>
    <option value="2015" >2015</option>
</select>

<jsp:include page="../components/courseList.jsp"/>

<div id="studentSelector">
<jsp:include page="../components/listStudentsWithClassFilter.jsp"/>
</div>

<br><br>
<div>
    <button onclick="onRegisterClick()" type="button" class="w3-btn w3-teal">Register</button>
</div>


<script>
    function onRegisterClick() {
        var studArr = [];
        $("#studentSelector input[type=checkbox]").each(function () {
            if (this.checked) {
                studArr.push(this.id);
            }
        });

        $.post('RegisterStudents', {
                studArr: studArr,
                year: $('#yearSelector').val(),
                course: $('#courseSelector').val()
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