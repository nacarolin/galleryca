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
		<input type="hidden" name ="ext" value=".<?php echo isset($original_name) ? strrev(explode('.',strrev($original_name),-1)[0]) : '' ?>">
		<div class="form-group">
			<label for="original_name" class="control-label">Image Name</label>
            <div class="input-group">
			<input name="original_name" autofocusid="" class="form-control form no-resize" value="<?php echo isset($original_name) ? explode('.',$original_name,-1)[0] : ''; ?>" />
            <div class="input-group-append">
                <span class="input-group-text">.<?php echo isset($original_name) ? strrev(explode('.',strrev($original_name),-1)[0]) : ''; ?></span>
            </div>
            </div>
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
				url:_base_url_+"classes/Master.php?f=rename_image",
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