
<div class="panel panel-default table-responsive">
<div class="panel-heading clearfix">
               
              <h3 class="panel-title"><?php echo $this->titulo;?></h3>
            </div>

    <div class="panel-body">
    <form method="post" action="<?php if(isset ($this->action))echo $this->action ?>" id="frm">
    <input type="hidden" name="guardar" id="guardar" value="1"/>
    <input type="hidden" readonly="readonly" name="id" id="id"
                value="<?php if(isset ($this->datos[0]['ID']))echo $this->datos[0]['ID']?>"/>
    <table align="center" cellpadding="10">
        <tr>
            <td><label class="control-label col-lg-12">Descripcion:</label></td>
            <td><input type="text" name="descripcion" onkeypress="return soloLetras(event)" class="form-control input-sm parsley-validated"
                       id="descripcion" value="<?php if(isset ($this->datos[0]['DESCRIPCION']))echo $this->datos[0]['DESCRIPCION']?>"/><br></td>
        </tr>
        <tr>
            <td><label class="control-label col-lg-12" >Abreviacion:</label></td>
            <td><input type="text" name="abreviacion"  class="form-control input-sm parsley-validated"
                       id="icono" value="<?php if(isset ($this->datos[0]['ABREVIACION']))echo $this->datos[0]['ABREVIACION']?>"/><br></td>
                       <input type="hidden" name="estado" class="form-control input-sm parsley-validated"id="estado" value="1"/></td>
        </tr>
        
        <tr>
            <td colspan="2" align="center">
                <br>
                <p><button type="submit" class="btn btn-success btn-sm" id="save">Guardar</button>
                <a href="<?php echo BASE_URL ?>tipo_productos" class="btn btn-danger btn-sm">Cancelar</a></p>
            </td>
        </tr>
    </table>
</form>
        </div>
     </div>