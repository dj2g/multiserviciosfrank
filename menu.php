<?php

Class menu {

//cargarmenu("0"); // Donde 0 es el Idpadre principal <ul class="list-inline"><li class=""><a href="profile.html">Profile</a></li><li class=""><a href="inbox.html" class="no-margin">Inbox</a></li></ul>
    protected $_id;
    protected $_datos;
    protected $_id_modulopadre;
    private $_c = 0;

    public function __construct($datos, $id_modulopadre) {
        $this->_datos = $datos;
        $this->_id_modulopadre = $id_modulopadre;
        $this->unemenu();
    }
    function unemenu() {

        $html = "";
        $html = $html . '<aside class="fixed skin-2">			
			<div class="sidebar-inner scrollable-sidebar">
				<div class="size-toggle">
					<a class="btn btn-sm" id="sizeToggle">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</a>
					<a class="btn btn-sm pull-right logoutConfirm_open"  href="#logoutConfirm">
						<i class="fa fa-power-off"></i>
					</a>
				</div><!-- /size-toggle -->	
				
                                <!-- /user-block -->
                                <div class="user-block clearfix">
                    <img src="'.BASE_URL.'lib/img/user.jpg" alt="User Avatar">
                    <div class="detail">
                        <strong> '.session::get('usuario').'</strong>
                       
                    </div>
                </div>
				 <!-- /search-block -->';

        $html = $html . '<div class="main-menu">
		     <ul>';
                 $html = $html .'<li class="">';
				$html = $html ."<a href='" . BASE_URL . "index'>";
				$html = $html .	'<span class="menu-icon">';
					$html = $html .'<i class="fa fa-desktop fa-lg"></i> ';
					$html = $html .	'</span>';
						$html = $html .	'<span class="text">';
						$html = $html .	'Inicio';
							$html = $html .	'</span>';
							$html = $html .	'<span class="menu-hover"></span>';
							$html = $html .'</a>';
						$html = $html .'</li>';

//       echo "<header class='navbar' role='navigation'>";
//        echo "<nav class='collapse navbar-collapse bs-navbar-collapse' role='navigation'>";
//
//        echo "<ul class='nav navbar-nav'>";
        
        
        echo $html;
        $this->cargarmenu();


        //echo "<li><a href='" . BASE_URL . "'><i class='icon-desktop'></i><span>Web</span></a></li>";
        echo "</ul>";
        echo "</div>";
        echo "</div>";
        echo '</aside><div id="main-container">'
		 ;
    }

    function cargarmenu() {
        if (isset($this->_datos) && count($this->_datos)) {
            for ($i = 0; $i < count($this->_datos); $i++) {
                if ($this->_c == 0) {
                    $descripcion = ucwords(strtolower($this->_datos[$i]['XMODULOS']));

                    if ($this->_datos[$i]['IDMODULO'] == $this->_id_modulopadre) {

                        echo "<li class='active openable'><a href='#'><span class='menu-icon'><i class='" . strtolower($this->_datos[$i]['ICONO']) . "'></i></span><span class='text'>$descripcion</span><span class='menu-hover'></span> </a><ul class='submenu' style='display: block;'>";
                    } else {

                        echo "<li class='openable'><a href='#'><span class='menu-icon'><i class='" . strtolower($this->_datos[$i]['ICONO']) . "'></i></span><span class='text'>$descripcion</span><span class='menu-hover'></span> </a><ul class='submenu'>";
                    }
                    $this->_c = 1;
                }
                if (strtoupper($descripcion) == $this->_datos[$i]['XMODULOS']) {
                    $url = BASE_URL . strtolower($this->_datos[$i]['URL']);
                    echo "<li class=''><a href='$url' class='mh_" . strtolower($this->_datos[$i]['URL']) . "'>" . '<span class="submenu-label">' . ucwords(strtolower($this->_datos[$i]['MODULOS_HIJOS'])) . "</span></a></li>";
                } else {
                    echo "</ul></li>";
                    $this->_c = 0;
                    $i = $i - 1;
                }
            }
            echo "</ul></li>";
        }
    }

}
?>
<!--FIn menu-->