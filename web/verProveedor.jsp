<%-- 
    Document   : verProveedor
    Created on : Oct 5, 2016, 8:04:07 PM
    Author     : chaos
--%>

<%@page session="false" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <script src="js/jquery-3.1.0.js"></script>
        <script src="jquery-ui.min.js"></script>
        <style>
            .contenedorProveedores{
                /*border:1px solid black;*/
                position: relative;
                width: 100%;
                height: 785px;
                margin: auto;
                top: 105px;
                padding:2% 21.5%;
                overflow-y: auto;
                z-index: 0;
            }
                .diviProveedor{
                width: 80%;
                /*border: 1px solid black;*/
                margin: auto;
                padding: 25px 15px;
                border-bottom: 1px solid #CECCCC;
                
            }
            .datosProveedor{
                /*border: 1px solid black;*/
                width: 63%;
                display: inline-block;
                /*padding: 25px 0px;*/
                box-sizing: border-box;
                position: relative;
                top: 15px;
            }
              .imgProveedor{
                width: 30%;
                height: 100%;
                margin-right: 1%;
            }
            
            .nombreProveedor{
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
        <div class="contenedorProveedores">
            <%HttpSession session = request.getSession();
            String[] datosProveedores = (String[]) session.getAttribute("proveedores");
            if(datosProveedores.length > 0){
                for(int i = 0; i < datosProveedores.length; i++){
                    String[] datos = datosProveedores[i].split(";");%>
                    <div class="diviProveedor">
                        <img src="perfiles/<%=datos[2]%>-1.jpg" class ="imgProveedor"/>

                     <div class ="datosProveedor"> 
                                    <br>
                                     <a href ="InformacionProveedorServlet?nickProveedor=<%=datos[2]%>" class ="nombreProveedor"><%=datos[2]%></a>
                                    <br>
                                    <label class ="nickProveedor"><%=datos[0]%>&nbsp;<%=datos[1]%></label>
                                </div>

                      </div>
                <%}
            }%>
        </div>    
    </body>
</html>
