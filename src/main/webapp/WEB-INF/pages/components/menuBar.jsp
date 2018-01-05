<%@ page import="util.Helper" %>
<div class="w3-top">

    <div class="w3-bar w3-theme-d2 w3-left-align w3-large">

        <a href="#" class="w3-bar-item w3-button w3-padding-large w3-theme-d4" onclick="w3_open()"><i
                class="fa fa-bars"></i></a>


        <a href="#" onclick="getAndSetPage('PageTeacherDashBoard?t56='+t56)"
           class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"
           title="Home"><i class="fa fa-home"></i></a>

        <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"
           onclick="getAndSetPage('PageAnalize?t56='+t56)" title="Analize"><i
                class="fa fa-stack-overflow"></i></a>

        <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"
           onclick="getAndSetPage('PageRateStudent?t56='+t56)" title="Rate Student"><i
                class="fa fa-star-half-empty "></i></a>


        <div class="w3-dropdown-hover w3-hide-small">
            <button class="w3-button w3-padding-large" title="Students"><i class="fa fa-users"></i>
                <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px">
                    <a href="#" class="w3-bar-item w3-button" style="font-size: 15px;" onclick="getAndSetPage('PageListStudents?t56='+t56)">Show Students</a>
                    <a href="#" class="w3-bar-item w3-button" style="font-size: 15px;" onclick="getAndSetPage('PageAddStudent')">Add Students</a>

                </div>
            </button>
        </div>
        <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"
           onclick="getAndSetPage('PageAddTeacher?t56='+t56)" title="Teachers"><i
                class="fa  fa-modx"></i></a>
        <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"
           onclick="getAndSetPage('PageLibraryManagement?t56='+t56)" title="Library Management"><i
                class="fa fa-book "></i></a>

        <div class="w3-dropdown-hover w3-hide-small">
            <button class="w3-button w3-padding-large" title="Settings"><i class="fa fa-gears"></i>
                <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px">
                    <a href="#" class="w3-bar-item w3-button" style="font-size: 15px;"
                       onclick="getAndSetPage('PageAddClassRoom?t56='+t56)">Create New Class</a>
                    <a href="#" class="w3-bar-item w3-button" style="font-size: 15px;"
                       onclick="getAndSetPage('PageEditClassRoom?t56='+t56)">Change Class Room</a>
                    <a href="#" class="w3-bar-item w3-button" style="font-size: 15px;"
                       onclick="getAndSetPage('PageAddClassStudents?t56='+t56)">Assign
                        Students to class</a>
                    <%--<a href="#" class="w3-bar-item w3-button" onclick="getAndSetPage('PageAddClassStudents?t56='+t56)">Assign--%>
                        <%--Students to class</a>--%>
                    <%--<a href="#" class="w3-bar-item w3-button" style="font-size: 15px;"--%>
                       <%--onclick="getAndSetPage('PageAddSubject?t56='+t56)">Subjects</a>--%>
                    <%--<a href="#" class="w3-bar-item w3-button" style="font-size: 15px;"--%>
                       <%--onclick="getAndSetPage('PageAddTeacher?t56='+t56)">Teachers</a>--%>
                    <a href="#" class="w3-bar-item w3-button" style="font-size: 15px;"
                       onclick="getAndSetPage('PageTimeTable?t56='+t56)">Create Time Table</a>
                    <%--<a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"--%>
                       <%--onclick="getAndSetPage('PageTimeTable?t56='+t56)" title="TIme Tables"><i--%>
                            <%--class="fa fa-calendar"></i></a>--%>
                </div>
        </div>
        <a href="/" class="w3-bar-item w3-button w3-right w3-padding-large w3-hover-white" title="My Account"
           style="width:10%;margin-right: 10px"><img
                src="img/logo-school.png" class="w3-circle" style="height:25px;width:25px" alt="Avatar"></a>
        <a href="#" class="w3-bar-item w3-button w3-right w3-padding-large w3-hover-white" title="My Account"
           style="width: 40%;">
            <%=
                new Helper().getUser(request).getSchool().getName()
            %>
        </a>
    </div>
</div>

<!-- Navbar on small screens -->
<div id="navDemo" class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium w3-large">
    <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 1</a>
    <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 2</a>
    <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 3</a>
    <a href="#" class="w3-bar-item w3-button w3-padding-large">My Profile</a>
</div>