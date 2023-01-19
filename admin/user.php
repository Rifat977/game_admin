<?php
include("include/security.php");
include("include/conn.php");

$selquery = "select * from tbl_user_master where uname='$user'";
$selres = mysqli_query($conn,$selquery);
$selres1 = mysqli_fetch_array($selres);
//$full_name = $selres1['fname'] . " " . $selres1['lname'];
$userid = $selres1['user_id'];

$acountquery="select count(*) from tbl_user_master";
$acountresult = mysqli_query($conn,$acountquery);
$acountres = mysqli_fetch_array($acountresult);
$mycount = $acountres['0'];
if($mycount==0)
{
  $uno= 1;
}
else
{
  $amax = "select max(user_id) from tbl_user_master";
  $amaxresult = mysqli_query($conn,$amax);
  $amaxres = mysqli_fetch_array($amaxresult);
  $maxno = $amaxres['0'];
  $uno= $maxno + 1;
}

if(isset($_POST['btnSave']))
{

  $txtFname = mysqli_real_escape_string($conn,$_POST['txtFname']);
  $txtLname = mysqli_real_escape_string($conn,$_POST['txtLname']);
  
  $txtBdate = $_POST['txtBdate'];
  if ($txtBdate=='') 
  {
    $txtBdate=null;
  }
  else
  {
    $txtBdate=$_POST['txtBdate'];
  }

  // Surround it in quotes if it isn't NULL.
  if ($txtBdate === NULL) {
    // Make a string NULL with no extra quotes
    $txtBdate = 'NULL';
  }
  // For non-null values, surround the existing value in quotes...
  else $txtBdate = "'$txtBdate'";

  $txtEmail = mysqli_real_escape_string($conn,$_POST['txtEmail']);
  $txtUname = mysqli_real_escape_string($conn,$_POST['txtUname']);
  
  $txtPassSha=$_POST['txtPass'];
  $txtPass=sha1($txtPassSha);

  $txtPhone = mysqli_real_escape_string($conn,$_POST['txtPhone']);
  $txtAphone = mysqli_real_escape_string($conn,$_POST['txtAphone']);
  $txtUdesig = mysqli_real_escape_string($conn,$_POST['txtUdesig']);
  $txtArole = mysqli_real_escape_string($conn,$_POST['txtArole']);
  $txtAddress = mysqli_real_escape_string($conn,$_POST['txtAddress']);
  $txtCity = mysqli_real_escape_string($conn,$_POST['txtCity']);
  $txtState = mysqli_real_escape_string($conn,$_POST['txtState']);
  $txtCountry = mysqli_real_escape_string($conn,$_POST['txtCountry']);
  
  $txtDate = date("Y-m-d H:i:s");

  $selquery ="select * from tbl_user_master where uname='$txtUname' or email='$txtEmail'";
  $selresult = mysqli_query($conn,$selquery);
  if($selres = mysqli_fetch_array($selresult))
  {
      echo "<script>alert(\"Already register\");</script>";
  }
  else
  {
    if(isset($_FILES['userImg']))
    {
      $file1 = $_FILES['userImg'];

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
        $userImg=$file1_destination;
        
      }
      else
      {
        $userImg="";
      }
    }
    else
    {
      echo "image not load";
    }

    function verificationCode() {
        $alphabet = "abcdefghijklmnopqrstuwxyzABCDEFGHIJKLMNOPQRSTUWXYZ0123456789";
        $verify_code = array(); //remember to declare $pass as an array
        $alphaLength = strlen($alphabet) - 1; //put the length -1 in cache
        for ($i = 0; $i < 16; $i++) {
        $n = rand(0, $alphaLength);
        $verify_code[] = $alphabet[$n];
        }
        return implode($verify_code); //turn the array into a string
        }

    $verify_code=verificationCode();

    /*$insquery = "insert into tbl_user_master values($uno,'{$txtFname}','{$txtLname}','{$txtUname}','{$txtPass}','{$txtEmail}','{$txtUdesig}','{$txtArole}','{$txtBdate}','{$txtPhone}','{$txtAphone}','{$txtAddress}','{$txtCity}','{$txtState}','{$txtCountry}','{$userImg}','$verify_code','1','0','0','{$userid}','{$txtDate}',null,null,null)";*/
    if (!empty($_FILES['userImg']['name'])) {
      
      $insquery = "insert into tbl_user_master (user_id,fname,lname,uname,password,email,user_designation,user_role,dob,phone,alt_phone,address,city,state,country,profile_pic,verification_code,account_status,is_verify,del,added_by,date_created) values($uno,'{$txtFname}','{$txtLname}','{$txtUname}','{$txtPass}','{$txtEmail}','{$txtUdesig}','{$txtArole}',$txtBdate,'{$txtPhone}','{$txtAphone}','{$txtAddress}','{$txtCity}','{$txtState}','{$txtCountry}','{$userImg}','$verify_code','1','0','0',$userid,'{$txtDate}')";
    }
    else // no image uploaded
    {
      $insquery = "insert into tbl_user_master (user_id,fname,lname,uname,password,email,user_designation,user_role,dob,phone,alt_phone,address,city,state,country,verification_code,account_status,is_verify,del,added_by,date_created) values($uno,'{$txtFname}','{$txtLname}','{$txtUname}','{$txtPass}','{$txtEmail}','{$txtUdesig}','{$txtArole}',$txtBdate,'{$txtPhone}','{$txtAphone}','{$txtAddress}','{$txtCity}','{$txtState}','{$txtCountry}','$verify_code','1','0','0',$userid,'{$txtDate}')";
    }

    $txtEmail = $txtEmail;
    $mailSubject = "Verify account";
    $message="<center><h2>Dear, $txtFname $txtLname</h2></center><br>
    <a href =\"https://www.youtube.com/channel/UCz4nXDl9sjaczWIrs3e5Q-A?view_as=subscriber">Contact here !</a>";
    /*<a href =\"http://abroadvisaexperts.com.au/admin/email-verification.php?uid=$uno&code=$verify_code\">Click here to Activate your Account</a>";*/
    /*<a href =\"http://www.technobitsdigital.com\">Click here to Activate your Account(local)</a>;*/  

    include("include/verify_mail.php");

    if(mysqli_query($conn,$insquery))
    {
      header("Location:user-list.php");
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


}

if(isset($_GET['userId'])&isset($_GET['userName']))
{
  $userId_u = $_GET['userId'];
  $userName = $_GET['userName'];
  
  $getquery1 = "select * from tbl_user_master where user_id={$userId_u} and uname='$userName' and del='0'";
  $getresult1 = mysqli_query($conn,$getquery1);
  
}

if(isset($_POST['btnUpdate']))
{

  $txtFname = mysqli_real_escape_string($conn,$_POST['txtFname']);
  $txtLname = mysqli_real_escape_string($conn,$_POST['txtLname']);
  
  $txtBdate = $_POST['txtBdate'];
  if ($txtBdate=='') 
  {
    $txtBdate=null;
  }
  else
  {
    $txtBdate=$_POST['txtBdate'];
  }

  // Surround it in quotes if it isn't NULL.
  if ($txtBdate === NULL) {
    // Make a string NULL with no extra quotes
    $txtBdate = 'NULL';
  }
  // For non-null values, surround the existing value in quotes...
  else $txtBdate = "'$txtBdate'";

  $txtPhone = mysqli_real_escape_string($conn,$_POST['txtPhone']);
  $txtAphone = mysqli_real_escape_string($conn,$_POST['txtAphone']);
  $txtUdesig = mysqli_real_escape_string($conn,$_POST['txtUdesig']);
  $txtArole = mysqli_real_escape_string($conn,$_POST['txtArole']);
  $txtAddress = mysqli_real_escape_string($conn,$_POST['txtAddress']);
  $txtCity = mysqli_real_escape_string($conn,$_POST['txtCity']);
  $txtState = mysqli_real_escape_string($conn,$_POST['txtState']);
  $txtCountry = mysqli_real_escape_string($conn,$_POST['txtCountry']);
  
  $txtMdate = date("Y-m-d H:i:s");

    if(isset($_FILES['userImg']))
    {
      $file1 = $_FILES['userImg'];

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
        $userImg=$file1_destination;
        
      }
      else
      {
        $userImg="";
      }
    }
    else
    {
      echo "image not load";
    }

    if (!empty($_FILES['userImg']['name'])) {
      
      $updateqry = "update tbl_user_master set fname='{$txtFname}',lname='{$txtLname}',user_designation='{$txtUdesig}',user_role='{$txtArole}',dob=$txtBdate,phone='{$txtPhone}',alt_phone='{$txtAphone}',address='{$txtAddress}',city='{$txtCity}',state='{$txtState}',country='{$txtCountry}',profile_pic='{$userImg}',modify_by='{$userid}',date_modify='{$txtMdate}' where user_id = $userId_u and uname='$userName' and del='0'";
    }
    else // no image uploaded
    {
      $updateqry = "update tbl_user_master set fname='{$txtFname}',lname='{$txtLname}',user_designation='{$txtUdesig}',user_role='{$txtArole}',dob=$txtBdate,phone='{$txtPhone}',alt_phone='{$txtAphone}',address='{$txtAddress}',city='{$txtCity}',state='{$txtState}',country='{$txtCountry}',modify_by='{$userid}',date_modify='{$txtMdate}' where user_id = $userId_u and uname='$userName' and del='0'";
    }

    if(mysqli_query($conn,$updateqry))
    {
      header("Location:user-list");
    }
    else
    {
        //echo $updateqry;
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

		<title>Manage User</title>

    <?php include_once("include/head-section.php"); ?>

    <style type="text/css">
      /*Profile Pic Start*/
      .picture-container{
          position: relative;
          cursor: pointer;
          text-align: center;
      }
      .picture{
          width: 120px;
          height: 120px;
          background-color: #fff;
          border: 4px solid #CCCCCC;
          color: #FFFFFF;
          border-radius: 50%;
          margin: 0px auto;
          overflow: hidden;
          transition: all 0.2s;
          -webkit-transition: all 0.2s;
      }
      .picture:hover{
          border-color: #2ca8ff;
      }
      .content.ct-wizard-green .picture:hover{
          border-color: #05ae0e;
      }
      .content.ct-wizard-blue .picture:hover{
          border-color: #3472f7;
      }
      .content.ct-wizard-orange .picture:hover{
          border-color: #ff9500;
      }
      .content.ct-wizard-red .picture:hover{
          border-color: #ff3b30;
      }
      .picture input[type="file"] {
          cursor: pointer;
          display: block;
          height: 100%;
          left: 0;
          opacity: 0 !important;
          position: absolute;
          top: 0;
          width: 100%;
      }

      .picture-src{
          width: 100%;
          
      }
      /*Profile Pic End*/
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
                  <?php if(isset($_GET['userId'])&isset($_GET['userName'])){?>

                  <?php 
                  
                  $selres4 = mysqli_num_rows($getresult1);
                  if ($selres4 == 0) {
                
                    //echo"<script>alert(\"You have entered a wrong url\");</script>";
                    
                  ?>

                  <div class="wrapper-page">
                    <div class="ex-page-content text-center">
                      <div class="text-error">
                        <span class="text-primary">4</span><i class="ti-face-sad text-pink"></i><span class="text-info">4</span>
                      </div>
                      <h2>Whoo0ps! Page not found</h2>
                      <br>
                      <p class="text-muted">
                        This page cannot found or is missing.
                      </p>
                      <p class="text-muted">
                        Use the navigation above or the button below to get back and track.
                      </p>
                      <br>
                      <a class="btn btn-default waves-effect waves-light" href="dashboard.php"> Return Home</a>

                    </div>
                  </div>

                  <?php } else { 
                    $getres1 = mysqli_fetch_array($getresult1); 
                  ?>

                  <h4 class="m-t-0 header-title"><b>Edit User Details</b></h4>
                  <p class="text-muted font-13 m-b-30">
                      Your awesome text goes here.
                  </p>
                  <form action="user.php?userId=<?php echo $_GET['userId'];?>&userName=<?php echo $_GET['userName'];?>" data-parsley-validate novalidate enctype="multipart/form-data" method="post">
                    <div class="row">
                      <div class="col-md-4">
                        <div class="picture-container">
                            <div class="picture">
                                <img src="<?php echo $getres1['profile_pic']?>" class="picture-src" id="wizardPicturePreview" title="">
                                <input type="file" name="userImg" id="wizard-picture" class="rounded-circle">
                            </div><br>
                             <h6 class="">Change Picture</h6>
                        </div>
                      </div>
                      <div class="col-md-8">
                        <div class="row">
                          <div class="col-md-6">
                            <div class="form-group">
                              <label for="txtFname">First Name*</label>
                              <input type="text" name="txtFname" parsley-trigger="change" value="<?php echo $getres1['fname']?>" required placeholder="Enter First name" class="form-control" id="txtFname">
                            </div>
                          </div>
                          <div class="col-md-6">
                            <div class="form-group">
                              <label for="txtLname">Last Name*</label>
                              <input type="text" name="txtLname" parsley-trigger="change" value="<?php echo $getres1['lname']?>" required placeholder="Enter Lasr name" class="form-control" id="txtLname">
                            </div>
                          </div>
                        </div><br>
                        <div class="row">
                          <div class="col-md-6">
                            <div class="form-group">
                              <label for="txtBdate">Date of Birth</label>
                              <input type="date" name="txtBdate" value="<?php echo $getres1['dob']?>" class="form-control" id="txtBdate">
                            </div>
                          </div>
                          <div class="col-md-6">
                            <div class="form-group">
                              <label for="txtEmail">Email address*</label>
                              <input type="email" name="txtEmail" value="<?php echo $getres1['email']?>" disabled parsley-trigger="change" required placeholder="Enter email" class="form-control" id="txtEmail">
                            </div>
                          </div>
                        </div><br>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-4">
                        <div class="form-group">
                          <label for="txtUname">User Name*</label>
                          <input type="text" name="txtUname" value="<?php echo $getres1['uname']?>" disabled parsley-trigger="change" required placeholder="Enter User Name" class="form-control" id="txtUname">
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="form-group">
                          <label for="txtPhone">Phone*</label>
                          <input type="text" name="txtPhone" parsley-trigger="change" value="<?php echo $getres1['phone']?>" required placeholder="Enter Phone" class="form-control" id="txtPhone">
                        </div>
                      </div>
                    </div><br>
                    <div class="row">
                      <div class="col-md-4">
                        <div class="form-group">
                          <label for="txtAphone">Alternate Phone</label>
                          <input type="text" name="txtAphone" parsley-trigger="change" value="<?php echo $getres1['alt_phone']?>" class="form-control" id="txtAphone">
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="form-group">
                          <label for="txtUdesig">User Designation*</label>
                          <input type="text" name="txtUdesig" parsley-trigger="change" value="<?php echo $getres1['user_designation']?>" required class="form-control" id="txtUdesig">
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="form-group">
                          <label for="txtArole">Access Role*</label>
                          <!-- <input type="text" name="text" parsley-trigger="change" required class="form-control" id="emailAddress"> -->
                          <select name="txtArole" class="form-control" id="txtArole" required>
                            <option value="">--Select--</option>
                            <option value="admin" <?php if ($getres1['user_role'] == 'admin') echo 'selected = "selected"'; ?>>Admin</option>
                            <option value="limited" <?php if ($getres1['user_role'] == 'limited') echo 'selected = "selected"'; ?>>Limited</option>
                          </select>
                        </div>
                      </div>
                    </div><br>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label for="txtAddress">Address</label>
                          <input type="text" name="txtAddress" value="<?php echo $getres1['address']?>"  parsley-trigger="change" class="form-control" id="txtAddress">
                        </div>
                      </div>
                    </div><br>
                    <div class="row">
                      <div class="col-md-4">
                        <div class="form-group">
                          <label for="txtCity">City</label>
                          <input type="text" name="txtCity" value="<?php echo $getres1['city']?>"  parsley-trigger="change" class="form-control" id="txtCity">
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="form-group">
                          <label for="txtState">State</label>
                          <input type="text" name="txtState" value="<?php echo $getres1['state']?>"  parsley-trigger="change" class="form-control" id="txtState">
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="form-group">
                          <label for="txtCountry">Country</label>
                          <input type="text" name="txtCountry" value="<?php echo $getres1['country']?>"  parsley-trigger="change" class="form-control" id="txtCountry">
                        </div>
                      </div>
                      
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group text-right m-b-0">
                          <button class="btn btn-primary waves-effect waves-light" type="submit" name="btnUpdate"> Update</button>
                          <!-- <a href="user-list.php" class="btn btn-default waves-effect waves-light m-l-5"> Cancel</a> -->
                          <a href="javascript:void(0);" class="btn btn-default waves-effect waves-light" onclick="history.back();"> Cancel</a>
                        </div>
                      </div>

                    </div>
                  </form>

                  <?php } ?> <!-- else part completed here (retrieving details) -->

                  <?php } else { ?>

                  <h4 class="m-t-0 header-title"><b>Add new User</b></h4>
                  <p class="text-muted font-13 m-b-30">
                      Your awesome text goes here.
                  </p>
                  <form action="user.php" data-parsley-validate novalidate enctype="multipart/form-data" method="post">
                    <div class="row">
                      <div class="col-md-4">
                        <div class="picture-container">
                            <div class="picture">
                                <img src="" class="picture-src" id="wizardPicturePreview" title="">
                                <input type="file" name="userImg" id="wizard-picture" class="rounded-circle">
                            </div><br>
                             <h6 class="">Change Picture</h6>
                        </div>
                      </div>
                      <div class="col-md-8">
                        <div class="row">
                          <div class="col-md-6">
                            <div class="form-group">
                              <label for="txtFname">First Name*</label>
                              <input type="text" name="txtFname" parsley-trigger="change" required placeholder="Enter First name" class="form-control" id="txtFname">
                            </div>
                          </div>
                          <div class="col-md-6">
                            <div class="form-group">
                              <label for="txtLname">Last Name*</label>
                              <input type="text" name="txtLname" parsley-trigger="change" required placeholder="Enter Lasr name" class="form-control" id="txtLname">
                            </div>
                          </div>
                        </div><br>
                        <div class="row">
                          <div class="col-md-6">
                            <div class="form-group">
                              <label for="txtBdate">Date of Birth</label>
                              <input type="date" name="txtBdate" class="form-control" id="txtBdate">
                            </div>
                          </div>
                          <div class="col-md-6">
                            <div class="form-group">
                              <label for="txtEmail">Email address*</label>
                              <input type="email" name="txtEmail" parsley-trigger="change" required placeholder="Enter email" class="form-control" id="txtEmail">
                            </div>
                          </div>
                        </div><br>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-4">
                        <div class="form-group">
                          <label for="txtUname">User Name*</label>
                          <input type="text" name="txtUname" parsley-trigger="change" required placeholder="Enter User Name" class="form-control" id="txtUname">
                          <span id="usernameLoading"></span>
                          <span id="usernameRes"></span>
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="form-group">
                          <label for="txtPass">Password*</label>
                          <input id="txtPass" name="txtPass" type="password" placeholder="Password" required class="form-control">
                        </div>
                      </div>

                      <div class="col-md-4">
                        <div class="form-group">
                          <label for="txtPhone">Phone*</label>
                          <input type="text" name="txtPhone" parsley-trigger="change" required placeholder="Enter Phone" class="form-control" id="txtPhone">
                        </div>
                      </div>
                    </div><br>
                    <div class="row">
                      <div class="col-md-4">
                        <div class="form-group">
                          <label for="txtAphone">Alternate Phone</label>
                          <input type="text" name="txtAphone" parsley-trigger="change" class="form-control" id="txtAphone">
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="form-group">
                          <label for="txtUdesig">User Designation*</label>
                          <input type="text" name="txtUdesig" parsley-trigger="change" required class="form-control" id="txtUdesig">
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="form-group">
                          <label for="txtArole">Access Role*</label>
                          <!-- <input type="text" name="text" parsley-trigger="change" required class="form-control" id="emailAddress"> -->
                          <select name="txtArole" class="form-control" id="txtArole" required>
                            <option value="">--Select--</option>
                            <option value="admin">Admin</option>
                            <option value="limited">Limited</option>
                          </select>
                        </div>
                      </div>
                    </div><br>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label for="txtAddress">Address</label>
                          <input type="text" name="txtAddress" parsley-trigger="change" class="form-control" id="txtAddress">
                        </div>
                      </div>
                    </div><br>
                    <div class="row">
                      <div class="col-md-4">
                        <div class="form-group">
                          <label for="txtCity">City</label>
                          <input type="text" name="txtCity" parsley-trigger="change" class="form-control" id="txtCity">
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="form-group">
                          <label for="txtState">State</label>
                          <input type="text" name="txtState" parsley-trigger="change" class="form-control" id="txtState">
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="form-group">
                          <label for="txtCountry">Country</label>
                          <input type="text" name="txtCountry" parsley-trigger="change" class="form-control" id="txtCountry">
                        </div>
                      </div>
                      <!-- <div class="col-md-4">
                        <div class="form-group">
                          <label for="passWord2">Confirm Password *</label>
                          <input data-parsley-equalto="#pass1" type="password" required placeholder="Password" class="form-control" id="passWord2">
                        </div>
                      </div> 
                      <div class="col-md-4">
                        <div class="form-group">
                          <label></label>
                          <div class="checkbox">
                            <input id="remember-1" type="checkbox">
                            <label for="remember-1"> Remember me </label>
                          </div>
                        </div>
                      </div>-->
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group text-right m-b-0">
                          <button class="btn btn-primary waves-effect waves-light" type="submit" name="btnSave" id="btnSave" > Save</button>
                          <!-- <a href="user-list.php" class="btn btn-default waves-effect waves-light m-l-5"> Cancel</a> -->
                          <a href="javascript:void(0);" class="btn btn-default waves-effect waves-light" onclick="history.back();"> Cancel</a>
                        </div>
                      </div>

                    </div>
                  </form>

                  <?php } ?>

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

    <script src="assets/js/jquery.core.js"></script>
    <script src="assets/js/jquery.app.js"></script>
	  <script type="text/javascript" src="assets/plugins/parsleyjs/parsley.min.js"></script>
        
    <script type="text/javascript">
      $(document).ready(function() {
        $('form').parsley();
      });

      $(document).ready(function() {
        $("#wizard-picture").change(function() {
          readURL(this);
        });
      });

      function readURL(input) {
        if (input.files && input.files[0]) {
          var reader = new FileReader();

          reader.onload = function(e) {
            $('#wizardPicturePreview').attr('src', e.target.result).fadeIn('slow');
          }
          reader.readAsDataURL(input.files[0]);
        }
      }

      $(document).ready(function(){
          $('#txtUname').keyup(function()
          {
              $.post("check_username.php",
              { 
                txtUname : $('#txtUname').val()
              },
              function(response)
              {
                $('#usernameRes').fadeOut(); 
                setTimeout("Userresult('usernameRes','"+escape(response)+"')",350);
              });
              return false;
          });
          
      });

      function Userresult(id,response)
      {
        $('#usernameLoading').hide();
        $('#'+id).html(unescape(response));
        $('#'+id).fadeIn();
      }
      
    </script>
	
  </body>
</html>