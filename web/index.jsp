<%-- 
    Document   : index
    Created on : 12/09/2016, 05:41:36 PM
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
        <title>Help 4 traveling</title>
    </head>
    <body>
        <jsp:include page="headerNL.jsp" />
    </body>
    <script>
        $(document).ready(function(){
            $.ajax({
                url: 'IniciarSesionServlet',
                type: 'GET',
                data: "nombre=pepe",
                dataType: 'html'
            })
            .done(function(response) {
                console.log(response);
            })
            .fail(function() {
                console.log("error");
            })
            .always(function() {
                console.log("complete");
            });
            
        });
    </script>
</html>
