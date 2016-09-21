<%-- 
    Document   : index
    Created on : 09/09/2016, 06:38:37 PM
    Author     : kapo_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <form id="formSignup">
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
                <form id="formLogin">
                    <div class="form-group has-feedback" id="nicknameDiv">
                        <label for="nickname">Nickname</label>
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
                        Registrarme!
                    </button>
                </div>
                <div class="loginDiv" id="ladoDerechoLogin">
                    <button  class="loginBoton" id="botonLogin">
                        Ingresar!
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
    <!--Segundo contenedor para las pestañas de navegación.-->
    <div class="secondHeader">
        <div class="secondHeaderCenter">
            <table style="width:100%;height:100%;">
                <tr align="middle">
                    <td style="width:25%;height:100%;"><button class="secondHeaderButton"><i class="fa fa-bed" aria-hidden="true"></i> Hoteles</button></td>
                    <td style="width:25%;height:100%;"><button class="secondHeaderButton"><i class="fa fa-taxi" aria-hidden="true"></i> Taxi</button></td>
                    <td style="width:25%;height:100%;"><button class="secondHeaderButton"><i class="fa fa-plane" aria-hidden="true"></i> Vuelos</button></td>
                    <td style="width:25%;height:100%;"><button class="secondHeaderButton"><i class="fa fa-calendar" aria-hidden="true"></i> Reservas</button></td>
                </tr>
            </table>
        </div>
    </div>
