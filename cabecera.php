<!DOCTYPE html>
<html lang="en">
 <head>
    <meta charset="utf-8">
    <title><?php echo $this->titulo;?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
   <!--  <link rel="shortcut icon" type="image/x-icon" href="<?php echo BASE_URL;?>lib/img/favicon.ico">
    Bootstrap core CSS -->
    <link href="<?php echo BASE_URL;?>lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Font Awesome-->
	<link href="<?php echo $_params['ruta_css'];?>font-awesome.min.css" rel="stylesheet">

	<!-- Pace -->
	<link href="<?php echo $_params['ruta_css'];?>pace.css" rel="stylesheet">
	<script type="text/javascript"  src="<?php echo $_params['ruta_js']; ?>jquery-1.10.2.min.js"></script>   
	<!-- Datatable -->
	<link href="<?php echo $_params['ruta_css'];?>jquery.dataTables_themeroller.css" rel="stylesheet">
	
	<!-- Endless -->
<!--	<link href="<?php //echo $_params['ruta_css'];?>endless.min.css" rel="stylesheet">-->
        <link href="<?php echo $_params['ruta_css'];?>endless.css" rel="stylesheet">
	<link href="<?php echo $_params['ruta_css'];?>endless-skin.css" rel="stylesheet">
        <script src="<?php echo $_params['ruta_js']; ?>bootbox.min.js"></script>
        
    <link href="<?php echo BASE_URL;?>lib/css/extra.css" rel="stylesheet">
 

   <!--     <script type="text/javascript"  src="<?php echo $_params['ruta_js']; ?>jquery.js"></script> -->
        <link href="<?php echo $_params['ruta_css'];?>endless.css" rel="stylesheet">

        <script type="text/javascript"  src="<?php echo $_params['ruta_js']; ?>validaciones.js"></script>
        <script type="text/javascript">
            	var url="<?php echo BASE_URL?>";
            	var $path_base="<?php echo BASE_URL?>";
//        window.onbeforeunload = function confirmaSalida(){
//            var text= "Vas a abandonar esta pagina. Si has hecho algun cambio sin grabar vas a perder todos los datos.";  
//                
//            return  text;
//        };  


        </script>

        <link rel="stylesheet"
          href="<?php echo BASE_URL;?>lib/scripts/jTable/themes/jqueryui/jtable_jqueryui.css"/>

          

		<link rel="stylesheet"
              href="<?php echo BASE_URL;?>lib/scripts/jTable/themes/lightcolor/bootstrap/jtable.css"/>
		<link rel="stylesheet"
          href="<?php echo BASE_URL;?>lib/scripts/jTable/themes/jqueryui/jquery-ui.css"/>


          <script src="<?php echo BASE_URL; ?>lib/scripts/jqueryui/js/jquery-ui.min.js"></script>
          <script src="<?php echo BASE_URL; ?>lib/scripts/jqueryui/js/jquery-ui-1.10.4.custom.js"></script>
           <script src="<?php echo BASE_URL; ?>lib/scripts/bootstrap/js/bootstrap.js"></script>

</script>
<script    src="<?php echo BASE_URL; ?>lib/scripts/jTable/jquery.jtable.min.js" type="text/javascript"></script>

<script
    src="<?php echo BASE_URL; ?>lib/scripts/jTable/localization/jquery.jtable.es.js"></script>
          <script src="<?php echo BASE_URL; ?>lib/js/main.js"></script>
  </head>

  <body class="overflow-hidden">
	<!-- Overlay Div -->
<!--	<div id="overlay" class="transparent"></div>

	<a href="#" id="theme-setting-icon"><i class="fa fa-cog fa-lg"></i></a>-->
<!--	<div id="theme-setting">
		<div class="title">
			<strong class="no-margin">Skin Color</strong>
		</div>
		<div class="theme-box">
			<a class="theme-color" style="background:#323447" id="default"></a>
			<a class="theme-color" style="background:#efefef" id="skin-1"></a>
			<a class="theme-color" style="background:#a93922" id="skin-2"></a>
			<a class="theme-color" style="background:#3e6b96" id="skin-3"></a>
			<a class="theme-color" style="background:#635247" id="skin-4"></a>
			<a class="theme-color" style="background:#3a3a3a" id="skin-5"></a>
			<a class="theme-color" style="background:#495B6C" id="skin-6"></a>
		</div>
		<div class="title">
			<strong class="no-margin">Sidebar Menu</strong>
		</div>
		<div class="theme-box">
			<label class="label-checkbox">
				<input type="checkbox" checked id="fixedSidebar">
				<span class="custom-checkbox"></span>
				Fixed Sidebar
			</label>
		</div>
	</div> /theme-setting -->
        <div id="wrapper" class="preload">
		<div id="top-nav" class="fixed skin-1">
			<div class="brand">
                             <a href="<?php echo BASE_URL ?>index" style="color:#ffffff;">
                            
				
                             <!--    <img src="<?php echo BASE_URL ?>lib/img/logo.png" style="height: 50px;">-->MULTISERVICIOS FRANK
                                 </a>
				<span class="text-toggle"></span>
			</div><!-- /brand -->
			<button type="button" class="navbar-toggle pull-left" id="sidebarToggle">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<ul class="nav-notification clearfix">
<!--				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="fa fa-envelope fa-lg"></i>
						<span class="notification-label bounceIn animation-delay4">1</span>
					</a>
					<ul class="dropdown-menu message dropdown-1">
						<li><a>Titulo de mensaje</a></li>					  
						<li>
							<a class="clearfix" href="#">
								<img src="img/user.jpg" alt="User Avatar">
								<div class="detail">
									<strong>John Doe</strong>
									<p class="no-margin">
										Lorem ipsum dolor sit amet...
									</p>
									<small class="text-muted"><i class="fa fa-check text-success"></i> 27m ago</small>
								</div>
							</a>	
						</li>
						<li><a href="#">View all messages</a></li>					  
					</ul>
				</li>
				<li class="dropdown hidden-xs">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-tasks fa-lg"></i>
						<span class="notification-label bounceIn animation-delay5">1</span>
					</a>
					<ul class="dropdown-menu task dropdown-2">
						<li><a href="#">cantidad de TAreas</a></li>					  
						<li>
							<a href="#">
								<div class="clearfix">
									<span class="pull-left">Bug Fixes</span>
									<small class="pull-right text-muted">78%</small>
								</div>
								<div class="progress">
									<div class="progress-bar" style="width:78%"></div>
								</div>
							</a>
						</li>
						 
						<li><a href="#">View all tasks</a></li>					  
					</ul>
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="fa fa-bell fa-lg"></i>
						<span class="notification-label bounceIn animation-delay6">1</span>
					</a>
					<ul class="dropdown-menu notification dropdown-3">
						<li><a href="#">Cantidad de Notificaciones</a></li>					  
						<li>
							<a href="#">
								<span class="notification-icon bg-warning">
									<i class="fa fa-warning"></i>
								</span>
								<span class="m-left-xs">Server #2 not responding.</span>
								<span class="time text-muted">Just now</span>
							</a>
						</li>
						 
						<li><a href="#">View all notifications</a></li>					  
					</ul>
				</li>-->