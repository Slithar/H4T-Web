<%-- 
    Document   : verInformacionServicio
    Created on : 03-oct-2016, 16:24:18
    Author     : usuario
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
            
            .migaDePan{
                /*border: 1px solid black;*/
                padding: 2px 5px;                
                background: #FAF7B4;
               /* margin-bottom: 35px;*/
            }
            
            .nombreServicio{
                display: block;
                text-align: center;
                font-weight: bold;
                font-size: 28px;
                margin-bottom: 4.5%;
                
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
            
            .descripcion{
                /*border: 1px solid black;*/
                width: 55%;
                height: 35%;
                float: left;
                display: inline-block;
                text-align: justify;
                padding: 5px;
                margin-left: 10%;
                overflow-y: auto;
                font-size: 16px;
            }
            
            .precio{
                /*border: 1px solid black;*/
                margin-top: 35%;
                width: 55%;
                height: 12%;
                margin-left: 45%;                
            }
            
            .lblPrecio{
                font-weight: bold;
                font-size: 22px;
                color: #CB3434;
            }
            
            .lblCantidad{
                font-size: 16px;
            }
            
            .txtCantidad{
                font-size: 16px;
                padding: 2px;
                width: 10%;
                text-align: center;
                border: 1px solid gray;
                outline: 0;
            }
            
            .btnAgregarCarrito{
                padding: 5px 15px;
                font-size: 14px;
                background: #FCD442;
                border: 2px solid #FCD442;
                color: white;
                border-radius: 4px;
                margin-left: 25px;
                outline: 0;
            }
            
            .btnAgregarCarrito:hover{
                cursor: pointer;
                background: #FAF7B4;
                border: 2px solid #FAF7B4;
            }
            
            .btnAgregarCarrito span{
                font-size: 18px;
                margin-right: 4px;                
            }
            
            .tblDatosServicio tr td{
                /*border: 1px solid black;*/
                padding: 15px;
                font-size: 16px;
            }
            
            .tblDatosServicio{
                margin-top: -8%;
            }
            
            .lblCategorias{
                font-size: 16px;
                margin-top: 4%;
                /*margin-left: 2%;*/
                margin-top: 75px;
            }
            
            .categoria{
                /*border: 2px solid black;*/
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
        <%HttpSession session = request.getSession();
        String[] informacionServicio = (String[]) session.getAttribute("informacionServicio");
        String ruta = informacionServicio[8];
        String[] pasosRuta = ruta.split(">");%>
        <div class="contenedorServicios">
            <div class = "migaDePan">
                <%for(int i = 0; i < pasosRuta.length; i++){
                    String paso = pasosRuta[i].trim();
                    int j = i + 1;
                    if(j < pasosRuta.length){%>
                        <a href="VerServiciosServlet?categoria=<%=paso%>"><%=paso%></a>&nbsp>&nbsp;
                    <%}
                    else{%>
                    <b><%=paso%></b>
                    <%}%>
                <%}%>
            </div>
                <h3 class = "nombreServicio"><%=informacionServicio[0]%></h3>
            
            <%String[] imagenes = informacionServicio[6].split(";");
                if(imagenes.length > 1){%>
                    <div class ="slides">
                    <%for(int i = 0; i<imagenes.length; i++){
                        int nro = i + 1;
                        String rutaImg = "servicios/" + informacionServicio[0] + "-" + informacionServicio[2] + "-" + nro + ".jpg";%>
                        <img src = "<%=rutaImg%>" alt = ""/>
                    <%}%>                    
                    </div>
                <%}
                else{
                    String rutaImg = "servicios/" + informacionServicio[0] + "-" + informacionServicio[2] + "-1.jpg";%>
                    <img class = "unaImagen" src = "<%=rutaImg%>" alt = ""/>
                <%}%>
                
            <div class ="descripcion">
                <%=informacionServicio[1]%>
            </div>
            <div class ="precio">
                <label class = "lblPrecio">U$S&nbsp<%=informacionServicio[9]%></label>
                <br><br>
                <label class = "lblCantidad">Cantidad:&nbsp;</label>
                <input type ="text" class ="txtCantidad"></input>
                <button class = "btnAgregarCarrito"><span class = "fa fa-cart-plus"></span>&nbsp;&nbsp;Agregar al carrito</button>
                <br>
                <label class = "lblCategorias"><span class = "fa fa-info-circle"></span>&nbsp;&nbsp;<b>Categor&iacute;as:</b></label>
                <%String[] categorias = informacionServicio[7].split(";");
                for(int i = 0; i < categorias.length; i++){%>
                    <div class = "categoria"><%=categorias[i]%></div>
                <%}%>
            </div>
            <table class ="tblDatosServicio">
                <tr>
                    <td><span class = "fa fa-user"></span>&nbsp;&nbsp;<b>Proveedor:&nbsp;</b></td>
                    <td><%=informacionServicio[2]%></td>
                </tr>
                <tr>
                    <td><span class = "fa fa-industry"></span>&nbsp;&nbsp;<b>Empresa:&nbsp;</b></td>
                    <td><%=informacionServicio[3]%></td>
                </tr>
                <tr>
                    <td><span class = "fa fa-street-view"></span>&nbsp;&nbsp;<b>Or&iacute;gen:&nbsp;</b></td>
                    <td><%=informacionServicio[4]%></td>
                </tr>
                <tr>
                    <td><span class = "fa fa-map-marker"></span>&nbsp;&nbsp;<b>Destino:&nbsp;</b></td>
                    <td><%=informacionServicio[5]%></td>
                </tr>
            </table>
            
        </div>
    </body>
</html>
