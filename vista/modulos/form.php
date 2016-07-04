<div class="panel panel-default table-responsive">
<div class="panel-heading clearfix">
               
              <h3 class="panel-title"><?php echo $this->titulo;?></h3>
            </div>

    <div class="panel-body">
    <form method="post" action="<?php if(isset ($this->action))echo $this->action ?>" id="frm">
    <input type="hidden" name="guardar" id="guardar" value="1"/>
    <input type="hidden" readonly="readonly" name="codigo" id="codigo"
                value="<?php if(isset ($this->datos[0]['IDMODULO']))echo $this->datos[0]['IDMODULO']?>"/>
    <table align="center" cellpadding="10">
        <tr>
            <td><label class="control-label col-lg-12">Descripcion:</label></td>
            <td><input type="text" name="descripcion" onkeypress="return soloLetras(event)" class="form-control input-sm parsley-validated"
                       id="descripcion" value="<?php if(isset ($this->datos[0]['DESCRIPCION']))echo $this->datos[0]['DESCRIPCION']?>"/><br></td>
        </tr>
        <tr>
            <td><label class="control-label col-lg-12" >Icono:</label></td>
            <td><input type="text" name="icono"  class="form-control input-sm parsley-validated"
                       id="icono" value="<?php if(isset ($this->datos[0]['ICONO']))echo $this->datos[0]['ICONO']?>"/><br></td>
        </tr>
        <tr>
            <td><label class="control-label col-lg-12" >Url:</label></td>
            <td><input type="text" name="url" class="form-control input-sm parsley-validated"
                       id="url" value="<?php if(isset ($this->datos[0]['URL']))echo $this->datos[0]['URL']?>"/><br></td>
        </tr>
        <tr>
            <td><label class="control-label col-lg-12" >Modulo Padre:</label></td>
            <td>
                <select class="input-sm form-control inline" style="width:200px;" id="modulo_padre" name="modulo_padre">
                    <?php for($i=0;$i<count($this->modulos_padre);$i++){ ?>
                        <?php if( $this->datos[0]['IDMODULO_PADRE'] == $this->modulos_padre[$i]['IDMODULO'] ){ ?>
                    <option value="<?php echo $this->modulos_padre[$i]['IDMODULO'] ?>" selected="selected"><?php echo $this->modulos_padre[$i]['DESCRIPCION'] ?></option>
                        <?php } else { ?>
                    <option value="<?php echo $this->modulos_padre[$i]['IDMODULO'] ?>"><?php echo $this->modulos_padre[$i]['DESCRIPCION'] ?></option>
                        <?php } ?>
                    <?php } ?>
                </select><br>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <br>
                <p><button type="submit" class="btn btn-success btn-sm" id="save">Guardar</button>
                <a href="<?php echo BASE_URL ?>modulos" class="btn btn-danger btn-sm">Cancelar</a></p>
            </td>
        </tr>
    </table>
</form>
        </div>
     </div>