<%@ page import="entity.Entity" %>
<%@ page import="java.util.List" %>
<%@ page import="entityManager.EntityManager" %>
<jsp:include page="../components/header.jsp">
    <jsp:param name="header" value="What You Need To Do ?" />
</jsp:include>

<div class="w3-container">
    <ul class="w3-ul w3-card-4">
        <jsp:include page="../components/dashBoardIcon.jsp?function=viewStudents&icon=fa-users&line1=View Students&line2=Look at the progress of the students"/>
        <jsp:include page="../components/dashBoardIcon.jsp?function=markAttendance&icon=fa-sort-amount-desc&line1=Mark Attendance&line2=Look at the progress of the students"/>
        <jsp:include page="../components/dashBoardIcon.jsp?function=enterMarks&icon=fa-asterisk&line1=Enter Marks&line2=Look at the progress of the students"/>
        <jsp:include page="../components/dashBoardIcon.jsp?function=createExam&icon=fa-book&line1=Create an Exam&line2=Look at the progress of the students"/>
    </ul>
</div>


<script>
    function viewStudents() {
//        alert("viewStudents")
        getAndSetPage("PageListStudents4Teacher?t56="+t56);
    }
    function markAttendance() {
        getAndSetPage("PageMarkAttendance?t56="+t56);
    }
    function enterMarks() {
        getAndSetPage('PageAddExamMarks?t56='+t56);
    }
    function createExam() {
        getAndSetPage('PageAddExam?t56='+t56);
    }
</script>


