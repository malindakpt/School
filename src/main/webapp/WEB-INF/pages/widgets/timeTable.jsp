<%@ page import="util.Helper" %>
<%@ page import="entity.User" %>
<%@ page import="entity.TimeTable" %>
<%@ page import="java.util.Set" %>
<%@ page import="entity.Period" %>
<%@ page import="entity.Exam" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>


<%
    Helper helper = new Helper();
    User user = helper.getUser(request);
    try{
    Set<TimeTable> timeTableSet =  helper.createAllocationTable(user.getSchool());
    List<HashMap<String, Period>> classTimeTableList = helper.createTimeTable(timeTableSet);
%>
<%
    for(HashMap<String, Period> classAllocation : classTimeTableList){
%>
    <table class="w3-table-all">
        <tr  class="w3-blue">
            <th>Monday</th>
            <th>Tuesday</th>
            <th>Wednesday</th>
            <th>Thursday</th>
            <th>Friday</th>
        </tr>
        <%
            for( int s=0 ;s<8;s++){
        %>
        <tr>
        <%
                for( int d=0 ;d<5;d++){
        %>
            <td><%=classAllocation.get(s+"-"+d)!=null?classAllocation.get(s+"-"+d).getSubject().getName()+": T"+classAllocation.get(s+"-"+d).getTeacher().getTeacherId():"--"%></td>
        <%
                }
        %>
        </tr>
        <%
            }
        %>


    </table>
    <br>
<%
    }
%>
<br>






<table class="w3-table-all">
    <tr  class="w3-black">
        <th>Class Room</th>
        <th>Subject</th>
        <th>Teacher</th>
    </tr>
<%
    for( TimeTable timeTable: timeTableSet){
        for(Period period: timeTable.getPeriods()){
%>
    <tr><td><%=period.getClassRoom().getGrade()+"-"+period.getClassRoom().getClassRoomName()%><td> <%=period.getSubject().getName()%></td><td><%=period.getTeacher().getFirstName()%></tr>
<%
        }
    }
%>


</table>

<%
    }catch (Exception e){
%>
    <h3><%=e.getMessage()%></h3>
<%
    }
%>


