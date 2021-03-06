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
     }
     .ayudaBoton{
        background-color: inherit;
        width: 100%;
        height: 100%;
        border: 0px;
        color: grey;
     }
     .ayudaBoton:hover{
        font-size: 20px;
        color:black;
     }
    .personalizado{
        width: 25% !important;
    }
    #iconPanel:hover{
        cursor: pointer;
    }
 </style>
</head>
<body>
    <!-- Modal para registrarse -->
    <div id="modalRegistroUsuario" class="modal fade" role="dialog">
      <div class="modal-dialog">
        <!-- Contenido del modal -->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <center><h4 class="modal-title">Ingresar nuevo usuario</h4></center>
            </div>
            <div class="modal-body">
                <form id="formSignup" action="signup.jsp" method="GET">
                    <div class="form-group has-feedback" id="nicknameDiv">
                        <label for="nickname"> Ingrese su Nickname</label>
                        <input class="form-control" type="text" id="nickname" name="nickname" placeholder="JPerez9">
                        <i class="glyphicon glyphicon-question-sign form-control-feedback"></i>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="nombre">Ingrese su Nombre</label>
                        <input class="form-control" type="text" id="nombre" name="nombre" placeholder="José">
                        <i class="glyphicon glyphicon-user form-control-feedback"></i>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="apellido">Ingrese su Apellido</label>
                        <input class="form-control" type="text" id="apellido" name="apellido" placeholder="Perez">
                        <i class="glyphicon glyphicon-user form-control-feedback"></i>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="email">Ingrese su E-mail</label>
                        <input class="form-control" type="email" id="email" name="email" placeholder="jose@gmail.com">
                        <i class="glyphicon glyphicon-envelope form-control-feedback"></i>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="fechaNacimiento">Fecha de Nacimiento</label>
                        <input type="text" id="fechaNacimiento" name="fechaNacimiento" class="form-control" placeholder="30/08/1990">
                        <i class="glyphicon glyphicon-calendar form-control-feedback"></i> 
                    </div>
                    <div class="form-group has-feedback">
                        <label for="password1">Ingrese su password</label>
                        <input class="form-control" type="password" id="password1" name="password1" placeholder="*******">
                        <i class="glyphicon glyphicon-lock form-control-feedback"></i>
                    </div>
                    <div class="form-group has-feedback">    
                        <label for="password2">Repita la password</label>
                        <input class="form-control" type="password" id="password2" name="password2" placeholder="*******">
                        <i class="glyphicon glyphicon-lock form-control-feedback"></i>
                    </div>
                    <center><input type="submit" id="enviarFormNuevoUsuario" value="Registrarme!" class="btn btn-primary"></center>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

      </div>
    </div>
    <!-- Fin de la ventana modal para registrar usuario -->
    <!-- Inicio de la ventana Modal para Iniciar Sesión. -->

    <!-- Modal -->
    <div id="modalLogin" class="modal fade" role="dialog">
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
                <div class="registrarseBotonDiv" id="registrarseBotonDiv">
                    <button  class="registrarseBoton" id="AbrirModalRegistro">
                        Sign-up!
                    </button>
                </div>
                <div class="loginDiv" id="ladoDerechoLogin">
                    <button  class="loginBoton" id="botonLogin">
                        Login!
                    </button>
                </div>
                <div class="ayudaBotonDiv" id="ayudaBotonDiv">
                    <button  class="ayudaBoton" onclick="location.href = 'ayuda.jsp'">
                        Ayuda?
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="secondHeader">
        <div class="secondHeaderCenter">
            <table style="width:100%;height:100%;">
                <tr align="middle">
                    <td style="width:25%;height:100%;"><button class="secondHeaderButton">Hoteles <i class="fa fa-bed" aria-hidden="true"></i></button></td>
                    <td style="width:25%;height:100%;"><button class="secondHeaderButton">Taxi <i class="fa fa-taxi" aria-hidden="true"></i></button></td>
                    <td style="width:25%;height:100%;"><button class="secondHeaderButton">Vuelos <i class="fa fa-plane" aria-hidden="true"></i></button></td>
                    <td style="width:25%;height:100%;"><button class="secondHeaderButton">Reservas <i class="fa fa-calendar" aria-hidden="true"></i></button></td>
                </tr>
            </table>
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