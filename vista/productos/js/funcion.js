var tablecontainer = $("#tablecontainer");

var actions = {
    listAction: 'productos/buscador',
    createAction: 'productos/nuevo',
    updateAction: 'productos/editar',
    deleteAction: 'productos/eliminar'
}
var toolbar = {
    items: [{
        cssClass: 'buscador',
        text: buscador
    }
    //,
    //{
      //  cssClass: 'jtable-toolbar-item-add-record',
       // text: '<span class="jtable-toolbar-item-icon"></span><span class="jtable-toolbar-item-text" onclick="nuevoProducto()">Crear nuevo registro</span>'
    //}
    ]
}
var messages = {}

var fields = {
    id: {
        key:true,
        create: false,
        edit: false ,
        list: false
    },
    descripcion: {
        title: 'Descripcion'
    },
    idlinea: {
        title: 'Lineas',
        options: 'lineas/allLinea'
    },
    stockactual: {
        title: 'Stock',
        create: false,
        edit: false ,
        list: true
    },
    precio: {
        title: 'Precio',
        create: true,
        edit: true ,
        list: true
    },
    estado: {
        list: false,
        create: true,
        edit: true,
        input: function () {
            return '<input  type="hidden"  name="estado" value="1" /><input  type="hidden"  name="stockactual" value="0" />';
        }
},
            kardex: {
                width: '1%',
                sorting: false,
                display: function(data) {
                    return '<a class="orange"  title="Kardex del Producto" href="'+$path_base+'productos/kardex/'+data.record.id+'" ><i class="fa fa-list-alt fa-lg"></i></a>';
                },
                create: false,
                edit: false
            }
}

var leyendaTable = {
    actions: ['ver', 'eliminar'],
    text: ['Ver información de una Perfil', 'Eliminar un Perfil']
}

table.render(tablecontainer, "Lista de Lineas", actions, toolbar, fields, messages, function (event, data) {
    var bval = true;
    bval = bval && data.form.find('input[name="descripcion"]').required();
    if (bval)
        return true;
    return false;
});

table.loadRecordsButton(tablecontainer, leyendaTable);

var nuevoProducto=function(){
    $("#myModal").modal();
}