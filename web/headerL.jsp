<%-- 
    Document   : index
    Created on : 09/09/2016, 06:38:37 PM
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
        <script>
            jQuery(document).ready(function($){
                //alert("hola");
                $.ajax({
                   url : 'SimulacionLogeoServlet',
                   type : 'POST',
                   data: {"logueado" : "si",
                            "nick" : "oWood"}                   
                   
                });
                //alert("llegue");
                
               $.ajax({
                   url : 'DatosLogueadoServlet',
                   type : 'POST',
                   success : function(response){
                       //alert(response);
                       $('.infoLogueado label').text(response);
                       $('.imgPerfil').attr('src', './perfiles/' + response + '.jpg');
                   },
                   error : function(object, error, resp){
                       alert("error! " + resp);
                   }
               }); 
               
               var activo = false;
               $('.infoLogueado').on('click', function(){
                   if(!activo){
                       $('.opcionesLogueado').fadeIn();
                       activo = true;
                   }
                   else{
                       $('.opcionesLogueado').fadeOut();
                       activo = false;
                   }
                    
                
               });
            });
        </script>
        <title>JSP Page</title>

 <style>
     .headerContainer{
        position: absolute;
        width:100%;
        top:0;
        height:70px;
        background-color: #FCD442;
     }
     .secondHeader{
        position: absolute;
        margin-top:70px;
        width:100%;
        height:36px;
        background-color:#84A8FB;
     }
     .secondHeaderButton{
        background-color:inherit;
        border:0px;
     }
     .secondHeaderCenter{
        position:relative;
        margin: auto;
        width:1100px;
        height:100%;
     }   
     .headerCentered{
        position:relative;
        width: 1100px;
        height: 100%;
        margin: 0px auto;
     }
     .IconPanelLeftSide{
        height:100%;
        width:10%;
        position:absolute;
     }
     .searcherMiddle{
        top:18px;
        position:absolute;
        left:15%;
        width:50%;
        font-family: verdana;
     }
     .infoRegistroRightSide{
        position:absolute;
        top:10%;
        left: 70%;
        height:80%;
        width:30%;
     }
     .registrarseBotonDiv{
        position: absolute;
        left:5px;
        width:30%;
        height:100%;
     }
     .registrarseBoton{
       background-color:inherit; 
       width:100%;
       height:100%;
       border:0px;
       color: grey;

     }
     .registrarseBoton:hover{
        font-size: 20px;
        color: black;
     }
     .loginDiv{
        position: absolute;
        left:35%;
        width:30%;
        height:100%;
     }
     .loginBoton{
        background-color: inherit;
        width: 100%;
        height: 100%;
        border: 0px;
        color: grey;
     }
     .loginBoton:hover{
        font-size: 20px;
        color:black;
     }
     .ayudaBotonDiv{
        position: absolute;
        right:0px;
        height: 100%;
        width:30%;
        top: .5%;
     }
     .ayudaBoton{
        background-color: inherit;
        width: 100%;
        height: 100%;
        border: 0px;
        color: grey;
        outline: 0;
     }
     .ayudaBoton:hover{
        color: white;
     }
    .personalizado{
        width: 25% !important;
    }
    #iconPanel:hover{
        cursor: pointer;
    }
    
    .menuPrincipal{
        list-style: none;
        /*border: 1px solid black;*/
    }
    
    .submenuPrincipal{
        float: left;
        width: 24%;
        box-sizing: border-box;
    }
    
    .submenuPrincipal a{
        color: white;
        text-decoration: none;
        display:block;
        /*font-weight: bold;*/
        padding: 0px 12px;
        height: 10px;
        text-align: center;
        box-sizing: border-box;
    }
    
    .submenuPrincipal a:hover{
        /*background-color: #A5BEF7;*/
        text-decoration: none;
        cursor: pointer;
        color: #EBFB87;
    }
    
    .submenuPrincipal i{
        margin-right: 10px;
    }
    
    .imgPerfil{
        width: 35px;
        height: 35px;
        border-radius: 50%;
        margin-right: 10px;
    }
    
    .infoLogueado{
        margin-top: 4%;
        /*border: 1px solid black;*/
        width: 55%;
        float: left;
        color: grey;
    }
    
    .infoLogueado label{
        
        cursor: pointer;
        /*float: left;*/
        /*border: 1px solid black;*/
    }
    
    .infoLogueado:hover{
        cursor: pointer;
        color: white;
    }
    
    .lstLogueado{
        list-style: none;
    }
    
    .lstLogueado > li{
        /*border: 1px solid black;*/
        height: 55px;
    }
    
    .opcionesLogueado{
        list-style: none;
        display: none;
        position: absolute;
        margin-top: 55px;
        margin-left: -14%;
        z-index: 1000;
    }
    
    .opcionesLogueado > li{
        position: relative;
        /*border: 1px solid black;*/
        width: 175px;
        padding: 5px 10px;
        background-color: #FAC506;
        border-bottom: 1px solid white;
        color: white;
    }
    
    .opcionesLogueado > li:hover{
        cursor: pointer;
        color: grey;
    }
    
    body{
        background: url(./images/fondo.png);
    }
    
 </style>
