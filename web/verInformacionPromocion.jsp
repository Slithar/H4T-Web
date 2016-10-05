<%-- 
    Document   : verInformacionPromocion
    Created on : 05-oct-2016, 14:24:28
    Author     : usuario
--%>

<%@page session="false" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .contenedorInformacionPromociones{
                /*border:1px solid black;*/
                position: relative;
                width: 100%;
                height: 785px;
                margin: auto;
                top: 105px;
                padding:2% 25%;
                overflow-y: auto;
                z-index: 0;
            }
            
            .nombrePromocion{
                font-size: 28px;
                font-weight: bold;
                text-align: center;
                margin-bottom: 5%;
            }
            
            .imgProveedor{
                width: 35%;
                height: 35;
                float: left;
                margin-left: 5%;
            }
            
            .tblPromo tr td{
                /*border: 1px solid black;*/
                font-size: 16px;
                padding: 15px;
            }
            
            .tblPromo{
                margin-left: 60%;
            }
            
            .descuento{
                font-weight: bold;
                font-size: 18px;
                color: #028427;
            }
            
            .precio{
                font-weight: bold;
                font-size: 22px;
                color: #CB3434;
                margin-top: 25px;
            }
            
            .serviciosPromocion{
                /*border: 1px solid black;*/
                margin-top: 10%;
                width: 90%;
            }
            
            .lblCategorias{
                font-size: 16px;
                margin-left: 5%;
            }
            
            .divServicio{
                display: inline;
                padding: 10px;
                margin: 10px;
                font-size: 16px;
                background: #FAF7B4;
                border-radius: 4px;
            }
        </style>
    </head>
    <body>
        <jsp:include page = "headerL.jsp"/>
        <jsp:include page = "footer.jsp"/>
        <div class="contenedorInformacionPromociones">
            <%HttpSession session = request.getSession();
            String[] datosPromocion = (String[]) session.getAttribute("informacionPromocion");%>
            <h3 class = "nombrePromocion"><%=datosPromocion[0]%></h3>
            <img src ="perfiles/<%=datosPromocion[1]%>-1.jpg" class ="imgProveedor"/>
            <div class ="datosPromocion">
                <table class ="tblPromo">
                    <tr>
                        <td><span class = "fa fa-user"></span>&nbsp;&nbsp;<b>Proveedor:</b></td>  
                        <td><%=datosPromocion[1]%></td>
                    </tr>
                    <tr>
                        <td><span class = "fa fa-industry"></span>&nbsp;&nbsp;<b>Empresa:</b></td>  
                        <td><%=datosPromocion[2]%></td>
                    </tr>
                    <tr>
                        <td><span class = "fa fa-money"></span>&nbsp;&nbsp;<b>Descuento:</b></td>  
                        <td class = "descuento"><%=datosPromocion[3]%>%</td>
                    </tr>
                    <tr>
                        <td colspan ="2"><label class = "precio">U$S&nbsp;<%=datosPromocion[4]%></label></td>
                    </tr>
                </table>
            </div>
            <div class ="serviciosPromocion">
                <label class ="lblCategorias"><span class = "fa fa-info-circle"></span>&nbsp;&nbsp;Servicios:&nbsp;</label>
                <%String[] servicios = datosPromocion[5].split(";");
                for(int i = 0; i < servicios.length; i++){%>
                    <div class ="divServicio"><a href = "InformacionServicioServlet?nombre=<%=servicios[i]%>&nickProveedor=<%=datosPromocion[1]%>"><%=servicios[i]%></a></div>
                <%}%>
            </div>
        </div>
    </body>
</html>
