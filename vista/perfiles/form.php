<div class="panel panel-default table-responsive">
<div class="panel-heading clearfix">
               
              <h3 class="panel-title"><?php echo $this->titulo;?></h3>
            </div>
<div class="panel-sub-heading">
<div class="panel-body">
<div class="navbar-inner">
        <form method="post" action="<?php if(isset ($this->action))echo $this->action ?>" id="frm">
            <input type="hidden" name="guardar" id="guardar" value="1"/>
            <input type="hidden" readonly="readonly" name="codigo" id="codigo"
                    value="<?php if(isset ($this->datos[0]['ID_PERFIL']))echo $this->datos[0]['ID_PERFIL']?>"/>
            <table align="center" cellpadding="10" >
                <tr>
                    <td><label class="control-label col-lg-3" >Descripcion </label></td>
                    <td>
                    <input type="text" name="descripcion" onkeypress="return soloLetras(event)" class="form-control input-sm parsley-validated"
                            id="descripcion" value="<?php if(isset ($this->datos[0]['DESCRIPCION']))echo $this->datos[0]['DESCRIPCION']?>"/></td>
                </tr>
                <tr>
                    <td colspan="2" class="text-center"><br>
                    <p><button type="button" class="btn btn-success btn-sm" id="save">Guardar</button>
                    <a href="<?php echo BASE_URL ?>perfiles" class="btn btn-danger btn-sm">Cancelar</a></p>
                    </td>
                </tr>
            </table>
        </form>
    </div>
     </div>
     </div>
     </div>