
<!-- 
  Agregar el codigo de empresa en las tabla y en numero de lineas ya credas por cada producto  para generar solo el codigo de empresa
-->
<style type="text/css">
    .se-example    {
        font-family: sans-serif;
        position: relative;
        margin: 100px;
    }
    .typeahead {
        background-color: #FFFFFF;
    }
    .typeahead:focus {
        border: 1px solid #999999;
    }
    .tt-query {
        box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset;
    }
    .tt-hint {
        color: #999999;
    }
    .typeahead, .tt-query, .tt-hint {
        border: 1px solid #CCCCCC;
        border-radius: 4px;
        font-size: 16px;
        height: 38px;
        line-height: 30px;
        outline: medium none;
        padding: 8px 12px;
        width: 546px;
    }
    .tt-dropdown-menu {
        background-color: #FFFFFF;
        border: 1px solid rgba(0, 0, 0, 0.2);
        border-radius: 4px;
        box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
        margin-top: 12px;
        padding: 8px 0;
        width: 422px;
    }
    .tt-suggestion {
        font-size: 16px;
        line-height: 24px;
        padding: 3px 20px;
    }
    .tt-suggestion p {
        margin: 0;
    }
    .tt-suggestion.tt-is-under-cursor {
        background-color: #999999;
        color: #FFFFFF;
    }
    </style>
<div class="panel panel-default table-responsive">
  
<div class="panel-body">
<div class="navbar-inner text-center">
 
    
    <div id="controls">
    
