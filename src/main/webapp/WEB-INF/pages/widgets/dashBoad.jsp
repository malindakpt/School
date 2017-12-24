<%
    String studentId = request.getParameter("studentId");
    String t56 = request.getParameter("t56");
%>
<jsp:include page="../components/courseSelector4Student.jsp?studentId=<%=studentId%>&t56=<%=t56%>"/>

<div class="w3-row">

    <div class="w3-container w3-twothird">
        <div id="chartContainer2" style="display: block"></div>
    </div>
    <div class="w3-container w3-third">
        <span class="w3-badge w3-large w3-padding w3-red">3rd</span>
        <span>place of last term test</span>

        <span style="float: right;">
            <span class="fa fa-star checked"></span>
            <span class="fa fa-star checked"></span>
            <span class="fa fa-star checked"></span>
            <span class="fa fa-star"></span>
            <span class="fa fa-star"></span>
            <div class="w3-tooltip">Teacher's Rating<span class="w3-text">(<em>avg. of 100 teachers</em>)</span></div>
        </span>
        <div class="w3-container">
            <%--<h2>Avatar List</h2>--%>
            <p>Recent comments from teachers</p>
                <div class="w3-panel w3-pale-red w3-leftbar w3-border-red">
                    <p>continues absent for last 3 sports practice sessions</p>
                </div>
                <div class="w3-panel w3-pale-green w3-leftbar w3-border-green">
                    <p>Class Highscore for monthly test for Maths</p>
                </div>
                <div class="w3-panel w3-pale-blue w3-leftbar w3-border-blue">
                    <p>Homeworks are incomplete for 3 days</p>
                </div>
        </div>

    </div>
</div>

<script>


    function onCourseChange() {

    }



    function drawChart() {

        var result3 = "94,86,85,80,79,89,90,88,83,86,88,85,94,86,93,94,81,93,76,82,87,88,89,81,96,84,86,88,96,85,98,89,89,87,99,85,84,94,99,93,92";
        var result1 = "74,76,75,75,75,69,70,68,53,56,58,65,64,66,63,64,61,63,66,62,67,68,69,71,76,74,76,78,66,85,90,86,85,87,77,88,94,96,77,98,95";
        var result2 = "70,70,71,61,65,60,65,68,63,66,68,65,64,66,63,54,61,63,60,62,67,66,55,49,56,64,56,58,56,55,51,50,55,51,45,48,44,46,47,48,45";

        var marks1 = result1.split(",");
        var marks2 = result2.split(",");
        var marks3 = result3.split(",");

        var marksInt1 = [];
        var marksInt2 = [];
        var marksInt3 = [];
        marks1.forEach(function (element) {
            marksInt1.push(Number(element));
        });
        marks2.forEach(function (element) {
            marksInt2.push(Number(element));
        });
        marks3.forEach(function (element) {
            marksInt3.push(Number(element));
        });

        Highcharts.chart('chartContainer2', {

            title: {
                text: ''
            },

            subtitle: {
                text: 'Main 3 subjects marks from the 2017 Jan'
            },

            yAxis: {
                title: {
                    text: 'Marks for the assessment out of hundred'
                },
                min: 0,
                max: 100
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
                    pointStart: 1,
                    marker: {
                        enabled: false
                    }
                }
            },

            series: [{
                name: 'English',
                data: marksInt1
            },
                {
                    name: 'Maths',
                    data: marksInt2,
                    color: '#FF0000'
                }, {
                    name: 'Science',
                    data: marksInt3
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
    setTimeout(drawChart(), 3000);

</script>

<p class="wid-id">dashBoad</p>