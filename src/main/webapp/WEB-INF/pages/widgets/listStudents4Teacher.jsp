<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Entity" %>
<%@ page import="entity.User" %>
<%@ page import="util.Helper" %>

<div class="w3-container">
    <div class="w3-responsive">

        <%
            String t56 = request.getParameter("t56");
        %>
        <jsp:include page="../components/listStudentsWithTeacherClassFilter2.jsp?t56=<%=t56%>"/>

    </div>
</div>
<script>
    function showReportCards() {

    }
</script>



<p class="wid-id">listStudents4Teacher</p>


