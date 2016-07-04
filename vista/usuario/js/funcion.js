    $(function(){
        $("#buscar").focus();
        function buscar(){
            $.post(url+'usuario/buscador','cadena='+$("#buscar").val()+'&filtro='+$("#filtro").val(),function(datos){
                HTML = '<table id="table" class="table table-striped table-bordered sortable">'+
                        '<thead>'+
                            '<tr>'+
                                '<th>Item</th>'+
                                '<th>Nombres</th>'+
                                '<th>Apellidos</th>'+
                                '<th>Usuario</th>'+
                                '<th>Perfil</th>'+
                                '<th>Acciones</th>'+
                            '</tr>'+
                            '</thead>'+
                            '<tbody>';

                for(var i=0;i<datos.length;i++){
                    HTML += '<tr>';
                    HTML += '<td>'+(i+1)+'</td>';
                    HTML += '<td>'+datos[i].NOMBRES+'</td>';
                    HTML += '<td>'+datos[i].APELLIDOS+'</td>';
                    HTML += '<td>'+datos[i].USUARIO+'</td>';
                    HTML += '<td>'+datos[i].PPERFIL+'</td>';
                    var editar=url+'usuario/editar/'+datos[i].ID_USUARIO; 
                    var eliminar=url+'usuario/eliminar/'+datos[i].ID_USUARIO;   
                    HTML += '<td><a style="margin-right:4px" href="#myModal" role="button" data-toggle="modal" onclick="ver(\''+datos[i].ID_USUARIO+'\')" class="btn btn-warning btn-minier"><i class="fa fa-eye fa-lg"></i> Ver</a>';
                    HTML += '<a style="margin-right:4px" href="javascript:void(0)" onclick="editar(\''+editar+'\')"  ><i class="fa fa-edit fa-lg text-success""></i> Editar</a>';
                    HTML += '<a href="javascript:void(0)" onclick="eliminar(\''+eliminar+'\')" class="task-del" ><i class="fa fa-trash-o fa-lg text-danger"></i> Eliminar</a>';
                    HTML += '</td>';
                    HTML += '</tr>';
                }
                HTML += '</tbody></table>'
                $("#grilla").html(HTML);
                $("#jsfoot").html('<script src="'+url+'vista/web/js/scriptgrilla.js"></script>');
            },'json');
        }
        $("#buscar").keyup(function(event){
           buscar();
        });
        
        $("#btn_buscar").click(function(){
            buscar();
            $("#buscar").focus();
        });
        
    });
    function ver(id){
            $("#myModalLabel").html('');
            $("#bodymodal").html('<div class="text-center"><img src="'+url+'lib/img/loading.gif" /></div>');
            html='';titulo='';
           $.post(url+'usuario/ver','id='+id,function(datos){
                titulo= 'Usuario: '+datos[0]['NOMBRES']+' '+datos[0]['APELLIDOS'];
                html+='<table class="table table-striped table-bordered table-hover sortable">';
                html+= '<tr>';
                html+= '<td>Direccion:</td>';
                html+= '<td>'+datos[0]['DIRECCION']+'</td>';
                html+= '</tr>';
                if(datos[0]['TELEFONO'] != null && datos[0]['TELEFONO'] != ' ' && datos[0]['TELEFONO'] != ''){
                html+= '<tr>';
                html+= '<td>Telefono:</td>';
                html+= '<td>'+datos[0]['TELEFONO']+'</td>';
                html+= '</tr>';
                }
                html+= '<tr>';
                html+= '<td>Dni:</td>';
                html+= '<td>'+datos[0]['DNI']+'</td>';
                html+= '</tr>';
                html+= '<tr>';
                html+= '<td>Usuario:</td>';
                html+= '<td>'+datos[0]['USUARIO']+'</td>';
                html+= '</tr>';
                html+= '<tr>';
                html+= '<td>Perfil:</td>';
                html+= '<td>'+datos[0]['PPERFIL']+'</td>';
                html+= '</tr>';
                html+= '</table>';
                $("#myModalLabel").html(titulo);
                $("#bodymodal").html(html);
           },'json');
       }
