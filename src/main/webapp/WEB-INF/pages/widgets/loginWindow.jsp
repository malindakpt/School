<html>
<head>
    <script src="js/jQuery.js"></script>
    <title>W3.CSS Template</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

<style>
    /* Full-width input fields */
    input[type=text], input[type=password] {
        width: 100%;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        box-sizing: border-box;
    }

    /* Set a style for all buttons */
    button {
        background-color: #4CAF50;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 100%;
    }

    button:hover {
        opacity: 0.8;
    }

    /* Extra styles for the cancel button */
    .cancelbtn {
        width: auto;
        padding: 10px 18px;
        background-color: #f44336;
    }

    /* Center the image and position the close button */
    .imgcontainer {
        text-align: center;
        margin: 24px 0 12px 0;
        position: relative;
    }

    img.avatar {
        width: 40%;
        border-radius: 50%;
    }

    .container {
        padding: 16px;
    }

    span.psw {
        float: right;
        padding-top: 16px;
    }

    /* The Modal (background) */
    .modal {
        /*display: none; !* Hidden by default *!*/
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        padding-top: 60px;
    }

    /* Modal Content/Box */
    .modal-content {
        background-color: #fefefe;
        margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
        border: 1px solid #888;
        width: 80%; /* Could be more or less, depending on screen size */
    }

    /* The Close Button (x) */
    .close {
        position: absolute;
        right: 25px;
        top: 0;
        color: #000;
        font-size: 35px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: red;
        cursor: pointer;
    }

    /* Add Zoom Animation */
    .animate {
        -webkit-animation: animatezoom 0.6s;
        animation: animatezoom 0.6s
    }

    @-webkit-keyframes animatezoom {
        from {-webkit-transform: scale(0)}
        to {-webkit-transform: scale(1)}
    }

    @keyframes animatezoom {
        from {transform: scale(0)}
        to {transform: scale(1)}
    }

    /* Change styles for span and cancel button on extra small screens */
    @media screen and (max-width: 300px) {
        span.psw {
            display: block;
            float: none;
        }
        .cancelbtn {
            width: 100%;
        }
    }
</style>

</head>
<body>
<p class="wid-id">loginWindow</p>




<%--<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Login</button>--%>

<div id="id01" class="modal">

    <div class="modal-content animate" style="max-width: 388px;">
        <div>
            <img src="img/avatar.png" style="
            width: 100px;
            height: 100px;
            border-radius: 50%;
            padding: 20px;
            margin-top: 44px;
            margin: auto;
            display: block;">
        </div>

        <div class="container">
            <label><b>Username</b></label>
            <input id="userName" type="text" placeholder="Enter Username" name="uname" required>

            <label><b>Password</b></label>
            <input id="password" type="password" placeholder="Enter Password" name="psw" required>

            <button onclick="loginUser()">Login</button>
            <input type="checkbox" checked="checked"> Remember me
        </div>

        <div class="container" style="background-color:#f1f1f1">
            <button type="button" onclick="" class="cancelbtn">Cancel</button>
            <span class="psw">Forgot <a href="#">password?</a></span>
        </div>
    </div>
</div>

<script>
    function loginUser() {
        $.post('Login', {
                userName: $('#userName').val(),
                password: $('#password').val()
            },
            function (result) {
                console.log(result)
                var resArr = result.split(",");
                if(resArr[0]==="OK"){
//                    window.Location.replace("Home?sessionId="+resArr[1]);
                    window.location.href = "Home?t56="+resArr[1];
                }else{
                    alert("Invalid Username or Password")
                }
//                if (result === "") {
//                    alert("Success");
//                } else {
//                    alert("Error");
//                }

            }).fail(function (msg) {
                alert(msg);
            }
        );
    }
//    // Get the modal
//    var modal = document.getElementById('id01');
//
//    // When the user clicks anywhere outside of the modal, close it
//    window.onclick = function(event) {
//        if (event.target == modal) {
//            modal.style.display = "none";
//        }
//    }
</script>


</body>

</html>
