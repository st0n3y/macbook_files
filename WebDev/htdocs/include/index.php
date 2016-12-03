<?php

// set page title and include HTML header

require_once('../include/config.inc.php');

$page_title = COMPANY . ' | Careers';

include('../include/header.html');

//require_once('../include/edocs.php');

include('../include/db_scripts.php');

include('../include/php_scripts.php');

$valid_operation = false;
$vacs = false;
$apps = false;
$cs = false;
$cv = false;

function printVacs($vacs) {
	$today = time();
	if (count($vacs) > 0) {
		$curr = $vacs[0];
		$s_from = explode(' ',$curr['show_from']);
		$s_to = explode(' ',$curr['show_to']);
		$date_from = explode('-',$s_from[0]);
		$date_to = explode('-',$s_to[0]);
		$from = mktime(0,0,0,$date_from[1],$date_from[2],$date_from[0]);
		$to = mktime(23,59,59,$date_to[1],$date_to[2],$date_to[0]);
		$status;
		$sColor;
		if ($to < $today) {
			$status = 'CLOSED';
			$sColor = 'FF0000';
		} else if ($from > $today) {
			$status = 'PENDING';
			$sColor = 'FF6600';
		} else if ($from <= $today && $today <= $to) {
			$status = 'LIVE';
			$sColor = '009900';
		}
		$countApps = 0;
		$apps = get_applications($curr['vid']);
		if ($apps) $countApps = count($apps);
		echo '<tr>
        <td class="td1" scope="row"><font style="color:#' . $sColor . '">&nbsp;&nbsp;' . $status . '</font></td>
        <td class="td2"><a href="http://www.' . DOMAIN . '/rs/index.php?vid=' . $curr['vid'] . '" title="View Applications">' . $curr['title'] . '</a></td>
        <td class="td3" align="center">' . strtoupper(date('d-M-y',$from)) . '</td>
        <td class="td4" align="center">' . strtoupper(date('d-M-y',$to)) . '</td>
		<td align="center">' . $countApps . '</td>
        	<td align="center"><a href="javascript: void(0);" onclick="window.open(\'http://www.' . DOMAIN . '/rs/viewVacancy.php?id=' . $curr['vid'] . '\', 
				\'windowname28\', 
				\'width=800, \
				 height=500, \
  				 directories=no, \
  				 location=no, \
  				 menubar=no, \
  				 resizable=no, \
  				 scrollbars=1, \
  				 toolbar=no\'); 
  				return false;" title="Preview ' . $curr['title'] . ' Vacancy"><img src="http://www.' . DOMAIN . '/images/prev_icon.png" height="14px" /></a>&nbsp;&nbsp;<a href="" title="Edit Vacancy Details"><img src="http://www.' . DOMAIN . '/images/edit_icon.png" height="14px" /></a>&nbsp;&nbsp;<a href="http://www.' . DOMAIN . '/rs/deleteVacancy.php?id=' . $curr['vid'] . '" title="Delete Vacancy"><img src="http://www.' . DOMAIN . '/images/delete_icon.png" height="12px" /></a></td>
      </tr>';
	  if (count($vacs) > 1) {
	  	for ($v=1; $v < count($vacs); $v++) {
			$curr = $vacs[$v];
			$countApps = 0;
			$apps = get_applications($curr['vid']);
			if ($apps) $countApps = count($apps);
			$s_from = explode(' ',$curr['show_from']);
			$s_to = explode(' ',$curr['show_to']);
			$date_from = explode('-',$s_from[0]);
			$date_to = explode('-',$s_to[0]);
			$from = mktime(0,0,0,$date_from[1],$date_from[2],$date_from[0]);
			$to = mktime(23,59,59,$date_to[1],$date_to[2],$date_to[0]);
			$status;
			$sColor;
			if ($to < $today) {
			$status = 'CLOSED';
			$sColor = 'FF0000';
		} else if ($from > $today) {
			$status = 'PENDING';
			$sColor = 'FF6600';
		} else {
			$status = 'LIVE';
			$sColor = '009900';
		}
			echo '<tr';
			 if ($v%2==1) echo ' class="dk"';
			 echo '>
        	<td scope="row"><font style="color:#' . $sColor . '">&nbsp;&nbsp;' . $status . '</font></td>
        	<td><a href="http://www.' . DOMAIN . '/rs/index.php?vid=' . $curr['vid'] . '" title="View Applications">' . $curr['title'] . '</a></td>
        	<td align="center">' . strtoupper(date('d-M-y',$from)) . '</td>
        	<td align="center">' . strtoupper(date('d-M-y',$to)) . '</td>
			<td align="center">' . $countApps . '</td>
        	<td align="center"><a href="javascript: void(0);" onclick="window.open(\'http://www.' . DOMAIN . '/rs/viewVacancy.php?id=' . $curr['vid'] . '\', 
				\'windowname28\', 
				\'width=800, \
				 height=500, \
  				 directories=no, \
  				 location=no, \
  				 menubar=no, \
  				 resizable=no, \
  				 scrollbars=1, \
  				 toolbar=no\'); 
  				return false;" title="Preview ' . $curr['title'] . ' Vacancy"><img src="http://www.' . DOMAIN . '/images/prev_icon.png" height="14px" /></a>&nbsp;&nbsp;<a href="" title="Edit Vacancy Details"><img src="http://www.' . DOMAIN . '/images/edit_icon.png" height="14px" /></a>&nbsp;&nbsp;<a href="http://www.' . DOMAIN . '/rs/deleteVacancy.php?id=' . $curr['vid'] . '" title="Delete Vacancy"><img src="http://www.' . DOMAIN . '/images/delete_icon.png" height="12px" /></a></td>
     	 </tr>';
		}
	  }
	} else {
		echo '<tr>
        <td class="td1" scope="row"></td>
        <td class="td2"></td>
        <td class="td3"></td>
        <td class="td4"></td>
        <td class="td5" align="center"></td>
		<td class="td7" align="center"></td>
      </tr>
      <tr>
        <td scope="row" colspan="8">&nbsp;&nbsp;No vacancies found.</td>
      </tr>
	  <tr>
        <td scope="row" colspan="8">&nbsp;&nbsp;Click +Vacancy to create your first vacancy.</td>
      </tr>
	  <tr class="dk">
        <td scope="row" colspan="8"></td>
      </tr>';
	}
}
function printApps($apps) {
	$today = time();
	for ($a = 0; $a < count($apps); $a++) {
		$curr = $apps[$a];
		$submitted = explode(' ',$curr['application_date']);
		$date_sub = explode('-',$submitted[0]);
		$sub = mktime(0,0,0,$date_sub[1],$date_sub[2],$date_sub[0]);
		$status = strtoupper(getAppStatus($curr['status']));
		$sColor = '';
		switch ($curr['status']) {
			case '10001' :
				$sColor = 'green';
				break;
			case '10002' :
				$sColor = 'amber';
				break;
			case '10003' : 
				$sColor = 'purple';
				break;
			case '10004' :
				$sColor = 'dark_purple';
				break;
			case '10005' :
			case '10006' :
				$sColor = 'red';
				break;
			case '10007' :
			case '10011' :
				$sColor = 'grey';
				break;
			case '10008' :
				$sColor = 'black';
				break;
			case '10009' :
				$sColor = 'dark_green';
				break;
			case '10010' :
				$sColor = 'dark_blue';
				break;
		}
		$cvPath = explode('../',$curr['cv']);
		$cv = $cvPath[1];
			echo '<tr';
			 if ($a%2==1) echo ' class="dk"';
			 echo '>
        	<td scope="row" class="td11"><font style="color:#000000">&nbsp;&nbsp;<img src="http://www.' . DOMAIN . '/images/' . $sColor . '.png" title="Status: ' . $status . '" width="13px" /></font></td>
        	<td class="td12">' . strtoupper(date('d-M-y',$sub)) . '</td>
        	<td class="td13"><a href="http://www.' . DOMAIN . '/rs/index.php?vid=' . $curr['vid'] . '&aid=' . $curr['applicationID'] . '" title="View ' . $curr['fname'] . '\'s Application">' . $curr['sname'] . '</a></td>
        	<td class="td14"><a href="http://www.' . DOMAIN . '/rs/index.php?vid=' . $curr['vid'] . '&aid=' . $curr['applicationID'] . '" title="View ' . $curr['fname'] . '\'s Application">' . $curr['fname'] . '</a></td>
     	 </tr>';
	}
}
function printComments($comments) {
	$today = time();
	if(isset($_GET['addComment'])) {
		echo '<form action="../include/addComment.php" method="post" name="addCommentsForm">
				
				<tr><td><a name="comment"></a>
			
					<textarea name="add_comment" rows="8" cols="34"></textarea>
					<input type="hidden" name="vid" value="' . $_GET['vid'] . '"/>
					<input type="hidden" name="aid" value="' . $_GET['aid'] . '"/>
				</td></tr>
				<tr><td align="center">
					<a href="index.php?vid=' . $_GET['vid'] . '&aid=' . $_GET['aid'] . '"><img name="cancelBut" src="../images/cancel.png" height="28px" onmouseover="document.addCommentsForm.cancelBut.src=\'../images/cancel_over.png\'" onmouseout="document.addCommentsForm.cancelBut.src=\'../images/cancel.png\'"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:document.addCommentsForm.submit()"><img name="submitBut" src="../images/submit.png" onmouseover="document.addCommentsForm.submitBut.src=\'../images/submit_over.png\'" onmouseout="document.addCommentsForm.submitBut.src=\'../images/submit.png\'" height="28px"></a>
				</td></tr>
			</form>';
	}
	if ($comments) {
		for ($c = 0; $c < count($comments); $c++) {
			$curr = $comments[$c];
			$added = explode(' ',$curr['created_date']);
			$date_sub = explode('-',$added[0]);
			$time_sub = explode(':',$added[1]);
			$sub = mktime($time_sub[0],$time_sub[1],$time_sub[2],$date_sub[1],$date_sub[2],$date_sub[0]);
			$message = $curr['text'];
			if (strlen($message) > 150) {
				$message = '<a title="' . str_replace('<br/>','&#10;',$message) . '">' . substr($message,0,150) . '...</a>';
			}
			echo '<tr';
				 if ($c%2==1) echo ' class="dk"';
				 echo '><td scope="row"><table width="100%">
				 <tr><td style="font-size:14px; color:#000000">' . $curr['fname'] . ' ' . substr($curr['sname'],0,1) . '</td><td align="right"><font style="size:8px; color:#000000">' . date('d-M g:i A',$sub) . '</font></td></tr>
				 <tr>
				<td scope="row" colspan="2">' . $message . '</td>
			 </tr></table></td></tr>';
		}
	}
	if (!$comments && !isset($_GET['addComment'])) {
		echo '<tr>
				<td scope="row"><font style="color:#000000">No comments provided.</font></td>
			 </tr>';
	}
}

