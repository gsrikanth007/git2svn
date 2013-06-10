<?php
	header('Content-Type: text/html; charset=utf-8');
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <title>Region / province map</title>
  <link href="../template.css" rel="stylesheet" type="text/css" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

</head>
<body>

<?php

include('../config.php');
include('../functions.php');

// CONNECT
$mysqli = new mysqli($host, $dbuser, $dbpass, $database);
/* check connection */
if ($mysqli->connect_errno) {
    printf("Connect failed: %s\n", $mysqli->connect_error);
    exit();
}

$mysqli->query("SET NAMES 'utf8'");

/*
echo "<pre>";
print_r($_GET);
echo "</pre>";
*/

if(!isset($_GET['type']) OR $_GET['type'] == '' OR !isset($_GET['cc']) OR $_GET['cc'] == '')	{
	echo "Country and Region/Province should be selected";
	die;
}

$sql = "
	SELECT * 
	FROM bwd_div_coordinates
	WHERE cc = '".addslashes($_GET['cc'])."'
";
$result = $mysqli->query($sql) or die(error_output(__LINE__, $mysqli->error, $sql));

echo "<div style='position:absolute;border:solid 1px'>";
echo "<img src='".strtolower($_GET['cc'])."_".strtolower($_GET['type'])."s.png'>";

while ($myrow = $result->fetch_array()) {

	$string_uri = "cc=".addslashes(strtoupper($_GET['cc']));
	if(isset($_GET['GeoRegion']) AND $_GET['GeoRegion'] != '')	$string_uri .= "&GeoRegion=".addslashes($_GET['GeoRegion']);
	if(isset($_GET['Region']) AND $_GET['Region'] != '')		$string_uri .= "&Region=".addslashes($_GET['Region']);
	if($_GET['cc'] == 'eu')		$string_uri .= "&GeoRegion=".convertUTFtoHTML($myrow[$_GET['type']]);
	else						$string_uri .= "&".$_GET['type']."=".convertUTFtoHTML($myrow[$_GET['type']]);
	
	echo "<div title='".$myrow[$_GET['type']]."' style='position:absolute;left:".$myrow['left']."px;top:".$myrow['top']."px'>";
		// only show link if there are some bathing places in this region/province
		if($myrow['bathing_places'] > 0)	{
			echo "<a style='color: black; ' href='' 
				onclick='
					parent.document.getElementById(\"map_div\").style.display = \"none\"; 
					parent.location = \"../index.php?".$string_uri."\"
				'
				title='".$myrow[$_GET['type']]."'
				>";
		}
			echo $myrow[$_GET['type']];
		if($myrow['bathing_places'] > 0) {
			echo "</a>";
		}
	echo "</div>";

}

echo "</div>";

?>

</body>
</html>