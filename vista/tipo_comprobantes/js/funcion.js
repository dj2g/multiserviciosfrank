var tablecontainer = $("#tablecontainer");

var actions = {
    listAction: 'tipo_comprobantes/buscador',
    createAction: 'tipo_comprobantes/nuevo',
    updateAction: 'tipo_comprobantes/editar',
    deleteAction: 'tipo_comprobantes/eliminar'
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

table.render(tablecontainer, "Lista de Tipo De Conceptos", actions, toolbar, fields, messages, function (event, data) {
    var bval = true;
    bval = bval && data.form.find('input[name="descripcion"]').required();
    if (bval)
        return true;
    return false;
});

table.loadRecordsButton(tablecontainer, leyendaTable);