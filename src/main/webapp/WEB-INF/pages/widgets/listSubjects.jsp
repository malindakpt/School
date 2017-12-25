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

    <jsp:include page="../components/header2.jsp?header=Exsiting Subjects"/>
    <div class="w3-responsive">
        <table class="w3-table-all">
            <tr>
                <th>Code</th>
                <th>Name</th>
                <th></th>

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
                <td>
                    <button class="w3-button" onclick="onEditClick(this)" id="<%=subject.getSubjectId()%>">edit</button>
                </td>
            </tr>
                <%
                    }
                %>


        </table>
    </div>
</div>


<script>
    function onEditClick(btn){
        getAndSetPage("PageEditSubject?subjectId="+btn.id);
    }
</script>


<p class="wid-id">listSubjects</p>



