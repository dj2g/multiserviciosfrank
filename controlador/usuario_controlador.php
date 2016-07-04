<?php

class usuario_controlador extends controller{

    private $_usuario;
    private $_perfil;

    public function __construct() {
        if (!$this->acceso()) {
            $this->redireccionar('error/access/5050');
        }
        parent::__construct();
        $this->_usuario=  $this->cargar_modelo('usuario');
        $this->_perfil = $this->cargar_modelo('perfiles');
    }

    public function index() {
        $this->_vista->titulo = 'Lista de Usuario';
        $this->_vista->datos = $this->_usuario->selecciona();
        $this->_vista->setJs(array('funcion'));
        $this->_vista->setJs_Foot(array('scriptgrilla'));
        $this->_vista->renderizar('index');
    }
    
    public function ver(){
        $this->_usuario->id_usuario=$_POST['id'];
        echo json_encode($this->_usuario->selecciona());
    }
    
    public function buscador(){
        if($_POST['filtro']==0){
            $this->_usuario->nombres=$_POST['cadena'];
        }
        if($_POST['filtro']==1){
            $this->_usuario->apellidos=$_POST['cadena'];
        }
        if($_POST['filtro']==2){
            $this->_usuario->usuario=$_POST['cadena'];
        }
        if($_POST['filtro']==3){
            $this->_usuario->perfil=$_POST['cadena'];
        }
        echo json_encode($this->_usuario->selecciona());
    }

    public function nuevo() {
//        echo '<pre>';print_r($_POST);exit;
        if (isset($_POST['guardar'])&&$_POST['guardar'] == 1) {
            $this->_usuario->nombres = $_POST['nombres'];
            $this->_usuario->apellidos = $_POST['apellidos'];
            $this->_usuario->direccion = $_POST['direccion'];
            $this->_usuario->telefono = $_POST['telefono'];
            $this->_usuario->dni = $_POST['dni'];
            $this->_usuario->usuario = $_POST['usuario'];
            $this->_usuario->clave = $_POST['clave'];
            $this->_usuario->id_perfil = $_POST['id_perfil'];
            $this->_usuario->inserta();
            $this->redireccionar('usuario');
        }
        $this->_vista->datos_perfil = $this->_perfil->selecciona();
        $this->_vista->titulo = 'Registrar Usuario';
        $this->_vista->action = BASE_URL . 'usuario/nuevo';
        $this->_vista->setJs(array('funciones_form','jquery-ui.min'));
        $this->_vista->renderizar('form');
    }

    public function editar($id) {
        if (!$this->filtrarInt($id)) {
            $this->redireccionar('usuario');
        }

        $this->_usuario->id_usuario = $this->filtrarInt($id);
        $this->_vista->datos = $this->_usuario->selecciona();

        if (isset($_POST['guardar'])&&$_POST['guardar'] == 1) {
            $this->_usuario->id_usuario = $_POST['codigo'];
            $this->_usuario->nombres = $_POST['nombres'];
            $this->_usuario->apellidos = $_POST['apellidos'];
            $this->_usuario->direccion = $_POST['direccion'];
            $this->_usuario->telefono = $_POST['telefono'];
            $this->_usuario->dni = $_POST['dni'];
            $this->_usuario->usuario = $_POST['usuario'];
            $this->_usuario->clave = $_POST['clave'];
            $this->_usuario->id_perfil = $_POST['id_perfil'];
            $this->_usuario->actualiza();
            $this->redireccionar('usuario');
        }
        $this->_vista->datos_perfil = $this->_perfil->selecciona();
        $this->_vista->titulo = 'Actualizar Usuario';
        $this->_vista->setJs(array('funciones_form','jquery-ui.min'));
        $this->_vista->renderizar('form');
    }

    public function eliminar($id) {
        if (!$this->filtrarInt($id)) {
            $this->redireccionar('usuario');
        }
        $this->_usuario->id_usuario = $this->filtrarInt($id);
        $this->_usuario->elimina();
        $this->redireccionar('usuario');
    }
    
}

?>
