<%@ page import="util.Helper" %>
<%@ page import="entity.User" %>
<%@ page import="entity.Entity" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Payment" %>
<%@ page import="java.util.List" %>
<h3>Payments</h3>



<div class="w3-container">
    <div class="w3-row">
        <input type="date" class="w3-input w3-col m3"/>
        <div class="w3-col m1">-</div>

        <input type="date"  class="w3-input w3-col m3"/>
        <div class="w3-col m1">-</div>
        <button class="w3-col m2 w3-button w3-blue">Search</button>
    </div>

<br><br>

    <div class="w3-responsive">
        <table class="w3-table w3-striped">
            <thead>
            <th>ID</th>
            <th>Payment For</th>
            <th>Description</th>
            <th>Amount</th>
            <th>Method</th>
            <th>Date</th>
            <th>Ref</th>
            <th>Student ID</th>
            </thead>
            <%
                User user = new Helper().getUser(request);
                List<Entity> items = EntityManager.getEntities(Payment.class, user.getSchool());
                for(Entity item : items){
                    Payment payment = (Payment)item;
            %>
            <tr>
                <td>
                    <%=
                    payment.getPaymentId()
                    %>
                </td>
                <td>
                    <%=
                    payment.getPaymentKey()
                    %>
                </td>
                <td>
                    <%=
                    payment.getDescription()
                    %>
                </td>
                <td>
                    <%=
                    payment.getAmount()
                    %>
                </td>
                <td>
                    <%=
                    payment.getPaymentMethod()
                    %>
                </td>
                <td>
                    <%=
                    payment.getPayDate()
                    %>
                </td>
                <td>
                    <%=
                    payment.getReferance()
                    %>
                </td>
                <td>
                    <%=
                    payment.getStudent().getStudentId()
                    %>
                </td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
</div>


<jsp:include page="addPayment.jsp"/>