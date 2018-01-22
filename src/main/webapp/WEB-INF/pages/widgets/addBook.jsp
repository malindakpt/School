<div>
    <%--<div class="w3-container widget-header">--%>
        <%--<h4>Add a new Location</h4>--%>
    <%--</div>--%>
    <div class="w3-container">
        <br>
        <label>Name</label>
        <input class="w3-input" type="text" id="name">

        <br><br>
        <label><b>Select Category</b></label>
        <select class="w3-select" id="categorySelector">
            <option value="-1" selected disabled>- Select -</option>
            <option value="0" >Education</option>
            <option value="1" >Novel</option>
            <option value="2" >Short Story</option>
        </select>
        <br><br>
        <label>Code</label>
        <input class="w3-input" type="text" id="code">
        <br>
        <label>ISBN</label>
        <input class="w3-input" type="text" id="isbn">
        <br>
        <label>Auther</label>
        <input class="w3-input" type="text" id="auther">
        <br>
        <label>Publisher</label>
        <input class="w3-input" type="text" id="publisher">
        <br>
        <label>Description</label>
        <input class="w3-input" type="text" id="desc">

    <br>



        <button onclick="saveBook()" type="button" class="w3-button w3-green btn-right">Save</button>
    </div>
</div>


<script>
    function saveBook() {
        $.post('AddBook', {
                name: $('#name').val(),
                category: $('#categorySelector').val(),
                code: $('#code').val(),
                publisher: $('#publisher').val(),
                isbn: $('#isbn').val(),
                auther: $('#auther').val(),
                desc: $('#desc').val(),

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


<p class="wid-id">addInvenotryItem</p>

