<?php if($_settings->chk_flashdata('success')): ?>
<script>
	alert_toast("<?php echo $_settings->flashdata('success') ?>",'success')
</script>
<?php endif;?>
<div class="w-100 d-flex justify-content-between border-bottom py-2">
	<h3>Albums</h3>
	<button class="btn btn-flat btn-danger" type="button" id="permanently_delete"><i class="fa fa-trash-alt"></i> Permanently Delete All</button>
</div>
<div class="row row-cols-4 row-cols-md-3 row-cols-sm-1 row-cols-lg-4 py-2">
	<?php 
		$qry = $conn->query("SELECT * FROM album_list where user_id = '{$_settings->userdata('id')}' and `delete_f` = 1  order by `name` asc ");
		while($row = $qry->fetch_assoc()):
			$img = array();
			$imgs = $conn->query("SELECT * FROM `images` where album_id = '{$row['id']}' order by unix_timestamp(date_updated) desc, unix_timestamp(date_created) desc limit 3");
			while ($irow = $imgs->fetch_assoc()){
				$img[] = $irow['path_name'];
			}
	?>
	<div class="col p-2 item">
		<a href="#" class="album-item">
			<div class='album-view'>
				<?php 
					foreach($img as $path):
				?>
					<img src="<?php echo validate_image($path) ?>" class="img-thumbnail img-fluid album-banner" alt="img" loading="lazy">	
				<?php endforeach; ?>
				<?php if(count($img) == 0): ?>
					<img src="<?php echo validate_image('') ?>" class="img-thumbnail img-fluid album-banner" alt="img" loading="lazy">	
				<?php endif; ?>
			</div>
			<div class="w-100 d-flex justify-content-between">
				<span class="text-dark"><b><?php echo $row['name'] ?></b></span>
				<div  class="dropleft">
					<a href="#" id="menus_<?php echo $row['id'] ?>" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="text-dark"><i class="fa fa-ellipsis-v"></i> </a>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						<a class="dropdown-item retrieve_album" data-id="<?php echo $row['id'] ?>" href="javascript:void(0)"><i class="fa fa-undo-alt text-dark"></i> Retrieve Album</a>
					</div>
				</div>
			</div>
		</a>
	</div>
	<?php endwhile; ?>
</div>

<div class="row">
    <div class="w-100 p-2 text-center" id="nData" style="display:none"><b>No Album Listed</b></div>
</div>
<div class="w-100 d-flex justify-content-between border-bottom py-2">
	<h3>Images</h3>
</div>
<div class="row row-cols-4 row-cols-md-3 row-cols-sm-1 row-cols-lg-4 py-2">
	<?php 
		$qry = $conn->query("SELECT * FROM `images` where user_id = '{$_settings->userdata('id')}' and `delete_f` = 1 order by `original_name` asc ");
		while($row = $qry->fetch_assoc()):
	?>
	<div class="col p-2 item">
		<a href="javascript:void(0)" data-id="<?php echo $row['id'] ?>" class="img-item">
			<div class='img-view'>
				<img src="<?php echo validate_image($row['path_name']) ?>" class="img-thumbnail img-fluid img-thumb" alt="img" loading="lazy">
			</div>
			<div class="w-100 d-flex justify-content-between">
				<span class="text-dark"><b><?php echo $row['original_name'] ?></b></span>
				<div  class="dropleft">
					<a href="#" id="menus_<?php echo $row['id'] ?>" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="text-dark"><i class="fa fa-ellipsis-v"></i> </a>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                        <a class="dropdown-item retrieve_image" data-id="<?php echo $row['id'] ?>" data-album-id="<?php echo $row['album_id'] ?>" href="javascript:void(0)"><i class="fa fa-undo-alt text-dark"></i> Retrieve Image</a>
					</div>
				</div>
			</div>
		</a>
	</div>
	<?php endwhile; ?>
</div>
<div class="row">
    <div class="w-100 p-2 text-center" id="nData2" style="display:none"><b>No Images</b></div>
</div>
<script>
	$(document).ready(function(){
        if($('.album-view').length <= 0){
            $('#nData').show('slow')
        }else{
            $('#nData').hide('slow')
        }
        if($('.img-item').length <= 0){
            $('#nData2').show('slow')
        }else{
            $('#nData2').hide('slow')
        }
		$('.retrieve_album').click(function(){
			_conf("Are you sure to retrieve this Album ?","retrieve_album",[$(this).attr('data-id')])
		})
        $('.retrieve_image').click(function(){
			_conf("Are you sure to retrieve this Image ?","retrieve_image",[$(this).attr('data-id'),$(this).attr('data-album-id')])
		})
        $('#permanently_delete').click(function(){
			_conf("Are you sure to empty the archives ?","permanently_delete",[])
		})
	})
	function retrieve_album($id){
		start_loader();
		$.ajax({
			url:_base_url_+"classes/Master.php?f=retrieve_album",
			method:"POST",
			data:{id: $id},
			dataType:"json",
			error:err=>{
				console.log(err)
				alert_toast("An error occured.",'error');
				end_loader();
			},
			success:function(resp){
				if(typeof resp== 'object' && resp.status == 'success'){
					location.reload();
				}else{
					alert_toast("An error occured.",'error');
					end_loader();
				}
			}
		})
	}
    function retrieve_image($id,$album_id){
		start_loader();
		$.ajax({
			url:_base_url_+"classes/Master.php?f=retrieve_image",
			method:"POST",
			data:{id: $id,album_id: $album_id},
			dataType:"json",
			error:err=>{
				console.log(err)
				alert_toast("An error occured.",'error');
				end_loader();
			},
			success:function(resp){
				if(typeof resp== 'object' && resp.status == 'success'){
					location.reload();
				}else{
					alert_toast("An error occured.",'error');
					end_loader();
				}
			}
		})
	}
    function permanently_delete(){
		start_loader();
		$.ajax({
			url:_base_url_+"classes/Master.php?f=permanently_delete",
			dataType:"json",
			error:err=>{
				console.log(err)
				alert_toast("An error occured.",'error');
				end_loader();
			},
			success:function(resp){
				if(typeof resp== 'object' && resp.status == 'success'){
					location.reload();
				}else{
					alert_toast("An error occured.",'error');
					end_loader();
				}
			}
		})
	}
</script>