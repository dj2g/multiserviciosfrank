var cargando = '<div class="text-center" style="padding: 2em 0"><i class="icon-spinner icon-spin blue bigger-125"></i></div>';
var cargando2 = '<div class="text-center" style="padding: 5em 0; font-size: 32px"><i class="icon-spinner icon-spin blue"></i></div>';
var buscador = '<form class="form-search"><span class="input-icon"><input type="text" id="search" class="nav-search-input" name="search" autocomplete="off" placeholder="Buscar..." /><i class="icon-search nav-search-icon"></i></span><button type="submit" id="LoadRecordsButton" class="hide"></button></form>';

var txtcaja = '';

if ($(window).width() <= 1024) {
    $("#sidebar").addClass('menu-min');
}

$(".ultimas_mod").html('<div class="sidebar-container"><div class="clock shadowed"><div id="date"></div><div id="time"><span id="hours"></span> : <span id="min"></span> : <span id="sec"></span></div></div><div class="shadowed side-calendar"><div id="sidebar-calendar"></div></div></div>');

$(".ultimas_mod").append($("#leyenda"));

//$('[data-rel=tooltip]').tooltip();

$(document).ready(function () {

  //  cargaMenu();

   // hora_fecha();

});

/*var cargaMenu = function () {
    var menu = $("._menu");
    $.ajax({
        type: 'GET',
        url: $path_base + 'modulo/modulos',
        beforeSend: function () {
            menu.html(cargando);
        },
        success: function (data) {
            menu.empty().generaMenu(data);
            activos();
        }
    })
}


$.fn.generaMenu = function (menu) {
    this.each(function () {
        var capaMenu = $(this);
        var capaInicio = $('<li class="active li_inicio"><a href="' + $path_base + '"><i class="icon-home"></i><span class="menu-text"> Inicio </span></a></li>');
        capaMenu.append(capaInicio);
        jQuery.each(menu, function () {
            var capa = $("<li></li>");
            capaMenu.append(capa);
            var capaPadre = $('<a class="dropdown-toggle" href="javascript:void(0)"></a>');
            capa.append(capaPadre);
            var enlacepadre = $('<i class="' + this.icono + '"></i><span class="menu-text">' + this.descripcion + '</span><b class="arrow icon-angle-down"></b>');
            capaPadre.append(enlacepadre);
            var subLista = $('<ul class="submenu"></ul>');
            capa.append(subLista);
            jQuery.each(this.enlaces, function () {
                var subElemento = $('<li class="mod' + this.url + '"></li>');
                subLista.append(subElemento);
                var subEnlace = $('<a href="' + $path_base + this.url + '"><i class="icon-double-angle-right"></i><span class="subm' + this.url + '">' + this.descripcion + '</span></a>');
                subElemento.append(subEnlace);
            });
        });
    });
    return this;
};
*/
var mensajes_validador = function (data) {
    var div_mensaje = $(".mensajes_validador");

    if (data != '') {
        var mensaje = '<div class="alert alert-block alert-danger"><button type="button" class="close" data-dismiss="alert"><i class="icon-remove"></i></button>';
        for (var property in data) {
            mensaje += '- ' + data[property] + '<br/>';
        }
        mensaje += '</div>';
        div_mensaje.html(mensaje);
    }
}
var mensajes_validador_Exception = function (data) {
    var div_mensaje = $(".mensajes_validador");

    if (data != '') {
        var mensaje = '<div class="alert alert-block alert-danger"><button type="button" class="close" data-dismiss="alert"><i class="icon-remove"></i></button>';
        var conten = data.split(",");
        for (var i = 0; i < conten.length; i++) {
            if (i == 1) {
                mensaje += '- ' + conten[i].substr(11, 19) + 'erico' + '<br/>';
            } else {
                mensaje += '- ' + conten[i].substr(15, 22) + 'erico' + '<br/>';
            }
        }
        mensaje += '</div>';
        div_mensaje.html(mensaje);
    }
}

var limpiar_validaciones = function () {
    $(".mensajes_validador").html('');
}

//seleccionar opciones

var selectOptions = function (padre, hijo, ruta, idp, callback) {
    var id = $("#Edit-" + padre).val();
    var hj = $("#Edit-" + hijo);
    $.ajax({
        type: 'POST',
        dataType: 'json',
        data: 'id=' + id,
        url: $path_base + ruta,
        beforeSend: function () {
            hj.html('<option>Cargando...</option>');
        },
        success: function (datos) {
            var data = datos.Options;
            var cadena = '';
            for (var i = 0; i < data.length; i++) {
                if (data[i].Value == idp) {
                    cadena += '<option value="' + data[i].Value + '" selected="selected">' + data[i].DisplayText + '</option>';
                } else {
                    cadena += '<option value="' + data[i].Value + '">' + data[i].DisplayText + '</option>';
                }
            }
            hj.html(cadena);
            if ((callback) && (typeof callback === 'function')) {
                callback();
            }
        },
        error: function () {
            bootbox.alert('Hubo un error, regargue su pagina');
        }
    })
}

