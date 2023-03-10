<?php
include("include/security.php");
include("include/conn.php");
      
$getquery4 = "select fname,lname,user_id from tbl_user_master where uname='$user'";
$getresult4 = mysqli_query($conn,$getquery4);
$getres4 = mysqli_fetch_array($getresult4);
$userid = $getres4['user_id'];

$selquery4 = "select * from tbl_app_details where id=1";
$selresult4 = mysqli_query($conn,$selquery4);
$selres4 = mysqli_fetch_array($selresult4);

$selqueryBanner = mysqli_query($conn,"SELECT * FROM tbl_app_banners");


if(isset($_POST['btnUpdate']))
  {
    $txtAname = mysqli_real_escape_string($conn,$_POST['txtAname']);
    $txtAurl = mysqli_real_escape_string($conn,$_POST['txtAurl']);

    if(isset($_FILES['txtLogo']))
    {
      $file1 = $_FILES['txtLogo'];

      //file properties

      $file1_name=$file1['name'];
      $file1_tmp=$file1['tmp_name'];
      $file1_error=$file1['error'];

      //file extension

      $file_ext=explode('.',$file1_name);
      $file_ext = strtolower($file1_name);

      if($file1_error==0)
      {
        $file1_new = uniqid('',true).'.'.$file_ext;
        $file1_destination='upload/'.$file1_new;
        move_uploaded_file($file1_tmp,$file1_destination);
      }

      if(isset($file1_destination))
      {
        $txtLogo=$file1_destination;
        
      }
      else
      {
        $txtLogo="";
      }
    }
    else
    {
      echo "image not load";
    }

    if(isset($_FILES['txtFlogo']))
    {
      $file1 = $_FILES['txtFlogo'];

      //file properties

      $file1_name=$file1['name'];
      $file1_tmp=$file1['tmp_name'];
      $file1_error=$file1['error'];

      //file extension

      $file_ext=explode('.',$file1_name);
      $file_ext = strtolower($file1_name);

      if($file1_error==0)
      {
        $file1_new = uniqid('',true).'.'.$file_ext;
        $file1_destination='upload/'.$file1_new;
        move_uploaded_file($file1_tmp,$file1_destination);
      }

      if(isset($file1_destination))
      {
        $txtFlogo=$file1_destination;
        
      }
      else
      {
        $txtFlogo="";
      }
    }
    else
    {
      echo "image not load";
    }
    $txtDate = date("Y-m-d H:i:s");
      
      if (!empty($_FILES['txtLogo']['name'])&!empty($_FILES['txtFlogo']['name'])) {

      $updquery = "update tbl_app_details set app_name='$txtAname', logo='$txtLogo', favicon='$txtFlogo', app_url='$txtAurl' where id=1";
      } else if(!empty($_FILES['txtLogo']['name'])){
        $updquery = "update tbl_app_details set app_name='$txtAname', logo='$txtLogo', app_url='$txtAurl' where id=1";
      } else if(!empty($_FILES['txtFlogo']['name'])){
        $updquery = "update tbl_app_details set app_name='$txtAname', favicon='$txtFlogo', app_url='$txtAurl' where id=1";
      } else{
        $updquery = "update tbl_app_details set app_name='$txtAname', app_url='$txtAurl' where id=1";
      }
      
      if(mysqli_query($conn,$updquery))
      {
          header("Location:app-details");
      }
      else
      {
          //echo $updquery;
          echo '<script type="text/javascript">';
          echo 'setTimeout(function () { swal(
                                                "Oops...",
                                                "Something went wrong !!",
                                                "error"
                                              );';
          echo '}, 1000);</script>';
      } 
  }

if(isset($_POST['bannerAdd'])){
    $bannerLink = mysqli_real_escape_string($conn,$_POST['bannerLink']);
    if(isset($_FILES['bannerImage']) && isset($_POST['bannerLink']))
      {
        $file1 = $_FILES['bannerImage'];

        //file properties

        $file1_name=$file1['name'];
        $file1_tmp=$file1['tmp_name'];
        $file1_error=$file1['error'];

        //file extension

        $file_ext=explode('.',$file1_name);
        $file_ext = strtolower($file1_name);

        if($file1_error==0)
        {
          $file1_new = uniqid('',true).'.'.$file_ext;
          $file1_destination='upload/banner/'.$file1_new;
          move_uploaded_file($file1_tmp,$file1_destination);
        }

        if(isset($file1_destination))
        {
          $txtCover=$file1_destination;
          
        }
        else
        {
          $txtCover="";
        }
        $insquery = "insert into tbl_app_banners(image, link) VALUES ('$txtCover', '$bannerLink')";
        if(mysqli_query($conn,$insquery)){
          header("Location:app-details");
        }
        else
        {
          //echo $insquery;
          echo '<script type="text/javascript">';
          echo 'setTimeout(function () { swal(
                                                "Oops...",
                                                "Something went wrong !!",
                                                "error"
                                              );';
          echo '}, 1000);</script>';
        }
      }
      else
      {
        echo "image not load";
      }
}

