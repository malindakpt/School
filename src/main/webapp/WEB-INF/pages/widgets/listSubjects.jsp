<%@ page import="entityManager.EntityManager" %>
<%@ page import="entity.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Entity" %>
<%@ page import="entity.Subject" %>
<%@ page import="entity.User" %>
<%@ page import="util.Helper" %>


<%
    User user = new Helper().getUser(request);
%>
<div class="w3-container">

    <h2>Subjects</h2>
    <div class="w3-responsive">
        <table class="w3-table-all">
            <tr>
                <th>Points</th>
                <th>Points</th>

            </tr>


                <% List<Entity> subjects = EntityManager.getEntities(Subject.class,user.getSchool());
                    for(Entity item : subjects){
                        Subject subject = (Subject)item;
                %>
            <tr>
                <td>
                    <%=
                    subject.getCode()
                    %>
                </td>
                <td>
                    <%=
                    subject.getName()
                    %>
                </td>
            </tr>
                <%
                    }
                %>


        </table>
    </div>
</div>


<p class="wid-id">listSubjects</p>



