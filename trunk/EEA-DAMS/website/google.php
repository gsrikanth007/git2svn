<?php
/**
 * Initialize the Google maps viewport and set up the environment.
 *
 * @param float $x Center position - latitude
 * @param float $y Center position - longitude
 * @param integer $z Zoom level
 * @param string $mapClickListener JavaScript function called when user clicks the map
 * @return string JS script. Please note that the script starts with <script type ... but does not append end script tag!. Do that explicitly calling endGoogleViewport()
 */
function startGoogleViewport ( $x = 4, $y = 55, $z = 3, 
    $mapClickListener = null, $showNearbyDams = false, 
    $exclude0x = "0", $exclude0y = "0",
    $exclude1x = "0", $exclude1y = "0" )
{
  $handlerStr = "";
  if( $mapClickListener != null )
  {
    $handlerStr = "GEvent.addListener(map, 'click', $mapClickListener )";
  }
  
  $ret = '
  <script type="text/javascript">

  /* Image2000 tile */
  // Handle copyright
  var i2k_cc = new GCopyrightCollection("I2K data");
  var i2k_cb = new GLatLngBounds( new GLatLng( 33.87, -14.41 ), new GLatLng( 72.23, 55.89 ) );  
  i2k_cc.addCopyright(new GCopyright( 1, i2k_cb, 5, "&copy; JRC" ));
  
  
  // var i2k_layer = new GTileLayer( i2k_cc, 1, 17 );
  var i2k_layer = new GTileLayer( null, 10, 10 );
  i2k_layer.myLayers="0";
  i2k_layer.myFormat="image/png";
  i2k_layer.myBaseURL="http://ags-sdi-public.jrc.ec.europa.eu/arcgis/services/image2000_pan/Mapserver/WMSServer?";
  i2k_layer.getTileUrl=CustomGetTileUrl;
  i2k_layer.getOpacity = function() {return 1;}
  var i2k_overlay = new GTileLayerOverlay( i2k_layer );
  i2k_layer.getCopyright = function(a, b) {
    // console.log(a);
    var ret = null;
    if(!i2k_overlay.isHidden()) {
      ret =  i2k_cc.getCopyrightNotice(a, b);
    }
    return ret;
  }

  /* EEA WMS */
  // Handle copyright
  var eea_cc = new GCopyrightCollection("EEA data");
  var eea_cb = new GLatLngBounds( new GLatLng( 33.87, -14.41 ), new GLatLng( 72.23, 55.89 ) );  
  eea_cc.addCopyright(new GCopyright( 2, eea_cc, 12, "ERM v2, (c) Eurogeographics" ));

  var eea_layer = new GTileLayer( eea_cc, 1, 17 );
  eea_layer.myLayers="ERM2Water";
  eea_layer.myFormat="image/png";
  eea_layer.myBaseURL="http://dampos-demo.eionet.europa.eu/cgi-bin/wseea?";
  eea_layer.getTileUrl=CustomGetTileUrl;
  eea_layer.getOpacity = function() {return 1;}
  var eea_overlay = new GTileLayerOverlay( eea_layer );
  eea_layer.getCopyright = function(a, b) {
    // console.log(a);
    var ret = null;
    if(!eea_overlay.isHidden()) {
      ret =  eea_cc.getCopyrightNotice(a, b);
    }
    return ret;
  }

  //var map = new GMap2( document.getElementById( "map" ), { mapTypes:[ G_SATELLITE_MAP, custommap ] } );
  var map = new GMap2( document.getElementById( "map" ) );
  map.setCenter( new GLatLng( '.$y.','.$x.'), '.$z.');

  var i2kButton = new LayerSelectControl( "I2K", onI2KClick, new GSize( 60, 5 ) );
  var eeaButton = new LayerSelectControl( "Water", onEEAClick, new GSize( 115, 5 ) );

  var hybButton = new LayerSelectControl( "Hyb", onHybClick, new GSize( 190, 5 ) );
  var satButton = new LayerSelectControl( "Sat", onSatClick, new GSize( 245, 5 ) );
  var normalButton = new LayerSelectControl( "Normal", onNormalClick, new GSize( 300, 5 ) );
  
  
  map.addControl( i2kButton );
  map.addControl( eeaButton );
  map.addControl( hybButton );
  map.addControl( satButton );
  map.addControl( normalButton );
  map.addControl( new GLargeMapControl() );
  map.addOverlay( i2k_overlay );
  map.addOverlay( eea_overlay );
  map.setMapType( G_SATELLITE_MAP );
  
  '.$handlerStr.'
    
  GEvent.addListener( map, "zoomend", function() { onZoomEnd(); } );
  GEvent.addListener( map, "moveend", function() { onMoveEnd(); } );
  //GEvent.addListener( map, "load", function() { onLoad(); } );
  
  // Initially hide additional overlays
  i2k_overlay.hide();
  eea_overlay.hide();

  var mt = map.getMapTypes();
  for (var i=0; i<mt.length; i++) {
    mt[i].getMinimumResolution = function() {return 3;}
  }


  function onI2KClick() {
  	i2kButton.press();
  	var eea_was_hidden = eea_overlay.isHidden();
  	if(i2k_overlay.isHidden())
  	{
  	  i2k_overlay.show();
      // Force a refresh of the map to reload the copyright string
      map.setCenter( map.getCenter() );
      i2k_overlay.show();
      if( eea_was_hidden ) eea_overlay.hide();
  	  return;
  	}
    // Force a refresh of the map to reload the copyright string
    i2k_overlay.hide();
    map.setCenter( map.getCenter() );
    if( eea_was_hidden ) eea_overlay.hide();
    i2k_overlay.hide();
  }
  
  function onEEAClick() {
  	eeaButton.press();
  	var i2k_was_hidden = i2k_overlay.isHidden();
  	if(eea_overlay.isHidden())
  	{
  	  eea_overlay.show();
      // Force a refresh of the map to reload the copyright string
      map.setCenter( map.getCenter() );
      eea_overlay.show();
      if( i2k_was_hidden ) i2k_overlay.hide();
  	  return;
  	}
    // Force a refresh of the map to reload the copyright string
    eea_overlay.hide();
    map.setCenter( map.getCenter() );
    if( i2k_was_hidden ) i2k_overlay.hide();
    eea_overlay.hide();
}

  function onHybClick() {
    if( !hybButton.isPress() )
    {
  	  hybButton.press();
  	  if( satButton.isPress() ) satButton.press();
  	  if( normalButton.isPress() ) normalButton.press();
  	  map.setMapType(G_HYBRID_MAP);
  	  restoreOverlays();
  	}
  }
  
  function onSatClick() {
    if( !satButton.isPress() )
    {
  	  if( hybButton.isPress() ) hybButton.press();
  	  satButton.press();
  	  if( normalButton.isPress() ) normalButton.press();
  	  map.setMapType(G_SATELLITE_MAP);
  	  restoreOverlays();
  	}
  }
  
  function onNormalClick() {
    if( !normalButton.isPress() )
    {
  	  if( hybButton.isPress() ) hybButton.press();
  	  if( satButton.isPress() ) satButton.press();
  	  normalButton.press();
  	  map.setMapType(G_NORMAL_MAP);
  	  restoreOverlays();
  	}
  }

  function onZoomEnd() {
  	restoreOverlays();
  }
  
  var nearbyicon = "'.NEARBYICON.'";
  
  function onLoad() {
  ';
  if( $showNearbyDams ) {
    $ret .= '  
    startRequestNearbyDams();';
  }
  $ret .= '
  }
  
  function onMoveEnd() {
  ';
  
  if( $showNearbyDams ) {
    $ret .= '  
  	startRequestNearbyDams();';
  }
  
  $ret.= '
  }
  //When changing map type (onSatClick/onHybClick), preserve overlay state of visibility 
  function restoreOverlays()
  {
  	if(i2k_overlay.isHidden()) i2k_overlay.hide(); 
  	if(eea_overlay.isHidden()) eea_overlay.hide();
  }
  
  satButton.press();
  
  var exclude0x = '.$exclude0x.';
  var exclude0y = '.$exclude0y.';
  var exclude1x = '.$exclude1x.';
  var exclude1y = '.$exclude1y.';
';
  if( $showNearbyDams ) {
    $ret .= '  
    startRequestNearbyDams();';
  }
  return $ret;
}

/**
 * Create a marker on google viewport.
 *
 * @param double $x Center position - x
 * @param double $y Center position - y
 * @param integer $id Marker id (unique within page)
 * @param string $name Marker (appears as tooltip on marker)
 * @param string $iconurl Marker icon
 * @return string Returs JS code which creates the marker
 */
function googleMarkerMain ( $x, $y, $id, $name = "", $iconurl = ICOLDICON ) {
  return "var point$id = new GPoint($x, $y); var marker$id = createMarkerMain(point$id, \"$id\", \"$iconurl\", \"$name\"); map.addOverlay(marker$id);";
}

function createCrossMarker( $markerID, $title, $x, $y, $icon, $markerType ) {
  return "var point$markerID = new GPoint($x, $y); var marker$markerID = createCrossMarker(point$markerID, \"$title\", \"$icon\", $markerType); map.addOverlay(marker$markerID);";
}

/**
 * Ends the script created by startGoogleViewport. 
 * @return string
 */
function endGoogleViewport () {
  return '</script>';
}

?>