if (isset($_SESSION['user_id'])) {
	$roles = get_user_roles($_SESSION['user_id']);
	if (in_array('Administrator',$roles) || in_array('Human Resource Manager',$roles)) {
		$valid_operation = true;
		$vacs = get_vacancies(getCID());
		if (isset($_GET['vid']) && $_GET['vid'] != 0) {
			if (isset($_GET['view']) && $_GET['view'] == 'shortlist') {
				$apps = get_shortlisted_applications($_GET['vid']);
			} else {
				$apps = get_applications($_GET['vid']);
			}
		} else if (isset($_GET['view']) && $_GET['view'] == 'shortlist') {
			$apps = get_all_shortlisted_applications();
		}
		if (isset($_GET['aid'])) {
			$appID = $_GET['aid'];
			$appl = get_application($appID);
			$cs = get_comments($appID);
		}
	}
}

if (!$valid_operation) {
	echo '<table width="100%" style="border:2px solid #000000; background-color:#FFFFFF" cellspacing="0px" align="center" class="menu, dialog"><form name="myForm" method="post">
<tr height="30px"><td colspan="2" style="background-color:#eee; padding-left:10px" align="left" class="menu"><form name="myForm" method="post"><font color="#354576" style="font-size:20px">R</font><font color="#354576" style="font-size:16px">ECRUIT</font><font color="#354576" style="font-size:20px">S</font><font color="#354576" style="font-size:16px">TAR - </font><font color="#354576" style="font-size:20px">P</font><font color="#354576" style="font-size:16px">REVIEW</em></font></td><td style="background-color:#eee; padding-right:10px" align="right"><a href="javascript:history.back();" onmouseover="document.myForm.back_but.src=\'http://www.' . DOMAIN . '/media/assets/back_over.png\'" onmouseout="document.myForm.back_but.src=\'http://www.' . DOMAIN . '/media/assets/back.png\'"><img name="back_but" src="http://www.' . DOMAIN . '/media/assets/back.png" height="24px" title="Back" alt="Back Button" /></a></td></tr>
<tr><td colspan="3">
<table width="100%" cellspacing="20px" align="center">

<tr valign="top"><td align="left" colspan="2" style="padding-left:20px; padding-right:20px; border:2px solid #cccccc; background-color:#eee">
<p align="center" class="error" style="font-size:18px"><a href="http://www.' . DOMAIN . '/images/recruit-star-beta.png" title="View Full-Size Image (opens in new window)" target="_blank"><img src="http://www.' . DOMAIN . '/images/recruit-star-beta.png" alt="RecruitStar (Beta Preview)" width="800px" /></a></p></td></tr>
</table>
</td></tr>
		
		
<tr style="background-color:#999; padding-left:20px; padding-right:20px"><td align="left" style="padding-left:20px; padding-right:20px" colspan="3"><p align="left"><font size="-1" color="#FFFFFF"><a href="http://www.' . DOMAIN . '/" onmouseover="document.myForm.cancel_but.src=\'http://www.' . DOMAIN . '/media/assets/cancel_over.png\'" onmouseout="document.myForm.cancel_but.src=\'http://www.' . DOMAIN . '/media/assets/cancel.png\'" title="Cancel"><img src="http://www.' . DOMAIN . '/media/assets/cancel.png" alt="Cancel Button" name="cancel_but" height="32px" /></a></font></p></td></tr>
</form>
</table>';
exit();
}
$new_mail = 1;


