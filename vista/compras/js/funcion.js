$(document).ready(function(){

$("#proveedor_txt").typeahead({
        remote: {
            url : 'proveedores/typehead?query=%QUERY'   
        }
        
    });
$("#producto_txt").typeahead({
        remote: {
            url : 'productos/typehead?query=%QUERY'   
        }
        
    });


});

var agregar=function(){
 bval = true;
            bval = bval && $('#cantidadc').required();
            bval = bval && $('#precioc').required();
            if (bval){
                agregardetalle();

            }
            return false;
}

var agregardetalle=function(){
 		var productos=$("#producto_txt").val();
 		var datoProducto=productos.split(".");
 		var id=datoProducto[0];
 		var descripcion=datoProducto[1];
 		//var precio=descripcion.split(" -> ");
 		var subtotal=parseInt($("#precioc").val())*parseInt($("#cantidadc").val());
 		//console.log(precio);
var cadena='<tr id="'+id+'tr" class="tr_compra tr_'+id+ '"><td>'+descripcion;
	 cadena += '<input type="hidden" name="idproducto[]" value="' + id + '" />';
      cadena += '<input type="hidden" name="cantidad[]" value="' + $("#cantidadc").val() + '" />';
       cadena += '<input type="hidden" name="precio[]" value="' + $("#precioc").val() + '" /></td>';
        cadena += '<td>' + $("#cantidadc").val() + '</td>';
                cadena += '<td>' + $("#precioc").val() + '</td>';
                cadena += '<td>' + subtotal+ '</td>';
                cadena += '<td class="action-buttons"><button class="red" title="Eliminar"  type="button" onclick="eliminartr(\''+id+'\',\''+subtotal+'\')" ><i class="fa fa-trash bigger-130"></i></button</td></tr>';
                $('#tbody_compras').append(cadena);
                limpiar();
                $("#modalProducto").modal('hide');
                var total=parseInt($("#total").val())+subtotal;	
                $("#total").val(total);
                $("#subtotal").val(total);
                $("#mtotal").html('S/. '+total);
}

var limpiar=function(){
	$(".limpiar").val("");
}

var save=function(){
 bval = true;
            bval = bval && $('#proveedor_txt').required();
            bval = bval && $('#idtipodoc').required();
            bval = bval && $('#nrodoc').required();
            bval = bval && $('#fecha').required();
            if (bval){
            	var proveedor=($('#proveedor_txt').val()).split(".");
            	
               bootbox.confirm("¿Está seguro que desea Generar la compra", function(result) {
        if(result) {
        	var data=$("#frm-compra").serialize();
                 RequestAjax("GET",'compras/nuevo',null,data+"&idproveedor="+proveedor[0],function(data){
                 console.log(data);

                 	
                 	if(data=="OK"){
                 		bootbox.alert(data,function(){
                 		location.href=$path_base + 'compras';
                 	});
                 	}else{
                 		bootbox.alert("Se produjo un error");
                 	}

                 		
                 },null,null);
			}   
        
    });

            }
            return false;

}

var eliminartr = function(id,subtotaltr)
{
    bootbox.confirm("¿Está seguro que desea eliminar este producto?", function(result) {
        if(result) {
            $(".tr_"+id).remove();
            
            var total=parseInt($("#total").val())-subtotaltr;	
                $("#total").val(total);
                $("#subtotal").val(total);
                $("#mtotal").html('S/. '+total);
                 
}   
        
    });
}