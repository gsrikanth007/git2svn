<?php

/* vi: set ts=4 sw=4:

BWD water quality data viewer: EXPORT TO RDF FILE

03.8.2011; first version
14.5.2012;	update for 2011 season

*/

include('config.php');
include('functions.php');

function rdfid($key) {
    return str_replace(" ", "_", $key);
}

header('Content-type: application/rdf+xml');

$baseurl = "http://".$_SERVER['SERVER_NAME']."/".substr($_SERVER['REQUEST_URI'],1 , strrpos($_SERVER['REQUEST_URI'],"/"));

echo "<?xml version='1.0' encoding='UTF-8'?>\n";
echo "<rdf:RDF xmlns:rdf='http://www.w3.org/1999/02/22-rdf-syntax-ns#'\n";
echo " xmlns:geo='http://www.w3.org/2003/01/geo/wgs84_pos#'\n";
echo " xmlns='http://bwd.eea.europa.eu/schema.rdf#'\n";
echo "xml:base='".$baseurl."'\n";
echo ">\n";


// connect to database
$db = mysql_connect($host, $dbuser,$dbpass);
mysql_select_db($database,$db);
// 5.5.2008; utf8: this must be included for utf-8 charset
mysql_query("SET NAMES UTF8");

// array with fields to show
$array_fields = array(
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
  'y2011' => 'Year 2011'
);

$lastknownyear = 'y2011';

$sql = "
  SELECT 
	UPPER(c.Country) AS Country, s.cc,
	s.numind, s.latitude, s.longitude, s.WaterType AS Type, s.Region, s.Province, s.Commune, s.Prelev,
        s.y2000, s.y2001, s.y2002, s.y2003, s.y2004, s.y2005, s.y2006, s.y2007, s.y2008, s.y2009, s.y2010, s.y2011
  FROM bwd_stations s
  LEFT JOIN countrycodes_iso c ON s.cc = c.ISO2 ";
$sql .= " ORDER BY Prelev";



$result = mysql_query($sql) or die($sql."<br/>".mysql_error());

  // BWD places
while ($row = @mysql_fetch_assoc($result)) {
  echo "<BathingWater rdf:about='waters/".rdfid($row['numind'])."'>\n";
  echo "<id>".htmlspecialchars($row['numind'])."</id>\n";
  echo "<name>".htmlspecialchars($row['Prelev'])."</name>\n";
  echo "<inCountry rdf:resource=\"http://rdfdata.eionet.europa.eu/eea/countries/".$row['cc']."\"/>\n";
  echo "<country>".htmlspecialchars($row['Country'])."</country>\n";
  echo "<region>".htmlspecialchars($row['Region'])."</region>\n";
  echo "<province>".htmlspecialchars($row['Province'])."</province>\n";
  echo "<commune>".htmlspecialchars($row['Commune'])."</commune>\n";
  echo "<type>".TypeAsText($row['Type'])."</type>\n";
  echo "<geo:lat>".$row['latitude']."</geo:lat>\n";
  echo "<geo:long>".$row['longitude']."</geo:long>\n";

  foreach($array_fields as $key=>$val) {
    echo "<measurement>\n";
    echo "<Measurement rdf:about='measurements/".rdfid($row['numind']).$key."'>\n";
    // user-friendly output of BW status for each year
    // 1=compliant to guide values, 2=prohibited throughout the season, 3=insufficiently sampled, 
    // 4=not compliant, 5=compliant to mandatory values, 6=not sampled
    echo "<year>".substr($key,1)."</year>";
    echo "<status>".complianceText($row[$key])."</status>\n";
    echo "</Measurement>\n";
    echo "</measurement>\n";
  }
  echo "</BathingWater>\n";

} // END BWD places 
  
echo "</rdf:RDF>\n";
?>