if ($function) {
	echo '<!-- #dialog is the id of a DIV defined in the code below --><table class="menu"><tr><td><a href="#favourite" name="modal">Sign In</a></td></tr>
<tr><td>   <div id="boxes">             <!-- #customize your modal window here -->      <div id="favourite" class="window">
<form name="myForm" method="post">

<table width="60%" style="border:2px solid #000000; background-color:#FFFFFF" cellspacing="0px" align="center">
<tr height="30px"><td colspan="2" style="background-color:#ABC8D1; padding-left:10px" align="left"><font color="#354576" style="font-size:16px">Sign In</font></td><td style="background-color:#ABC8D1; padding-right:10px" align="right"><font color="#FFFFFF" style="font-size:16px"><a href="#" class="close" onmouseover="document.myForm.back_but.src=\'http://www.' . DOMAIN . '/media/assets/back_over.png\'" onmouseout="document.myForm.back_but.src=\'http://www.' . DOMAIN . '/media/assets/back.png\'"><img name="back_but" src="http://www.' . DOMAIN . '/media/assets/back.png" height="24px" title="Back" alt="Back Button" /></a></font></td></tr>
<tr height="10px"><td width="30%"></td><td></td><td width="40%"></td></tr>';

$u = $p = $errors = false;

if (isset($_POST['submitted']))
{
	
	if (empty($_POST['username'])) {
		$errors.= '<em>Error:</em>&nbsp;&nbsp;&nbsp;&nbsp;Please enter your username.<br/>';
	}	
	else if (!empty($_POST['username']) && preg_match('/^[\w.-]+@[\w.-]+\.[A-Za-z]{2,6}$/',$_POST['username']))
	{
		$u = $_POST['username'];
	} else {
		$errors.= '<em>Error:</em>&nbsp;&nbsp;&nbsp;&nbsp;Invalid username. Please try again!<br/>';
	}
	if (empty($_POST['password'])) {
		$errors.= '<em>Error:</em>&nbsp;&nbsp;&nbsp;&nbsp;Please enter your password.<br/>';
	}	
	else if (!empty($_POST['password']) && preg_match('/^\w{6,20}$/',$_POST['password']))
	{
		$p = SHA1($_POST['password']);
	} else {
		$errors.= '<em>Error:</em>&nbsp;&nbsp;&nbsp;&nbsp;Invalid password. Please try again!<br/>';
	}
	if ($u && $p)
	{
		$qUser = mysql_query("select email, password from User where email='" . mysql_real_escape_string($_POST['username']) . "'");
		
		if (mysql_num_rows($qUser) == 0)
		{
			$errors.='<em>Error:</em>&nbsp;&nbsp;&nbsp;&nbsp;Invalid username. Please try again!<br/>';
		} else {
			$uDetails = mysql_fetch_array($qUser);
			if ($p != $uDetails['password'])
			{
				$errors.='<em>Error:</em>&nbsp;&nbsp;&nbsp;&nbsp;Invalid password. Please try again!<br/>';
			} else {
			
				$_SESSION = array();
			
				$q = mysql_query("SELECT * FROM Company, User WHERE User.email = '" . mysql_real_escape_string($_POST['username']) . "' AND User.cid = Company.cid");
				$result = mysql_fetch_array($q);
				
				$_SESSION['user_id'] = $_POST['username'];
				$_SESSION['name'] = $result['fname'] . ' ' . $result['sname'];
				$_SESSION['company'] = $result['name'];
				$_SESSION['imageURL'] = $result['image_url'];
				$_SESSION['addresses'] = get_company_addresses(getCID());
				$_SESSION['website'] = $result['website'];
				$_SESSION['webmaster'] = $result['webmaster'];
				$_SESSION['phone'] = $result['tel'];
				$_SESSION['mobile'] = $result['mob'];
				
				ob_end_clean();

				$url = 'http://www.' . DOMAIN;

				header("Location: $url");
				
				exit();

			}
		}
	}
	if ($errors)
	{
		echo '<script type="text/javascript">launchWindow(dialog);</script><tr valign="top"><td align="left" colspan="3" style="padding-left:20px; padding-right:20px; border:2px solid #cccccc; background-color:#e4f2f9"><p align="left" class="error" style="font-size:10px">' . $errors . '</p></td></tr>';
	}
}
echo '<tr valign="top"><td><p align="right"><font size="-1">Username: </font></p></td><td align="left"><p align="left"><font size="-1"><input type="text" name="username" '; 
$haystack = strtolower($errors);
$needle = 'username';

if (isset($_POST['username']) && $_POST['username'] != '') {
	echo 'value="' . $_POST['username'] . '" ';
}
if (strpos($haystack,$needle) !== false) {
	echo 'style="border:#FF0000 solid 2px;" ';
}

echo 'size="30"/></font></p></td><td rowspan="2"><!--<img src="http://www.' . DOMAIN . '/images/sportstar.png" alt="Sport Star Logo" width="50%" />--></td></tr>
<tr valign="top"><td><p align="right"><font size="-1">Password: </font></p></td><td align="left"><p align="left"><font size="-1"><input type="password" name="password" ';
$haystack = strtolower($errors);
$needle = 'password';

if (strpos($haystack,$needle) !== false) {
	echo 'style="border:#FF0000 solid 2px;" ';
}
echo 'size="30"/><br/><a href="http://www.' . DOMAIN . '/careers/recruiters/forgot_password.php" title="Reset Password">
Forgotten Password?</a></font></p></td></tr>
<tr height="20px"><td><br/></td></tr>
<tr style="background-color:#6EA0B0"><td align="center" colspan="3"><p align="center"><font size="-1" color="#FFFFFF"><a href="http://www.' . DOMAIN . '/me/register.php" onmouseover="document.myForm.reg_but.src=\'http://www.' . DOMAIN . '/images/register_over.png\'" onmouseout="document.myForm.reg_but.src=\'http://www.' . DOMAIN . '/images/register.png\'" title="Register With Us"><img src="http://www.' . DOMAIN . '/images/register.png" alt="Register Button" name="reg_but" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="image" name="enter_but" src="http://www.' . DOMAIN . '/images/enter.png" title="Enter" alt="Enter Button" onclick="javascript:document.myForm.submit();" onmouseover="this.src=\'http://www.' . DOMAIN . '/images/enter_over.png\'" onmouseout="this.src=\'http://www.' . DOMAIN . '/images/enter.png\'" />
<input type="hidden" name="submitted" value="TRUE" /></font></p></td></tr>
</table>

</form></div>             <!-- Do not remove div#mask, because you\'ll need it to fill the whole screen -->      <div id="mask"></div> </div> 

</td></tr></table>';
exit();
}

