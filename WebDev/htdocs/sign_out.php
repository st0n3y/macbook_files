<?php

require_once('include/db_scripts.php');

$redirect = 'sign_in.php';
if (isset($_GET['redirect'])) {
  $redirect = $_GET['redirect'];
}

session_start();

$_SESSION = array();

session_destroy();

print_r($_SESSION);

redirect_url($redirect);

?>