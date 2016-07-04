<?php

class usuario extends Main{
    
    public $id_usuario;
    public $nombres;
    public $apellidos;
    public $direccion;
    public $dni;
    public $telefono;
    public $usuario;
    public $clave;
    public $id_perfil;
    public $perfil;

    public function selecciona() {
        if (is_null($this->id_usuario)) {
            $this->id_usuario = 0;
        }
        if (is_null($this->nombres)) {
            $this->nombres = '';
        }
        if (is_null($this->apellidos)) {
            $this->apellidos = '';
        }
        if (is_null($this->usuario)) {
            $this->usuario = '';
        }
        if (is_null($this->perfil)) {
            $this->perfil = '';
        }
        $datos = array($this->id_usuario, $this->nombres, $this->apellidos,$this->usuario, $this->perfil);
//        echo '<pre>';print_r($datos);exit;
        $r = $this->get_consulta("sel_usuario", $datos);
        if ($r[1] == '') {
            $stmt = $r[0];
        } else {
            die($r[1]);
        }
        $r = null;
        if (conexion::$_servidor == 'oci') {
            oci_fetch_all($stmt, $data, null, null, OCI_FETCHSTATEMENT_BY_ROW);
            return $data;
        } else {
            $stmt->setFetchMode(PDO::FETCH_ASSOC);
            return $stmt->fetchall();
        }
    }

    public function inserta() {
        $datos = array($this->nombres, $this->apellidos, $this->direccion, $this->dni, $this->telefono, 
            $this->usuario, $this->clave, $this->id_perfil);
//        echo '<pre>';print_r($_POST);exit;
        $r = $this->get_consulta("ins_usuario", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

    public function actualiza() {
        $datos = array($this->id_usuario, $this->nombres, $this->apellidos, $this->direccion, $this->dni, $this->telefono, 
            $this->usuario, $this->clave, $this->id_perfil);
        $r = $this->get_consulta("act_usuario", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }

    public function seleccionar($usuario,$clave) {
        $datos = array($usuario,$clave);
        $r = $this->get_consulta("pa_selecciona_login", $datos);
        if ($r[1] == '') {
            $stmt = $r[0];
        } else {
            die($r[1]);
        }
        $r = null;
        if (conexion::$_servidor == 'oci') {
            oci_fetch_all($stmt, $data, null, null, OCI_FETCHSTATEMENT_BY_ROW);
            return $data;
        } else {
            $stmt->setFetchMode(PDO::FETCH_ASSOC);       
            return $stmt->fetchall();
//            echo '<pre>';
//            print_r($stmt->fetchall());
//            die();
        }
    }

    public function elimina() {
        $datos = array($this->id_usuario);
        $r = $this->get_consulta("elim_usuario", $datos);
        $error = $r[1];
        $r = null;
        return $error;
    }
    
    public function login_android($usuario, $clave) {
        $datos = array($usuario, $clave);
        $r = $this->get_consulta("pa_login_android", $datos);
        if ($r[1] == '') {
            $stmt = $r[0];
        } else {
            die($r[1]);
        }
        $r = null;
        $stmt->setFetchMode(PDO::FETCH_ASSOC);
        return $stmt->fetch();
    }

}

?>
