<%-- 
    Document   : verPromociones
    Created on : 05-oct-2016, 11:48:47
    Author     : usuario
--%>

<%@page session="false" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .contenedorPromociones{
                /*border:1px solid black;*/
                position: relative;
                width: 100%;
                height: 785px;
                margin: auto;
                top: 105px;
                padding:2% 21.5%;
                overflow-y: auto;
                z-index: 0;
                /*margin-top: 35px;*/
            }
            
            .contenidoPromo{
                width: 80%;
                /*border: 1px solid black;*/
                margin: auto;
                padding: 25px 15px;
                border-bottom: 1px solid #CECCCC;
                
            }
            
            /*.primerPromocion{
                margin-top: 35px;
            }*/
            
            .imgProveedor{
                width: 20%;
                height: 100%;
                margin-right: 1%;
            }
            
            .datosPromo{
                /*border: 1px solid black;*/
                width: 63%;
                display: inline-block;
                /*padding: 25px 0px;*/
                box-sizing: border-box;
                position: relative;
                top: 15px;
            }
            .precioPromo{
                /*border: 1px solid black;*/
                width: 15%;
                display: inline-block;
                text-align: right;
                font-size: 16px;
                color: #CB3434;
                font-weight: bold;
            }
            .nombrePromo{
                font-size: 16px;
                margin-top: 10px;
            }
            
            .nickProveedor{
                font-size:14px;
                font-weight: normal;
                color: grey;
                margin-top: 2px;
            }
        </style>
    </head>
    <body>
        <jsp:include page = "headerL.jsp"/>
        <jsp:include page = "footer.jsp"/>
        
        <div class="contenedorPromociones">
            <%HttpSession session = request.getSession();
            String[] datosPromociones = (String[]) session.getAttribute("promociones");
            if(datosPromociones.length > 0){
                for(int i = 0; i < datosPromociones.length; i++){
                    String[] datos = datosPromociones[i].split(";");%>
            
                    <div class = "contenidoPromo">
                        <%String ruta = "perfiles/datos[1]-1.jpg";%>
                        <img src ="perfiles/<%=datos[1]%>-1.jpg" class ="imgProveedor"/>
                        <div class ="datosPromo"> 
                            <br>
                            <a href ="InformacionPromocionServlet?nombrePromocion=<%=datos[0]%>&nickProveedor=<%=datos[1]%>" class ="nombrePromo"><%=datos[0]%></a>
                            <br>
                            <label class ="nickProveedor"><%=datos[1]%></label>
                        </div>
                        <div class = "precioPromo">
                            U$S&nbsp;<%=datos[3]%>
                        </div>

                    </div>
                <%}
            }%>
        </div>
    </body>
</html>
