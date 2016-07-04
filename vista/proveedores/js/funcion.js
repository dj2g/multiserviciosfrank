var tablecontainer = $("#tablecontainer");

var actions = {
    listAction: 'proveedores/buscador',
    createAction: 'proveedores/nuevo',
    updateAction: 'proveedores/editar',
    deleteAction: 'proveedores/eliminar'
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
    razonsocial: {
        title: 'Razon social'
    },
    ciudad: {
        title: 'Ciudad'
    },
    email: {
        title: 'Email'
    },
    ruc: {
        title: 'Ruc'
    },
    direccion: {
        title: 'Direccion'
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
    text: ['Ver información de una Proveedor', 'Eliminar un Proveedor']
}

table.render(tablecontainer, "Lista de Proveedores", actions, toolbar, fields, messages, function (event, data) {
    var bval = true;
    bval = bval && data.form.find('input[name="descripcion"]').required();
    if (bval)
        return true;
    return false;
});

table.loadRecordsButton(tablecontainer, leyendaTable);