<?php

class proveedores_controlador extends controller{

    private $_modulos;

    public function __construct() {
        if (!$this->acceso()) {
            $this->redireccionar('error/access/5050');
        }
        parent::__construct();
        $this->_modulos = $this->cargar_modelo('proveedores');
    }

    public function index() {
        $this->_vista->titulo = 'Proveedores';
       // $this->_vista->datos = $this->_modulos->todos();
        $this->_vista->setJs(array('funcion'));
        //$this->_vista->setJs_Foot(array('scriptgrilla'));
        $this->_vista->renderizar('index');
    }
    
    public function buscador(){
        if(isset($_GET["jtSorting"])){
             $_POST["jtSorting"]=$_GET["jtSorting"];
        }
           if(isset($_GET["jtPageSize"])){
             $_POST["jtPageSize"]=$_GET["jtPageSize"];
        }if(isset($_GET["jtStartIndex"])){
              $_POST["jtStartIndex"]=$_GET["jtStartIndex"];
        }
        header('Content-Type: application/json');
        echo  ($this->_modulos->buscar($_POST,['razonsocial']));
    }

    public function nuevo() {
        echo $this->_modulos->inserta($_POST);
    }

    public function editar() {
      echo $this->_modulos->actualiza($_POST);
    }

    public function eliminar() {
        echo $this->_modulos->elimina($this->filtrarInt($_POST["id"]));
    }
    public function allProveedor(){
        echo $this->_modulos->allForTable($_POST);
    }

    public function typehead(){
         header('Content-Type: application/json');
        echo  ($this->_modulos->typehead($_GET));
    }
}

?>
