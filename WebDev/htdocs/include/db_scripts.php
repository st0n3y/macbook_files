<?php

global $db;

require "User.php";

function is_authenticated_user($email, $password) {
  global $db;
  $email = mysqli_real_escape_string($db, $email);
  $password = mysqli_real_escape_string($db, $password);
  $userSQL = "select 1 " .
    "from user " .
    "inner join logindetails on user.userid = logindetails.userid " .
    "where user.email = '" . $email . "' " .
    " and logindetails.password = '" . $password . "'";
  $validUserResult = mysqli_query($db, $userSQL);
  if (mysqli_num_rows($validUserResult) > 0) {
    return true;
  } else {
    return false;
  }
}

function lookup_user_details($email) {
  global $db;
  $fname = $sname = '';
  $userSQL = "select * " .
    "from user " .
    "where email = '" . $email . "'";
  $result = mysqli_query($db, $userSQL);
  if (mysqli_num_rows($result) > 0) {
    $row = mysqli_fetch_array($result);
    $fname = $row['fname'];
    $sname = $row['sname'];
  }
  $roles = get_user_roles($email);
  $lastLoginDate = get_last_login($email);
  return new User($email, $fname, $fname . ' ' . $sname, $roles, $lastLoginDate);
}

function get_user_roles($email) {
  global $db;
  $roles = array();
  $roleSQL = "select roleName " . 
    "from role " .
    "inner join assignroletouser a on a.roleId = role.roleId " .
    "inner join user on a.userId = user.userId " .
    "where user.email = '" . $email . "'";
  $result = mysqli_query($db, $roleSQL);
  while ($row = mysqli_fetch_array($result)) {
    array_push($roles, $row['roleName']);
  }
  print_r($roles);
  return $roles;
}

function get_last_login($email) {
  global $db;
  $userSQL = "select lastSuccessfulLogin " .
    "from logindetails l " .
    "inner join user on l.userId = user.userId " .
    "where user.email = '" . $email . "'";
  $result = mysqli_query($db, $userSQL);
  if (mysqli_num_rows($result) > 0) {
    $row = mysqli_fetch_array($result);
    $last_login = $row['lastSuccessfulLogin'];
    return $last_login;
  }
  return '';
}

function register_new_successful_login($email) {
  global $db;
  $timestamp = date('Y-m-d H:i:s');
  echo $timestamp;
  $registerNewLogin = "insert into authenticationlog " .
    "(`userId`, `loginAttemptedDate`, `isLoginSuccessful`) " .
    "values ((select userId from user where email = '" . $email . "'), '" . $timestamp . "', 'Y')";
  $updateLastSuccessfulLogin = "update logindetails " .
    "set lastSuccessfulLogin = '" . $timestamp . "', " .
    "failedLoginAttempts = 0 " .
    "where userId = (select userId from user where email = '" . $email . "')";
  $addLogin = mysqli_query($db, $registerNewLogin) or die(mysqli_error($db));
  $updateUserLogin = mysqli_query($db, $updateLastSuccessfulLogin) or die (mysqli_error($db));
}

function register_new_unsuccessful_login($email) {
  global $db;
  $timestamp = date('Y-m-d H:i:s');
  echo $timestamp;
  $registerNewLogin = "insert into authenticationlog " .
    "(`userId`, `loginAttemptedDate`, `isLoginSuccessful`) " .
    "values ((select userId from user where email = '" . $email . "'), '" . $timestamp . "', 'N')";
  $updateFailedLoginAttempts = "update logindetails " .
    "set failedLoginAttempts = failedLoginAttempts + 1 " .
    "where userId = (select userId from user where email = '" . $email . "')";
  $addLogin = mysqli_query($db, $registerNewLogin) or die(mysqli_error($db));
  $updateUserLogin = mysqli_query($db, $updateFailedLoginAttempts) or die (mysqli_error($db));
}

function redirect_url($url) {
  header("Location: " . $url);
}

?>