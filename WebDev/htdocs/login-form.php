<form name="login_form" id="login-form" method="post" action="login.php">

<div id="login">
<table align="center">
<?php
if (isset($_GET['error'])) {
  echo '<td colspan="2" class="error">' . $_GET['error'] . '</td>';
}
?>
<tr>
<td>Email: </td>
<td><input type="text" name="email" />
</tr>
<tr>
<td>Password: </td>
<td><input type="password" name="password" />
</tr>
<tr>
<td colspan="2" align="center"><a href="#" title="Reset Password">Forgotten Password?</a></td>
</tr>
<tr>
<td colspan="2" align="center"><input type="submit" name="submit" value="Sign In" /><input type="hidden" name="submitted" value="TRUE" /><?php if (isset($_GET['redirect'])) { echo '<input type="hidden" name="redirect" value="' . $_GET['redirect'] . '" />'; } ?></td>
</tr>
</table>
</div>

</form>