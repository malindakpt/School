<%@ page import="entity.Student" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.examination.Assesment" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Entity" %>
<%@ page import="entity.User" %>
<%@ page import="util.Helper" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="entity.examination.Exam" %>
<h3>Student Report Card</h3>
<%
    try{
    String studentId = request.getParameter("studentId");
    String examId = request.getParameter("examId");
    User user = new Helper().getUser(request);
    int total = 0;
    int subCount = 0;
%>

<div class="w3-container w3-twothird">
    <div class="w3-responsive">
        <table class="w3-table-all">
        <tr>
            <th>Subject</th>
            <th>Marks</th>
        </tr>
        <%
            if (examId != null && studentId != null) {
                Student student = (Student) EntityManager.getEntity(Student.class, "studentId", studentId);

                for (Assesment assesment : student.getAssesments()) {
                    if (assesment.getExam().getExamId() == Integer.parseInt(examId)) {
                        total = total + assesment.getMarks();
                        subCount++;
        %>
        <tr>
            <td>
                <%=assesment.getSubject().getName()%>
            </td>
            <td>
                <%=assesment.getMarks()%>
            </td>
        </tr>
        <%
                    }
                }
            }
        %>
    </table>
    </div>
</div>

<div class="w3-container w3-third">

    <h3 class="w3-blue" style="padding-left: 60px; margin: auto">

<%        List<HashMap> entities = EntityManager.getRankList(Integer.parseInt(examId), user.getSchool().getSchoolId());
         for(int y=1; y <= entities.size() ; y++){
             Integer id = (Integer) entities.get(y).get("studentId");
                if(id == Integer.parseInt(studentId)){
%>

                    Rank: <%=y%>

<%
            break;
                }
          }
%>
    </h3>
    <%--<h7>--%>
        <%--&lt;%&ndash;Average: <%=total/subCount%>&ndash;%&gt;--%>
    <%--</h7>--%>
</div>

<p class="wid-id">reportCard</p>


    <%
        }catch (Exception e){
            System.out.println("ERROR");
        }
    %>
