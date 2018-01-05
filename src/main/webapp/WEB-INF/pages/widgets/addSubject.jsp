<div>
    <jsp:include page="../components/header.jsp?header=Create a New Subject"/>

    <div class="w3-container">
        <button onclick="getAndSetPage('PageSubjectTeacher')" class="w3-button w3-blue btn-right">Allocate Subject Teachers</button>
        <br>
        <br>
        <label>Code</label>
        <input class="w3-input" type="text" id="code">
        <label>Name</label>
        <input class="w3-input" type="text" id="name">

        <button onclick="saveSubject()" class="w3-button w3-green btn-right">Create Subject</button>
    </div>
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