?>

<table width="100%" style="margin:0px; padding:0px;  border-collapse:collapse; border:0" cellspacing="0" cellpadding="0" align="center" class="menu">
<tr><td colspan="2" cellspacing="0" cellpadding="0"><form name="myForm" method="post">
<table width="100%" style="padding:0px; border-collapse:collapse; border:0"><tr align="left"><td align="left"><a href="http://www.<?php echo DOMAIN; ?>/rs/addVacancy.php" title="Create New Vacancy" onmouseover="document.myForm.new_vac_but.src='http://www.<?php echo DOMAIN; ?>/media/assets/new_over.png'" onmouseout="document.myForm.new_vac_but.src='http://www.<?php echo DOMAIN; ?>/media/assets/new.png'">
<img src="http://www.<?php echo DOMAIN; ?>/media/assets/new.png" alt="New Vacancy Icon" name="new_vac_but" height="28px" /></a>
<a href="http://www.<?php echo DOMAIN; ?>/rs/index.php" title="View Applications" onmouseover="document.myForm.filter_vac_but.src='http://www.<?php echo DOMAIN; ?>/media/assets/filter_over.png'" onmouseout="document.myForm.filter_vac_but.src='http://www.<?php echo DOMAIN; ?>/media/assets/filter.png'">
<img src="http://www.<?php echo DOMAIN; ?>/media/assets/filter.png" alt="Filter Vacancies Icon" name="filter_vac_but" height="28px" /></a>
<a href="http://www.<?php echo DOMAIN; ?>/rs/mail.php" title="Your Inbox" onmouseover="document.myForm.inbox_but.src='http://www.<?php echo DOMAIN; ?>/media/assets/mail<?php if (isset($new_mail)) echo '_new'; ?>_over.png'" onmouseout="document.myForm.inbox_but.src='http://www.<?php echo DOMAIN; ?>/media/assets/mail<?php if (isset($new_mail)) echo '_new'; ?>.png'">
<img src="http://www.<?php echo DOMAIN; ?>/media/assets/mail<?php if (isset($new_mail)) echo '_new'; ?>.png" alt="Your Inbox Icon" name="inbox_but" height="28px" /></a>
<a href="http://www.<?php echo DOMAIN; ?>/rs/index.php?vid=<?php if(isset($_GET['vid'])) { echo $_GET['vid']; } else { echo 0; } ?>&view=shortlist" title="View Shortlisted Applicants" onmouseover="document.myForm.fav_but.src='http://www.<?php echo DOMAIN; ?>/media/assets/favourites_over.png'" onmouseout="document.myForm.fav_but.src='http://www.<?php echo DOMAIN; ?>/media/assets/favourites.png'">
<img src="http://www.<?php echo DOMAIN; ?>/media/assets/favourites.png" alt="View Favourites Icon" name="fav_but" height="28px" /></a>
<a href="http://www.<?php echo DOMAIN; ?>/rs/interviews.php<?php if (isset($_GET['vid'])) { echo '?vid=' . $_GET['vid']; } ?>" title="View Scheduled Interviews" onmouseover="document.myForm.ints_but.src='http://www.<?php echo DOMAIN; ?>/media/assets/interviews_over.png'" onmouseout="document.myForm.ints_but.src='http://www.<?php echo DOMAIN; ?>/media/assets/interviews.png'">
<img src="http://www.<?php echo DOMAIN; ?>/media/assets/interviews.png" alt="View Interviews Icon" name="ints_but" height="28px" /></a>
<a href="http://www.<?php echo DOMAIN; ?>/rs/viewReports.php" title="View Company Reports" onmouseover="document.myForm.reports_but.src='http://www.<?php echo DOMAIN; ?>/media/assets/reports_over.png'" onmouseout="document.myForm.reports_but.src='http://www.<?php echo DOMAIN; ?>/media/assets/reports.png'">
<img src="http://www.<?php echo DOMAIN; ?>/media/assets/reports.png" alt="Company Reports Icon" name="reports_but" height="28px" /></a>
<a href="http://www.<?php echo DOMAIN; ?>/rs/manageUsers.php" title="Manage Users" onmouseover="document.myForm.users_but.src='http://www.<?php echo DOMAIN; ?>/media/assets/users_over.png'" onmouseout="document.myForm.users_but.src='http://www.<?php echo DOMAIN; ?>/media/assets/users.png'">
<img src="http://www.<?php echo DOMAIN; ?>/media/assets/users.png" alt="User Management Icon" name="users_but" height="28px" /></a></td>
<td align="right"><a href="javascript:history.back();" onmouseover="document.myForm.back_but.src='http://www.<?php echo DOMAIN; ?>/media/assets/back_over.png'" onmouseout="document.myForm.back_but.src='http://www.<?php echo DOMAIN; ?>/media/assets/back.png'"><img name="back_but" src="http://www.<?php echo DOMAIN; ?>/media/assets/back.png" height="28px" title="Back" alt="Back Button" /></a></td></tr></table></form></td></tr>
<tr><td colspan="2" cellspacing="0" cellpadding="0">
<table style="padding:0px; border-collapse:collapse; border:0">
<tr valign="top"><td align="left">
<table class="tableone" summary="This table lists current vacancies" align="left">
      <thead>
        <tr>
          <th class="th1" scope="col">VACANCIES</th> 
          <th class="th2" scope="col">NAME</th>
		  <th class="th3" scope="col">LIVE FROM</th>
		  <th class="th4" scope="col">LIVE TO</th>
          <th class="th5" colspan="2" scope="col" align="left">APPLICATIONS</th>
        </tr>
      </thead>
