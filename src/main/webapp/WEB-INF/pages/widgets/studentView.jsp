<%@ page import="entity.Student" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Assesment" %>
<h3>Student ID = <%=request.getParameter("id")%></h3>

<br>
<br>
<div id = "subjectListView"></div>
<br>
<br>
<div id="chartContainer"></div>

<script>




    function onSubjectChange() {
        w3_close();
        busyOn();
        $.post('GetMarksForAssessment', {
                studentId: 5,
                subjectId: $('#subjectSelector').val(),
                regId:$('#registrationSelector').val()
            },
            function (result) {
//               alert(result);
                drawChart(result);
                busyOff();
            }).fail(function (result) {
//                $('#marksClassStudents').html(result);
                busyOff();
            }
        );
    }

   function drawChart(result) {
       console.log(result);
       var marks = result.split(",")
       var marksInt = [];
       marks.forEach(function(element) {
           marksInt.push(Number(element));
       });

       Highcharts.chart('chartContainer', {

           title: {
               text: ''
           },

           subtitle: {
               text: 'Subject Marks from the year start'
           },

           yAxis: {
               title: {
                   text: 'Marks for the assessment'
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
                   pointStart: 1
               }
           },

           series: [{
               name: '',
               data: marksInt
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
   }
</script>