var cselect = function (id, ruta) {
    var cont = $("#" + id);
    $.ajax({
        type: 'GET',
        dataType: 'json',
        url: $path_base + ruta,
        beforeSend: function () {
            cont.html('<option>Cargando...</option>');
        },
        success: function (datos) {
            var data = datos.Options;
            var cadena = '';
            for (var i = 0; i < data.length; i++) {
                cadena += '<option value="' + data[i].Value + '">' + data[i].DisplayText + '</option>';
            }
            cont.html(cadena);
        },
        error: function () {
            bootbox.alert('Hubo un error, regargue su pagina');
        }
    })
}

var ctypeahead = function (id, descripcion, ruta, callback) {
    $('#' + descripcion).typeahead({
        source: function (query, process) {
            $.ajax({
                url: $path_base + ruta,
                type: 'GET',
                data: 'query=' + query,
                dataType: 'JSON',
                async: true,
                success: function (data) {
                    objects = [];
                    map = {};
                    $.each(data, function (i, object) {
                        map[object.texto] = object;
                        objects.push(object.texto);
                    });
                    process(objects);
                }
            });
        },
        items: 5,
        minLength: 3,
        updater: function (item) {
            if ((callback) && (typeof callback === 'function')) {
                callback(map[item]);
            }
            $('#' + id).val(map[item].id);
            return item;
        }
    });
}

function saltar(me, e, t) {
    var k = null;
    (e.keyCode) ? k = e.keyCode : k = e.which;
    if (k == 13 && me.value != '') document.getElementById(t).focus();
}

function saltar_chosen(me, e, t) {
    var k = null;
    (e.keyCode) ? k = e.keyCode : k = e.which;
    if (k == 13 && me.value != '') $('#' + t).trigger('chosen:activate');
}

function mostrar_ventana(txt) {
    $("#ventana, #div_ventana").fadeIn(300);
    $("#div_ventana").html(txt);
}
function mostrar_ventana2(txt) {
    $("#ventana, #div_ventana").fadeIn();

    $("#div_ventana").html(txt);
}

function cerrar_ventana() {
    $("#ventana, #div_ventana").fadeOut(300);
}
function cerrar_ventana2() {
    $("#ventana, #div_ventana").fadeOut(4000);

}
function cerrar_ventana3(segundos) {
    $("#ventana, #div_ventana").fadeOut(segundos);

}

//validaciones

//validar vacios
//validar vacios
$(function () {
    $.fn.required = function () {
        if ($(this).val() == '') {
            $(this).addClass('required');
            $(this).focus();
            return false;
        } else {
            $(this).removeClass('required');
            $('#msg').html('');
            return true;
        }
    };
});

//validar email
$(function () {
    $.fn.email = function () {
        var filter = /[\w-\.]{3,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-]{2,4}/;
        if ($.trim($(this).val()) != '' && filter.test($(this).val())) {
            return true;
        } else {
            $(this).focus();
            return false;
        }
    };
});

//validar solo letras
var soloLetras = function (e) {
    key = e.keyCode || e.which;
    tecla = String.fromCharCode(key).toLowerCase();
    letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
    especiales = [8, 9, 37, 39, 46];
    tecla_especial = false
    for (var i in especiales) {
        if (key == especiales[i]) {
            tecla_especial = true;
            break;
        }
    }
    if (letras.indexOf(tecla) == -1 && !tecla_especial)
        return false;
}

//validar solo numeros
function soloNumeros(evt) {
    evt = (evt) ? evt : event; //Validar la existencia del objeto event
    var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode : ((evt.which) ? evt.which : 0)); //Extraer el codigo del caracter de uno de los diferentes grupos de codigos
    var respuesta = true; //Predefinir como valido
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        respuesta = false;
    }
    return respuesta;
}

//validar numero telefonico
function numeroTelefonico(evt) {
    evt = (evt) ? evt : event; //Validar la existencia del objeto event
    var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode : ((evt.which) ? evt.which : 0));
    var respuesta = true; //Predefinir como valido
    if (charCode > 31 && (charCode < 48 || charCode > 57) && (charCode != 42 && charCode != 35 && charCode != 32 && charCode != 40 && charCode != 41 && charCode != 45)) {
        respuesta = false;
    }
    return respuesta;
}

