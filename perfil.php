<li class="profile dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
        <strong> <?php echo session::get('perfil')?> 
            | <?php echo Main::get_servidor(); ?></strong>
        <span><i class="fa fa-chevron-down"></i></span>
    </a>
    <ul class="dropdown-menu">
        <li>
            <a class="clearfix" href="#">
                <img src="img/user.jpg" alt="User Avatar">
                <div class="detail">
                    <strong><?php echo session::get('usuario');?></strong>
                 <!--   <p class="grey">John_Doe@email.com</p> -->   
                </div>
            </a>
        </li>
        <li><a tabindex="-1" href="profile.html" class="main-link"><i class="fa fa-edit fa-lg"></i> Editar Perfil</a></li>

        <li><a tabindex="-1" href="#" class="theme-setting"><i class="fa fa-cog fa-lg"></i> Ajustes</a></li>
        <li class="divider"></li>
        <li><a tabindex="-1" class="main-link logoutConfirm_open" href="#logoutConfirm"><i class="fa fa-lock fa-lg"></i> Cerrar Sesíon</a></li>
    </ul>
</li>


</ul>
</div><!-- /top-nav                   
 

<script>
    var url = "<?php echo BASE_URL ?>";
</script>