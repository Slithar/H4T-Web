<%-- 
    Document   : footer
    Created on : 14/09/2016, 06:14:02 PM
    Author     : kapo_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.css" type="text/css" rel="stylesheet">
<script src="js/jquery-3.1.0.js"></script>
<script src="js/bootstrap.js"></script>
<title>JSP Page</title>

<style>
    .footerCarrito2{
        position:fixed;
        bottom:0px;
        right:0px;
        border-radius: 0px;
        width: 100%;
        height:60px;
        background-color: black;
        -webkit-transition: width 0.3s, height 0.3s, border-radius 0.3s, bottom 0.1s, right 0.2s;
    }
    .footerCarrito{
        position:fixed;
        bottom: 20px;
        right:70px;
        width:80px;
        height:80px;
        border-radius: 50%;
        background-color: black;
        -webkit-transition: width 0.1s, height 0.3s, border-radius 0.1s, bottom 0.1s, right 0.2s;
        z-index: 10;
    }
</style>
</head>
<body>
    <div id="click" class="footerCarrito">
            
    </div>
    
    <script>
        $("#click").click(function(){
            if($(this).hasClass("footerCarrito")){
                $(this).removeClass("footerCarrito");
                $(this).addClass("footerCarrito2");
            }
            else{
                $(this).removeClass("footerCarrito2");
                $(this).addClass("footerCarrito");                
            }
        });
    </script>
</body>
</html>
