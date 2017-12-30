<%@ page import="util.Helper" %>
<%@ page import="entity.*" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="java.util.*" %>

<div id="chartContainer" style="min-width: 300px; height: 400px; margin: 0 auto"></div>


<%
    Helper helper = new Helper();
    User user = helper.getUser(request);
    List<Entity> teachersList = EntityManager.getEntities(Teacher.class,user.getSchool());
    HashMap<Integer,Integer> teacherAllocationMap = new HashMap<Integer,Integer>();

    for(Entity ent : teachersList){
        Teacher teacher = (Teacher) ent;
        teacherAllocationMap.put(teacher.getTeacherId(), 0);
    }

    try{
    Set<TimeTable> timeTableSet =  helper.createAllocationTable(user.getSchool());
    HashMap<Integer, HashMap<String,Period>> classTimeTableMap = helper.createTimeTable(timeTableSet);
    List<Entity> classRoomSet= EntityManager.getEntities(ClassRoom.class, user.getSchool());
%>
<%
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

                    if(classPeriod != null){
                        int cnt = teacherAllocationMap.get(classPeriod.getTeacher().getTeacherId());
                        teacherAllocationMap.put(classPeriod.getTeacher().getTeacherId(), cnt+1);
                    }


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



<script>

    var dataArr = [];
    <%
    for(Integer key :teacherAllocationMap.keySet()){


    %>
        dataArr.push(["<%=key%>",<%=teacherAllocationMap.get(key)%>]);
    <%
    }
    %>
    Highcharts.chart('chartContainer', {
        chart: {
            type: 'column'
        },
        title: {
            text: 'World\'s largest cities per 2014'
        },
        subtitle: {
            text: 'Source: <a href="http://en.wikipedia.org/wiki/List_of_cities_proper_by_population">Wikipedia</a>'
        },
        plotOptions: {
            column: {
                zones: [{
                    value: 10, // Values up to 10 (not including) ...
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
                text: 'Population (millions)'
            }
        },
        legend: {
            enabled: false
        },
        tooltip: {
            pointFormat: 'Population in 2008: <b>{point.y:.1f} millions</b>'
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


