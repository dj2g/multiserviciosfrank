var tablecontainer = $("#tablecontainer");

var actions = {
    listAction: 'series/buscador',
    createAction: 'series/nuevo',
    updateAction: 'series/editar',
    deleteAction: 'series/eliminar'
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
    serie: {
        title: 'Serie'
    },
    correlativo: {
        title: 'Correlativo'
    },
    idtipocomprobante: {
        title: 'Tipo de Comprobante',
        options: 'tipo_comprobantes/allTipo_Comprobante'
    },
    maxcorrelativo: {
        title: 'Maximo Correlativo'
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

table.render(tablecontainer, "Lista de Lineas", actions, toolbar, fields, messages, function (event, data) {
    var bval = true;
    bval = bval && data.form.find('input[name="descripcion"]').required();
    if (bval)
        return true;
    return false;
});

table.loadRecordsButton(tablecontainer, leyendaTable);