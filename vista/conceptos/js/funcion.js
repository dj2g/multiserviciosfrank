var tablecontainer = $("#tablecontainer");

var actions = {
    listAction: 'conceptos/buscador',
    createAction: 'conceptos/nuevo',
    updateAction: 'conceptos/editar',
    deleteAction: 'conceptos/eliminar'
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
        title: 'Descripcion'
    },
    idtipoconcepto: {
        title: 'Tipo de Concepto',
        options: 'tipo_conceptos/allTipo_concepto'
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
    text: ['Ver información de una Concepto', 'Eliminar un Concepto']
}

table.render(tablecontainer, "Lista de Conceptos", actions, toolbar, fields, messages, function (event, data) {
    var bval = true;
    bval = bval && data.form.find('input[name="descripcion"]').required();
    if (bval)
        return true;
    return false;
});

table.loadRecordsButton(tablecontainer, leyendaTable);