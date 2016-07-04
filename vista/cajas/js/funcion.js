var tablecontainer = $("#tablecontainer");

var actions = {
    listAction: 'cajas/buscador'
    //createAction: 'clientes/nuevo',
    //updateAction: 'clientes/editar',
    //deleteAction: 'clientes/eliminar'
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
    fechaapertura: {
        title: 'Fecha Apertura'
    },
    saldoapertura: {
        title: 'Saldo Apertura'
    },
    fechacierre: {
        title: 'Fecha Cierre'
    },
    saldocierrer: {
        title: 'Saldo Cierre'
    },
    saldo: {
        title: 'Saldo'
        
    }
}

var leyendaTable = {
    actions: ['ver', 'eliminar'],
    text: ['Ver información de una Perfil', 'Eliminar un Cliente']
}

table.render(tablecontainer, "Administracion de Caja", actions, toolbar, fields, messages, function (event, data) {
    var bval = true;
    bval = bval && data.form.find('input[name="descripcion"]').required();
    if (bval)
        return true;
    return false;
});

table.loadRecordsButton(tablecontainer, leyendaTable);