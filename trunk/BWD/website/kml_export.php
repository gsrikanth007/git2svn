<?php

/* vi: set ts=4 sw=4:

BWD water quality data/map viewer: EXPORT TO KML FILE

21.3.2008; first version
29.5.2008; changed from array to echo because of PHP memory limit error
17.5.2011;	update for 2010 season
14.5.2012;	update for 2011 season
17.5.2013;	update for 2012 season
20.5.2014;	update for 2013 season
13.5.2015;	update for 2014 season

*/

include('config.php');
include('functions.php');

if (!isset($_GET['GeoRegion'])) $_GET['GeoRegion'] = '';
if (!isset($_GET['cc'])) $_GET['cc'] = '';
if (!isset($_GET['Region'])) $_GET['Region'] = '';
if (!isset($_GET['Province'])) $_GET['Province'] = '';
if (!isset($_GET['BathingPlace'])) $_GET['BathingPlace'] = '';

if($_GET['cc'] != '')   {

// connect to database
$db = mysql_connect($host, $dbuser,$dbpass);
mysql_select_db($database,$db);
// 5.5.2008; utf8: this must be included for utf-8 charset
mysql_query("SET NAMES 'utf8'");

// array with fields to show in kml
$array_fields = array(
  'numind' => 'Id',
  'Latitude' => 'Latitude',
  'Longitude'=> 'Longitude',
  'Country' => 'Country',
  'Region' => 'Region',
  'Province' => 'Province',
  'Commune' => 'Commune',
  'Prelev' => 'Bathing water',
  'Type' => 'Type',
  'y2000' => 'Year 2000',
  'y2001' => 'Year 2001',
  'y2002' => 'Year 2002',
  'y2003' => 'Year 2003',
  'y2004' => 'Year 2004',
  'y2005' => 'Year 2005',
  'y2006' => 'Year 2006',
  'y2007' => 'Year 2007',
  'y2008' => 'Year 2008',
  'y2009' => 'Year 2009',
  'y2010' => 'Year 2010',
  'y2011' => 'Year 2011',
  'y2012' => 'Year 2012',
  'y2013' => 'Year 2013',
  'y2014' => 'Year 2014');

$lastknownyear = 'y2014';

$sql = "
  SELECT 
	UPPER(c.Country) AS Country,
	s.numind, s.Latitude, s.Longitude, s.WaterType AS Type, s.Region, s.Province, s.Commune, s.Prelev, 
	#s.y1990, s.y1991, s.y1992, s.y1993, s.y1994, s.y1995, s.y1996, s.y1997, s.y1998, s.y1999, 
	s.y2000, s.y2001, s.y2002, s.y2003, s.y2004, s.y2005, s.y2006, s.y2007, s.y2008, s.y2009, 
	s.y2010, s.y2011, s.y2012, s.y2013, s.y2014
  FROM bwd_stations s
  LEFT JOIN countrycodes_iso c ON s.cc = c.ISO2 ";

// Filter out empty coordinates. In Europe latitude can not legally be zero, but longitude can
$sql .= " WHERE latitude != 0";
if($_GET['cc'] != 'EU27')			$sql .= " AND cc = '".$_GET['cc']."' ";

if($_GET['GeoRegion'] != '')		$sql .= " AND geographic = '".$_GET['GeoRegion']."'";

if($_GET['Region'] != '')			$sql .= " AND Region LIKE '".changeChars($_GET['Region'],"%")."'";
if($_GET['Province'] != '')			$sql .= " AND Province LIKE '".changeChars($_GET['Province'],"%")."'";
if($_GET['BathingPlace'] != '')		$sql .= " AND numind = '".$_GET['BathingPlace']."'";
$sql .= " ORDER BY Prelev";


$result = mysql_query($sql) or die($sql."<br>".mysql_error());

// piece of code copied from iz: http://code.google.com/support/bin/answer.py?answer=69906&topic=11364#outputkml
// 29.5.2008; changed on 29.5.2008 - usage of echo instead of array (remark by Søren Roug)

// generates kml file name
if($_GET['cc'] != '')             $string_filename  = $_GET['cc'];
if($_GET['GeoRegion'] != '')		$string_filename .= "-".substr($_GET['GeoRegion'],29);
if($_GET['Region'] != '')         $string_filename .= "-".$_GET['Region'];
if($_GET['Province'] != '')       $string_filename .= "-".$_GET['Province'];
if($_GET['BathingPlace'] != '')   $string_filename .= "-".$_GET['BathingPlace'];

header('Content-type: application/vnd.google-earth.kml+xml');
header("Content-disposition: attachment; filename=".changeChars(replaceUTFChars($string_filename),"_")."_bplaces.kml");
  
$baseurl = "http://".$_SERVER['SERVER_NAME']."/".substr($_SERVER['REQUEST_URI'],1 , strrpos($_SERVER['REQUEST_URI'],"/"));

// BEGIN **************
  // Creates an array of strings to hold the lines of the KML file.
  echo "<?xml version='1.0' encoding='UTF-8'?>\n";
  echo "<kml xmlns='http://earth.google.com/kml/2.1'>\n";
  echo "<Document>\n";
  
  // style definition - how icons look like: <styleUrl>#bw_places</styleUrl>
  
  // BWD places icon - swimmer
  echo " <Style id='bw_places'>\n";
  echo " <IconStyle>\n";
  echo " <scale>1.1</scale>\n";
  echo " <Icon>\n";
  echo " <href>".$baseurl."images/swimming.png</href>\n";
  echo " </Icon>\n";
  echo " </IconStyle>\n";
  echo " </Style>\n";

  // BWD places
  while ($row = @mysql_fetch_assoc($result)) {
    echo "<Placemark id='p_".$row['numind']."'>\n";
    echo "<name>".$row['Prelev']."</name>\n";
    echo "<styleUrl>#bw_places</styleUrl>\n";
    echo "<Snippet>\n";
    echo $array_fields['Type'].": ".TypeAsText($row['Type'])."\n";
    echo $array_fields[$lastknownyear].": ".complianceText($row[$lastknownyear])."\n";
    echo "</Snippet>\n";
    echo "<description>\n";
    echo "<![CDATA[<table style='border: 1px black solid;' cellpadding='2' cellspacing='1'>\n";

	foreach($array_fields as $key=>$val) {
      echo "<tr>\n";
      //echo "<th bgcolor='#8BD1FF' width='120'>";
      //echo "<th bgcolor='#B9E8F7' width='120'>";
      echo "<th bgcolor='#C0C0C0' width='120'>";
      echo htmlentities($val); 
      echo "</th>\n";
      
      //echo "<td bgcolor='#F7F7F7' width='300'>\n";
      
      // 14.4.2008; user-friendly output of attribute WaterType instead of 1,2,3 output text:
      if($key == "Type") {
        echo "<td bgcolor='#F7F7F7' width='300'>".TypeAsText($row[$key])."</td>\n";
      } 
      // 14.4.2008; user-friendly output of BW status for each year
      // 1=compliant to guide values, 2=prohibited throughout the season, 3=insufficiently sampled, 
      // 4=not compliant, 5=compliant to mandatory values, 6=not sampled
      elseif(substr($key,0,1) == "y")  {
        echo "<td bgcolor='".complianceColor($row[$key])."' width='300'>".complianceText($row[$key])."</td>\n";
      }
      else {
        echo "<td bgcolor='#F7F7F7' width='300'>".$row[$key]."</td>\n";
      }
      echo "</tr>\n";
    }
    echo "</table>]]>\n";
    echo "</description>\n";
    echo "<Point>\n";
    echo "<coordinates>".$row['Longitude'].",".$row['Latitude']."</coordinates>\n";
    echo "</Point>\n";
    echo "</Placemark>\n";

  } // END BWD places 
  
  // Footer XML file
  echo "</Document>\n";
  echo "</kml>\n";
  
  
// END **************
exit;

} // END if EXPORT

?>
