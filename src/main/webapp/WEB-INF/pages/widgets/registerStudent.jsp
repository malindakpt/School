


<div id="studentSelector">
<jsp:include page="../components/classRoomSelector.jsp"/>
</div>
<jsp:include page="../components/courseSelector.jsp"/>
<br><br>
<div>
    <button onclick="onRegisterClick()" type="button" class="w3-btn w3-teal">Register</button>
</div>


<script>
    function onRegisterClick() {
        var studArr = [];
//        $("#studentSelector input[type=checkbox]").each(function () {
//            if (this.checked) {
//                studArr.push(this.id);
//            }
//        });

        $.post('RegisterStudents', {
//                studArr: studArr,
//                year: $('#yearSelector').val(),
                courseId: $('#courseSelector').val(),
                classId: $('#classSelector').val()
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

    function onCourseChange () {
        
    }
    function onClassRoomChange() {
        
    }
</script>