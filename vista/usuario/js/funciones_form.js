$(function() {
    $("#nombres").focus();
    $("#save").click(function() {
        var bval = true;
        bval = bval && $("#nombres").required();
        bval = bval && $("#apellidos").required();
        bval = bval && $("#direccion").required();
        bval = bval && $("#telefono").required();
        bval = bval && $("#dni").required();
        if(bval && $("#dni").val().length!=8){
            bootbox.alert("El dni debe tener 8 digitos");
            bval = false;
        }
        bval = bval && $("#id_perfil").required();
        bval = bval && $("#usuario").required();
        bval = bval && $("#clave").required();

        if (bval){
            $("#frm").submit();
        }
        return false;
    });
});