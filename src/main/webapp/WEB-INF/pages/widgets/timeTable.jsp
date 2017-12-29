<%@ page import="util.Helper" %>
<%@ page import="entity.User" %>
<%@ page import="entity.TimeTable" %>
<%@ page import="java.util.Set" %>
<%@ page import="entity.Period" %>
<%@ page import="entity.Exam" %>


<%
    Helper helper = new Helper();
    User user = helper.getUser(request);
    try{
    Set<TimeTable> timeTableSet =  helper.createTimeTable(user.getSchool());
%>

<table class="w3-table-all">
    <tr  class="w3-grey">
        <th>Class Room</th>
        <th>Subject</th>
        <th>Teacher</th>
    </tr>
<%
    for( TimeTable timeTable: timeTableSet){
        for(Period period: timeTable.getPeriods()){
%>
    <tr><td><%=period.getClassRoom().getClassRoomName()%><td> <%=period.getSubject().getName()%></td><td><%=period.getTeacher().getFirstName()%></tr>
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