<tbody>
<tr><td colspan="8">
<div class="innerb">
<table class="tabletwo" <?php if (!$vacs || count($vacs) < 5) { echo ' style="width:595px"'; } ?>>
<?php printVacs($vacs); ?>
</table>
</div>
</td></tr>
</tbody>
</table></td>
<?php
/*if (isset($appID)) {
echo '<td style="border:#ABC8D1 2px solid; background-color:#EEEEEE" width="300px">
<table cellspacing="2px" align="center">
<tr><td style="padding:8px"><img src="http://www.' . DOMAIN . '/images/star_icon.png" alt="Shortlist Applicant Icon" width="24px" /></td><td style="padding:8px"><img src="http://www.' . DOMAIN . '/images/chat_icon.png" alt="View Recruiter Comments Icon" width="24px" /></td><td style="padding:8px"><img src="http://www.' . DOMAIN . '/images/invite_icon.png" alt="Invite Applicant to Interview Icon" width="24px" /></td><td style="padding:8px"><img src="http://www.' . DOMAIN . '/images/ok_icon.png" alt="Hire Applicant Icon" width="24px" /></td><td style="padding:8px"><img src="http://www.' . DOMAIN . '/images/delete_icon.png" alt="Reject Applicant Icon" width="24px" /></td></tr>
 
<tr><td style="padding:8px"><a href="mailto:' . $appl['fname'] . ' ' . $appl['sname'] . ' <' . $appl['email'] . '>" title="Email ' . $appl['fname'] . ' ' . $appl['sname'] . '"><img src="http://www.' . DOMAIN . '/images/mail_icon.png" alt="Email Applicant Icon" width="24px" name="mail_but" /></a></td><td style="padding:8px"><img src="http://www.' . DOMAIN . '/images/edit_icon.png" alt="Edit Applicant Details Icon" width="24px" /></td><td style="padding:8px"><img src="http://www.' . DOMAIN . '/images/print_icon.png" alt="Print Application Icon" width="24px" /></td><td style="padding:8px"><img src="http://www.' . DOMAIN . '/images/update_icon.png" alt="Update Application Status Icon" width="24px" /></td><td style="padding:8px"></td></tr>
 
</table>
</td>';
}*/
	echo '<td align="left" rowspan="2">
