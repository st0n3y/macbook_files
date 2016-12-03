<?php

// set page title and include HTML header

require_once('include/config.inc.php');

$page_title = COMPANY . ' | Sign In';

include('include/header.html');

require_once('include/db_scripts.php');

$redirect = $error = '';
if (isset($_GET['redirect'])) {
  $redirect = $_GET['redirect'];
}
if (isset($_GET['error'])) {
  $error = $_GET['error'];
}
?>

<ul>
  <li><a href="#home">Home</a></li>
  <li><a href="myApp.php">My App</a></li>
  <li><a href="#contact">Contact</a></li>
  <?php
  if(isset($_SESSION['user_full_name'])) {
    echo '<li style="float:right"><a href="sign_out.php?redirect=sign_in.php">Sign Out</a></li>';
    echo '<li style="float:right; padding-left:10px; padding-right:10px">Welcome back <br/>' . $_SESSION['user_full_name'] . '</li>';
  } else {
    echo '<li style="float:right" class="active"><a href="#" class="active">Sign In</a></li>';
  }
  ?>
</ul>

<h1 style="padding-top:40px">MyApp</h1>

<?php

if(!isset($_SESSION['user_email'])) {
  include('login-form.php');
} else {
  if (!empty($redirect)) {
    redirect_url($redirect);
    exit();
  } else {
    include('show-user-session.php');
  }
}

include('include/footer.html');

?>