<%-- 
    Document   : verReserva
    Created on : Sep 20, 2016, 3:17:59 PM
    Author     : chaos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>JSP Page</title>
        <script src="js/jquery-3.1.0.js"></script>
        <script>
            jQuery(document).ready(function($){
                //alert("hola");
                $('.tablaProductosReserva').hide();
                $.ajax({
                    url:"VerReservaServlet",
                    type:"POST",
                    data:{"operacion":"tablaReservas"},
                    success:function(response){
                        
                       $('.cuerpoReservas').html(response);
                        
                    }
                });
                
                $('body').on('click', '.ver', function(){
                    //alert($(this).attr("id"));
                    $.ajax({
                        url:"VerReservaServlet",
                        type:"POST",
                        data:{"operacion":"tablaProductos",
                                "numeroReserva":$(this).attr("id")},
                        success:function(response){                        
                            //alert(response);
                            $('.tablaProductosReserva').show();
                            $('.cuerpoProductosReserva').html(response);   
                        }
                    });
                });
                    
                
            });
        </script>
        <style>
            .contenedorReserva{
                /*border:1px solid black;*/
                position: relative;
                width: 1100px;
                height: 775px;
                margin: auto;
                top: 125px;
                padding:2%;
                overflow-y: auto;
            }
            
            .tablaRes{
                width:80%;
                margin:auto;
                border:2px solid #84A8FB;
                
            }
            
            .tablaRes tr td {
                padding: 3px 5px; 
            }
            
            .tablaRes tbody tr:nth-child(odd){
                background-color:#E4E1E1; 
                
            }
            .tablaRes tbody tr:nth-child(even){
                background-color:#FBF7F7; 
                
            }
            .titulo{
                color:white;
                background-color:#84A8FB;
                text-align:center;
            }
            .columna{
                color:white;
                background-color:#BABABA;
            }
            
            .tablaRes .cNumero{
                width:23%;
            }
            .tablaRes .cPrecio{
                width:23%;
            }
            .tablaRes .cFecha{
                width:23%;
            }
            .tablaRes .cEstado{
                width:23%;
            }
            
            .tablaRes .cVer{
                width:5%;
                cursor:pointer;
                text-align: center;
                
            }
            
            .tablaRes tbody .cVer:hover{
                color: #84A8FB;
            }
            .tablaProductosReserva{
                border:1px solid black;
                position: relative;
                width: 90%;
                height:10%; 
                margin: auto;
                top: 125px;
                padding:2%;
                 border:2px solid #84A8FB;
                
            }
              .tablaProductosReserva tr td {
                padding: 3px 5px; 
            }
            
            .tablaProductosReserva tbody tr:nth-child(odd){
                background-color:#E4E1E1; 
                
            }
            .tablaProductosReserva tbody tr:nth-child(even){
                background-color:#FBF7F7; 
                
            }
            .tablaProductosReserva .cNombre{
                width:15%; 
            }
            .tablaProductosReserva .cProveedor{
                width:15%; 
            }
            .tablaProductosReserva .cEmpresa{
                width:10%; 
            }
            .tablaProductosReserva .cCantidad{
                width:10%; 
            }
            .tablaProductosReserva .cPrecioUnit{
                width:10%; 
            }
            .tablaProductosReserva .cTotalLinea{
                width:10%; 
            }
            .tablaProductosReserva .cFechaIni{
                width:10%; 
            }
            .tablaProductosReserva .cFechaFin{
                width:10%; 
            }
            .tablaProductosReserva .cTipo{
                width:10%; 
            }
            .tituloProd{
                color:white;
                background-color:#84A8FB;
                text-align:center;
            }
        </style>
    </head>
    <body>
            
            <jsp:include page="headerNL.jsp" />
            <div class="contenedorReserva" > 
                <table class="tablaRes">
                    <thead>
                        <tr class="titulo"  > <td colspan="5">Reservas</td></tr>
                        <tr class="columna"> 
                            <td class='cNumero'>N&uacute;mero</td>
                            <td class='cPrecio'>Precio</td>
                            <td class='cFecha'>Fecha</td>
                            <td class='cEstado'>Estado</td>
                            <td class='cVer'>Ver</td>
                        </tr>
                    </thead>
                    <tbody class="cuerpoReservas" id="cuerpoReservas">
                             
                    </tbody>
                </table>
                
                <table class="tablaProductosReserva">
                    <thead>
                        <tr class="tituloProd"> <td colspan="9">Productos de la reserva</tr>
                        <tr class="columna">
                            <td class="cNombre">Nombre </td>
                            <td class="cProveedor">Proveedor </td>
                            <td class="cEmpresa">Empresa</td>
                            <td class="cCantidad">Cantidad</td>
                            <td class="cPrecioUnit">P. unitario </td>
                            <td class="cTotalLinea">Total linea </td>
                            <td class="cFechaIni">Fecha Inicio</td>
                            <td class="cFechaFin">Fecha Fin </td>
                            <td class="cTipo">Tipo</td>
                            
                        </tr>
                    </thead>
                    <tbody class="cuerpoProductosReserva">
                        
                    </tbody>
                </table>
            </div>
            <jsp:include page="footer.jsp" />
            
    </body>
</html>
