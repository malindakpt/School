<div>
    <div class="w3-container widget-header">
        <h4>Add nSubject</h4>
    </div>
    <form class="w3-container">
        <br>
        <label>Code</label>
        <input class="w3-input" type="text" id="code">
        <label>Name</label>
        <input class="w3-input" type="text" id="name">

        <button onclick="saveSubject()" type="button" class="w3-button w3-theme button-ok"><i class="fa fa-pencil"></i>
             Save
        </button>
    </form>
</div>

<%
    String session4 = request.getParameter("t56");
%>
<jsp:include page="listSubjects.jsp?t56=<%=session4%>"/>


<script>
    function saveSubject() {
        $.post('AddSubject', {
                code: $('#code').val(),
                name: $('#name').val(),
                t56:t56
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


<p class="wid-id">addSubjects</p>

