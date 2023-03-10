<?php
include("include/security.php");
include("include/conn.php");


$selquery = "select * from payout_details where status='0' order by id desc";
$selres1 = mysqli_query($conn,$selquery);

if(isset($_POST['btnSave']))
{
  $txtPayMethod = mysqli_real_escape_string($conn,$_POST['txtPayMethod']);
  $txtSubTittle = mysqli_real_escape_string($conn,$_POST['txtSubTittle']);
  $txtPlaceHolder = mysqli_real_escape_string($conn,$_POST['txtPlaceHolder']);
  $txtAmount = mysqli_real_escape_string($conn,$_POST['txtAmount']);
  $txtCoin = mysqli_real_escape_string($conn,$_POST['txtCoin']);
  $txtPayMode = mysqli_real_escape_string($conn,$_POST['txtPayMode']);
  $txtCurrency = mysqli_real_escape_string($conn,$_POST['txtCurrency']);

  if(isset($_FILES['txtImg']))
    {
      $file1 = $_FILES['txtImg'];

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
        $txtImg=$file1_destination;
        
      }
      else
      {
        $txtImg="";
      }
    }
    else
    {
      echo "image not load";
    }

  $txtDate = date("Y-m-d H:i:s");

  
  $insquery = "insert into payout_details (title, subtitle, message, amount, coins, image, status, type, currency) values('{$txtPayMethod}', '{$txtSubTittle}', '{$txtPlaceHolder}', '{$txtAmount}', '{$txtCoin}', '{$txtImg}', '0', '{$txtPayMode}', '{$txtCurrency}')";
  
  if(mysqli_query($conn,$insquery))
    {
      header("Location:payout-master");
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

if(isset($_GET['id']))
{
  $id = $_GET['id'];
  
  $getquery1 = "select * from payout_details where id={$id}";
  $getresult1 = mysqli_query($conn,$getquery1);
  $getres1 = mysqli_fetch_array($getresult1); 
}

if(isset($_POST['btnUpdate']))
{
  $txtPayMethod = mysqli_real_escape_string($conn,$_POST['txtPayMethod']);
  $txtSubTittle = mysqli_real_escape_string($conn,$_POST['txtSubTittle']);
  $txtPlaceHolder = mysqli_real_escape_string($conn,$_POST['txtPlaceHolder']);
  $txtAmount = mysqli_real_escape_string($conn,$_POST['txtAmount']);
  $txtCoin = mysqli_real_escape_string($conn,$_POST['txtCoin']);
  $txtPayMode = mysqli_real_escape_string($conn,$_POST['txtPayMode']);
  $txtCurrency = mysqli_real_escape_string($conn,$_POST['txtCurrency']);

  if(isset($_FILES['txtImg']))
    {
      $file1 = $_FILES['txtImg'];

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
        $txtImg=$file1_destination;
        
      }
      else
      {
        $txtImg="";
      }
    }
    else
    {
      echo "image not load";
    }
  $txtMdate = date("Y-m-d H:i:s");

  if (!empty($_FILES['txtImg']['name'])) {
    $insquery = "update payout_details set title='{$txtPayMethod}', subtitle='{$txtSubTittle}', message='{$txtPlaceHolder}', amount='{$txtAmount}', coins='{$txtCoin}', image='{$txtImg}', type='{$txtPayMode}', currency='{$txtCurrency}' where id=$id";
  }
  else
  {
    $insquery = "update payout_details set title='{$txtPayMethod}', subtitle='{$txtSubTittle}', message='{$txtPlaceHolder}', amount='{$txtAmount}', coins='{$txtCoin}', type='{$txtPayMode}', currency='{$txtCurrency}' where id=$id";
  }

  if(mysqli_query($conn,$insquery))
    {
      header("Location:payout-master");
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

if(isset($_GET['did']))
{
  $did = $_GET['did'];
  
  $delquery = "update payout_details set status='1' where id=$did";
  if(mysqli_query($conn,$delquery))
    {
      header("Location:payout-master");
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

?>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Payout Master</title>

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
          <?php if($selres4Access['user_role']=='admin') { ?>
          <div class="container">

            <!-- Page Content -->
            <div class="row">
              <div class="col-lg-5 col-md-5 col-sm-12">
                <div class="card-box">
                  
                  <h4 class="m-t-0 header-title"><b>Add New Payout Method</b></h4>
                  <p class="text-muted font-13 m-b-30">
                      You can manage Payout Method here.
                  </p>
                  <?php if(isset($_GET['id'])) { ?>
                  <form action="payout-master.php?id=<?php echo $_GET['id'];?>" data-parsley-validate enctype="multipart/form-data" novalidate method="post">
                    
                    <div class="row">
                        <div class="col-lg-12"> 
                            <div class="row">
                              <div class="col-md-12">
                                <div class="form-group">
                                  <label for="txtPayMethod">Payment Method *</label>
                                  <select name="txtPayMethod" parsley-trigger="change" required class="form-control" id="txtPayMethod">
                                    <option value="">--Select--</option>
                                    <option <?php if($getres1['title'] == 'PayTm') { echo 'selected'; } ?> value="PayTm">PayTm</option>
                                    <option <?php if($getres1['title'] == 'PayPal') { echo 'selected'; } ?> value="PayPal">PayPal</option>
                                    <option <?php if($getres1['title'] == 'UPI') { echo 'selected'; } ?> value="UPI">UPI</option>
                                    <option <?php if($getres1['title'] == 'GooglePay') { echo 'selected'; } ?> value="GooglePay">GooglePay</option>
                                    <option <?php if($getres1['title'] == 'PhonePe') { echo 'selected'; } ?> value="PhonePe">PhonePe</option>
                                  </select>
                                </div>
                              </div>
                              <div class="col-md-12">
                                <div class="form-group">
                                  <label for="txtSubTittle">Sub Title *</label>
                                  <input type="text" name="txtSubTittle" parsley-trigger="change" required placeholder="Enter Sub Title" class="form-control" id="txtSubTittle" value="<?php echo $getres1['subtitle']?>">
                                </div>
                              </div>
                              <div class="col-md-12">
                                <div class="form-group">
                                  <label for="txtPlaceHolder">Placeholder (Message) *</label>
                                  <input type="text" name="txtPlaceHolder" parsley-trigger="change" required placeholder="Enter Place Holder" class="form-control" id="txtPlaceHolder" value="<?php echo $getres1['message']?>">
                                </div>
                              </div>
                              <div class="col-md-6">
                                <div class="form-group">
                                  <label for="txtAmount">Amount *</label>
                                  <input type="number" name="txtAmount" parsley-trigger="change" required placeholder="Enter Amount" class="form-control" id="txtAmount" value="<?php echo $getres1['amount']?>">
                                </div>
                              </div>
                              <div class="col-md-6">
                                <div class="form-group">
                                  <label for="txtCoin">Coin *</label>
                                  <input type="number" name="txtCoin" parsley-trigger="change" required placeholder="Enter number of coin" class="form-control" id="txtCoin" value="<?php echo $getres1['coins']?>">
                                </div>
                              </div>
                              <div class="col-md-6">
                                <div class="form-group">
                                  <label for="txtCurrency">Currency *</label>
                                  <input type="text" name="txtCurrency" parsley-trigger="change" required placeholder="Enter number of coin" class="form-control" id="txtCurrency" value="<?php echo $getres1['currency']?>">
                                </div>
                              </div>
                              <div class="col-md-6">
                                <div class="form-group">
                                  <label for="txtPayMode">Payment Mode *</label>
                                  <select name="txtPayMode" required class="form-control" parsley-trigger="change" id="txtPayMode">
                                    <option value="">-- Select --</option>
                                    <option value="0" <?php if($getres1['type']=='0') { echo 'selected'; } ?>>Debit</option>
                                    <option value="1" <?php if($getres1['type']=='1') { echo 'selected'; } ?>>Credit</option>
                                  </select>
                                </div>
                              </div>
                              <div class="col-md-12">
                                <div class="form-group">
                                  <label for="txtImg">Logo/Image *</label>
                                  <input type="file" name="txtImg" parsley-trigger="change" class="form-control" id="txtImg">
                                </div>
                              </div>
                              <div class="col-md-12">
                                <div class="form-group">
                                  <label>Date</label>
                                  <input readonly value="<?php echo date("Y-m-d"); ?>" type="date" class="form-control">
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
                          <a href="payout-master" class="btn btn-default waves-effect waves-light"> Cancel</a>
                        </div>
                      </div>
                    </div>
                  </form>
                  <?php } else { ?>
                  <form action="payout-master.php" data-parsley-validate enctype="multipart/form-data" novalidate method="post">
                    
                    <div class="row">
                        <div class="col-lg-12"> 
                            <div class="row">
                              <div class="col-md-12">
                                <div class="form-group">
                                  <label for="txtPayMethod">Payment Method *</label>
                                  <select name="txtPayMethod" parsley-trigger="change" required class="form-control" id="txtPayMethod">
                                    <option value="">--Select--</option>
                                    <option value="PayTm">PayTm</option>
                                    <option value="PayPal">PayPal</option>
                                    <option value="UPI">UPI</option>
                                    <option value="GooglePay">GooglePay</option>
                                    <option value="PhonePe">PhonePe</option>
                                  </select>
                                </div>
                              </div>
                              <div class="col-md-12">
                                <div class="form-group">
                                  <label for="txtSubTittle">Sub Title *</label>
                                  <input type="text" name="txtSubTittle" parsley-trigger="change" required placeholder="Enter Sub Title" class="form-control" id="txtSubTittle">
                                </div>
                              </div>
                              <div class="col-md-12">
                                <div class="form-group">
                                  <label for="txtPlaceHolder">Placeholder (Message) *</label>
                                  <input type="text" name="txtPlaceHolder" parsley-trigger="change" required placeholder="Enter Place Holder" class="form-control" id="txtPlaceHolder">
                                </div>
                              </div>
                              <div class="col-md-6">
                                <div class="form-group">
                                  <label for="txtAmount">Amount *</label>
                                  <input type="number" name="txtAmount" parsley-trigger="change" required placeholder="Enter Amount" class="form-control" id="txtAmount">
                                </div>
                              </div>
                              <div class="col-md-6">
                                <div class="form-group">
                                  <label for="txtCoin">Coin *</label>
                                  <input type="number" name="txtCoin" parsley-trigger="change" required placeholder="Enter number of coin" class="form-control" id="txtCoin">
                                </div>
                              </div>
                              <div class="col-md-6">
                                <div class="form-group">
                                  <label for="txtCurrency">Currency *</label>
                                  <input type="text" name="txtCurrency" parsley-trigger="change" required placeholder="Enter number of coin" class="form-control" id="txtCurrency">
                                </div>
                              </div>
                              <div class="col-md-6">
                                <div class="form-group">
                                  <label for="txtPayMode">Payment Mode *</label>
                                  <select name="txtPayMode" required class="form-control" parsley-trigger="change" id="txtPayMode">
                                    <option value="">-- Select --</option>
                                    <option value="0">Debit</option>
                                    <option value="1">Credit</option>
                                  </select>
                                </div>
                              </div>
                              <div class="col-md-12">
                                <div class="form-group">
                                  <label for="txtImg">Logo/Image *</label>
                                  <input type="file" name="txtImg" parsley-trigger="change" required class="form-control" id="txtImg">
                                </div>
                              </div>
                              <div class="col-md-12">
                                <div class="form-group">
                                  <label>Date</label>
                                  <input readonly value="<?php echo date("Y-m-d"); ?>" type="date" class="form-control">
                                </div>
                              </div>
                            </div><br>
                        </div>
                    </div>
                     <!-- end row -->

                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group text-right m-b-0">
                          <button class="btn btn-primary waves-effect waves-light" type="submit" name="btnSave" id="btnSave" > Save</button>
                          <!-- <a href="user-list.php" class="btn btn-default waves-effect waves-light m-l-5"> Cancel</a> -->
                          <a href="payout-master" class="btn btn-default waves-effect waves-light"> Cancel</a>
                        </div>
                      </div>
                    </div>
                  </form>
                  <?php } ?>
                </div>
              </div>
              <div class="col-lg-7 col-md-7 col-sm-12">
                <div class="card-box">
                  
                  <h4 class="m-t-0 header-title"><b>Payout List</b></h4>
                  <p class="text-muted font-13 m-b-30">
                      You can manage image here.
                  </p>

                  <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap table-loader" cellspacing="0" width="100%">
                      <thead>
                        <tr>
                            <th>Id</th>
                            <th>Payment Method</th>
                            <th>SubTitle</th>
                            <th>Message</th>
                            <th>Amount</th>
                            <th>Coins</th>
                            <th>Image</th>
                            <th>Action</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php while ($selres = mysqli_fetch_array($selres1)){ ?>
                          <tr class="font-13">
                              <td><?php echo $selres['id']; ?></td>
                              <td><?php echo $selres['title']; ?></td>
                              <td><?php echo $selres['subtitle']; ?></td>
                              <td><?php echo $selres['message']; ?></td>
                              <td><?php echo $selres['amount']; ?></td>
                              <td><?php echo $selres['coins']; ?></td>
                              <td><img src="<?php echo $selres['image']; ?>" height=50 width=50></td>
                              
                              <td>
                                <a href="payout-master.php?id=<?php echo $selres['id'];?>" class="edit-row" style="color: #29b6f6;" data-toggle="tooltip" data-placement="top" title="" data-original-title="Update Record"><i class="fa fa-edit"></i></a>&nbsp;&nbsp;
                                <a href="payout-master.php?did=<?php echo $selres['id'];?>" class="remove-row" style="color: #f05050;" data-toggle="tooltip" data-placement="top" title="" data-original-title="Delete Permanently" onclick="return checkDelete()"><i class="fa fa-trash-o"></i></a>
                              </td>
                          </tr>
                        <?php } ?>
                      </tbody>
                  </table>
                </div>
              </div>
            </div>
            <!-- /Page Content -->

          </div> <!-- container -->
          <?php } else { ?>
            <h3 class="text-danger">Access Denied</h3>
          <?php } ?>                
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
              //$('#datatable-responsive').DataTable();
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
              $('#datatable-responsive').DataTable( {
                "order": [[ 0, "desc" ]]
            } );
          });
          TableManageButtons.init();

      </script>
    
  </body>
</html>