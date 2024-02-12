<?php
require_once('../config.php');
if(isset($_GET['id']) && $_GET['id'] >  0){
    $qry = $conn->query("SELECT * from `images` where id = '{$_GET['id']}' ");
    if($qry->num_rows >  0){
        foreach($qry->fetch_assoc() as $k => $v){
            $$k=$v;
        }
    }
}
?>
<style>
    #uni_modal .modal-header,#uni_modal .modal-footer{
        display:none !important;
    }
    #uni_modal .modal-body img {
        width:  100%;
        height: auto;
    }
</style>
<div class="container-fluid">
    <div class="w-100 d-flex justify-content-between">
        <h4><b><?php echo $original_name ?></b></h4>
        <a href="#" data-dismiss='modal' class="text-dark"><i class="fa fa-times"></i></a>
    </div>
</div>
<div class="container-fluid bg-light">
<div class="container-fluid bg-light">
    <div id="img-holder" class='w-100'>
        <img src="<?php echo validate_image($path_name) ?>" alt="img" loading="lazy" class="w-100 view-img" id="view-img">
    </div>
    <?php if(isset($description)): ?>
    <div class="mt-3">
        <p><?php echo htmlspecialchars($description); ?></p>
    </div>
    <?php endif; ?>
</div>
<script>
// Script untuk menangani klik pada gambar
document.addEventListener('DOMContentLoaded', function () {
    const viewImg = document.getElementById('view-img');
    const uniModalBody = document.querySelector('#uni_modal .modal-body');

    viewImg.addEventListener('click', function () {
        // Buat elemen img baru untuk modal
        const modalImg = document.createElement('img');
        modalImg.src = viewImg.src; // Set source of modal image to the clicked image
        modalImg.alt = 'Enlarged Image';
        modalImg.className = 'img-fluid'; // Add any necessary classes

        // Kosongkan konten modal dan tambahkan gambar baru
        while (uniModalBody.firstChild) {
            uniModalBody.removeChild(uniModalBody.firstChild);
        }
        uniModalBody.appendChild(modalImg);

        // Tampilkan modal
        $('#uni_modal').modal('show');
    });
});
</script>
