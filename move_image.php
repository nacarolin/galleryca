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
		<input type="hidden" name ="user_id" value="<?php echo isset($user_id) ? $user_id : '' ?>">
		<input type="hidden" name ="opath" value="<?php echo isset($path_name) ? $path_name : '' ?>">
		<div class="form-group">
			<label for="album_id" class="control-label">Select Album</label>
            <select name="album_id" id="album_id" class="custom-select select2">
                <option value=""></option>
                <?php 
                    $qry = $conn->query("SELECT * FROM album_list where user_id = '{$_settings->userdata('id')}' and `delete_f` = 0  and id != '{$album_id}' order by `name` asc ");
                    while($row = $qry->fetch_assoc()):
                ?>
                <option value="<?php echo $row['id'] ?>"><?php echo $row['name'] ?></option>
                <?php endwhile; ?>
            </select>
		</div>
		</div>
	</form>
</div>
<script>
	$(document).ready(function(){
        $('.select2').select2()
		$('#image-form').submit(function(e){
			e.preventDefault();
            var _this = $(this)
			 $('.err-msg').remove();
			start_loader();
			$.ajax({
				url:_base_url_+"classes/Master.php?f=move_image",
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