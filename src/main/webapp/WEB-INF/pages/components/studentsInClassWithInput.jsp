<%@ page import="entity.Entity" %>
<%@ page import="entity.Student" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.User" %>
<%@ page import="util.Helper" %>
<%@ page import="entity.examination.Assesment" %>

<%
    User user = new Helper().getUser(request);

%>
<br>
<div style="overflow-x:auto; clear: both;">

<table class="w3-table w3-striped">


<%
    int subjectId = -1;
    int examId = -1;
    try {
        subjectId = Integer.parseInt(request.getParameter("subjectId"));
        examId = Integer.parseInt(request.getParameter("examId"));
    }catch (Exception e){

    }

    List<Entity> students = EntityManager.getEntitySubList(Student.class,"classRoom.classRoomId",request.getParameter("classId"), user.getSchool());
    Integer totalArr[] = new Integer[10];
    for( int k=0; k < totalArr.length ; k++){
        totalArr[k] = 0;
    }
    boolean headersCreated = false;
//    int stud = -1;
    for (Entity item : students) {
//        stud++;
        Student student = (Student) item;

        Assesment assesment = new Assesment();
        assesment.setAssesmentId(-1);

        for (Assesment ass :student.getAssesments()) {
            if (ass.getSubject().getSubjectId() == subjectId && ass.getExam().getExamId() == examId ){
                assesment = ass;
                %>
                <script></script>
                <%
            }
        }
%>

<%
    if(!headersCreated){
%>
    <tr>
        <th style=" min-width: 150px;">Student Name</th>
        <th>Total Marks</th>

        <th><input id="marks1Name" value=<%= assesment.getMark1Name() != null ? assesment.getMark1Name() : "Question1" %> ></th>
        <th><input id="marks2Name" value=<%= assesment.getMark2Name() != null ? assesment.getMark2Name() : "Question2" %> ></th>
        <th><input id="marks3Name" value=<%= assesment.getMark3Name() != null ? assesment.getMark3Name() : "Question3" %> ></th>
        <th><input id="marks4Name" value=<%= assesment.getMark4Name() != null ? assesment.getMark4Name() : "Question4" %> ></th>
        <th><input id="marks5Name" value=<%= assesment.getMark5Name() != null ? assesment.getMark5Name() : "Question5" %> ></th>
        <th><input id="marks6Name" value=<%= assesment.getMark6Name() != null ? assesment.getMark6Name() : "Question6" %> ></th>
        <th><input id="marks7Name" value=<%= assesment.getMark7Name() != null ? assesment.getMark7Name() : "Question7" %> ></th>
        <th><input id="marks8Name" value=<%= assesment.getMark8Name() != null ? assesment.getMark8Name() : "Question8" %> ></th>
        <th><input id="marks9Name" value=<%= assesment.getMark9Name() != null ? assesment.getMark9Name() : "Question9" %> ></th>
        <th><input id="marks10Name" value=<%= assesment.getMark10Name() != null ? assesment.getMark10Name() : "Question10" %> ></th>
        <th  style="display: none"></th>

    </tr>

<%
        headersCreated = true;
    }
%>


    <tr>
    <td>
        <%= student.getFirstName() + " " + student.getLastName()+"("+student.getStudentId()+")"%>
    </td>
    <td>
        <input value="<%=assesment.getMarks() == 0 ? "" : assesment.getMarks()%>"  class="w3-input" type="number" rel="mainMarks" id="<%=student.getStudentId()%>">
    </td>
    <td>
        <%
            totalArr[0] += assesment.getMark1();
        %>
        <input value="<%=assesment.getMark1() == 0 ? "" : assesment.getMark1()%>"  class="w3-input" type="number" id="q1-<%=student.getStudentId()%>">
    </td>
    <td>
        <%
            totalArr[1] += assesment.getMark2();
        %>
        <input value="<%=assesment.getMark2() == 0 ? "" : assesment.getMark2()%>"  class="w3-input" type="number" id="q2-<%=student.getStudentId()%>">
    </td>
    <td>
        <%
            totalArr[2] += assesment.getMark3();
        %>
        <input value="<%=assesment.getMark3() == 0 ? "" : assesment.getMark3()%>"  class="w3-input" type="number" id="q3-<%=student.getStudentId()%>">
    </td>
    <td>
        <%
            totalArr[3] += assesment.getMark4();
        %>
        <input value="<%=assesment.getMark4() == 0 ? "" : assesment.getMark4()%>"  class="w3-input" type="number" id="q4-<%=student.getStudentId()%>">
    </td>
    <td>
        <%
            totalArr[4] += assesment.getMark5();
        %>
        <input value="<%=assesment.getMark5() == 0 ? "" : assesment.getMark5()%>"  class="w3-input" type="number" id="q5-<%=student.getStudentId()%>">
    </td>
    <td>
        <%
            totalArr[5] += assesment.getMark6();
        %>
        <input value="<%=assesment.getMark6() == 0 ? "" : assesment.getMark6()%>"  class="w3-input" type="number" id="q6-<%=student.getStudentId()%>">
    </td>
    <td>
        <%
            totalArr[6] += assesment.getMark7();
        %>
        <input value="<%=assesment.getMark7() == 0 ? "" : assesment.getMark7()%>"  class="w3-input" type="number" id="q7-<%=student.getStudentId()%>">
    </td>
    <td>
        <%
            totalArr[7] += assesment.getMark8();
        %>
        <input value="<%=assesment.getMark8() == 0 ? "" : assesment.getMark8()%>" class="w3-input" type="number" id="q8-<%=student.getStudentId()%>">
    </td>
    <td>
        <%
            totalArr[8] += assesment.getMark9();
        %>
        <input value="<%=assesment.getMark9() == 0 ? "" : assesment.getMark9()%>"  class="w3-input" type="number" id="q9-<%=student.getStudentId()%>">
    </td>
    <td>
        <%
            totalArr[9] += assesment.getMark10();
        %>
        <input value="<%=assesment.getMark10() == 0 ? "" : assesment.getMark10()%>"  class="w3-input" type="number" id="q10-<%=student.getStudentId()%>">
    </td>
    <td style="display: none">
        <input disabled value="<%=assesment.getAssesmentId()%>" id="assID-<%=student.getStudentId()%>">
    </td>
</tr>
<%
    }
