<script> url = <?php echo BASE_URL ?></script>
<div class="panel panel-default table-responsive">
    <div class="panel-heading clearfix">

        <h3 class="panel-title"><?php echo $this->titulo; ?></h3>
    </div>

    <div class="panel-body">
        <div class="navbar-inner text-center">
            <table align="center">
                <tr>
                    <td><label class="control-label col-lg-3" >Perfil: </label> </td>
                    <td>
                        <select class="input-sm form-control inline" style="width:130px;" required name="perfil" id="perfil">
                            <option value="0">Seleccione...</option>
                            <?php for ($i = 0; $i < count($this->datos_perfiles); $i++) { ?>
                                <option value="<?php echo $this->datos_perfiles[$i]['ID_PERFIL'] ?>"><?php echo $this->datos_perfiles[$i]['DESCRIPCION'] ?></option>
                            <?php } ?>
                        </select>
                    </td>
                    <td id="celda_aceptar">
                        <a href="<?php echo BASE_URL ?>permisos" class="btn btn-primary">Aceptar</a>
                    </td>
                </tr>
            </table>



            <div id="div_modulos" align="left">
                <ul id='modulos'>
                    <?php
                    for ($i = 0; $i < count($this->datos_modulos); $i++) {
                        $idmodulo = $this->datos_modulos[$i]['IDMODULO'];
                        $idmodulo_padre = $this->datos_modulos[$i]['IDMODULO_PADRE'];
                        $modulo = $this->datos_modulos[$i]['DESCRIPCION'];
                        if ($idmodulo_padre == 0) {
                            echo "<li>" . $modulo . "<ul>";
                            for ($j = 0; $j < count($this->datos_modulos); $j++) {
                                if ($this->datos_modulos[$j]['IDMODULO_PADRE'] == $idmodulo) {
                                    $id = $this->datos_modulos[$j]['IDMODULO'];
                                    $descripcion = $this->datos_modulos[$j]['DESCRIPCION'];
                                    echo "<li><label class='checkbox'><input type='checkbox' class='chk-row' name='$id' id='$id'/><span class='custom-checkbox'></span>" . $descripcion . "</label></li>";
                                }
                            }
                            echo "</ul></li>";
                        }
                    }
                    ?>
                </ul>
            </div>
        </div>
    </div>
</div>