function dosDecimales(evt, control) {
    //Limita un control a números con dos decimales.
    var texto = control.value;
    var punto = texto.indexOf('.');

    if (evt.keyCode <= 13 || (evt.keyCode >= 48 && evt.keyCode <= 57)) {
        if ((punto != -1) && (texto.length - (punto + 1)) >= 2) {
            return false;
        }
    }
    else if (evt.keyCode == 46 && texto.length >= 1) {
        if (punto != -1 && texto.indexOf('.', punto) != -1) {
            return false;
        }
    } else {
        return false;
    }
    return true;
}

jQuery(function ($) {
    $.datepicker.regional['es'] = {
        closeText: 'Cerrar',
        prevText: '',
        nextText: '',
        currentText: 'Hoy',
        monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
            'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
        monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun',
            'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
        dayNames: ['Domingo', 'Lunes', 'Martes', 'Mi&eacute;rcoles', 'Jueves', 'Viernes', 'S&aacute;bado'],
        dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mi&eacute;', 'Juv', 'Vie', 'S&aacute;b'],
        dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'S&aacute;'],
        weekHeader: 'Sm',
        dateFormat: 'yy-mm-dd',
        //firstDay: 1,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: '',
        changeMonth: true,
        changeYear: true,
        //defaultDate: '1990-01-01'
    };
    $.datepicker.setDefaults($.datepicker.regional['es']);
});
/*
var hora_fecha = function () {

    $('#sidebar-calendar').fullCalendar({
        editable: false,
        events: [],
        monthNames: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Setiembre", "Octubre", "Noviembre", "Diciembre"],
        dayNamesShort: ["Dom", "Lun", "Mar", "Mie", "Jue", "Vie", "Sab"],
        header: {
            left: 'title'
        }
    });

    var monthNames = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Setiembre", "Octubre", "Noviembre", "Diciembre"];
    var dayNames = ["Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado"]

    // Create a newDate() object
    var newDate = new Date();

    // Extract the current date from Date object
    newDate.setDate(newDate.getDate());

    // Output the day, date, month and year
    $('#date').html(dayNames[newDate.getDay()] + " " + newDate.getDate() + ' ' + monthNames[newDate.getMonth()] + ' ' + newDate.getFullYear());

    setInterval(function () {

        // Create a newDate() object and extract the seconds of the current time on the visitor's
        var seconds = new Date().getSeconds();

        // Add a leading zero to seconds value
        $("#sec").html(( seconds < 10 ? "0" : "" ) + seconds);
    }, 1000);

    setInterval(function () {

        // Create a newDate() object and extract the minutes of the current time on the visitor's
        var minutes = new Date().getMinutes();

        // Add a leading zero to the minutes value
        $("#min").html(( minutes < 10 ? "0" : "" ) + minutes);
    }, 1000);

    setInterval(function () {

        // Create a newDate() object and extract the hours of the current time on the visitor's
        var hours = new Date().getHours();

        // Add a leading zero to the hours value
        $("#hours").html(( hours < 10 ? "0" : "" ) + hours);
    }, 1000);
}
********/

var is_unique = function (datos, index, valor) {
    var unique = true;
    for (var i = 0; i < datos.length; i++) {
        if (datos[i][index] == valor) {
            unique = false;
        }
    }
    return unique;
}

var leyenda = function (leyendas, titulos) {
    $("#leyenda").html('<div class="sidebar-container"><div class="shadowed shad-title"><h4 class="header header-min blue">Leyenda</h4><div id="table-leyenda"></div></div></div>');
    var contenido = '<table class="table table-hover table-bordered table-white"><tbody>';
    for (var leyend in leyendas) {
        var color = '', icono = '';
        switch (leyendas[leyend]) {
            case 'editar' :
                color = 'blue';
                icono = 'edit';
                break;
            case 'eliminar' :
                color = 'red';
                icono = 'trash';
                break;
            case 'amortizar' :
                color = 'blue';
                icono = 'money';
                break;
            case 'cronograma' :
                color = 'purple';
                icono = 'list-alt';
                break;
            case 'cancelado' :
                color = 'green';
                icono = 'ok';
                break;
            case 'precio' :
                color = 'green';
                icono = 'money';
                break;
            case 'imprimir' :
                color = 'purple';
                icono = 'print';
                break;
            case 'ver' :
                color = 'purple';
                icono = 'zoom-in';
                break;
            case 'kardex':
                color = 'orange';
                icono = 'bar-chart';
                break;
            case 'confirmar' :
                color = 'green';
                icono = 'ok';
                break;
            case 'ticket':
                color = 'green';
                icono = 'ticket';
                break;
        }
        contenido += '<tr><td class="action-buttons"><a class="' + color + '" href="javascript:void(0)" ><i class="icon-' + icono + ' bigger-130"></i></a></td><td>' + titulos[leyend] + '</td></tr>';
    }
    contenido += '</tbody></table>';
    $("#table-leyenda").append(contenido);
}

