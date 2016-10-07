<%-- 
    Document   : verInformacionProveedor
    Created on : Oct 6, 2016, 7:02:27 PM
    Author     : chaos
--%>

<%@page session="false" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel ="stylesheet" href ="fonts.css"/>
        <script src="js/jquery-3.1.0.js"></script>
        <script src="jquery-ui.min.js"></script>
        <script src="js/jquery.slides.js"></script> 
        <title>JSP Page</title>
        <script>
            jQuery(document).ready(function($){
                $('.txtCantidad').focus();
		 $(".slides").slidesjs({

                    play: {
		      active: true,
		        // [boolean] Generate the play and stop buttons.
		        // You cannot use your own buttons. Sorry.
		      effect: "slide",
		        // [string] Can be either "slide" or "fade".
		      interval: 500,
		        // [number] Time spent on each slide in milliseconds.
		      auto: false,
		        // [boolean] Start playing the slideshow on load.
		      swap: true,
		        // [boolean] show/hide stop and play buttons
		      pauseOnHover: false,
		        // [boolean] pause a playing slideshow on hover
		      restartDelay: 2500
		        // [number] restart delay on inactive slideshow
		    }
		  });
		});
        </script>
        <style>
            .contenedorInformacionProveedor{
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
             .nombreProveedor{
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
              .tblProveedor tr td{
                /*border: 1px solid black;*/
                font-size: 16px;
                padding: 15px;
            }
            
            .tblProveedor{
                margin-left: 60%;
            }
            .serviciosProveedor{
                /*border: 1px solid black;*/
                margin-top: 10%;
                width: 100%;
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
            
            /**** Estilos del slider ****/
            
            .slides{
                width: 35%;
                height: auto;
                float: left;
            }
            .unaImagen{
                width: 35%;
                height: auto;
                float: left;
            }
            .slides img{
                width: 100%;
                height: 100%;
                
            }

            .slidesjs-pagination{
                margin-top:30px;
                float: right;
                margin-right: 10px;
            }

            .slidesjs-pagination li{
                float:left;
                margin-left:5px;
                list-style: none;
            }

            .slidesjs-pagination li a{
                display: block;
                background: #FCD442;
                float:left;
                border-radius: 20px;
                -moz-border-radius: 20px;
                -webkit-border-radius: 20px;
                width: 15px;
                height: 15px;
                text-decoration: none;
                color:white;
                font-size:0px;
            }

            .slidesjs-pagination li a:hover{
                background: #FAF7B4;
                color: #FAF7B4;
            }

            .slides .active{
                background: #84A8FB;
            }

            .slidesjs-navigation{
                text-decoration: none;
                color: #FCD442;
                margin-top: 25px;
                display: inline-block;
                float: left;
                font-weight: bold;
                font-size: 20px;
            }

            .slidesjs-navigation:hover{
                color: #FAF7B4;
                text-decoration: none;
            }
            
            .slidesjs-navigation:active{
                text-decoration: none;
            }            
            
            /********************/
          </style>  
    </head>
    <body>
        <jsp:include page = "headerL.jsp"/>
        <jsp:include page = "footer.jsp"/>
          <div class="contenedorInformacionProveedor">
            <%HttpSession session = request.getSession();
            String[] datosProveedor = (String[]) session.getAttribute("informacionProveedor");%>
             <h3 class = "nombreProveedor"><%=datosProveedor[2]%></h3>
             <%int tam = Integer.parseInt(datosProveedor[7]);
                if(tam > 1){%>
                    <div class ="slides">
                    <%for(int i = 0; i<tam; i++){
                        int nro = i + 1;
                        String rutaImg = "perfiles/" + datosProveedor[2] + "-" + nro + ".jpg";%>
                        <img src = "<%=rutaImg%>" alt = ""/>
                    <%}%>                    
                    </div>
                <%}
                else{
                    String rutaImg = "perfiles/" + datosProveedor[2] + "-1.jpg";%>
                    <img class = "imgProveedor" src = "<%=rutaImg%>" alt = ""/>
                <%}%>
             <!--img src ="perfiles/<%=datosProveedor[2]%>-1.jpg" class ="imgProveedor"/-->
             <div class ="datosProveedor">
                <table class ="tblProveedor">
                    <tr>
                        <td><span class = "fa fa-user"></span>&nbsp;&nbsp;<b>Nombre:</b></td>  
                        <td><%=datosProveedor[0]%></td>
                    </tr>
                    <tr>
                        <td><span class = "fa fa-user"></span>&nbsp;&nbsp;<b>Apellido:</b></td>  
                        <td><%=datosProveedor[1]%></td>
                    </tr>
                  
                    <tr>
                        <td><span class = "fa fa-at"></span>&nbsp;&nbsp;<b>E-mail:</b></td>  
                        <td><%=datosProveedor[3]%></td>
                    </tr>
                    <tr>
                        <td><span class = "fa fa-calendar"></span>&nbsp;&nbsp;<b>Fecha nacimiento:</b></td>  
                        <td><%=datosProveedor[4]%></td>
                    </tr>
                    <tr>
                        <td><span class = "fa fa-industry"></span>&nbsp;&nbsp;<b>Empresa:</b></td>  
                        <td><%=datosProveedor[5]%></td>
                    </tr>
                </table>
            </div>
               <div class ="serviciosProveedor">
                <label class ="lblCategorias"><span class = "fa fa-info-circle"></span>&nbsp;&nbsp;Servicios:&nbsp;</label>
                <%String[] servicios = datosProveedor[6].split(";");
                if(servicios.length > 0){
                    for(int i = 0; i < servicios.length; i++){%>
                        <div class ="divServicio"><a target="_blank" href = "InformacionServicioServlet?nombre=<%=servicios[i]%>&nickProveedor=<%=datosProveedor[2]%>"><%=servicios[i]%></a></div>
                    <%}
                }%>
            </div>     
          </div>
    </body>
</html>
