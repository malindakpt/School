<jsp:include page="../components/header.jsp">
    <jsp:param name="header" value="What You Need To Do ?" />
</jsp:include>


<div class="w3-container">
    <ul class="w3-ul w3-card-4">

        <jsp:include page="../components/dashBoardIcon.jsp?icon=fa-bug&line1=View Students&line2=Look at the progress of the students"/>
        <jsp:include page="../components/dashBoardIcon.jsp?icon=fa-bullseye&line1=Mark Attendance&line2=Look at the progress of the students"/>
        <jsp:include page="../components/dashBoardIcon.jsp?icon=fa-asterisk&line1=Enter Marks&line2=Look at the progress of the students"/>
        <jsp:include page="../components/dashBoardIcon.jsp?icon=fa-deafness&line1=Create an Exam&line2=Look at the progress of the students"/>
    </ul>
</div>


<script>
    function load() {
        alert("loaded")
    }
</script>


