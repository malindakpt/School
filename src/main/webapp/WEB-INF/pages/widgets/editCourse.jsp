<%@ page import="entity.Subject" %>
<%@ page import="entity.Entity" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Course" %>
<%@ page import="util.Helper" %>
<%@ page import="entity.User" %>

<div id="addCourseInputs">
<%
    Helper helper = new Helper();
    User user = helper.getUser(request);
    String courseId = request.getParameter("courseId");
    Course course = (Course) EntityManager.getEntity(Course.class,"courseId",courseId);
    List<Entity> entityList = EntityManager.getEntities(Subject.class, user.getSchool());
%>
    <h3><%=course.getName()%></h3>
<%
    for (Entity subjectEntity : entityList) {
        Subject subject = (Subject) subjectEntity;
%>
<div style="width: 33%; float: left;">
    <input id="<%=subject.getSubjectId()%>" type="checkbox" class="w3-check inputSubjectList"  <%=helper.isCourseHaveSubject(course,subject)?"checked":""%>/>
    <input id="cnt<%=subject.getSubjectId()%>" type="number" class="w3-input inputSubjectList" value="<%=helper.getNoOfPeriodsForClurseSubject(course,subject)%>"/>
    <label><%= subject.getCode() + " " + subject.getName()%>
    </label>
</div>
<%
    }
%>
</div>
<button class="w3-button w3-green btn-right" onclick="saveEditedCourse()">Edit Course</button>

<script>
    function saveEditedCourse(){
        var subList = [];
        var subjectCountList = [];

        $("#addCourseInputs input[type=checkbox]").each(function () {
            if (this.checked) {
                subList.push(this.id);
                subjectCountList.push($('#cnt'+this.id).val());
            }
        });
        $.post('AddCourseSubjects', {
                name: $('#addCourseName').val(),
                subjectList: subList,
                subjectCountList:subjectCountList,
                courseId:<%=courseId%>,
                t56:t56
            },
            function (result) {
                if (result === "") {
                    alert("Success " + result);
                } else {
                    console.log("Error response");
                }

            }).fail(function () {
                alert("error");
            }
        );
    }
</script>



<p class="wid-id">editCourse</p>