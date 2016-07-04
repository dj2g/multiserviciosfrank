<div class="panel panel-default table-responsive">
    <div class="panel-heading clearfix">

        <h3 class="panel-title"><?php echo $this->titulo; ?></h3>
    </div>

    <div class="panel-body">

        <div class="navbar-inner">
            <form method="post" action="<?php if (isset($this->action)) echo $this->action ?>" id="frm">
                <input type="hidden" name="guardar" id="guardar" value="1"/>
                <table align="center" cellpadding="20" >
                    <caption><span id="msg"></span></caption>
                    <tr>
                        <td><label class="control-label col-lg-3" >SGBD: </label></td>
                        <td>
                            <select class="input-sm form-control inline" style="width:130px;" name="sgbd" id="sgbd">
                                <option></option>
                                <option value="mysql">MySQL</option>            
                                <option value="pgsql">PostgreSQL</option>            
                                <option value="mssql">SQL Server</option>            
                                <option value="oci">Oracle</option>            
                            </select>
                        </td>
                    </tr>
                    <tr> 
                        <td><label class="control-label col-lg-3" >Usuario: </label></td>
                        <td><br><input type="text" class="form-control input-sm parsley-validated"  name="usuario" id="usuario" value="" /> </td>

                    </tr>
                    <tr>
                        <td><label class="control-label col-lg-3">Clave: </label></td>
                        <td><br><input type="password" class="form-control input-sm parsley-validated"  name="clave" id="clave" value="" /></td>
                    </tr>
                    <tr>
                        <td><label class="control-label col-lg-3">Host: </label></td>
                        <td><br><input type="text" class="form-control input-sm parsley-validated"  name="host" id="host" value="" /></td>
                    </tr>
                    <tr>
                        <td><label class="control-label col-lg-3">Puerto: </label></td>
                        <td><br><input type="text"  class="form-control input-sm parsley-validated"  name="puerto" id="puerto" value="" /></td>
                    </tr>
                    <tr>
                        <td><label class="control-label col-lg-12">Base de Datos: </label></td>
                        <td><br><input type="text"  class="form-control input-sm parsley-validated" name="basedatos" id="basedatos" value="" /></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <br>
                            <p><button type="submit" id="save" class="btn btn-success btn-sm">Guardar</button>
                                <a href="<?php echo BASE_URL ?>index" class="btn btn-danger btn-sm">Cancelar</a></p>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
