jQuery(document).ready(function($) {
jQuery("#click").on('click', function(event) {
    if(jQuery(this).hasClass("footerCarrito")){
        jQuery(this).removeClass("footerCarrito");
        jQuery(this).addClass("footerCarrito2");        
    }
    else{
        jQuery(this).removeClass("footerCarrito2");
        jQuery(this).addClass("footerCarrito");                
    }
});
});