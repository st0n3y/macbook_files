<?php

// set page title and include HTML header

require_once('include/config.inc.php');

$page_title = COMPANY . ' | My App';

include('include/header.html');

?>

<ul>
  <li><a href="#home">Home</a></li>
  <li><a href="myApp.php" class="active">My App</a></li>
  <li><a href="#contact">Contact</a></li>
  <?php
  if(isset($_SESSION['user_full_name'])) {
    echo '<li style="float:right"><a href="sign_out.php?redirect=myApp.php">Sign Out</a></li>';
    echo '<li style="float:right; padding-left:10px; padding-right:10px">Welcome back <br/>' . $_SESSION['user_full_name'] . '</li>';
  } else {
    echo '<li style="float:right"><a href="sign_in.php?redirect=myApp.php">Sign In</a></li>';
  }
  ?>
</ul>

<h1 style="padding-top:40px">Test</h1>

<h2>Some details about my app</h2>

<h2>Session Details</h2>

<?php
if (isset($_SESSION['user_email'])) {
  print_r($_SESSION);
} else {
  echo 'Session not currently active';
}

include('include/footer.html');

?>