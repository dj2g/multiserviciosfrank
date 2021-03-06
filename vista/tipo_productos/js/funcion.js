var tablecontainer = $("#tablecontainer");

var actions = {
    listAction: 'tipo_productos/buscador',
    createAction: 'tipo_productos/nuevo',
    updateAction: 'tipo_productos/editar',
    deleteAction: 'tipo_productos/eliminar'
}
var toolbar = {
    items: [{
        cssClass: 'buscador',
        text: buscador
    }]
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
        title: 'DESCRIPCION'
    },
    abreviacion: {
        title: 'ABREVIACION'
    },
    estado: {
        list: false,
        create: true,
        edit: true,
        input: function () {
            return '<input  type="hidden"  name="estado" value="1" />';
        }
}
}

var leyendaTable = {
    actions: ['ver', 'eliminar'],
    text: ['Ver información de una Perfil', 'Eliminar un Perfil']
}

table.render(tablecontainer, "Lista de Tipo De Producto", actions, toolbar, fields, messages, function (event, data) {
    var bval = true;
    bval = bval && data.form.find('input[name="descripcion"]').required();
    if (bval)
        return true;
    return false;
});

table.loadRecordsButton(tablecontainer, leyendaTable);