<div>
    <%--<div class="w3-container widget-header">--%>
        <%--<h4>Add a new Location</h4>--%>
    <%--</div>--%>
    <div class="w3-container">
        <br>
        <label>Location Name</label>
        <input class="w3-input" type="text" id="name">
        <label>Description</label>
        <input class="w3-input" type="text" id="description">
        <br><br>
        <label><b>Select Owner</b></label>
        <jsp:include page="../components/teacherSelector.jsp"/>



        <button onclick="saveLocation()" type="button" class="w3-button w3-green btn-right">Save</button>
    </div>
</div>


<script>
    function saveLocation() {
        $.post('AddLocation', {
                name: $('#name').val(),
                description: $('#description').val(),
                owner: $('#teacherSelector').val(),

                t56: t56
            },
            function (result) {
                var resArr = result.split("##");
                if (resArr[0] === "") {
                    alert("Success");
                } else {
                    alert(resArr[1]);
                }

            }).fail(function () {
                alert("Error");
            }
        );
    }
</script>


<p class="wid-id">addLocation</p>

