<%@ page import="entity.Subject" %>
<%@ page import="entity.Entity" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Course" %>
<%@ page import="util.Util" %>

<div id="addCourseInputs">
<%
    String courseId = request.getParameter("courseId");
    Course course = (Course) EntityManager.getEntity(Course.class,"courseId",courseId);


    List<Entity> entityList = EntityManager.getEntities(Subject.class);
%>
<%
    for (Entity subjectEntity : entityList) {
        Subject subject = (Subject) subjectEntity;
%>
<div style="width: 30%; float: left;">
    <input id="<%=subject.getSubjectId()%>" type="checkbox" class="w3-check"  <%=Util.isCourseHaveSubject(course,subject)?"checked":""%>/>
    <label><%= subject.getCode() + " " + subject.getName()%>
    </label>
</div>
<%
    }
%>
</div>
<button class="w3-button w3-red btn-right" onclick="saveEditedCourse()">Save Course</button>

<script>
    function saveEditedCourse(){
        var subList = [];
        $("#addCourseInputs input[type=checkbox]").each(function () {
            if (this.checked) {
                subList.push(this.id);
            }
        });
        $.post('AddCourseSubjects', {
                name: $('#addCourseName').val(),
                subjectList: subList,
                courseId:<%=courseId%>
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