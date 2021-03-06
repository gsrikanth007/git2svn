<?php

/* 

BWD water quality data/map viewer: FILE TO CREATE IMAGE WITH BAR GRAPH

21.3.2008; first version
17.5.2011;	update for 2010 season
14.5.2012;	update for 2011 season
17.5.2013;	update for 2012 season
20.5.2014;	update for 2013 season
13.5.2015;	update for 2014 season

*/

// array of years for which graph is plotted | each season, additional year should be added
$years = array(2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014);


if (!isset($_GET['GeoRegion'])) $_GET['GeoRegion'] = '';
if (!isset($_GET['type'])) $_GET['type'] = '';
if (!isset($_GET['Country'])) $_GET['Country'] = '';
if (!isset($_GET['Region'])) $_GET['Region'] = '';
if (!isset($_GET['Province'])) $_GET['Province'] = '';
if (!isset($_GET['BathingPlace'])) $_GET['BathingPlace'] = '';
include('config.php');
include('functions.php');
// 17.5.2013; on EEA server, PHP version 5.2.13, only jpgraph-2.3 version is working
include ("jpgraph-2.3/src/jpgraph.php"); include ("jpgraph-2.3/src/jpgraph_bar.php");
//include ("jpgraph-3.5.0b1/src/jpgraph.php"); include ("jpgraph-3.5.0b1/src/jpgraph_bar.php");

// CONNECT
$db = mysql_connect($host, $dbuser,$dbpass);
mysql_select_db($database,$db);
mysql_query("SET NAMES 'utf8'");

header('Content-Type: text/html; charset=utf-8');

// ONLY SHOW THESE STATUSES IN GRAPH
// 1=compliant to guide values = BLUE, 
// 2=prohibited throughout the season = GRAY, 
// 4=not compliant = RED, 
// 5=compliant to mandatory values = GREEN
// 0,3,6 = not sampled / insufficiently sampled = ORANGE

// 3.6.2010; mkovacic: added new category for Greek NF data - white
// NFC = incompletely sampled
//if($_GET['cc'] == 'GR')		$compliance_values = array('CG','B','NC','CI','NS','NF','NFC');
//else						$compliance_values = array('CG','B','NC','CI','NS','NF');

// 16.5.2015; mkovacic; there are only 4 categories now
$compliance_values = array(
    'CG',
    'CI',
    'NC',
    "B','NS','NF','NFC"
);

foreach($compliance_values as $key=>$val) {
  $sql = "
    SELECT
  ";
  foreach($years as $ykey=>$year) {
	$sql .= " (COUNT(IF(y".$year." IN ( '".$val."' ), 1, NULL))/COUNT(IF(y".$year." IS NOT NULL, 1, NULL)) )*100 AS '".$year."',\n";
  }
  $sql .= "
      COUNT(*) AS No_of_stations,													# only needed to display in title total or max. number of stations for all years
      COUNT(IF(y".end($years)." IS NOT NULL, 1, NULL)) AS No_of_stations_curr_year,		# only needed to display in title: number of stations 2010
      Prelev,
      SeaWater,
	  etcw_bw_profile
    FROM bwd_stations 
	WHERE 1 ";
  
  if($_GET['GeoRegion'] != '')		$sql .= " AND geographic = '".$_GET['GeoRegion']."'";

  // CONDITION
  if($_GET['type'] == 'coast')  $sql .= " AND SeaWater = 'O'"; 
  if($_GET['type'] == 'inland')  $sql .= " AND SeaWater = 'N'"; 
  if($_GET['Region'] != "")   $sql .= ' AND Region LIKE "'.$_GET['Region'].'"';
  if($_GET['Province'] != "") $sql .= ' AND Province LIKE "'.$_GET['Province'].'"';
  if($_GET['BathingPlace'] != "") $sql .= ' AND Numind = "'.$_GET['BathingPlace'].'"';
  
  // GROUP BY
  if($_GET['BathingPlace'] != "")   $sql .= " GROUP BY Numind";
  elseif($_GET['Province'] != "")   $sql .= " GROUP BY Province";
  elseif($_GET['Region'] != "")     $sql .= " GROUP BY Region";

  $result = mysql_query($sql) or die($sql."<br>".mysql_error());
  $myrow = mysql_fetch_array($result);


  foreach($years as $key1=>$val1) {
    // to shift 0 values a little above the bottom; disabled
    //$data[$val][] = ($myrow[$val1] < 1)?0.2:$myrow[$val1];
    $data[$val][] = $myrow[$val1];
  }
} // foreach


// 20.5.2008; adds together "ORANGE" values: 3+6 (not sampled + insufficiently sampled)
/*
foreach($data['ns'] as $key=>$val) 	{
	$data['ns'][$key] += $data['nf'][$key];
	//$data['ns'][$key] += $data[''][$key];
}
*/


//echo "<pre>";
//print_r($data);
//echo "</pre>";
//die;


