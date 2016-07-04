<?php

abstract class controller {

    protected $_vista;
    protected $_modelo;
    protected $configs;
    protected $_modeloalert;
    protected $menu;

    //aqui ya tenemos el objeto vista disponible en el controlador
    public function __construct() {
        $this->_modelo = $this->cargar_modelo('modulos');
        $this->configs = $this->cargar_modelo('configuraciones');
        $this->_modelo->idmodulo = 9999;
        if(session::get('autenticado')){
            $this->_modelo->idperfil = session::get('idperfil');
             
        }
        $this->menu = $this->_modelo->selecciona();
        
        $url = explode("/",$_SERVER["REQUEST_URI"]);
        $url = $url[2];
        $this->_modelo->url=$url;
        $datos_modulos=$this->_modelo->seleccionaxurl();
        if (count($datos_modulos)>0) {
           $datos_modulo=$datos_modulos[0]['IDMODULO_PADRE'];
        }else{
            $datos_modulo="";
        }
        $this->_vista = new view(new request(),$this->menu,$datos_modulo,$this->configs);
    }

    abstract public function index();

    protected function cargar_modelo($modelo, $modulo = false) {
        //ruta del modelo
        $rutaModelo = ROOT . 'modelo' . DS . $modelo . '.php';
        //verificamos si exxiste y es legible
        if (is_readable($rutaModelo)) {
            //requerimos el archivo
            require_once $rutaModelo;
            //instanciamos
            $modelo = new $modelo;

            return $modelo;
        } else {
            throw new Exception('Error de modelo');
        }
    }

    protected function redireccionar($ruta = false) {
        if ($ruta) {
            die("<script> window.location='".BASE_URL."$ruta'; </script>");
//            header('location:' . BASE_URL . $ruta);
            exit;
        } else {
             die("<script> window.location='".BASE_URL."index'; </script>");
//            header('location:' . BASE_URL);
            
            exit;
        }
    }

    protected function filtrarInt($int) {
        $int = (int) $int;
        if (is_int($int)) {
            return $int;
        } else {
            return 0;
        }
    }

    protected function fecha_en($fecha) {
        $d = substr($fecha, 0, 2);
        $m = substr($fecha, 3, 2);
        $a = substr($fecha, 6, 4);
        return "$a-$m-$d";
    }

    public function acceso() {
        if (!session::get('autenticado')) {
            header('location:' . BASE_URL );
            exit;
        }
        $url = explode("/",$_SERVER["REQUEST_URI"]);
        $url = $url[2];
        $permisos = $this->cargar_modelo('permisos');
        $permisos->idperfil= session::get('idperfil');
        $permisos->url= $url;
        $permiso = $permisos->valida_acceso();
//        print_r($permiso);exit;
        if ($permiso[0]['ID_PERFIL']!=session::get('idperfil') || $permiso[0]['ESTADO'] ==0) {
            return false;
        } else {
            return true;
        }
    }

    protected function get_Libreria($libreria) {
        //ruta 
        $rutaLibreria = ROOT . 'lib' . DS . $libreria . '.php';
        //verificamos si existe y es legible
        if (is_readable($rutaLibreria)) {
            require_once $rutaLibreria;
        } else {
            throw new Exception('Error de libreria');
        }
    }

    public function get_matriz($datos, $cabeceras) {
        $nuevo;
        for ($i = 0; $i < count($datos); $i++) {
            for ($j = 0; $j < count($cabeceras); $j++) {
                $nuevo[$i][$cabeceras[$j]] = $datos[$i][$cabeceras[$j]];
            }
        }
        return $nuevo;
    }

}

?>
