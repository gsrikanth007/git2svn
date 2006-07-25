<?php
header('Content-Disposition: attachment; filename="damposlink.kml"');
header('Content-type: application/vnd.google-earth.kml+xml');
echo '<?xml version="1.0" encoding="UTF-8"?>'
?>
<kml xmlns="http://earth.google.com/kml/2.0">
  <Document>
    <name>European Dams</name>
    <description><![CDATA[Dams recorded in the EEA database.
Shows the 20 largest in view at any time.]]></description>
    <visibility>1</visibility>
    <open>1</open>
    <LookAt>
      <longitude>15.89188611937717</longitude>
      <latitude>53.37819505548502</latitude>
      <altitude>0</altitude>
      <range>3656450</range>
      <tilt>0</tilt>
      <heading>0.0</heading>
    </LookAt>
    <NetworkLink>
      <name>Validated dams</name>
      <description><![CDATA[Reading from DAMPOS service]]></description>
      <Url>
        <href>http://dampos.eea.europa.eu/showkml.php?coordinates=val</href>
        <viewRefreshMode>onStop</viewRefreshMode>
        <viewRefreshTime>3</viewRefreshTime>
      </Url>
    </NetworkLink>
    <NetworkLink>
      <name>Proposed dams</name>
      <description><![CDATA[Reading from DAMPOS service]]></description>
      <Url>
        <href>http://dampos.eea.europa.eu/showkml.php?coordinates=prop</href>
        <viewRefreshMode>onStop</viewRefreshMode>
        <viewRefreshTime>3</viewRefreshTime>
      </Url>
    </NetworkLink>
    <NetworkLink>
      <name>iCold dams</name>
      <description><![CDATA[ICOLD: International commission on large dams<br>http://www.icold-cigb.org]]></description>
      <Url>
        <href>http://dampos.eea.europa.eu/showkml.php?coordinates=icold</href>
        <viewRefreshMode>onStop</viewRefreshMode>
        <viewRefreshTime>3</viewRefreshTime>
      </Url>
    </NetworkLink>
  </Document>
</kml>
