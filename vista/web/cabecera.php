<!DOCTYPE html>
<html lang="ES">

    <!-- Mirrored from ashobiz.asia/metromania45/lblue/ by HTTrack Website Copier/3.x [XR&CO'2013], Fri, 11 Apr 2014 02:46:39 GMT -->
    <head>
        <meta charset="utf-8">
        <link rel="shortcut icon" type="image/x-icon" href="<?php echo BASE_URL; ?>lib/img/favicon.ico">
        <!-- Title here -->
        <title>Multiservicio Frank
        </title>
        <!-- Description, Keywords and Author -->

        <!-- Styles -->
        <!-- Bootstrap CSS -->
        <link href="<?php echo BASE_URL; ?>lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Font Awesome -->
        <link href="<?php echo $_params['ruta_css']; ?>font-awesome.min.css" rel="stylesheet">


        <!-- Endless -->
        <link href="<?php echo $_params['ruta_css']; ?>endless.css" rel="stylesheet">


        <link href="<?php echo BASE_URL; ?>vista/web/jquery.motionCaptcha.0.2.css" rel="stylesheet">
        <!-- SLIDER REVOLUTION 4.x CSS SETTINGS -->
        <style>
                                #mc-canvas {
                                margin:0 auto 20px;
                                padding:1px;
                                display: block;
                                border: 4px solid gray;
                                -webkit-border-radius: 4px;
                                   -moz-border-radius: 4px;
                                        border-radius: 4px;
                                    }
           /* Red border when invalid */
                            #mc-canvas.mc-invalid {
                                border: 4px solid #aa4444;
                            }
                            /* Green border when valid */
                            #mc-canvas.mc-valid {
                                border: 4px solid #44aa44;}
                 </style>

        <!-- Favicon -->

    </head>

    <body>

        <!-- Header Starts -->


        <!-- Navigation bar starts -->

        <div class="login-wrapper">
            <div class="text-center">
                <h2 class="fadeInUp animation-delay3" style="font-weight:bold">
                    <span class="text-info"><?php echo $this->datos["Records"][4]["valor"];?></span> <span style="color:#ccc; text-shadow:0 1px #fff"></span>
                </h2>
            </div>
            <div class="login-widget animation-delay1">	
                <div class="panel panel-default">
                    <div class="panel-heading clearfix">
                        <div class="pull-left">
                            <i class="fa fa-lock fa-lg"></i> Login
                        </div>

                        
                    </div>
                    <div class="panel-body">
                        <form class="form-login" action="<?php echo BASE_URL ?>login" method="post" id="mc-form">
                            <div class="form-group">
                                <label>Usuario</label>
                                <input type="text" placeholder="usuario" class="form-control input-sm bounceIn animation-delay2" name="usuario" id="usuario"  >
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input type="password" placeholder="contraseña" class="form-control input-sm bounceIn animation-delay3" name="clave" id="c" >
                            </div>
                            <div class="text-center">
                                <div id="mc">
                                    <p></p>
                                    <canvas id="mc-canvas">

                                    </canvas>

                                </div>     
                                <p><input class="btn btn-info" disabled="disabled" autocomplete="false" type="submit" value="Ingresar"></p>
                            </div>
                            <div class="form-group">
                                <label class="label-checkbox inline">
                                    <input type="checkbox" class="regular-checkbox chk-delete" />
                                    <span class="custom-checkbox info bounceIn animation-delay4"></span>
                                </label>
                                Recordarme		
                            </div>

                            <div class="seperator"></div>
                            <div class="form-group">
                                Olvido su contraseña?<br/>
                                Click <a href="#">para</a> restaurar su contraseña
                            </div>

                            <hr/>

                            <!--<a class="btn btn-success btn-sm bounceIn animation-delay5 login-link pull-right" href="index-2.html"><i class="fa fa-sign-in"></i> Sign in</a>-->
                        </form>
                    </div>
                </div><!-- /panel -->
            </div>







<!--            <form class="form-horizontal" action="<?php //echo BASE_URL ?>login" method="post" id="mc-form">
                <div class="form-group">
                    <label class="control-label col-md-3" for="username">Usuario</label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" name="usuario" id="usuario">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3" for="pass">Contraseña</label>
                    <div class="col-md-9">
                        <input type="password" class="form-control"  name="clave" id="c">
                    </div>
                </div>
                <div class="text-center">
                    <div id="mc">
                        <p></p>
                        <canvas id="mc-canvas">

                        </canvas>

                    </div>     
                    <p><input class="btn btn-primary" disabled="disabled" autocomplete="false" type="submit" value="Ingresar"></p>
                </div>


                                         <button type="submit" class="btn btn-primary" >Ingresar</button>
            </form>-->


        </div>

        <!-- Navigation bar ends -->