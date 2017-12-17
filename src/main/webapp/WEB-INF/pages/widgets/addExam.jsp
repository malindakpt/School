<label>Exam Name</label>
<input class="w3-input" type="text" id="examName">

<br>
<br>
<label>Year</label>
<input class="w3-input" type="text" id="examYear">
<br>
<br>

<button class="w3-button w3-black" style="float: right" onclick="addExam()">Add Exam</button>



<script>
    function addExam() {
        var name = $('#examName').val();
        var year = $('#examYear').val();

        $.post('AddExam', {
                name: name,
                year: year
            },
            function (result) {
                alert("Success " + result);

            }).fail(function () {
                alert("error");
            }
        );
    }
</script>

