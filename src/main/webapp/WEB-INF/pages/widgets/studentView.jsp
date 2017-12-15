<%@ page import="entity.Student" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Assesment" %>
<h2>Student ID = <%=request.getParameter("id")%></h2>
<% Student student = (Student) EntityManager.getEntity(Student.class,"StudentId",request.getParameter("id")); %>
<h3><%=student.getClassRoom().getClassRoomName()%></h3>

<% for(Assesment assesment : student.getAssesments()){%>
     <div><%=assesment.getMarks()   %></div>
<%}%>
<jsp:include page="../components/studentYearRegistrations.jsp"/>
<br>
<br>
<div id = "subjectListView"></div>
<br>
<br>
<div id="chartContainer"></div>

<script>

     function onSubjectChange() {

     }
     function onYearRegistrationChange() {
         w3_close();
         busyOn();
         $.post('CompSubjectListInRegistration?id='+$('#registrationSelector').val(), {},
             function (result) {
                 $('#subjectListView').html(result);
                 busyOff();
             }).fail(function (result) {
                 $('#marksClassStudents').html(result);
                 busyOff();
             }
         );
     }

    function onSubjectChange() {
        w3_close();
        busyOn();
        $.post('PageListStudentsMarks?classRoomId='+$('#classSelector').val(), {},
            function (result) {
                $('#marksClassStudents').html(result);
                busyOff();
            }).fail(function (result) {
                $('#marksClassStudents').html(result);
                busyOff();
            }
        );
    }

    var test="Malinda";
    Highcharts.chart('chartContainer', {

        title: {
            text: 'Solar Employment Growth by Sector, 2010-2016'
        },

        subtitle: {
            text: 'Source: thesolarfoundation.com'
        },

        yAxis: {
            title: {
                text: 'Number of Employees'
            }
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle'
        },

        plotOptions: {
            series: {
                label: {
                    connectorAllowed: false
                },
                pointStart: 2010
            }
        },

        series: [{
            name: 'Installation',
            data: [43934, 52503, 57177, 69658, 97031, 119931, 137133, 154175]
        }, {
            name: 'Manufacturing',
            data: [24916, 24064, 29742, 29851, 32490, 30282, 38121, 40434]
        }, {
            name: 'Sales & Distribution',
            data: [11744, 17722, 16005, 19771, 20185, 24377, 32147, 39387]
        }, {
            name: 'Project Development',
            data: [null, null, 7988, 12169, 15112, 22452, 34400, 34227]
        }, {
            name: 'Other',
            data: [12908, 5948, 8105, 11248, 8989, 11816, 18274, 18111]
        }],

        responsive: {
            rules: [{
                condition: {
                    maxWidth: 500
                },
                chartOptions: {
                    legend: {
                        layout: 'horizontal',
                        align: 'center',
                        verticalAlign: 'bottom'
                    }
                }
            }]
        }

    });
</script>