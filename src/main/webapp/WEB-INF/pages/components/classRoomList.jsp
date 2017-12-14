<select class="w3-select" name="option" id="<%=student.getStudentId()%>">
    <option value="" disabled selected>Select a Class</option>
    <%
        for (Entity e1 : classRooms) {
            ClassRoom classRoom = (ClassRoom) e1;
    %>
    <option value="<%=classRoom.getClassRoomId()%>"><%=classRoom.getClassRoomName()%></option>
    <%
        }
    %>
</select>