</head>
<body>
    
    <!-- Modal -->
    <div id="modalPerfil" class="modal fade" role="dialog">
      <div class="modal-dialog personalizado">

        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Iniciar Sesión.</h4>
          </div>
          <div class="modal-body">
                <form id="formLogin" action="login.jsp" method="GET">
                    <div class="form-group has-feedback" id="nicknameDiv">
                        <label for="nickname">Nicknam</label>
                        <input class="form-control" type="text" id="nicknameLogin" name="nickname">
                        <i class="glyphicon glyphicon-user form-control-feedback"></i>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="nombre">Password</label>
                        <input class="form-control" type="password" id="passwordLogin" name="password">
                        <i class="glyphicon glyphicon-eye-open form-control-feedback"></i>
                    </div>
                    <center><input type="submit" id="enviarFormIniciarSesion" value="Iniciar Sesión!" class="btn btn-primary"></center>
                </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>
        </div>

      </div>
    </div>
    <!-- Fin de la ventana modal para Iniciar Sesión. -->
    <div class="headerContainer">
        <div class="headerCentered">
            <div onclick="location.href='index.jsp'" class="IconPanelLeftSide" id="iconPanel">
                <img style='height: 100%; width: 100%; object-fit: contain' src='logo.png'/>                     
            </div>

            <div class="searcherMiddle" id="buscadorDiv">
                <div class="input-group col-md-12">
                <input type="text" class="form-control" placeholder="Buscar" id="buscarCampo" />
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button">
                        <i class="glyphicon glyphicon-search"></i>
                    </button>
                </span>
                </div>
            </div>
            <div class="infoRegistroRightSide" id="ladoDerechoSignup">
                <ul class ="lstLogueado">
                    <li>
                        <div class = "infoLogueado">
                            <img src = "images/perfil.png" class = "imgPerfil"></img>
                            <label>Roccma</label>
                            &nbsp;&nbsp;
                            <span class="fa fa-angle-down" id = "btnVerMasPerfil"></span>
                        </div>
                        <ul class = "opcionesLogueado">
                            <li><span class = "	fa fa-user"></span>&nbsp;&nbsp;Ver perfil</li>
                            <li><span class = "fa fa-unlock-alt"></span>&nbsp;&nbsp;Cerrar sesi&oacute;n</li>
                        </ul>
                    </li>
                    
                        
                </ul>
                
                <div class="ayudaBotonDiv" id="ayudaBotonDiv">
                    <button  class="ayudaBoton" onclick="location.href = 'ayuda.jsp'">
                        <span class = "fa fa-question-circle"></span>&nbsp;&nbsp;Ayuda
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="secondHeader">
        <div class="secondHeaderCenter">
            <ul class = "menuPrincipal">
                <li class = "submenuPrincipal"><a href = "verProveedoresServlet"><i class="fa fa-truck" aria-hidden="true"> </i>&nbsp;Proveedores</a></li>
                <!--li class = "submenuPrincipal"><a href = " alogajiento.mostrar("alojamientos"); -->
                <li class = "submenuPrincipal"><a href = "VerServiciosServlet?categoria=Alojamientos"><i class="fa fa-bed" aria-hidden="true"> </i>&nbsp;Servicios</a></li>
                <li class = "submenuPrincipal"><a href = "verReserva.jsp"><i class="fa fa-calendar" aria-hidden="true"> </i>&nbsp;Reservas</a></li>
                <li class = "submenuPrincipal"><a href = "VerPromosServlet"><i class="fa fa-shopping-bag" aria-hidden="true"> </i>&nbsp;Promociones</a></li>
            </ul>
        </div>
    </div>