// **********************
// Create the basic graph
// **********************
// STATUS GRAPH IF BATHING WATER IS SELECTED 
if($_GET['BathingPlace'] != "")  {
    // coastal or inland in title
    if($_GET['type'] == 'coast' || $myrow['SeaWater'] == 'O')  
		$title = "Coastal: ".$myrow['Prelev'];
    if($_GET['type'] == 'inland' || $myrow['SeaWater'] == 'N')  
		$title = "Inland: ".$myrow['Prelev'];
    
    // status graph for bw is smaller
    $graph_width = 500; 
    $graph_height = 220; 
    $margin_left = 20; 
    $margin_top = 130; 
    $ycolor = 'white'; // text on y axis is the same as background, thus hidden
    $procent = "";  // not to show % sign in: "% compliant with ..." -> "compliant with ..."

	// bar width
	$width_bar = 1;
	
	// legend box position
	$legendX = 0.05;
	$legendY = 0.15;

} 
// DEFAULT GRAPH FOR PROVINCE
else {
    // default title
    //$title = $_GET['Country'];
	 //if($_GET['GeoRegion'] != "") $title .= " (".substr($_GET['GeoRegion'],29).")";
    // 11.05.2009; mkovacic; name in bar graph starts with region
	if($_GET['Region'] != "") $title = $_GET['Region'];
    if($_GET['Province'] != "") $title .= ", ".$_GET['Province'];
    $title .= ": ".$myrow['No_of_stations_curr_year']." ";
    if($_GET['type'] == 'coast')  $title .= "coastal BW";
    if($_GET['type'] == 'inland')  $title .= "inland BW";
	$title .= " in ".end($years);

    // default graph dimensions
    $graph_width = 600; 
    $graph_height = 450; 
    $margin_left = 50; 
    $margin_top = 30; 
    $ycolor = 'black';
    $procent = "% ";

	// default bar width
	$width_bar = 0.6;

	// legend box position
	$legendX = 0.1;
	$legendY = 0.1;
}

$graph = new Graph($graph_width,$graph_height,"auto");
$graph->SetScale("textlin",0,100);
$graph->img->SetMargin($margin_left,20,$margin_top,40);

// if STATUS GRAPH for selected BW: white margin
if($_GET['BathingPlace'] != "") $graph->SetMarginColor('white');


//$graph ->SetShadow();

// TITLE
$graph->title->Set(replaceUTFChars($title));

// AXIS TITLES AND FONTS
$graph->xaxis->SetTickLabels($years);

if($_GET['BathingPlace'] == "") $graph->xaxis->title->Set('Year');
$graph->xaxis->title->SetColor('black');
$graph->xaxis->SetColor('black');

if($_GET['BathingPlace'] == "") $graph->yaxis->title->Set('% of bathing waters');
$graph->yaxis->title->SetColor($ycolor);
$graph->yaxis->SetColor($ycolor);

$graph->yaxis->scale->SetGrace(10);  // on Y axis is some more room, top and bottom 

// posebnosti, če je graf za pos. b.p.
if($_GET['BathingPlace'] != "") {
  $graph->ygrid->Show(false,false);  // 1st parameter to show/hide major gridline, 2nd parameter to show/hide minor gridline
  $graph->yscale->ticks->Set(100 ,100);
}

// POSITION OF THE LEGEND BOX
$graph->legend->Pos($legendX,$legendY,"left","top");
$graph->legend->SetShadow('darkgray@0.5');
$graph->legend->SetFillColor('lightgray@0.3');

// 1st (from top) BAR - 1=compliance with guide values = BLUE
$b4plot = new BarPlot($data['CG']);
$b4plot->SetFillColor('lightblue');
$b4plot->SetLegend($procent.complianceText('CG'));

// 2nd BAR - 5=compliance with mandatory values = GREEN
$b3plot = new BarPlot($data['CI']);
$b3plot->SetFillColor('lightgreen');
$b3plot->SetLegend($procent.complianceText('CI'));

// 3rd BAR - 4=not compliant with mandatory values = RED
$b2plot = new BarPlot($data['NC']);
$b2plot->SetFillColor('#FF7F7F');
$b2plot->SetLegend($procent.complianceText('NC'));

// 4th BAR - 2=closed or banned /* before "prohibited throughout the season" */ = GRAY
//$b1plot = new BarPlot($data['B']);
$b1plot = new BarPlot($data["B','NS','NF','NFC"]);
$b1plot->SetFillColor('lightgray');
$b1plot->SetLegend($procent.complianceText('B'));

// 5th BAR - not sampled = YELLOW
//$b0plot = new BarPlot($data['NS']);
//$b0plot->SetFillColor(complianceColor('NS'));
//$b0plot->SetLegend($procent.complianceText('NS'));

// 6th BAR - insufficiently sampled = ORANGE
//$b5plot = new BarPlot($data['NF']);
//$b5plot->SetFillColor(complianceColor('NF'));
//$b5plot->SetLegend($procent.complianceText('NF'));

// 3.6.2010; mkovacic: added new category for Greek NF data - white
// 7th BAR - incompletely sampled = WHITE
//if($_GET['cc'] == 'GR')  {
//	$b6plot = new BarPlot($data['NFC']);
//	$b6plot->SetFillColor(complianceColor('NFC'));
//	$b6plot->SetLegend($procent.complianceText('NFC'));
//}

// CREATE THE GROUPED BAR PLOT
//if($_GET['cc'] == 'GR')		$gbplot = new AccBarPlot(array($b6plot,$b0plot,$b5plot,$b1plot,$b2plot,$b3plot,$b4plot));
//else						$gbplot = new AccBarPlot(array($b0plot,$b5plot,$b1plot,$b2plot,$b3plot,$b4plot));

$gbplot = new AccBarPlot(array($b1plot,$b2plot,$b3plot,$b4plot));

$gbplot->SetWidth($width_bar);
$graph->Add($gbplot);

$graph->Stroke();

// vi: set ts=4 sw=4:
?>
