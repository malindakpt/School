<%@ page import="entity.allocation.Location" %>
<%@ page import="entity.User" %>
<%@ page import="util.Helper" %>
<%@ page import="entity.Entity" %>
<%@ page import="entityManager.EntityManager" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.allocation.InventoryItem" %>
<%@ page import="entity.library.Book" %>

<div class="w3-container">
    <div>
        <jsp:include page="../components/header.jsp?header=Library Management"/>
        <button onclick="showAddBook()" class="w3-btn btn-right w3-green">Add Books</button>
    </div>

    <div id="addBook" class="w3-container w3-hide">
        <jsp:include page="../widgets/addBook.jsp"/>
    </div>

</div>

<div class="w3-container">

    <div class="w3-responsive">
        <table class="w3-table-all">
            <thead>
            <th>ID</th>
            <th>Name</th>
            <th>Auther</th>
            <th>ISBN</th>
            <th>Code</th>
            <th>Publisher</th>
            <th>Burrower</th>
            <th></th>
            </thead>
            <%
                User user = new Helper().getUser(request);
                List<Entity> items = EntityManager.getEntities(Book.class, user.getSchool());
                for(Entity item : items){
                    Book book = (Book)item;
            %>
            <tr>
                <td>
                    <%=
                    book.getBookId()
                    %>
                </td>
                <td>
                    <%=
                    book.getName()
                    %>
                </td>
                <td>
                    <%=
                    book.getAuther()
                    %>
                </td>
                <td>
                    <%=
                    book.getISBN()
                    %>
                </td>
                <td>
                    <%=
                    book.getCode()
                    %>
                </td>
                <td>
                    <%=
                    book.getPublisher()
                    %>
                </td>
                <td>
                    <%=
                    book.getBorrowedBy()!= null ? book.getBorrowedBy().displayName() : "---"
                    %>
                </td>
                <td>
                    <button id="<%=book.getBookId()%>" class="w3-button w3-amber" onclick="showIssueBook(this)">Issue</button>
                </td>
            </tr>
            <%
                }
            %>
        </table>
    </div>

    <div id="bookAllocWindow" class="w3-modal">
        <div class="w3-modal-content"  style="width:500px;top: 200px;">
            <header class="w3-container w3-blue">
        <span onclick="document.getElementById('bookAllocWindow').style.display='none'"
              class="w3-button w3-display-topright">&times;</span>
                <h3>Issue Books</h3>
            </header>
            <div class="w3-container">
                <p><input class="w3-input" id = "studentId" type="text" placeholder="Student ID" name="studentId" class="field" /></p>
                <%--<p><input class="w3-input" id = "desc" type="text" placeholder="Dscription" name="name" class="field" /></p>--%>
            </div>
            <footer class="w3-container w3-light-grey w3-padding">
                <p><button class="w3-button w3-right w3-white w3-border" onclick="issueBook()">Issue</button></p>
            </footer>
        </div>
    </div>
</div>


<script>
    var bookId = 0;
    function showIssueBook(e){
        bookId = e.id;
        $('#bookAllocWindow').show();
//        getAndSetPage('PageChangeAllocationInventory?t56='+t56+'&inventoryId='+e.id);
    }

    function issueBook(){
        $.post('IssueBook', {
                studentId: $('#studentId').val(),
                bookId: bookId,
                t56: t56
            },
            function (result) {
                var resArr = result.split("##");
                if (resArr[0] === "") {
                    alert("Success");
//                    getAndSetPage('PageLi?t56='+t56+'&inventoryId='+inventoryId);
                } else {
                    alert(resArr[1]);
                }
                $('#bookAllocWindow').hide();

            }).fail(function () {
                alert("Error");
            }
        );
//        getAndSetPage('PageChangeAllocationInventory?t56='+t56+'&inventoryId='+e.id);
    }
    function showAddBook() {
        var x = document.getElementById("addBook");
        if (x.className.indexOf("w3-show") == -1) {
            x.className += " w3-show";
        } else {
            x.className = x.className.replace(" w3-show", "");
        }
    }
</script>