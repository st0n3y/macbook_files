<?php

/* This script:

 * - defines constants and settings

 * - dictates how errors are handled

 * - defines useful functions

 */

/* ######################################## */

/*                 SETTINGS                 */

/* ######################################## */

define('Author','Marc Dinardo');
define('Created', '16/05/2016');

//ini_set('include_path', '../models');

// flag variable for site status
define('LIVE', FALSE);
define('DOMAIN', $_SERVER['DOMAIN_NAME']);
define('PRIMARY_EMAIL', 'marc.dinardo@codeclan.com');
define('COMPANY', 'CodeClan');

/* ######################################## */

/*            ERROR MANAGEMENT              */

/* ######################################## */

// create the error handler

function my_error_handler($e_number, $e_message, $e_file, $e_line, $e_vars)
{

// build the error message
$message = "<p>An error has occurred in the script '$e_file' on line $e_line: $e_message\n<br/>";

// add the date and time
$message .= "Date/Time: " . date('n-j-Y H:i:s') . "\n<br/>";

// append $e_vars to the message
$message .= "<pre>" . print_r ($e_vars,1) . "</pre>\n</p>";

  if (!LIVE)
  {
  	// development stage:
  	// send error details to browser
  	echo '<div id="Error">' . $message . '<div><br/>';
  } else {
  	// live stage:
  	// email admin
  	$headers = "From: Web Error Identified <" . PRIMARY_EMAIL . ">\r\nMIME-Version:1.0\r\nDate: " . date("r") . "\r\nContent-type:text/html;charset=iso-8859-1\r\n";
  	mail(PRIMARY_EMAIL, 'Site Error!', $message, $headers);
  }

}

// use this error handler
set_error_handler('my_error_handler');

/* ######################################## */
/*                 DB PARAMS                */
/* ######################################## */

$dbhost = 'localhost';
$dbuser = 'root';
$dbpass = 'L8CujiyG';
$dbname = 'codeclan';

?>