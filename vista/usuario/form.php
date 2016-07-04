<!--<script src="<?php //echo $_params['ruta_js'];  ?>bootbox.min.js"></script>-->
<link href="<?php echo $_params['ruta_css']; ?>jquery-ui.custom.css" rel="stylesheet" />
<div class="panel panel-default table-responsive">
    <div class="panel-heading clearfix">

        <h3 class="panel-title"><?php echo $this->titulo; ?></h3>
    </div>
    <div class="panel-body">
        <form method="post" action="<?php if (isset($this->action)) echo $this->action ?>" id="frm">
            <input type="hidden" name="guardar" id="guardar" value="1"/>
            <input type="hidden" readonly="readonly" name="codigo" id="codigo" 
                   value="<?php if (isset($this->datos[0]['ID_USUARIO'])) echo $this->datos[0]['ID_USUARIO'] ?>"/>
            <table align="center" cellpadding="10">
                <tr>
                    <td><label class="control-label col-lg-3">Nombres:</label><br></td>
                    <td><input type="text" name="nombres" onkeypress="return soloLetras(event)" class="form-control input-sm parsley-validated" 
                               id="nombres" value="<?php if (isset($this->datos[0]['NOMBRES'])) echo $this->datos[0]['NOMBRES'] ?>"/><br></td>
                    <td><label class="control-label col-lg-3" >Apellidos:</label><br></td>
                    <td><input type="text" name="apellidos" onkeypress="return soloLetras(event)" class="form-control input-sm parsley-validated" 
                               id="apellidos" value="<?php if (isset($this->datos[0]['APELLIDOS'])) echo $this->datos[0]['APELLIDOS'] ?>"/><br></td>
                </tr>
                <tr>
                    <td><label class="control-label col-lg-3">Direccion:</label><br></td>
                    <td><input type="text" name="direccion" class="form-control input-sm parsley-validated" 
                               id="direccion" value="<?php if (isset($this->datos[0]['DIRECCION'])) echo $this->datos[0]['DIRECCION'] ?>"/><br></td>
                    <td><label class="control-label col-lg-3">Telefono:</label></td>
                    <td><input type="text" name="telefono" id="telefono" onkeypress="return numeroTelefonico(event)" class="form-control input-sm parsley-validated" 
                               value="<?php if (isset($this->datos[0]['TELEFONO'])) echo $this->datos[0]['TELEFONO'] ?>"/><br></td>
                </tr>
                <tr>
                    <td><label class="control-label col-lg-3">DNI:</label><br></td>
                    <td><input type="text" name="dni" id="dni" maxlength="8" onkeypress="return soloNumeros(event)" min="8" class="form-control input-sm parsley-validated" 
                               value="<?php if (isset($this->datos[0]['DNI'])) echo $this->datos[0]['DNI'] ?>"/><br></td>
                    <td><label class="control-label col-lg-3" >Perfil:</label><br></td>
                    <td>
                        <select class="input-sm form-control inline" style="width:130px;" id="id_perfil" name="id_perfil" >
                            <option value="0"></option>
                            <?php for ($i = 0; $i < count($this->datos_perfil); $i++) { ?>
                                <?php if ($this->datos[0]['ID_PERFIL'] == $this->datos_perfil[$i]['ID_PERFIL']) { ?>
                                    <option value="<?php echo $this->datos_perfil[$i]['ID_PERFIL'] ?>" selected="selected"><?php echo $this->datos_perfil[$i]['DESCRIPCION'] ?></option>
                                <?php } else { ?>
                                    <option value="<?php echo $this->datos_perfil[$i]['ID_PERFIL'] ?>"><?php echo $this->datos_perfil[$i]['DESCRIPCION'] ?></option>
                                <?php } ?>
                            <?php } ?>
                        </select><br>
                    </td>
                </tr>
                <tr>
                    <td><label class="control-label col-lg-3">Usuario:</label><br></td>
                    <td><input type="text" name="usuario" id="usuario"  class="form-control input-sm parsley-validated" 
                               value="<?php if (isset($this->datos[0]['USUARIO'])) echo $this->datos[0]['USUARIO'] ?>"/><br></td>
                    <td><label class="control-label col-lg-3">Clave:</label><br></td>
                    <td><input type="password" name="clave" id="clave"  class="form-control input-sm parsley-validated" 
                               value="<?php if (isset($this->datos[0]['CLAVE'])) echo $this->datos[0]['CLAVE'] ?>"/><br></td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <br>
                        <p><button type="button" class="btn btn-success btn-sm" id="save">Guardar</button>
                            <a href="<?php echo BASE_URL ?>usuario" class="btn btn-danger btn-sm">Cancelar</a></p>
                    </td>
                </tr>
            </table>
        </form>
    </div> </div>