//****************dias de las fechas
function getDias(fecha_inicio, fecha_final) {

    var diastotales;
    //fecha de inicio
    var fecha_inicio = new Date(fecha_inicio);
    var anio_i = fecha_inicio.getFullYear();
    var mes_i = fecha_inicio.getMonth() + 1;
    var dia_i = fecha_inicio.getDate();

    //fecha final
    var fecha_final = new Date(fecha_final);
    var anio_f = fecha_final.getFullYear();
    var mes_f = fecha_final.getMonth() + 1;
    var dia_f = fecha_final.getDate() + 1;

    var dif_anio = 0;
    var findemes;

    dif_anio = anio_f - anio_i;//1
    if (dif_anio > 0) {
        findemes = 12;
    } else {
        findemes = mes_f;
    }
    var diasmes = 0;
    var fin = dif_anio;                                        //1-----> 1-02-2014
    for (var i = 0; i <= fin; i++) {//2
        if (dif_anio > 0) {//2>0;1>0;
            findemes = 12;//12;12
            dif_anio = dif_anio - 1;//1;0
            if (i > 0) {
                mes_i = 0;
            }
        } else {
            if (i > 0) {
                mes_i = 0;
            }
            findemes = mes_f;
        }
        for (var j = mes_i + 1; j <= findemes; j++) {//1 a 12
            diasmes += diasMes(j, i);
        }

        if (i < 2) {
            diasmes = diasmes - i; //-1;
        }
    }

    dia_i = diasMes(mes_i, anio_i) - dia_i;
    dia_f = diasMes(mes_f, anio_f) - dia_f;

    diastotales = diasmes + (dia_i - dia_f);

    return diastotales;
}

function diasMes(humanMonth, year) {
    return new Date(year || new Date().getFullYear(), humanMonth, 0).getDate();
}

var makeSelectCallback = function (url, elemtId, param, callback) {
    $.ajax({
        type: 'GET',
        url: $path_base + url,
        data: param,
        dataType: 'json',
        beforeSend: function () {
            elemtId.html(cargando);
        },
        success: function (data) {

            var cadena = '';
            if (data.length > 0) {
                cadena += '<option value="">--Seleccione--</option>';
                for (var i = 0; i < data.length; i++) {
                    cadena += '<option value="' + data[i].id + '">' + data[i].descripcion + '</option>';

                }
            } else {
                cadena += '<option value="">--Seleccione--</option>';
            }
            elemtId.empty().html(cadena);
            if ((callback) && (typeof callback === 'function')) {
                callback(data);
            }
        }
    });
}

var RequestAjax = function (type, url, elementId, param, callback, error, load) {
    //console.log(param);
    $.ajax({
        type: type || 'GET',
        url: $path_base + url,
        data: param || '',
        dataType: 'json',
        cache: false,
        processData: false, // Don't process the files
        contentType: false,
        beforeSend: load || function () {
            if (elementId != null) {
                elementId.html(cargando);
            }
        },
        success: function (data) {
            //console.log(data);
            if ((callback) && (typeof callback === 'function')) {
                callback(data);
            }
        },
        error: error || function () {
            bootbox.alert('Hubo un error, regargue su pagina');
        }

    });
}

//create to table
var table = {
    render: function (element, title, actions, toolbar, fields, messages,formSubmitting, formCreated) {
        var table = element.jtable({
            title: title,
            paging: true,
            sorting: true,
            actions: actions,
            toolbar: toolbar,
            fields: fields,
            messages: messages,
            selecting: true,
            formSubmitting: function (event, data) {
                if ((formSubmitting) && (typeof formSubmitting === 'function')) {
                    return formSubmitting(event, data);
                }
            },
            formCreated: function (event, data) {
                if ((formCreated) && (typeof formCreated === 'function')) {
                    formCreated(event, data);
                }
            }
        });
        return table;
    },

    loadRecordsButton: function(element, leyendaTable){
        if($(element).length) 
        {
            $('#LoadRecordsButton').click(function (e) {
                e.preventDefault();
                element.jtable('load', {
                    search: $('#search').val()
                });
            });
            
            $('#LoadRecordsButton').click();

            if (leyendaTable != null) {
                leyenda(leyendaTable['actions'], leyendaTable['text']);
            }
        }
    }
}


