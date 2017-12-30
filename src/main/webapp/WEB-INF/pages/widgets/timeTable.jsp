<%@ page import="util.Helper" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.*" %>
<%@ page import="entityManager.EntityManager" %>


<%
    Helper helper = new Helper();
    User user = helper.getUser(request);
    try{
    Set<TimeTable> timeTableSet =  helper.createAllocationTable(user.getSchool());
//    List<HashMap<String, Period>> classTimeTableList = helper.createTimeTable(timeTableSet);
    HashMap<Integer, HashMap<String,Period>> classTimeTableMap = helper.createTimeTable(timeTableSet);
    List<Entity> classRoomSet= EntityManager.getEntities(ClassRoom.class, user.getSchool());
%>
<%
//    for(HashMap<String, Period> classAllocation : classTimeTableList){
    for(Entity entity : classRoomSet){
        ClassRoom classRoom = (ClassRoom)entity;
        HashMap<String,Period> classTimeTable = classTimeTableMap.get(classRoom.getClassRoomId());
        Course course = (Course) EntityManager.getEntity(Course.class,"courseId",classRoom.getCurrentCourseId()+"");
%>

<h2><%=course.getName()+"-"+classRoom.getClassRoomName()%></h2>

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
                    String key1 = classRoom.getClassRoomId()+"-"+d+"-"+s;
                    Period classPeriod = classTimeTable.get(key1);
        %>
            <td><%=classPeriod != null ? classPeriod.getSubject().getName()+": T"+classPeriod.getTeacher().getTeacherId():"--"%></td>
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






<%--<table class="w3-table-all">--%>
    <%--<tr  class="w3-black">--%>
        <%--<th>Class Room</th>--%>
        <%--<th>Subject</th>--%>
        <%--<th>Teacher</th>--%>
    <%--</tr>--%>
<%--<%--%>
    <%--for( TimeTable timeTable: timeTableSet){--%>
        <%--for(Period period: timeTable.getPeriods()){--%>
<%--%>--%>
    <%--<tr><td><%=period.getClassRoom().getGrade()+"-"+period.getClassRoom().getClassRoomName()%><td> <%=period.getSubject().getName()%></td><td><%=period.getTeacher().getFirstName()%></tr>--%>
<%--<%--%>
        <%--}--%>
    <%--}--%>
<%--%>--%>


<%--</table>--%>

<%
    }catch (Exception e){
%>
    <h3><%=e.getMessage()%></h3>
<%
    }
%>


