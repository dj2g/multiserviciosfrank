

</div>
</div>
</div>
<!-- Footer
               ================================================== -->
<footer>
    <div class="row">
        <div class="col-sm-6">
            <span class="footer-brand">
                <strong class="text-danger">Multiservicios Frank</strong>
            </span>
            <p class="no-margin">
                &copy; 2016 <strong>Multiservicios Frank</strong>.Todos los derechos reservados. 
            </p>
        </div><!-- /.col -->
    </div><!-- /.row-->
</footer>
<a href="#" id="scroll-to-top" class="hidden-print"><i class="fa fa-chevron-up"></i></a>

<!-- Logout confirmation -->
<div class="custom-popup width-100" id="logoutConfirm">
    <div class="padding-md">
        <h4 class="m-top-none"> ¿Quiere cerrar sesión?</h4>
    </div>

    <div class="text-center">
        <a class="btn btn-success m-right-sm" href="<?php echo BASE_URL ?>login/cerrar">Salir</a>
        <a class="btn btn-danger logoutConfirm_close">Cancel</a>
    </div>
</div>

<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->



 
<!--<script src="<?php //echo $_params['ruta_js']; ?>jquery-1.10.2.min.js" type="text/javascript"></script>-->

<?php if (isset($_params['js']) && count($_params['js'])): ?>
    <?php for ($i = 0; $i < count($_params['js']); $i++): ?>

        <script src="<?php echo $_params['js'][$i] ?>" type="text/javascript"></script>

    <?php endfor; ?>
<?php endif; ?>

<?php if (isset($_params['css']) && count($_params['css'])): ?>
    <?php for ($i = 0; $i < count($_params['css']); $i++): ?>

        <link href="<?php echo $_params['css'][$i] ?>" type="text/css" rel="stylesheet" media="screen" />

    <?php endfor; ?>
<?php endif; ?>


<div id="jsfoot">
    <?php if (isset($_params['js_foot']) && count($_params['js_foot'])): ?>
        <?php for ($i = 0; $i < count($_params['js_foot']); $i++): ?>

            <script src="<?php echo $_params['js_foot'][$i] ?>" type="text/javascript"></script>

        <?php endfor; ?>
    <?php endif; ?>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->





<!-- Jquery -->
<!--	

<script   src="<?php echo BASE_URL; ?>lib/js/typeahead.js"  type="text/javascript" ></script>-->
<script   src="<?php echo BASE_URL; ?>lib/js/bootstrap.min.js"  type="text/javascript" ></script>
<script   src="<?php echo BASE_URL; ?>lib/bootstrap/js/bootstrap.min.js"  type="text/javascript" ></script>
<!--<script   src="<?php echo BASE_URL; ?>lib/js/bootstrap.min.js"  type="text/javascript" ></script>
<script   src="<?php echo BASE_URL; ?>lib/js/typeahead.js"  type="text/javascript" ></script>
 Datatable -->
<script src="http://cdn.jsdelivr.net/typeahead.js/0.9.3/typeahead.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

<script  src='<?php echo $_params['ruta_js']; ?>jquery.dataTables.min.js'  type="text/javascript" ></script>	

<!-- Modernizr -->
<script    src='<?php echo $_params['ruta_js']; ?>modernizr.min.js' type="text/javascript"></script>

<!-- Pace -->
<script    src='<?php echo $_params['ruta_js']; ?>pace.min.js' type="text/javascript"></script>

<!-- Popup Overlay -->
<script   src='<?php echo $_params['ruta_js']; ?>jquery.popupoverlay.min.js' type="text/javascript" ></script>

<!-- Slimscroll -->
<script  src='<?php echo $_params['ruta_js']; ?>jquery.slimscroll.min.js' type="text/javascript" ></script>

<!-- Cookie -->
<script  src='<?php echo $_params['ruta_js']; ?>jquery.cookie.min.js'  type="text/javascript" ></script>

<!-- Endless -->

<script    src="<?php echo $_params['ruta_js']; ?>endless/endless.js" type="text/javascript"></script>



</body>


</html>