if(isset($_POST['bannerId'])){
  $bannerId = mysqli_real_escape_string($conn,$_POST['bannerId']);
  $bannerImage = mysqli_real_escape_string($conn,$_POST['bannerImage']);
  $query = "DELETE FROM tbl_app_banners WHERE id=$bannerId";

  unlink($bannerImage);

  if(mysqli_query($conn,$query)){
    header("Location:app-details");
  }
  else
  {
    echo '<script type="text/javascript">';
    echo 'setTimeout(function () { swal(
                                          "Oops...",
                                          "Something went wrong !!",
                                          "error"
                                        );';
    echo '}, 1000);</script>';
  }
}

?>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>App Details</title>

    <?php include_once("include/head-section.php"); ?>
    <!-- DataTables -->
    <link href="assets/plugins/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
    <link href="assets/plugins/datatables/buttons.bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="assets/plugins/datatables/fixedHeader.bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="assets/plugins/datatables/responsive.bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="assets/plugins/datatables/scroller.bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="assets/plugins/datatables/dataTables.colVis.css" rel="stylesheet" type="text/css"/>
    <link href="assets/plugins/datatables/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="assets/plugins/datatables/fixedColumns.dataTables.min.css" rel="stylesheet" type="text/css"/>
    <script src="https://cdn.ckeditor.com/4.11.3/standard/ckeditor.js"></script>
    <script language="JavaScript" type="text/javascript">
      function checkDelete(){
          return confirm('Are you sure you want to delete this Record?');
      }
    </script>
    <style type="text/css">
      .validation
      {
        font-size: 12px;
        color: #f6504d;
      }
      .validation-box
      {
        border-color: #f6504d;
      }
    </style>
  </head>

  <body class="fixed-left">

    <!-- Begin page -->
    <div id="wrapper">

      <!-- topbar and sidebar -->
      <?php include_once("include/navbar.php"); ?>

      <!-- ============================================================== -->
      <!-- Start right Content here -->
      <!-- ============================================================== -->
      <div class="content-page">
        <!-- Start content -->
        <div class="content">
          <div class="container">

            <!-- Page Content -->
            <div class="row">
              <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="card-box">
                  
                  <h4 class="m-t-0 header-title"><b>App Details</b></h4>
                  <p class="text-muted font-13 m-b-30">
                      Change your APP name, logo, and app url.
                  </p>
                  <form action="app-details.php" data-parsley-validate novalidate method="post" enctype="multipart/form-data">
                    
                    <div class="row">
                        <div class="col-lg-12"> 
                            <div class="row">
                              <div class="col-md-12">
                                <div class="form-group">
                                  <label for="txtAname">App Name *</label>
                                  <input type="text" name="txtAname" parsley-trigger="change" required class="form-control" id="txtAname" value="<?php echo $selres4['app_name']; ?>">
                                </div>
                              </div>
                              <div class="col-md-12">
                                <div class="form-group">
                                  <label for="txtLogo">Logo *</label>
                                  <input type="file" name="txtLogo" parsley-trigger="change" class="form-control" id="txtLogo">
                                </div>
                              </div>
                              <div class="col-md-12">
                                <div class="form-group">
                                  <label for="txtFlogo">Icon *</label>
                                  <input type="file" name="txtFlogo" parsley-trigger="change" class="form-control" id="txtFlogo">
                                </div>
                              </div>
                              <div class="col-md-12">
                                <div class="form-group">
                                  <label for="txtAurl">App Url *</label>
                                  <input type="text" name="txtAurl" parsley-trigger="change" required class="form-control" id="txtAurl" value="<?php echo $selres4['app_url']; ?>">
                                </div>
                              </div>
                            </div><br>
                        </div>
                    </div>
                     <!-- end row -->

                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group text-right m-b-0">
                          <button class="btn btn-primary waves-effect waves-light" type="submit" name="btnUpdate" id="btnUpdate" > Update</button>
                          <!-- <a href="user-list.php" class="btn btn-default waves-effect waves-light m-l-5"> Cancel</a> -->
                          <a href="app-details" class="btn btn-default waves-effect waves-light"> Cancel</a>
                        </div>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="card-box">
                  
                  <h4 class="m-t-0 header-title"><b>App Banner</b></h4>
                  <p class="text-muted font-13 m-b-30">
                      Upload your app banner.
                  </p>
                  <form action="app-details.php" data-parsley-validate novalidate method="post" enctype="multipart/form-data">
                    
                    <div class="row">
                        <div class="col-lg-12"> 
                            <div class="row">
                              <div class="col-md-12">
                                <div class="form-group">
                                  <label for="txtLogo">Image *</label>
                                  <input type="file" name="bannerImage" parsley-trigger="change" class="form-control" id="bannerImage">
                                </div>
                              </div>
                              <div class="col-md-12">
                                <div class="form-group">
                                  <label for="txtAname">Link *</label>
                                  <input type="text" name="bannerLink" parsley-trigger="change" required class="form-control" id="bannerLink" placeholder="http://example.com/">
                                </div>
                              </div>
                            </div><br>
                        </div>
                    </div>
                     <!-- end row -->

                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group text-right m-b-0">
                          <button class="btn btn-primary waves-effect waves-light" type="submit" name="bannerAdd" id="bannerAdd" > Add</button>
                          <!-- <a href="user-list.php" class="btn btn-default waves-effect waves-light m-l-5"> Cancel</a> -->
                          <a href="app-details" class="btn btn-default waves-effect waves-light"> Cancel</a>
                        </div>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="card-box">
                  
                  <h4 class="m-t-0 header-title"><b>Banner List</b></h4>
                  <p class="text-muted font-13 m-b-30">
                      All banners of application
                  </p>
                  <form action="app-details.php" data-parsley-validate novalidate method="post" enctype="multipart/form-data">
                    
                    <div class="row">
                      <?php while( $row = mysqli_fetch_row($selqueryBanner) ) { ?>
                        <div class="col-lg-4"> 
                            <div class="row">
                              <div class="col-md-12">
                                <div class="form-group">
                                  <img src="<?php echo $row[1]; ?>" style="height: 150px;" />
                                  <input type="hidden" name="bannerImage" value="<?php echo $row[1]; ?>">
                                </div>
                              </div>
                              <input type="hidden" name="bannerId" value="<?php echo $row[0] ?>">
                              <div class="col-md-12">
                                <div class="form-group">
                                  <label for="txtAname">Link *</label>
                                  <input type="text" name="bannerLink" parsley-trigger="change" required class="form-control" id="bannerLink" value="<?php echo $row[2]; ?>">
                                </div>
                              </div>
                              <div class="col-md-12">
                                <div class="form-group">
                                <button class="btn btn-danger waves-effect waves-light" type="submit" name="bannerAdd" id="bannerAdd" >Delete</button>
                                </div>
                              </div>
                            </div><br>
                        </div>
                        <?php } ?>
                    </div>
                     <!-- end row -->

                  </form>
                </div>
              </div>
            </div>
            <!-- /Page Content -->

          </div> <!-- container -->
                               
        </div> <!-- content -->

        <?php include_once("include/footer.php"); ?>

      </div>
      <!-- ============================================================== -->
      <!-- End Right content here -->
      <!-- ============================================================== -->
      
    </div>
    <!-- END wrapper -->

    <script>
        var resizefunc = [];
    </script>

    <!-- jQuery  -->
    <?php include_once("include/common_js.php"); ?>
      
      <script src="assets/plugins/moment/moment.js"></script>
      
      <script src="assets/js/jquery.core.js"></script>
      <script src="assets/js/jquery.app.js"></script>
      <script type="text/javascript" src="assets/plugins/parsleyjs/parsley.min.js"></script>
      <script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
      <script src="assets/plugins/datatables/dataTables.bootstrap.js"></script>

      <script src="assets/plugins/datatables/dataTables.buttons.min.js"></script>
      <script src="assets/plugins/datatables/buttons.bootstrap.min.js"></script>
      <script src="assets/plugins/datatables/jszip.min.js"></script>
      <script src="assets/plugins/datatables/pdfmake.min.js"></script>
      <script src="assets/plugins/datatables/vfs_fonts.js"></script>
      <script src="assets/plugins/datatables/buttons.html5.min.js"></script>
      <script src="assets/plugins/datatables/buttons.print.min.js"></script>
      <script src="assets/plugins/datatables/dataTables.fixedHeader.min.js"></script>
      <script src="assets/plugins/datatables/dataTables.keyTable.min.js"></script>
      <script src="assets/plugins/datatables/dataTables.responsive.min.js"></script>
      <script src="assets/plugins/datatables/responsive.bootstrap.min.js"></script>
      <script src="assets/plugins/datatables/dataTables.scroller.min.js"></script>
      <script src="assets/plugins/datatables/dataTables.colVis.js"></script>
      <script src="assets/plugins/datatables/dataTables.fixedColumns.min.js"></script>

      <script src="assets/pages/datatables.init.js"></script>

      <script type="text/javascript">
          $(document).ready(function () {
              $('#datatable').dataTable();
              $('#datatable-keytable').DataTable({keys: true});
              $('#datatable-responsive').DataTable();
              $('#datatable-colvid').DataTable({
                  "dom": 'C<"clear">lfrtip',
                  "colVis": {
                      "buttonText": "Change columns"
                  }
              });
              $('#datatable-scroller').DataTable({
                  ajax: "assets/plugins/datatables/json/scroller-demo.json",
                  deferRender: true,
                  scrollY: 380,
                  scrollCollapse: true,
                  scroller: true
              });
              var table = $('#datatable-fixed-header').DataTable({fixedHeader: true});
              var table = $('#datatable-fixed-col').DataTable({
                  scrollY: "300px",
                  scrollX: true,
                  scrollCollapse: true,
                  paging: false,
                  fixedColumns: {
                      leftColumns: 1,
                      rightColumns: 1
                  }
              });
          });
          TableManageButtons.init();

      </script>
    
  </body>
</html>