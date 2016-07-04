<?php if (isset($this->datos) && count($this->datos)) { ?>
    <div class="panel panel-default table-responsive">
        <div class="panel-heading clearfix">

            <h3 class="panel-title"><?php echo $this->titulo; ?></h3>
        </div>

        <div class="panel-body">
            <div class="navbar-inner text-center">
                <div class="row-fluid">
                    <div>
                        <br/>
                        <div class="input-append">
                            <select class="input-sm form-control inline" style="width:130px;" id="filtro">
                                <option value="0">Nombres</option>
                                <option value="1">Apellidos</option>
                                <option value="2">Usuario</option>
                                <option value="3">Perfil</option>
                            </select>
                            <input class="form-control inline" type="text" id="buscar" placeholder="Buscar..." style="width:150px;">    
                            <button class="btn btn-inverse" type="button" id="btn_buscar"><i class="icon-search icon-white"></i></button>
                            <a href="<?php echo BASE_URL ?>usuario/nuevo" class="btn btn-grey"><i class="icon-plus icon-white"></i> Nuevo</a>
                        </div>
                        <br/>
                    </div>
                </div>


                <div class="table-responsive">
                    <table id="table" class="table table-condensed table-striped table-bordered  no-margin">
                        <thead>
                            <tr>
                                <th>Item</th>
                                <th>Nombres</th>
                                <th>Apellidos</th>
                                <th>Usuario</th>
                                <th>Perfil</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php for ($i = 0; $i < count($this->datos); $i++) { ?>
                                <tr>
                                    <td><?php echo $i + 1 ?></td>
                                    <td><?php echo $this->datos[$i]['NOMBRES'] ?></td>
                                    <td><?php echo $this->datos[$i]['APELLIDOS'] ?></td>
                                    <td><?php echo $this->datos[$i]['USUARIO'] ?></td>
                                    <td><?php echo $this->datos[$i]['PPERFIL'] ?></td>
                                    <td>
                                        <a href="#myModal" role="button" data-toggle="modal" onclick="ver('<?php echo $this->datos[$i]['ID_USUARIO'] ?>')"  ><i class="fa fa-eye fa-lg"></i></a>
                                        <a href="javascript:void(0)" onclick="editar('<?php echo BASE_URL ?>usuario/editar/<?php echo $this->datos[$i]['ID_USUARIO'] ?>')"  ><i class="fa fa-edit fa-lg text-success"></i></a>
                                        <a href="javascript:void(0)" onclick="eliminar('<?php echo BASE_URL ?>usuario/eliminar/<?php echo $this->datos[$i]['ID_USUARIO'] ?>')" class="task-del" ><i class="fa fa-trash-o fa-lg text-danger"></i></a>
                                    </td>
                                </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>
                <div id="controls">
                    <div id="perpage">
                        <select onchange="sorter.size(this.value)">
                            <option value="5">5</option>
                            <option value="10" selected="selected">10</option>
                            <option value="20">20</option>
                            <option value="50">50</option>
                            <option value="100">100</option>
                        </select>
                        <span>Entradas por Página</span>
                    </div>
                    <div id="navigation">
                        <img src="<?php echo BASE_URL ?>lib/img/first.gif" width="16" height="16" alt="Primera Página" onclick="sorter.move(-1, true)" />
                        <img src="<?php echo BASE_URL ?>lib/img/previous.gif" width="16" height="16" alt="Página Anterior" onclick="sorter.move(-1)" />
                        <img src="<?php echo BASE_URL ?>lib/img/next.gif" width="16" height="16" alt="Página Siguiente" onclick="sorter.move(1)" />
                        <img src="<?php echo BASE_URL ?>lib/img/last.gif" width="16" height="16" alt="Última Página" onclick="sorter.move(1, true)" />
                    </div>
                    <div id="text">Página <span id="currentpage"></span> de <span id="pagelimit"></span></div>
                </div>
            <?php } else { ?>
                <div class="navbar-inner">
                    <p>No hay usuario</p>
                    <a href="<?php echo BASE_URL ?>usuario/nuevo" class="btn btn-primary">Nuevo</a>
                <?php } ?>
                <!--                 Modal 
                                <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                        <h3 id="myModalLabel"></h3>
                                    </div>
                                    <div class="modal-body text-justify">
                                        <div id="bodymodal">
                                            <div class="text-center">
                                                <img src="<?php // echo BASE_URL  ?>lib/img/loading.gif" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">Ok</button>
                                    </div>
                                </div>-->

                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                            </div>
                            <div class="modal-body">
                                <div class="text-center">
                                    <img src="<?php echo BASE_URL ?>lib/img/loading.gif" />
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                            </div>
                        </div>
                    </div>
                </div>



            </div>
        </div>

    </div>
</div>