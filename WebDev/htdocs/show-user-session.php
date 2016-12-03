<?php

if(isset($_SESSION['user_full_name']) && isset($_SESSION['user_email'])) {
  echo "Welcome back " . $_SESSION['user_full_name'] . " &lt;" . $_SESSION['user_email'] . "&gt;";
  echo '</br>';
  echo '<br/>';
  print_r($_SESSION);
  echo '</br>';
  echo '<br/>';
  echo '<a href="sign_out.php" title="Sign Out" >Sign Out</a>';
} else {
  echo 'Session expired. No session details found.';
}