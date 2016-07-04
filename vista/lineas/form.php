<div class="panel panel-default table-responsive">
<div class="panel-heading clearfix">
               
              <h3 class="panel-title"><?php echo $this->titulo;?></h3>
            </div>

    <div class="panel-body">
    <form method="post" action="<?php if(isset ($this->action))echo $this->action ?>" id="frm">
    <input type="hidden" name="guardar" id="guardar" value="1"/>
    <input type="hidden" name="estado" value="1" />
    <input type="hidden" readonly="readonly" name="id" id="id"
                value="<?php if(isset ($this->datos[0]['ID']))echo $this->datos[0]['ID']?>"/>
    <table align="center" cellpadding="10">
        <tr>
            <td><label class="control-label col-lg-12">Descripcion:</label></td>
            <td><input type="text" name="descripcion" onkeypress="return soloLetras(event)" class="form-control input-sm parsley-validated"
                       id="descripcion" value="<?php if(isset ($this->datos[0]['DESCRIPCION']))echo $this->datos[0]['DESCRIPCION']?>"/><br></td>
        </tr>
        <tr>
            <td><label class="control-label col-lg-12" >Tipo de Productos:</label></td>
            <td>
                <select class="input-sm form-control inline" style="width:200px;" id="idtipo" name="idtipo">
                    <?php for($i=0;$i<count($this->modulos_padre);$i++){ ?>
                        <?php if( $this->datos[0]['IDTIPO'] == $this->modulos_padre[$i]['ID'] ){ ?>
                    <option value="<?php echo $this->modulos_padre[$i]['ID'] ?>" selected="selected"><?php echo $this->modulos_padre[$i]['DESCRIPCION'] ?></option>
                        <?php } else { ?>
                    <option value="<?php echo $this->modulos_padre[$i]['ID'] ?>"><?php echo $this->modulos_padre[$i]['DESCRIPCION'] ?></option>
                        <?php } ?>
                    <?php } ?>
                </select><br>
            </td>

        </tr>
        <tr>
            <td colspan="2" align="center">
                <br>
                <p><button type="submit" class="btn btn-success btn-sm" id="save">Guardar</button>
                <a href="<?php echo BASE_URL ?>lineas" class="btn btn-danger btn-sm">Cancelar</a></p>
            </td>
        </tr>
    </table>
</form>
        </div>
     </div>