<table class="tableseven" summary="This table lists applications for selected vacancy" align="left">
      <thead>
        <tr>
          <th class="th11" scope="col">APPLICATIONS</th>
          <th class="th16" scope="col"></th>
		  <th class="th16" scope="col"></th> 
		  <th class="th16" scope="col"></th>
        </tr>
      </thead>
<tbody>
<tr><td colspan="4">';
if (!isset($_GET['vid']) || !$apps) {
	echo '<div class="innerb">
<table class="tableeight">
<tr>
        <td class="td11" scope="row"></td>
        <td class="td16"></td>
        <td class="td16"></td>
		<td class="td16"></td>
      </tr>
      <tr>
        <td scope="row" colspan="4">&nbsp;&nbsp;';
		if (!isset($_GET['vid'])) {
			echo 'Select a vacancy to view applications.</td>';
		} else if (!$apps) {
			echo 'No applications found.</td>';
		}
      echo '</tr>
	  <tr class="dk">
        <td scope="row" colspan="4"></td>
      </tr>
</table>
</div>';
} else {
	echo '<div class="innerb">
<table class="tableeight"'; if (count($apps) > 5) { echo ' style="width:278px"'; }
echo '>';
printApps($apps);
echo '
</table>
</div>';
}
echo '</td></tr>
</tbody>
</table></td>';
?>
</tr>
</table>
</td></tr>

