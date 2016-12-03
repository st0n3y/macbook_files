<?php

class User {
  public $email;
  public $first_name;
  public $full_name;
  public $roles = array();
  public $last_login;

  public function __construct($email, $first_name, $full_name, $roles, $last_login)
  {
    $this->email = $email;
    $this->first_name = $first_name;
    $this->full_name = $full_name;
    $this->roles = $roles;
    $this->last_login = $last_login;
  }
}

?>