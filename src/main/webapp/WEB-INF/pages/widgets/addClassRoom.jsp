<div>
    <div class="w3-container widget-header">
        <h4>Add nSubject</h4>
    </div>
    <form class="w3-container">
        <br>
        <label>Batch</label>
        <input class="w3-input" type="text" id="batch">
        <label>Grade</label>
        <input class="w3-input" type="text" id="grade">
        <label>Class Name</label>
        <input class="w3-input" type="text" id="name">
        <label>Class Teacher</label>
        <input class="w3-input" type="text" id="teacher">


        <button onclick="saveSubject()" type="button" class="w3-button w3-theme button-ok"><i class="fa fa-pencil"></i>
             Save
        </button>
    </form>
</div>


<script>
    function saveSubject() {
        $.post('AddSubject', {
                code: $('#code').val(),
                name: $('#name').val(),
            },
            function (result) {
                if (result === "") {
                    alert("Success");
                } else {
                    alert("Error");
                }

            }).fail(function () {
                alert("error");
            }
        );
    }
</script>