%>
 <script> var dataArr = []; </script>

 <tr>
     <td>Average Marks</td>
     <td></td>
     <%
         for( int m=0;  m<totalArr.length && students.size()>0 ; m++){
     %>
     <script>
         var name = $('#marks<%=m+1%>Name').val();
         dataArr.push([name,<%=totalArr[m]/students.size()%>]);
     </script>

     <td style="font-weight: bold"><%=totalArr[m]/students.size()%>%</td>
     <%
         }
     %>

 </tr>
</table>
</div>
<div id="chartContainer"/>

<script>

    Highcharts.chart('chartContainer', {
        chart: {
            type: 'column'
        },
        title: {
            text: 'Performance for the lessons'
        },
        credits: {
            enabled: false,
        },
        plotOptions: {
            column: {
                zones: [{
                    value: 13, // Values up to 10 (not including) ...
                    color: 'blue' // ... have the color blue.
                },{
                    color: 'red' // Values from 10 (including) and up have the color red
                }]
            }
        },
        xAxis: {
            type: 'category',
            labels: {
                rotation: -45,
                style: {
                    fontSize: '13px',
                    fontFamily: 'Verdana, sans-serif'
                }
            }
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Number Of Allocated Periods'
            }
        },
        legend: {
            enabled: false
        },
        tooltip: {
            pointFormat: 'Average Marks<b>{point.y:.1f} </b>'
        },
        series: [{
            name: 'Population',
            data: dataArr,
            dataLabels: {
                enabled: true,
                rotation: -90,
                color: '#FFFFFF',
                align: 'right',
                format: '{point.y:.1f}', // one decimal
                y: 10, // 10 pixels down from the top
                style: {
                    fontSize: '13px',
                    fontFamily: 'Verdana, sans-serif'
                }
            }
        }]
    });
</script>



