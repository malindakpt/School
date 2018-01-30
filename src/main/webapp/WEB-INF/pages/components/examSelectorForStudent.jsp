<%@ page import="entity.Entity" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.examination.Exam" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Student" %>
<%@ page import="entity.examination.Assesment" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashSet" %>
<%
    String studentId = request.getParameter("studentId");
    Student student = (Student) EntityManager.getEntity(Student.class,"studentId",studentId);
    Set<Exam> examSet = new HashSet<Exam>();
    for(Assesment assesment: student.getAssesments()){
        if(assesment.getExam() != null){
            examSet.add(assesment.getExam());
        }
    }
//    List<Entity> entityList = EntityManager.getEntities(Exam.class);
%>
<select class="w3-select" name="option" id="examSelector" onchange="onExamChange()">
    <option value="" disabled selected>Select an Examination</option>
    <%
        for (Entity exa : examSet) {
            Exam exam = (Exam) exa;
    %>
    <option value="<%=exam.getExamId()%>"><%=exam.getYear() + " " + exam.getName()%>
    </option>
    <%
        }
    %>
</select>
