<%@ page import="entity.Teacher" %>
<%@ page import="java.util.Set" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Entity" %>
<%@ page import="entity.User" %>
<%@ page import="util.Helper" %>
<div>

      <div class="w3-container widget-header">
        <h4>Add Class Room batch</h4>
    </div>
    <div class="w3-container">
        <br>
        <label>Batch</label>
        <input class="w3-input" type="text" id="batch">
        <%--<label>Grade</label>--%>
        <%--<input class="w3-input" type="text" id="grade">--%>
        <label>Class Name/ (A,B...Maths1, Bio2)</label>
        <input class="w3-input" type="text" id="classRoomName">

        <br>
        <%
            String session4 = request.getParameter("t56");
        %>
        <jsp:include page="../components/teacherSelector.jsp?t56=<%=session4%>"/>
        <%--<jsp:include page="../components/teacherSelector.jsp?t56=<%=request.getParameter("t56")%>"/>--%>
        <button class="w3-button w3-red btn-right" onclick="save()">Add Batch</button>
    </div>
</div>


<script>
    function save() {
        $.post('AddClassRoom', {
                batch: $('#batch').val(),
                grade: $('#grade').val(),
                classRoomName: $('#classRoomName').val(),
                classTeacher: $('#teacherSelector').val(),
                t56:t56
            },
            function (result) {
                if (result === "") {
                    alert("Success");
                } else {
                    alert("Error"+result);
                }

            }).fail(function () {
                alert("error");
            }
        );
    }
</script>

<p class="wid-id">addClassRoom</p>

