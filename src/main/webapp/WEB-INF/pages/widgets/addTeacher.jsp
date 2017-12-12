<%@ page import="entity.Entity" %>
<%@ page import="java.util.List" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Subject" %>
<div>
    <div class="w3-container widget-header">
        <h4>Teacher</h4>
    </div>
    <form class="w3-container">
        <br>
        <label>First Name</label>
        <input class="w3-input" type="text" id="firstName">
        <label>Last Name</label>
        <input class="w3-input" type="text" id="lastName">
        <label>Full Name</label>
        <input class="w3-input" type="text" id="fullName">
        <label>Birthday</label>
        <input class="w3-input" type="date" id="birthday">
        <label>Address</label>
        <input class="w3-input" type="text" id="address">
        <label>Phone</label>
        <input class="w3-input" type="text" id="phone">

        <label>NIC</label>
        <input class="w3-input" type="text" id="nic">



        <button onclick="saveTeacher()" type="button" class="w3-button w3-theme button-ok"><i class="fa fa-pencil"></i>
             Save
        </button>
    </form>
</div>


<script>
    function saveTeacher() {
        $.post('AddTeacher', {
                firstName: $('#firstName').val(),
                lastName: $('#lastName').val(),
                fullName: $('#fullName').val(),
                birthday: $('#birthday').val(),
                address: $('#address').val(),
                phone: $('#phone').val(),

                nic: $('#nic').val(),

            },
            function (result) {
                if (result === "") {
                    alert("Success");
                } else {
                    alert("Error");
                }

            }).fail(function () {
                alert("error");
            }
        );
    }
</script>

