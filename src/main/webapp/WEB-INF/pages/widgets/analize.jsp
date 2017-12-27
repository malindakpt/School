<%@ page import="entityManager.AnalizedEntity" %>
<%@ page import="entityManager.AnalizeManager" %>
<%--<jsp:include page="../components/header.jsp?header=Analize Results"/>--%>

<select class="w3-select my-select-analize" name="option" id="classSelector" onchange="onClassRoomChange()">
    <option value="1" selected>Grade 1</option>
    <option value="2" selected>Grade 2</option>
    <option value="3" selected>Grade 3</option>
    <option value="4" selected>Grade 4</option>
</select>

<div class="w3-panel">

    <div class="w3-container w3-green">
        <h3>Top Marking Students</h3>
    </div>

    <%
        String grade = "5";//request.getParameter("grade");
        AnalizeManager analizeManager = new AnalizeManager();
        for(AnalizedEntity analizedEntity: analizeManager.getTopMarkers(grade)){
    %>
    <div class="w3-container w3-pale-green">
        <div class="w3-row w3-margin">
            <div class="w3-half">
                <%= analizedEntity.getName()%>
            </div>
            <div class="w3-half">
                <%= analizedEntity.getValue()%>
            </div>
        </div>
    </div>

    <%
        }
    %>
</div>

<div class="w3-panel">

    <div class="w3-container w3-red">
        <h3>Top Marking Students</h3>
    </div>

    <%
        for(AnalizedEntity analizedEntity: analizeManager.getTopMarkers(grade)){
    %>
    <div class="w3-container w3-pale-red">
        <div class="w3-row w3-margin">
            <div class="w3-half">
                <%= analizedEntity.getName()%>
            </div>
            <div class="w3-half">
                <%= analizedEntity.getValue()%>
            </div>
        </div>
    </div>

    <%
        }
    %>
</div>

<div class="w3-panel">

    <div class="w3-container w3-blue">
        <h3>Top Marking Students</h3>
    </div>

    <%
        for(AnalizedEntity analizedEntity: analizeManager.getTopMarkers(grade)){
    %>
    <div class="w3-container w3-pale-blue">
        <div class="w3-row w3-margin">
            <div class="w3-half">
                <%= analizedEntity.getName()%>
            </div>
            <div class="w3-half">
                <%= analizedEntity.getValue()%>
            </div>
        </div>
    </div>

    <%
        }
    %>
</div>
