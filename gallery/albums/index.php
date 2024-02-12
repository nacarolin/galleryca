<?php if($_settings->chk_flashdata('success')): ?>
<script>
	alert_toast("<?php echo $_settings->flashdata('success') ?>",'success')
</script>
<?php endif;?>
<style>
	/* styles.css atau stylesheet eksternal lainnya */
.btn-pink {
  color: #fff; /* Warna teks yang kontras dengan latar belakang */
  background-color: #ff69b4; /* Warna latar belakang pink */
  border-color: #ff69b4; /* Warna border yang sesuai */
}

.btn-pink:hover {
  background-color: #d855a6; /* Warna pink yang berbeda saat tombol dihover */
  border-color: #d855a6; /* Warna border yang sesuai saat tombol dihover */
}

</style>
<div class="w-100 d-flex justify-content-between border-bottom py-2">
	<h3>My Albums</h3>
	<button class="btn btn-flat btn-pink" type="button" id="add-new"><i class="fa fa-plus"></i> Add New Album</button>
</div>
<div class="row row-cols-4 row-cols-md-3 row-cols-sm-1 row-cols-lg-4 py-2">
	<?php 
		$qry = $conn->query("SELECT * FROM album_list where user_id = '{$_settings->userdata('id')}' and `delete_f` = 0  order by `name` asc ");
		while($row = $qry->fetch_assoc()):
			$img = array();
			$imgs = $conn->query("SELECT * FROM `images` where album_id = '{$row['id']}' and delete_f = 0 order by unix_timestamp(date_updated) desc, unix_timestamp(date_created) desc limit 3");
			while ($irow = $imgs->fetch_assoc()){
				$img[] = $irow['path_name'];
			}
	?>
	<div class="col p-2 item">
		<a href="<?php echo base_url ?>?page=albums/images&id=<?php echo $row['id'] ?>" class="album-item">
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
						<a class="dropdown-item edit_album" data-id="<?php echo $row['id'] ?>" href="javascript:void(0)"><i class="fa fa-edit text-primary"></i> Rename</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item delete_album" data-id="<?php echo $row['id'] ?>" href="javascript:void(0)"><i class="fa fa-trash text-danger"></i> Remove</a>
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
<script>
	$(document).ready(function(){
		if($('.album-view').length <= 0){
            $('#nData').show('slow')
        }else{
            $('#nData').hide('slow')
        }
		$('#add-new').click(function(){
			uni_modal("<i class='fa fa-plus'></i> Create New Album", "albums/manage_album.php")
			$('.modal-footer .btn-primary').addClass('btn-pink');
		})
		$('.edit_album').click(function(){
			uni_modal("<i class='fa fa-edit'></i> Rename Album", "albums/manage_album.php?id="
		+$(this).attr('data-id'))
		$('.modal-footer .btn-primary').addClass('btn-pink');
		})
		$('.delete_album').click(function(){
			_conf("Are you sure to delete this Album ?","delete_album",[$(this).attr('data-id')])
			$('.modal-footer .btn-primary').addClass('btn-pink');
		})
		$('.album-item').closest('.item').hover(function(){
			$(this).css({
				'background':'#005aff29',
				'border-radius':'5px'
			})
		})
		$('.album-item').closest('.item').mouseleave(function(){
			$(this).css({
				'background':'none',
				'border-radius':'5px'
			})
		})
	})
	function delete_album($id){
		start_loader();
		$.ajax({
			url:_base_url_+"classes/Master.php?f=delete_album",
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
</script>