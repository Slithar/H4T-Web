<%-- 
    Document   : verInformacionServicios
    Created on : 02-oct-2016, 22:38:50
    Author     : usuario
--%>
<%@page session="false" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/jquery-3.1.0.js"></script>
        <script src="jquery-ui.min.js"></script>
        <title>JSP Page</title>
        <script>
            jQuery(document).ready(function($){
                
                
                function getHijas(padre){
                    $.ajax({
                        url : "CatsServlet",
                        type : "POST",
                        data : {"tipo" : "hijas"},
                        success : function(response){
                            var hijas = response;
                            var datosHijas = hijas.split(":");
                            
                            for(var i = 0; i < datosHijas.length; i++){
                                var nivel = datosHijas[i].split(";");
                                if(nivel[0].replace(" ","") == padre){
                                    //alert("aca");
                                    var id = "#lst" + padre.replace(" ","");
                                    $(id).append('<li class = "hija"><a href = "VerServiciosServlet?categoria=' + nivel[1] + '">' + nivel[1] + '</a><ul id = "lst' + nivel[1].replace(" ","") + '"></ul></li>');
                                    getHijas(nivel[1].replace(" ",""));
                                }
                            }

                        }
                    }); 
                };
                
                $.ajax({
                   url : "CatsServlet",
                   type : "POST",
                   data : {"tipo" : "padres"},
                   success : function(response){
                       //alert(response);
                       //alert(response);
                       var datos = response.split(";");
                       for(var i = 0; i < datos.length-1; i++){
                           $('.listaCategorias').append('<li class = "hija"><a href = "VerServiciosServlet?categoria=' + datos[i] + '">' + datos[i] + '</a><ul id = "lst' + datos[i] + '"></ul></li>');
                           getHijas(datos[i]);
                       }
                   }
                }); 
            });
        </script>
        <style>
            .contenedorServicios{
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
            
            .divCategorias{
                top: 15%;
                width: 15%;
                height: 75%;
                background-color: #FAF7B4;
                margin-right: 5%;
                position: fixed;
                padding: 1% 1%;
                overflow-x: auto;
            }
            
            .divInfoCategoria{
                width: 72%;
                height: 4%;
                box-sizing: border-box;
                margin-left: 30%;
                padding: .5%;
                margin-bottom: 2%;
                background-color: #FAF7B4;
                /*border: 1px solid yellow;*/
            }
            
            .divInformacionServicio{
                width: 72%;
                height: 20%;
                border-bottom: 1px solid #CECCCC;
                box-sizing: border-box;
                padding: 2%;
                margin-left: 30%;
                /*border: 1px solid blue;*/
            }
            
            .imgServicio{
                width: 20%;
                height: 100%;
                float: left;
            }
            
            .divInformacionServicio a{
                font-size: 16px;
            }
            
            .divPrecio{
                /*border: 1px solid black;*/
                width: 12%;
                text-align: right;
                position: relative;
                top: -65%;
                margin-left: 90%;
                font-size: 16px;
                /*z-index: -10;*/
                color: #CB3434;
                float: left;
            }
            
            .nombreServicio{
                /*border: 1px solid grey;*/
                /*position: relative;
                top: -75%;*/
                left: 22%;
                width: 65%;
                float: left;
                margin-top: 25px;
                margin-left: 10px;
            }
            
            .proveedorServicio{
                color: grey;
                font-weight: normal;
            }
            
            .listaCategorias {
			  padding: 0;
			  margin: 0;
			  list-style-type: none;
			  position: relative;
			}
			.listaCategorias .hija {
			  list-style-type: none;
			  border-left: 2px solid grey;
			  margin-left: 1em;
			}
			.listaCategorias .hija a {
			  padding-left: 1em;
			  position: relative;
			}
			.listaCategorias .hija a::before {
			  content:'';
			  position: absolute;
			  top: 0;
			  left: -2px;
			  bottom: 50%;
			  width: 0.75em;
			  border: 2px solid grey;
			  border-top: 0 none transparent;
			  border-right: 0 none transparent;
			}
			.listaCategorias ul > .hija:last-child {
			  border-left: 2px solid transparent;
			}
        </style>
        
        
    </head>
    <body>
        <jsp:include page = "headerL.jsp"/>
        <jsp:include page = "footer.jsp"/>  
        <div class="contenedorServicios">
            <div class ="divCategorias">
                <b>Categor&iacute;as disponibles</b>
                <br>
                <ul class = "listaCategorias">
                    
               </ul>
            </div>
            
            <%  response.setContentType("text/html;charset=UTF-8");        
                response.setCharacterEncoding("UTF-8");          
                HttpSession session = request.getSession();
                String[] datosServicios = (String[]) session.getAttribute("servicios");
                String categoria = request.getParameter("categoria");
                
                session.setAttribute("categoriaSeleccionada",categoria);
                    /*String datos1 = datosServicios[0];
                    String[] categoria = datos1.split(";");*/
            %>
                
                <div class = "divInfoCategoria">
                    Categor&iacute;a actual: <b><%=categoria%></b>
                </div>
            
                <%if(datosServicios.length > 0){
                    for (int i = 0; i < datosServicios.length; i++){ 
                    String datos = datosServicios[i];            
                    String[] informacionServicios = datos.split(";");
                    if(!informacionServicios[0].equals("hija")){                
                        if(!informacionServicios[0].equals("padre")){
                            String rutaImagen = "./servicios/" + informacionServicios[1] + "-" + informacionServicios[2] + "-1.jpg";%>

                            <div class ="divInformacionServicio">
                                <img src = "<%=rutaImagen%>" class = "imgServicio"></img>
                                &nbsp;&nbsp;
                                <div class = "nombreServicio">
                                    <%String informacionServicioRuta = "InformacionServicioServlet?nombre=" + informacionServicios[1] + "&nickProveedor=" + informacionServicios[2];%>
                                    <a href ="<%=informacionServicioRuta%>"><%=informacionServicios[1]%></a>
                                    <br>
                                    <label class = "proveedorServicio"><%=informacionServicios[2]%></label>                    
                                </div>
                                <div class ="divPrecio">
                                <label class = "lblPrecio">U$S <%=informacionServicios[3]%></label>
                                </div>              
                            
                            </div>
                        <%}
                    }
                }
            }%>
            
            
            <!--div class ="divInformacionServicio">
                hola
            </div>
            <div class ="divInformacionServicio">
                hola
            </div>
            <div class ="divInformacionServicio">
                hola
            </div>
            <div class ="divInformacionServicio">
                hola
            </div>
            <div class ="divInformacionServicio">
                hola
            </div>
            <div class ="divInformacionServicio">
                hola
            </div-->
        </div>
    </body>
</html>
