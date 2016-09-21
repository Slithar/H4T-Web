jQuery(document).ready(function($) {
    



jQuery(document).ready(
    function () {
    var jQueryj = jQuery.noConflict();
    jQuery("#fechaNacimiento" ).datepicker({
      changeMonth: true,
      changeYear: true
    });
  }

);
    jQuery(document).ready(function(jQuery) {
        jQuery("#ladoDerechoLogin").on('click', function(event) {
            jQuery("#modalLogin").modal({
                backdrop: "static",
                keyboard: false,
                show: true
            });
        });
    });

    jQuery(document).ready(function(jQuery) {
        jQuery("#AbrirModalRegistro").on('click', function(event) {
            jQuery("#modalRegistroUsuario").modal({
                backdrop: "static",
                keyboard: false,
                show: true
            });
        });
    });

    jQuery(document).ready(function(jQuery) {
        jQuery("#buscarCampo").on('focus', function(event) {
            jQuery(this).attr('placeholder', 'Servicio, promoción o categoría para buscar....');
        });
        jQuery("#buscarCampo").on('focusout', function(event) {
            jQuery(this).attr('placeholder', 'Buscar');
        });
    });

jQuery(document).ready(function(jQuery) {
    jQuery("#modalRegistroUsuario").on('hidden.bs.modal', function () {
        jQuery("#formSignup *").filter(":input[type!=submit]").each(function() {
                jQuery(this).parent().removeClass('has-error');
                jQuery(this).parent().removeClass('has-success');            
                jQuery(this).val("");
        });
    });
});

    jQuery("#enviarFormNuevoUsuario").click(function(event){
        var error = false;
        event.preventDefault();
        jQuery("#formSignup *").filter(":input").each(function() {
            jQuery(this).parent().removeClass('has-error');
            if(jQuery(this).val()==""){
                jQuery(this).parent().addClass('has-error');
                error = true;
            }
        });
        if( jQuery("#password1").val()!=jQuery("#password2").val() ){
            error = true;
            jQuery("#password2").parent().addClass('has-error');
            jQuery("#password1").parent().addClass('has-error');
        }
        if(error == false){
            var nickname = jQuery("#nickname").val();
            var data = jQuery("#formSignup").serialize();
            console.log(data);
            jQuery.ajax({
                url: 'CrearUsuarioServlet',
                type: 'POST',
                dataType: 'JSON',
                data: data,
            })
            .done(function(response){
                if(!!response.agregado==true){
                    jQuery.ajax({
                        url: 'sendEmailConfirmation',
                        type: 'GET',
                        data: "emailTo="+jQuery("#email").val()+"&nickname="+nickname,
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

jQuery(document).ready(function(){
    jQuery("#enviarFormIniciarSesion").on('click', function(event) {
        event.preventDefault();
        var error = false;
        jQuery("#formLogin").find(':input').each(function(index, el) {
            jQuery(this).parent().removeClass("has-error");
            if(jQuery(this).val()==""){
                jQuery(this).parent().addClass('has-error');
                error = true;
            }
        });
        if(error == false){
            datos=jQuery("#formLogin").serialize();
            jQuery.ajax({
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

});