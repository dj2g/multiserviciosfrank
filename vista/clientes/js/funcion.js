var tablecontainer = $("#tablecontainer");

var actions = {
    listAction: 'clientes/buscador',
    createAction: 'clientes/nuevo',
    updateAction: 'clientes/editar',
    deleteAction: 'clientes/eliminar'
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
    nombres: {
        title: 'Nombres'
    },
    apellidos: {
        title: 'Apellidos'
    },
    idtipocliente: {
        title: 'Tipo de Cliente',
        options: 'tipo_clientes/allTipo_cliente'
    },
    documento: {
        title: 'Documento'
    },
    sexo: {
        title: 'Sexo',
        list: false,
        create: true,
        edit: true,
        input: function () {
            return '<select name="sexo"><option value="M">Masculino</option><option value="F">Femenino</option></select>';
        }
    },
    telefono: {
        title: 'Telefono'
    },
    email: {
        title: 'Email'
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
    text: ['Ver información de una Perfil', 'Eliminar un Cliente']
}

table.render(tablecontainer, "Lista de Clientes", actions, toolbar, fields, messages, function (event, data) {
    var bval = true;
    bval = bval && data.form.find('input[name="descripcion"]').required();
    if (bval)
        return true;
    return false;
});

table.loadRecordsButton(tablecontainer, leyendaTable);