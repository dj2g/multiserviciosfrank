<?php

class web_controlador extends controller {
    private $_modulos;
    private $_informacion;
    public function __construct() {
        parent::__construct();
        $this->_modulos = $this->cargar_modelo('configuraciones');
    }
    
    public function index() {
        $this->_vista->datos =$this->_modulos->todos();
        $this->_vista->renderiza_web('index');
    }
    
    public function login(){
        $this->_vista->datos = $this->_informacion->selecciona();
        $this->_vista->renderiza_web('login');
    }
    
     
    
}

?>
