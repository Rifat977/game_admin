<?php

    //database configuration
    // $host       = "tour.wintertestcode.xyz";
    // $user       = "winterte_tour";
    // $pass       = "test@tour";
    // $database   = "winterte_tour";

    $host = "localhost";
    $user = "root";
    $pass = "";
    $database = "multi_tour";

    $connect = new mysqli($host, $user, $pass, $database);

    if (!$connect) {
        die ("connection failed: " . mysqli_connect_error());
    } else {
        $connect->set_charset('utf8');
    }
	
	$GLOBALS['config'] = $connect;


    $ENABLE_RTL_MODE = 'false';

?>