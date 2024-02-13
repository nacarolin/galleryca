<?php
require_once('../config.php');
if(isset($_GET['id']) && $_GET['id'] > 0){
    $qry = $conn->query("SELECT * from `images` where id = '{$_GET['id']}' ");
    if($qry->num_rows > 0){
        foreach($qry->fetch_assoc() as $k => $v){
            $$k=$v;
        }
    }
}
?>
<div class="container-fluid">
	<form action="" id="image-form">
		<input type="hidden" name ="id" value="<?php echo isset($id) ? $id : '' ?>">
		<input type="hidden" name ="album_id" value="<?php echo $_GET['album_id'] ?>">
		<input type="hidden" name ="user_id" value="<?php echo $_settings->userdata('id') ?>">
		<div class="form-group">
			<label for="images" class="control-label">Upload</label>
            <input name="images[]" id="images" type="file" multiple class="form-control" accept="image/*" /> <br>
			<input name="titles[]" type="text" placeholder="Judul Foto" class="form-control" /> <br>
			<input name="descriptions[]" type="text" placeholder="Deskripsi Gambar" class="form-control" />
		</div>
		</div>
	</form>
</div>
<script>
	$(document).ready(function(){
		$('#image-form').submit(function(e){
			e.preventDefault();
            var _this = $(this)
			 $('.err-msg').remove();
			start_loader();
			$.ajax({
				url:_base_url_+"classes/Master.php?f=save_image",
				data: new FormData($(this)[0]),
                cache: false,
                contentType: false,
                processData: false,
                method: 'POST',
                type: 'POST',
                dataType: 'json',
				error:err=>{
					console.log(err)
					alert_toast("An error occured",'error');
					end_loader();
				},
				success:function(resp){
					if(typeof resp =='object' && resp.status == 'success'){
						location.reload()
					}else if(resp.status == 'failed' && !!resp.msg){
                        var el = $('<div>')
                            el.addClass("alert alert-danger err-msg").text(resp.msg)
                            _this.prepend(el)
                            el.show('slow')
                            $("html, body").animate({ scrollTop: _this.closest('.card').offset().top }, "fast");
                            end_loader()
                    }else{
						alert_toast("An error occured",'error');
						end_loader();
                        console.log(resp)
					}
				}
			})
		})

	})
</script>