<script>
$(document).ready(
    function () {
    var $j = jQuery.noConflict();
    $("#fechaNacimiento" ).datepicker({
      changeMonth: true,
      changeYear: true
    });
  }

);
    jQuery(document).ready(function($) {
        $("#ladoDerechoLogin").on('click', function(event) {
            $("#modalLogin").modal({
                backdrop: "static",
                keyboard: false,
                show: true
            });
        });
    });
</script>
<script>
    jQuery(document).ready(function($) {
        $("#AbrirModalRegistro").on('click', function(event) {
            $("#modalRegistroUsuario").modal({
                backdrop: "static",
                keyboard: false,
                show: true
            });
        });
    });
</script>
<script>
    jQuery(document).ready(function($) {
        $("#buscarCampo").on('focus', function(event) {
            $(this).attr('placeholder', 'Servicio, promoción o categoría para buscar....');
        });
        $("#buscarCampo").on('focusout', function(event) {
            $(this).attr('placeholder', 'Buscar');
        });
    });
</script>
<script>
jQuery(document).ready(function($) {
    $("#modalRegistroUsuario").on('hidden.bs.modal', function () {
        $("#formSignup *").filter(":input[type!=submit]").each(function() {
                $(this).parent().removeClass('has-error');
                $(this).parent().removeClass('has-success');            
                $(this).val("");
        });
    });
});
</script>
<script>
    $("#enviarFormNuevoUsuario").click(function(event){
        var error = false;
        event.preventDefault();
        $("#formSignup *").filter(":input").each(function() {
            $(this).parent().removeClass('has-error');
            if($(this).val()==""){
                $(this).parent().addClass('has-error');
                error = true;
            }
        });
        if($("#password1").val()!=$("#password2").val()){
            error = true;
            $("#password2").parent().addClass('has-error');
            $("#password1").parent().addClass('has-error');
        }
        if(error == false){
            var data = $("#formSignup").serialize();
            console.log(data);
            $.ajax({
                url: 'CrearUsuarioServlet',
                type: 'POST',
                dataType: 'JSON',
                data: data,
            })
            .done(function(response){
                if(!!response.agregado==true){
                    console.log($("#email").val());
                    $.ajax({
                        url: 'sendEmailConfirmation',
                        type: 'GET',
                        data: "emailTo="+$("#email").val()
                    })
                    .done(function(){

                    });
                    window.location.reload();
                }
                else{
                    alert("Well shit.");
                }
            });
        }
    });    
</script> 
<script>
$(document).ready(function(){
    $("#enviarFormIniciarSesion").on('click', function(event) {
        event.preventDefault();
        var error = false;
        $("#formLogin").find(':input').each(function(index, el) {
            $(this).parent().removeClass("has-error");
            if($(this).val()==""){
                $(this).parent().addClass('has-error');
                error = true;
            }
        });
        if(error == false){
            datos=$("#formLogin").serialize();
            $.ajax({
                url: 'IniciarSesionServlet',
                type: 'POST',
                data: datos,
                dataType: 'JSON',
            })
            .done(function(response) {
                if(!!response.validacion){
                    window.location.reload();
                }
                else{
                    alert("Contraseña incorrecta");
                }
            });
        }
        else
            return 0;
    });       
});
</script>
</body>
</html>