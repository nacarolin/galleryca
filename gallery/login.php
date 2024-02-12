<?php require_once('config.php') ?>
<!DOCTYPE html>
<html lang="en" class="" style="height: auto;">
 <?php require_once('inc/header.php') ?>
<body class="hold-transition login-page ">
<style>
  body {
    background-image: url('bg.jpeg');
    background-size: cover;
    background-repeat: no-repeat;
    background-attachment: fixed;
  }
  /* styles.css atau dalam file Bootstrap yang disesuaikan */
.text-pink {
  color: #ff69b4; /* Ganti dengan warna pink yang diinginkan */
}

.btn-pink {
  background-color: #ff69b4; /* Ganti dengan warna pink yang diinginkan */
  color: #fff; /* Ganti dengan warna teks yang kontras dengan latar belakang */
}

.btn-pink:hover {
  background-color: #d855a6; /* Ganti dengan warna pink yang berbeda saat tombol dihover */
}
.card-pink {
  background-color: #ff69b4;
}
.custom-font {
    font-family: Helvetica, sans-serif;
}

</style>
  <script>
    start_loader()
  </script>
  <div class="container mb-4">
    <h1 class="text-center custom-font font-weight-bold">Welcome to My Gallery</h1>
  </div>
<div class="login-box">
  <!-- /.login-logo -->
  <div class="card card-outline card-pink">
    <div class="card-header text-center text-white custom-font">
      <a href="./" class="h1"><b>Login</b></a>
    </div>
    <div class="card-body bg-black">
      <form id="login-frm" action="" method="post">
        <div class="input-group mb-3">
          <input type="text" class="form-control" name="username" placeholder="Username">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" class="form-control" name="password" placeholder="Password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">
  <div class="col-8">
    <a href="javascript:void(0)" id="create_account" class="text-pink">Create Account?</a>
  </div>
  <div class="col-4">
    <button type="submit" class="btn btn-pink btn-block">Sign In</button>
  </div>
</div>

      </form>
      <!-- /.social-auth-links -->

      <!-- <p class="mb-1">
        <a href="forgot-password.html">I forgot my password</a>
      </p> -->
      
    </div>
    <!-- /.card-body -->
  </div>
  <!-- /.card -->
</div>
<!-- /.login-box -->

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>

<script>
  window.uni_modal = function($title = '' , $url='',$size=""){
        start_loader()
        $.ajax({
            url:$url,
            error:err=>{
                console.log()
                alert("An error occured")
            },
            success:function(resp){
                if(resp){
                    $('#uni_modal .modal-title').html($title)
                    $('#uni_modal .modal-body').html(resp)
                    if($size != ''){
                        $('#uni_modal .modal-dialog').addClass($size+'  modal-dialog-centered')
                    }else{
                        $('#uni_modal .modal-dialog').removeAttr("class").addClass("modal-dialog modal-md modal-dialog-centered")
                    }
                    $('#uni_modal').modal({
                      show:true,
                      backdrop:'static',
                      keyboard:false,
                      focus:true
                    })
                    end_loader()
                }
            }
        })
    }
  $(document).ready(function(){
    end_loader();
    $('#create_account').click(function(){
      uni_modal("Create New Account","create_account.php")
    })
  })
</script>
<div class="modal fade" id="uni_modal" role='dialog'>
    <div class="modal-dialog modal-md modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
        <h5 class="modal-title"></h5>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary btn-pink" id='submit' onclick="$('#uni_modal form').submit()">Save</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
      </div>
      </div>
    </div>
  </div>
</body>
</html>