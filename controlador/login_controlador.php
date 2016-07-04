<?php

class login_controlador extends controller {
    
    private $_usuario;
    
    public function __construct() {
        parent::__construct();
        $this->_usuario=  $this->cargar_modelo('usuario');
    }

    public function index() {
        if($_POST['usuario'] == '' || $_POST['clave'] == ''){
            echo "<script>alert('Ingrese usuario y clave')</script>";
            $this->redireccionar();
        }
        /*if ($_SESSION['tmptxt'] != $_POST['tmptxt']) {
            echo "<script>alert('Captcha incorrecto')</script>";
            $this->redireccionar();
        }*/
            
        $datos=$this->_usuario->seleccionar($_POST['usuario'],$_POST['clave']);
        $search  = array('á', 'é', 'í', 'ó', 'ú', 'ñ');
        $replace = array('Á', 'É', 'Í', 'Ó', 'Ú', 'Ñ');
        foreach ($_POST as $key => $value) {
            $_POST[$key]=str_replace($search, $replace, strtoupper($value) );
        }
        //echo '<pre>';print_r($datos);exit;
        if($datos[0]['USUARIO']== $_POST['usuario'] && $datos[0]['ID_USUARIO']!=''){
            session::set('autenticado', true);
            session::set('idusuario', $datos[0]['ID_USUARIO']);
            session::set('idusuariosiga', $datos[0]['USUARIO']);
            session::set('usuario', $datos[0]['NOMBRES']." ".$datos[0]['APELLIDOS']);
            session::set('perfil', $datos[0]['PERFIL']);
            session::set('idperfil', $datos[0]['ID_PERFIL']);
            $this->redireccionar();
        }else{
            echo '<script>alert("usuario o clave incorrecta")</script>';
            session_destroy();
            $this->redireccionar();
        }
    }
    
    public function mostrar() {
        echo 'Usuario: ' . session::get('usuario') . '<br>';
        echo 'Perfil: ' . session::get('perfil') . '<br>';
    }

    public function cerrar() {
        session::destroy();
        echo '<script>alert("Sesion finalizada")</script>';
        $this->redireccionar();
    }

}

?>
