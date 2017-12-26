<div class="profile_pic_wrapper">
    <canvas id="chat_canvas" width=200 height=200 style="display:none"></canvas>
    <input id="profPicInput" type="file" accept="image/*" onchange="changeProfPic()" />
    <img id="imgPreview" style="float: left;"></img>
</div>

<script>
    var img = new Image();
    function changeProfPic() {
        var file = profPicInput.files[0];
        var reader = new FileReader();
        reader.onloadend = function() {
            profPic = reader.result;
            if(profPic.startsWith("data:image")){
                // Image resizing
                loadImage();
                img.src = profPic;
            }
        };
        reader.readAsDataURL(file);
    }

    function loadImage(){
        var canvas = document.getElementById("chat_canvas");
        var ctx = canvas.getContext("2d");
        var resizedImg;

        img.onload = function () {
            w = img.width;
            h = img.height;
            gap=0;
            ctx.clearRect(0,-0,canvas.width,canvas.height);
            if(w>h){
                gap = (w-h)/2;
                ctx.drawImage(img, gap, 0, w-2*gap, h, -35, -35, canvas.width, canvas.height);
            }else{
                gap = (h-w)/2;
                ctx.drawImage(img, 0, gap, w, h-2*gap, -35, -35, canvas.width, canvas.height);
            }
            resizedImg = canvas.toDataURL();
            imgPreview.src = resizedImg;
        };
    }
</script>