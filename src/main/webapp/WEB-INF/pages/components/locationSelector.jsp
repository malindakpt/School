<%@ page import="entity.Entity" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.User" %>
<%@ page import="util.Helper" %>
<%@ page import="entity.allocation.Location" %>

<%
    User user = new Helper().getUser(request);
%>

<select class="w3-select" name="option" id="locationSelector">
    <option value="-1"> - Select -</option>
    <%
        List<Entity> locations = EntityManager.getEntities(Location.class,user.getSchool());
        for(Entity entity : locations){
            Location location = (Location)entity;
    %>
    <option value="<%=location.getLocationId()%>" ><%=location.getName()%></option>

    <%}%>
</select>