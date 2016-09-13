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
        <link href="css/bootstrap.css" type="text/css" rel="stylesheet">
        <script src="js/jquery-3.1.0.js"></script>
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
       /*background-color:#FFF059;*/
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
                        <input class="form-control" type="text" id="nickname" placeholder="JPerez9">
                        <i class="glyphicon glyphicon-question-sign form-control-feedback"></i>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="nombre">Ingrese su Nombre</label>
                        <input class="form-control" type="text" id="nombre" placeholder="José">
                        <i class="glyphicon glyphicon-user form-control-feedback"></i>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="apellido">Ingrese su Apellido</label>
                        <input class="form-control" type="text" id="apellido" placeholder="Perez">
                        <i class="glyphicon glyphicon-user form-control-feedback"></i>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="email">Ingrese su E-mail</label>
                        <input class="form-control" type="email" id="email" placeholder="jose@gmail.com">
                        <i class="glyphicon glyphicon-envelope form-control-feedback"></i>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="password1">Ingrese su password</label>
                        <input class="form-control" type="password" id="password1" placeholder="*******">
                        <i class="glyphicon glyphicon-lock form-control-feedback"></i>
                    </div>
                    <div class="form-group has-feedback">    
                        <label for="password2">Repita la password</label>
                        <input class="form-control" type="password" id="password2" placeholder="*******">
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
                        <input class="form-control" type="text" id="nicknameLogin">
                        <i class="glyphicon glyphicon-user form-control-feedback"></i>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="nombre">Password</label>
                        <input class="form-control" type="password" id="passwordLogin">
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
            <div class="IconPanelLeftSide" id="iconPanel">
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
                    <button  class="registrarseBoton" id="AbrirModal"><!-- data-toggle="modal" data-target="#modalRegistroUsuario" -->
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
<script>
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
        $("#enviarFormIniciarSesion").on('click', function(event) {
            event.preventDefault();
            $("#formLogin *").filter(":input[type!=submit]").each(function(){
                if($(this).val()==""){
                    $(this).parent().addClass('has-error');
                }
            });
        });
    });
</script>
<script>
    jQuery(document).ready(function($) {
        $("#AbrirModal").on('click', function(event) {
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
jQuery(document).ready(function($) {
    $("#modalLogin").on('hidden.bs.modal', function () {
        $("#formLogin *").filter(":input[type!=submit]").each(function() {
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
        $("#formSignup *").filter(":input[type!=submit]").each(function() {
            if($(this).val()==""){
                $(this).parent().addClass('has-error');
                error = true;
            }
        });
    });
</script> 
<script>
    jQuery(document).ready(function($) {
        $("#iconPanel").on('click', function(event) {
            event.preventDefault();
            window.location = "index.jsp";
        });
    });
</script>
</body>
</html>