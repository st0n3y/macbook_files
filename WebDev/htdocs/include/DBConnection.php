<?php

require_once('config.inc.php');

class DBConnection {
  private static $instance;
  public function __construct($host, $user, $password, $db){
    if (self::$instance){
      exit("Instance on DBConnection already exists.") ;
    } else {
      self::$instance = mysqli_connect($host, $user, $password, $db);
    }
  }

  public static function getInstance(){
    if (!self::$instance){
      self::$instance = new DBConnection($dbhost,$dbuser,$dbpass,$dbname) ;
    }
    return $instance;
  }
}

?>