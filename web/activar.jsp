<%-- 
    Document   : activar
    Created on : 21/09/2016, 02:24:41 PM
    Author     : kapo_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
    <link href="jquery-ui.min.css" type="text/css" rel="stylesheet">
    <script src="js/jquery-3.1.0.js"></script>
    <script src="jquery-ui.min.js"></script>
    <link href="css/bootstrap.css" type="text/css" rel="stylesheet">
    <script src="js/bootstrap.js"></script>
    <!--Archivos JS y CSS externos.-->
    <link href="header.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="footer.css">
    <script type="text/javascript" src="footer.js"></script>
    <script type="text/javascript" src="header.js"></script>
    <style>
        body{
            width:100%;
            height: 100%;
        }
        .mainContainer{
            position: absolute;
            margin-left: auto;
            margin-right: auto;
            left: 0;
            right: 0;
            display: block;
            margin-top: 6%;
            width:1100px;
            height:80%;
        }
        .textContainer{
            position: absolute;
            margin:auto;
            right:0;
            left:0;
            width:80%;
            height:100%;
            font-size: 20px;
        }
    </style>
    </head>
    <body>
        <jsp:include page="headerNL.jsp" />     
        <div class="mainContainer">
            <div class="textContainer">
                Bienvenido <strong>${param.user}</strong>. Ha activado correctamente su cuenta.
                A partir de ahora podrá loguearse de manera normal.  
            </div>
        </div>
        <jsp:include page="footer.jsp" /> 
    </body>
</html>
