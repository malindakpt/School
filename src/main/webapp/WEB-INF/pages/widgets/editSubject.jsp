<%@ page import="entity.Subject" %>
<%@ page import="entityManager.EntityManager" %>
<div>
    <%
        String subjectId = request.getParameter("subjectId");
        Subject subject = (Subject) EntityManager.getEntity(Subject.class,"subjectId", subjectId);
    %>
    <jsp:include page="../components/header.jsp?header=Create a New Subject"/>

    <div class="w3-container">
        <br>
        <label>Code</label>
        <input class="w3-input" type="text" id="code" value="<%=subject.getCode()%>">
        <label>Name</label>
        <input class="w3-input" type="text" id="name" value="<%=subject.getName()%>">

        <button onclick="saveSubject()" class="w3-button w3-green btn-right">Edit Subject</button>
    </div>
</div>

<%
    String session4 = request.getParameter("t56");
%>



<script>

    var subjectId = "<%=subject.getSubjectId()%>";
    function saveSubject() {
        $.post('EditSubject', {
                subjectId: subjectId,
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