<div class="row">
    <div class="col-md-12">
     
      <form class="widget-box" id="frm-compra">
      <div class="">
        <h2>
                   <!-- <a href="<?php echo BASE_URL?>" class="btn btn-xs btn-kardex btn-info pull-right">
                        <i class="icon-arrow-left"></i>
                        Atrás
                    </a>-->
          Registrar Compra
        </h2>
      
      </div>
      <div class="widget-body">
        <div class="widget-main">
          <div>
            <div class="row">
              <div class="col-md-6 spaccing">
              <input  type="hidden" id="idproveedor" value="" />
                <input class="form-control typeahead tt-query" type="text" id="proveedor_txt" autocomplete="off" placeholder="Buscar proveedor..." onkeypress="saltar(this,event,'idtipodoc');" autofocus value="" />
              </div>
              <div class="col-md-2 spaccing">
                <select id="idtipodoc" name="idtipodoc" class="form-control"
                    onKeyDown="saltar(this,event,'nrodoc');">

                  <?php for($i=0;$i<count($this->datos);$i++) {?>
                    <option value="<?php echo $this->datos[$i]["id"]?>"><?php echo $this->datos[$i]["descripcion"]?></option>
                  <?php }?>
                </select>
              </div>
              <div class="col-md-2 spaccing">
                <input type="text" id="nrodoc" name="nrodoc" placeholder="Nro.Doc" class="form-control"
                     onKeyDown="saltar(this,event,'fecha');" />
              </div>
              <div class="col-md-2 spaccing">
                <input type="text" id="fecha" name="fecha" placeholder="Fecha" value="<?php echo date('Y-m-d');?>" disabled class="form-control"
                     onKeyDown="saltar(this,event,'idtipopago');" />
              </div>
           
            </div>
          </div>
          <div>
            <div class="row">
              <div class="col-md-6 spaccing">
                <div class="input-group">
                  <input class="form-control typeahead tt-query limpiar" type="text" id="producto_txt" autocomplete="off" style="width: 546px;" 
                       placeholder="Buscar producto..."  />
                        <span class="input-group-btn"> &nbsp;</span>
                  <span class="input-group-btn">
                    <button class="btn btn-sm btn-info" type="button" data-toggle="modal" data-target="#modalProducto" >
                      <i class="fa fa-chevron-down bigger-110"></i>
                    </button>
                  </span>
                 <!-- <span class="input-group-btn">  
                    <button class="btn btn-sm btn-info" type="button" id="agregarproducto" data-toggle="modal" data-target="#modalNuevoP">
                      <i class="fa fa-plus bigger-110"></i>
                    </button>
                  </span>
        
                  -->
                </div>
              </div>
              
   
            </div>
          </div>
          <div>
            <div class="panel panel-default container_compra_main">
              <div class="panel-body container_compra">
                <table class="table table-bordered table-hover table-striped">
                  <thead>
                  <tr>
                <th>Producto</th>
                    <th>Cantidad</th>
                    <th>Precio S/.</th>
                    <th>Subtotal</th>
                    <th></th>
                  </tr>
                  </thead>
                  <tbody id='tbody_compras'>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          <div class="widget-main-int text-center">
            <div class="row">
              <div class="col-md-2 spaccing text-center margin-top">
                <label>Monto:</label>
               
              </div>


              <div class="col-md-7 spaccing">
                <input type="hidden" id="subtotal" name="subtotal" value="0">
                <input type="hidden" name="total" id="total" value="0">
                <div class="well well-sm" id="mtotal">S/. 0.00</div>
              </div>
              <div class="col-md-3 spaccing text-right margin-top">
                <button class="btn btn-primary btn-block" type="button" id="btn-save" onclick="save()">
                  <i class="icon-ok"></i>
                  Comprar
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
      </form>
    </div>
  </div>


    </div>


    </div>
    </div>
    </div>

 <div class="modal fade" id="modalNuevoP" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">
            <span aria-hidden="true">&times;</span>
            <span class="sr-only">Close</span>
          </button>
          <h4 class="modal-title" id="myModalLabel">Registrar Producto</h4>
        </div>
        <div class="modal-body">
              <div id="accountForm" class="form-horizontal">
                      <div class="tab-content">
                          <div class="tab-pane active" id="info-tab">
                              <div class="row">
                                  <div class="col-sm-8 col-sm-offset-2">
                                      <div class="form-group">
                                          <div class="mensajes_validador">
                                          </div>
                                          <label class="col-xs-4 control-label">Codigo Barra</label>
                                          <div class="col-xs-8">
                                              <input type="text" class="form-control input-sm" id="codigo" readonly/>
                                          </div>

                                      </div>

                                      <div class="form-group">
                                          <label class="col-xs-4 control-label">Codigo Empresa</label>
                                          <div class="col-xs-8">
                                              <input type="text" class="form-control input-sm" name="codigoempresa" id="codigoempresa"  onkeypress="saltar(this,event,'producto');" />
                                          </div>
                                      </div>

                                      <div class="form-group">
                                          <label class="col-xs-4 control-label">Producto</label>
                                          <div class="col-xs-8">
                                              <input type="text" class="form-control input-sm" name="producto" id="producto"  onkeypress="saltar_chosen(this,event,'linea');" />
                                          </div>
                                      </div>
                                      <div class="form-group">
                                          <label class="col-xs-4 control-label">Linea</label>
                                          <div class="col-xs-8">
                                              <select class="form-control input-sm" name="linea" id="linea">
                                              </select>
                                          </div>
                                      </div>

                                      <div class="form-group">
                                          <label class="col-xs-4 control-label">Ubicacion</label>
                                          <div class="col-xs-8">
                                              <select  class="form-control input-sm" name="ubicacion" id="ubicacion" onKeyDown="saltar(this,event,'genero');" />
                                              </select>
                                          </div>
                                      </div>

                                      <div class="form-group">
                                          <label class="col-xs-4 control-label">Genero</label>
                                          <div class="col-xs-8">
                                              <select class="form-control input-sm" name="genero" id="genero" onKeyDown="saltar(this,event,'siguiente');" >
                                              </select>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                          </div>

                      </div>
                  </div>

                  
        </div>
        <div class="modal-footer">
                  <button type="button" class="btn btn-primary btn-sm"  id="siguiente"  onclick="validar_FormP()">
                      <i class=""></i>
                      Siguiente
                  </button>
                  <button type="button" class="btn btn-primary btn-sm hide" id="btn-savep" onclick="guardarProducto()">
                      <i class="icon-print"></i>
                     Guardar
                  </button>
                  <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">
                      <i class="icon-remove"></i>
                      Cerrar
                  </button>
        </div>
      </div>
    </div>
  </div>


  <div class="modal fade" id="modalProducto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">
            <span aria-hidden="true">&times;</span>
            <span class="sr-only">Close</span>
          </button>
          <h4 class="modal-title" id="myModalLabel">Agregar Producto</h4>
        </div>
        <div class="modal-body">
          <div class="form-horizontal">
            <div class="form-group">
              <label class="col-md-2 control-label"><b>Cantidad</b></label>
              <div class="col-md-4"><input type="text" id="cantidadc" class="form-control limpiar" onKeyDown="saltar(this,event,'precio');" /></div>
            </div>
            <br/>
            <div class="form-group">
              <label class="col-md-2 control-label"><b>Precio</b></label>
              <div class="col-md-4"><input type="text" id="precioc" class="form-control limpiar"  onkeypress="return dosDecimales(event,this)"/></div>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary btn-sm" id="btn-agregar" onclick="agregar()">
            <i class="icon-ok"></i>
            Agregar
          </button>
          <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">
            <i class="icon-remove"></i>
            Cerrar
          </button>
        </div>
      </div>
    </div>
  </div>