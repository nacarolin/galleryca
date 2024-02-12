<style>
  .user-img{
        position: absolute;
        height: 27px;
        width: 27px;
        object-fit: cover;
        left: -7%;
        top: -12%;
  }
  .btn-rounded{
        border-radius: 50px;
  }
</style>
<!-- Navbar -->
      <nav class="main-header navbar navbar-expand-md navbar-dark navbar-white bg-pink" style="background-color: #ff69b4">
          <div class="container">
  <img src="gallery.png" class="brand-image img-circle elevation-3" style="opacity: .8">
  <span class="brand-text font-weight-light">My Gallery</span>
</a>


          <button class="navbar-toggler order-1" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse order-3" id="navbarCollapse">
            <!-- Left navbar links -->
            <ul class="navbar-nav">
              <li class="nav-item">
                <a href="<?php echo base_url ?>" class="nav-link">Home</a>
              </li>
              <li class="nav-item">
                <a href="<?php echo base_url."?page=albums" ?>" class="nav-link">Albums</a>
              </li>
              <li class="nav-item">
                <a href="<?php echo base_url."?page=user" ?>" class="nav-link">My Account</a>
              </li>
            </ul>

            
          </div>

          <!-- Right navbar links -->
          <ul class="order-1 order-md-3 navbar-nav navbar-no-expand ml-auto">
            <li>
              <div class="btn-group nav-link">
                  <button type="button" class="btn btn-rounded badge badge-light dropdown-toggle dropdown-icon" data-toggle="dropdown">
                    <span><img src="<?php echo validate_image($_settings->userdata('avatar')) ?>" class="img-circle elevation-2 user-img" alt="User Image"></span>
                    <span class="ml-3"><?php echo ucwords($_settings->userdata('firstname').' '.$_settings->userdata('lastname')) ?></span>
                    <span class="sr-only">Toggle Dropdown</span>
                  </button>
                  <div class="dropdown-menu" role="menu">
                    <a class="dropdown-item" href="<?php echo base_url.'?page=user' ?>"><span class="fa fa-user"></span> My Account</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="<?php echo base_url.'/classes/Login.php?f=logout' ?>"><span class="fas fa-sign-out-alt"></span> Logout</a>
                  </div>
              </div>
            </li>
          </ul>
        </div>
      </nav>
      <!-- /.navbar -->