<?php

if (isset($appID)) {

echo '<tr><td><table>
<tr valign="top"><td align="left" rowspan="2">
<table class="tablethree" summary="This table lists applications for selected vacancy" align="left">
      <thead>
        <tr>
          <th>' . strtoupper($appl['prefix']) . ' ' .  strtoupper($appl['fname']) . ' ' . strtoupper($appl['sname']) . '</th> 
        </tr>
      </thead>
<tbody>
<tr><td colspan="4">
<div>
<table class="tablefour"><tr>
        <td scope="row" align="left">Tel </td>
        <td align="left">' . strtoupper($appl['tel']) . '</td>
        <td align="center"><a href="http://www.' . DOMAIN . '/rs/shortlist.php?id=' . $appID . '&vid=' . $_GET['vid'] . '" title="Shortlist Applicant"><img src="http://www.' . DOMAIN . '/images/star_icon.png" alt="Shortlist Applicant Icon" width="18px" /></a></td>
		<td align="center"><a href="http://www.' . DOMAIN . '/rs/index.php?vid=' . $_GET['vid'] . '&aid=' . $appID . '&addComment=Y#comment" title="Add Comment"><img src="http://www.' . DOMAIN . '/images/chat_icon.png" alt="View Recruiter Comments Icon" width="18px" /></a></td>
      </tr>
      <tr>
        <td scope="row" align="left">Mob </td>
		<td align="left">' . strtoupper($appl['mob']) . '</td>
		<td align="center"><a href="http://www.' . DOMAIN . '/rs/hire.php?id=' . $appID . '&vid=' . $_GET['vid'] . '" title="Hire Applicant"><img src="http://www.' . DOMAIN . '/images/ok_icon.png" alt="Hire Applicant Icon" width="18px" /></a></td>
		<td align="center"><a href="http://www.' . DOMAIN . '/rs/reject.php?id=' . $appID . '&vid=' . $_GET['vid'] . '" title="Reject Applicant"><img src="http://www.' . DOMAIN . '/images/delete_icon.png" alt="Reject Applicant Icon" width="18px" /></a></td>
      </tr>
	  <tr>
        <td scope="row" align="left">Email </td>
		<td align="left">' . $appl['email'] . '</td>
		<td align="center"><a href="http://www.' . DOMAIN . '/rs/invite.php?id=' . $appID . '&vid=' . $_GET['vid'] . '" title="Schedule Interview"><img src="http://www.' . DOMAIN . '/images/invite_icon.png" alt="Invite Applicant to Interview Icon" width="18px" /></a></td>
		<td align="center"><a href="mailto:' . $appl['fname'] . ' ' . $appl['sname'] . ' <' . $appl['email'] . '>" title="Email Applicant"><img src="http://www.' . DOMAIN . '/images/mail_icon.png" alt="Email Applicant Icon" width="18px" name="mail_but" /></a></td>
      </tr>
	  <tr valign="top">
        <td scope="row" align="left">Address </td>
		<td align="left">';
		if (isset($appl['a1'])) {
			echo $appl['a1'] . ', ';
		}
		if (isset($appl['a2'])) {
			echo $appl['a2'];
		}
		echo '</td>
		<td align="center" rowspan="2"><a href="http://www.' . DOMAIN . '/rs/editApp.php?id=' . $appID . '" title="Edit Applicant Details"><img src="http://www.' . DOMAIN . '/images/edit_icon.png" alt="Edit Applicant Details Icon" width="18px" /></a></td>
		<td align="center" rowspan="2"><a href="http://www.' . DOMAIN . '/rs/printApp.php?id=' . $appID . '" title="Print Application"><img src="http://www.' . DOMAIN . '/images/print_icon.png" alt="Print Application Icon" width="18px" /></a></td>		
		</tr>
		<tr>
		<td></td>
		<td align="left">' . $appl['city'] . ', ' . $appl['postcode'] . '</td>
      </tr>
</table>
</div>
</td></tr>
</tbody>
</table>

<table class="tablethree" summary="This table lists applicants comments" align="left">
      <thead>
        <tr>
          <th>APPLICANT COMMENTS</th> 
        </tr>
      </thead>
<tbody>
<tr><td colspan="4">
<div class="innerb2">
<table class="tablefour" style="width:308px;"><tr>
        <td scope="row" align="left">';
		if ($appl['cover_letter'] == '') { echo 'No comments provided.'; } else { echo $appl['cover_letter']; }
		echo '</td>
      </tr>
</table>
</div>
</td></tr>
</tbody>
</table>

<table class="tablethree" summary="This table lists applicants comments" align="left">
      <thead>
        <tr>
          <th>RECRUITER COMMENTS</th>
        </tr>
      </thead>
<tbody>
<tr><td colspan="4">
<div class="innerb2">
<table class="tablefour" style="width:308px;">';
printComments($cs);
echo '</table>
</div>
</td></tr>
</tbody>
</table>

</td><td width="700px">';

$status = strtoupper(getAppStatus($appl['status']));

$cv = $appl['cv'];
$cvPath = explode('../',$cv);
$cv = $cvPath[count($cvPath)-1];

echo '<table class="tablefive" summary="This table displays selected applicant\'s information" align="right">
      <thead>
        <tr>
          <th>' . $status . '</th>
        </tr>
      </thead>
<tbody>
<tr><td colspan="4">
<div>
<table class="tablesix">
<tr><td><iframe src="http://docs.google.com/gview?url=http://www.' . DOMAIN . '/' . $cv . '&embedded=true" style="width:560px; height:512px;" frameborder="0"></iframe></td></tr>
</table>
</div>
</td></tr>
</tbody>
</table></td></tr>';

echo '</tr>
</table></td></tr>';
}
?>

</table>

</form>

<?php

// include footer

include('../include/footer.html');

?>