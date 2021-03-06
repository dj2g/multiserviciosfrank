<?php if (isset($this->datos) && count($this->datos)) { ?>
        <div class="panel panel-default table-responsive">
 <div class="panel-heading clearfix">
               
              <h2 class="panel-title"><?php echo $this->titulo;?></h2>
            </div>
            
  
<div class="panel-body">
<div class="navbar-inner text-center">
    <div class="row-fluid">
        <div>
            <br/>
            <div class="input-append">
            <select class="input-sm form-control inline" style="width:130px;" id="filtro">
            <option value="0">Descripcion</option>
            <option value="1">Modulo Padre</option>
                </select>
                <input class="form-control inline" type="text" id="buscar" placeholder="Buscar..." style="width:150px;" >    
                <button class="btn btn-inversput-xlargee" type="button" id="btn_buscar"><i class="icon-search icon-white"></i></button>
                <a href="<?php echo BASE_URL ?>modulos/nuevo" class="btn btn-grey"><i class="icon-plus icon-white"></i> Nuevo</a>
            </div>
            <br/>
        </div>
    </div>
    <div id="grilla">
    <table id="table" class="table table-striped table-bordered table-hover sortable">
        <thead>
        <tr>
            <th>Item</th>
            <th>Descripcion</th>
            <th>Icono</th>
            <th>Url</th>
            <th>Modulo Padre</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <?php for ($i = 0; $i < count($this->datos); $i++) { ?>
            <tr>
                <td><?php echo $i+1 ?></td>
                <td><?php echo $this->datos[$i]['DESCRIPCION'] ?></td>
                <td><?php echo $this->datos[$i]['ICONO'] ?></td>
                <td><?php echo $this->datos[$i]['URL'] ?></td>
                <td><?php echo $this->datos[$i]['MODULO_PADRE'] ?></td>
                <td>
                    <a href="javascript:void(0)" onclick="editar('<?php echo BASE_URL?>modulos/editar/<?php echo $this->datos[$i]['IDMODULO'] ?>')" ><i class="fa fa-edit fa-lg text-success"></i></a>
                    <a href="javascript:void(0)" onclick="eliminar('<?php echo BASE_URL?>modulos/eliminar/<?php echo $this->datos[$i]['IDMODULO'] ?>')" class="task-del"><i class="fa fa-trash-o fa-lg text-danger"></i></a>
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
			<img src="<?php echo BASE_URL ?>lib/img/first.gif" width="16" height="16" alt="Primera Página" onclick="sorter.move(-1,true)" />
			<img src="<?php echo BASE_URL ?>lib/img/previous.gif" width="16" height="16" alt="Página Anterior" onclick="sorter.move(-1)" />
			<img src="<?php echo BASE_URL ?>lib/img/next.gif" width="16" height="16" alt="Página Siguiente" onclick="sorter.move(1)" />
			<img src="<?php echo BASE_URL ?>lib/img/last.gif" width="16" height="16" alt="Última Página" onclick="sorter.move(1,true)" />
		</div>
		<div id="text">Página <span id="currentpage"></span> de <span id="pagelimit"></span></div>
	</div>
    <?php } else { ?>
<div class="navbar-inner">
        <p>No hay modulos</p>
        <a href="<?php echo BASE_URL?>modulos/nuevo" class="btn btn-primary">Nuevo</a>
    <?php } ?>
</div>
    </div>
    </div>
    </div>