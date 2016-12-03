<?php
require_once('include/config.inc.php');

$page_title = COMPANY . ' | Sign In';

include('include/header.html');

require_once('include/db_scripts.php');

$email = $password = $redirect = $errors = '';

if(!empty($_POST['email']) && filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
  $email = $_POST['email'];
}
if(!empty($_POST['password'])) {
  $password = sha1($_POST['password']);
}
if(isset($_POST['redirect'])) {
  $redirect = $_POST['redirect'];
} else {
  $redirect = "sign_in.php";
}
if (empty($email)) {
  $errors .= '<li>Please enter email address.</li>';
}
if (empty($password)) {
  if (!empty($errors)) {
    $errors .= '<br/>';
  }
  $errors .= '<li>Please enter password.</li>';
}
if (!empty($errors)) {
  redirect_url("sign_in.php?error=" . $errors);
  exit();
}

if(is_authenticated_user($email, $password)) {
  $_SESSION = array();
  register_new_successful_login($email);
  $user = lookup_user_details($email);
  $_SESSION['session_id'] = session_id();
  $_SESSION['user_email'] = $user->email;
  $_SESSION['user_roles'] = $user->roles;
  $_SESSION['user_first_name'] = $user->first_name;
  $_SESSION['user_full_name'] = $user->full_name;
  $_SESSION['last_login'] = $user->last_login;
  redirect_url($redirect);
  exit();
} else {
  register_new_unsuccessful_login($email);
  redirect_url("sign_in.php?error=Authentication Error:<br/>Invalid email address or password entered. Try again!");
  exit();
}

?>