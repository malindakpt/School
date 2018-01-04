<%@ page import="entity.Teacher" %>
<%@ page import="entityManager.EntityManager" %>
<div>
    <jsp:include page="../components/header.jsp?header=Edit Teacher"/>

    <%
        String teacherId = request.getParameter("teacherId");
        Teacher teacher = (Teacher) EntityManager.getEntity(Teacher.class, "teacherId", teacherId);
    %>
    <div class="w3-container">
        <br>

        <div class="w3-row">
            <div class="w3-half">
                <label>First Name</label>
                <input class="w3-input" type="text" id="firstName" value="<%=teacher.getFirstName()%>">
                <label>Last Name</label>
                <input class="w3-input" type="text" id="lastName" value="<%=teacher.getLastName()%>">
                <label>Full Name</label>
                <input class="w3-input" type="text" id="fullName" value="<%=teacher.getFullName()%>">
                <label>Birthday</label>
                <input class="w3-input" type="date" id="birthday" value="<%=teacher.getBirthday().toString().split(" ")[0]%>">
                <label>Address</label>
                <input class="w3-input" type="text" id="address" value="<%=teacher.getAddress()%>">
                <label>Phone</label>
                <input class="w3-input" type="text" id="phone" value="<%=teacher.getPhone()%>">
                <label>Available Periods</label>
                <input class="w3-input" type="number" id="availablePeriods"  value="<%=teacher.getAvailablePeriods()%>">

                <label>NIC</label>
                <input class="w3-input" type="text" id="nic" value="<%=teacher.getNic()%>">

                <jsp:include page="../components/imageUploader.jsp">
                    <jsp:param name="prev" value="<%=teacher.getImage()%>" />
                </jsp:include>

                <button onclick="editTeacher()" type="button" class="w3-button w3-green btn-right">Edit Teacher</button>
            </div>
            <div class="w3-half">
                <div id="chartView"></div>
            </div>
        </div>




    </div>
</div>


<script>


    var teacherId = "<%=teacher.getTeacherId()%>";

    function editTeacher() {
        $.post('EditTeacher', {
                teacherId: teacherId,
                firstName: $('#firstName').val(),
                lastName: $('#lastName').val(),
                fullName: $('#fullName').val(),
                birthday: $('#birthday').val(),
                address: $('#address').val(),
                phone: $('#phone').val(),
                nic: $('#nic').val(),
                image: $('#imgPreview').attr('src'),
                availablePeriods: $('#availablePeriods').val(),
                t56: t56,

            },
            function (result) {
                var resArr = result.split("##");
                if (resArr[0] === "") {
                    alert("Success");
                } else {
                    alert(resArr[1]);
                }

            }).fail(function () {
                alert("Error");
            }
        );
    }
</script>
<script>




    // Radialize the colors
//    Highcharts.setOptions({
//        colors: Highcharts.map(Highcharts.getOptions().colors, function (color) {
//            return {
//                radialGradient: {
//                    cx: 0.5,
//                    cy: 0.3,
//                    r: 0.7
//                },
//                stops: [
//                    [0, color],
//                    [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
//                ]
//            };
//        })
//    });



    Highcharts.chart('chartView', {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: 'Allocation of 2018'
        },
        credits: {
            enabled: false
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    distance: -30,

                    enabled: true,
                    format: '<b>{point.name}</b>',
                    style: {
                        color: 'white',
                        textOutline: 0,
//                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: [{
            name: 'Brands',
            colorByPoint: true,
            data: [{
                name: 'Grade 2',
                y: 5
            },
                {
                    name: 'Grade 1',
                    y: 8
                },
                {
                    name: 'Grade 3',
                    y: 5
                },
                {
                    name: 'Grade 4',
                    y: 4
                },
                {
                    name: 'Grade 2',
                    y: 10
                },
                {
                name: 'Free Periods',
                y: 24,
                sliced: true,
                selected: true
            }]
        }]
    });
</script>

<p class="wid-id">editTeacher</p>

