<?php

//require "DBConnection.php";

// connect to the database
$db = mysqli_connect($dbhost,$dbuser,$dbpass,$dbname);

/* check connection */
if (!$db) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}

?>