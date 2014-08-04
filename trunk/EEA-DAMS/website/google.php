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
      $handlerStr = "google.maps.event.addListener(map, 'click', $mapClickListener )";
    }
  
  $ret = '
  <script type="text/javascript">
    function updateCopyrights() {
      var copyrightNode = document.getElementById("copyright-control");
      if (copyrightNode) {
        copyrightNode.style.fontSize = "14px";
        copyrightNode.style.fontFamily = "Arial, sans-serif";
        copyrightNode.style.backgroundColor = "white";
        var notice = "", sep="", copy1, copy2;

        if (!isOverlayHidden(0)) {
          copy1 = " &copy; JRC ";
          sep = "|";
        } else {
          copy1 = "";
        }

        if (!isOverlayHidden(1)) {
          copy2 = " ERM v2, (c) Eurogeographics ";
        } else {
          copy2 = "";
          sep = "";
        }

        notice = copy1 + sep + copy2;
        copyrightNode.innerHTML = notice;
      }
    }

    var i2k_layer_options = {
      myLayers: "0",
      myFormat: "image/png",
      isPng: false,
      myBaseURL: "http://ags-sdi-public.jrc.ec.europa.eu/arcgis/services/image2000_pan/Mapserver/WMSServer?",
      getTileUrl: CustomGetTileUrl,
      tileSize: new google.maps.Size(256, 256),
      getOpacity: function() {return 1;}
    };
    var i2k_layer = new google.maps.ImageMapType(i2k_layer_options);

    var eea_layer_options = {
      myLayers: "ERM2Water",
      myFormat: "image/png",
      isPng: false,
      myBaseURL: "http://dampos-demo.eionet.europa.eu/cgi-bin/wseea?",
      getTileUrl: CustomGetTileUrl,
      tileSize: new google.maps.Size(256, 256),
      getOpacity: function() {return 1;}
    };
    var eea_layer = new google.maps.ImageMapType(eea_layer_options);

    var mapCenter = new google.maps.LatLng( '.$y.','.$x.');
    var mapOptions = {
      zoom: '.$z.',
      center: mapCenter,
      mapTypeControl: false,
      overviewMapControl: true
    };
    var map = new google.maps.Map( document.getElementById( "map" ), mapOptions );

    var markers = [];

    var i2kButton = new LayerSelectControl( "I2K", onI2KClick, new google.maps.Size( 60, 5 ) );
    i2kButton.initialize(map);
    var eeaButton = new LayerSelectControl( "Water", onEEAClick, new google.maps.Size( 115, 5 ) );
    eeaButton.initialize(map);
    var hybButton = new LayerSelectControl( "Hyb", onHybClick, new google.maps.Size( 190, 5 ) );
    hybButton.initialize(map);
    var satButton = new LayerSelectControl( "Sat", onSatClick, new google.maps.Size( 245, 5 ) );
    satButton.initialize(map);
    var normalButton = new LayerSelectControl( "Normal", onNormalClick, new google.maps.Size( 300, 5 ) );
    normalButton.initialize(map)

    map.overlayMapTypes.push(null);
    map.overlayMapTypes.push(null);
    map.setMapTypeId(google.maps.MapTypeId.SATELLITE);
    '.$handlerStr.'
      
    google.maps.event.addListener( map, "zoomend", function() { onZoomEnd(); } );
    google.maps.event.addListener( map, "moveend", function() { onMoveEnd(); } );
  
//    var mt = map.getMapTypes();
//    for (var i=0; i<mt.length; i++) {
//      mt[i].getMinimumResolution = function() {return 3;}
//    }

    function hideOverlay(idx) {
      map.overlayMapTypes.setAt(idx, null);
    }

    function showOverlay(idx, overlay) {
      map.overlayMapTypes.setAt(idx, overlay);
    }

    function isOverlayHidden(idx) {
      if (map.overlayMapTypes.getAt(idx)) {
        return false;
      }
      return true;
    }

  function onI2KClick() {
    i2kButton.press();
    var eea_was_hidden = isOverlayHidden(1);
    if(isOverlayHidden(0)) {
      showOverlay(0, i2k_layer);
      // Force a refresh of the map to reload the copyright string
      map.setCenter( map.getCenter() );
      if( eea_was_hidden ) hideOverlay(1);
      updateCopyrights();
      return;
    }
    // Force a refresh of the map to reload the copyright string
    hideOverlay(0);
    map.setCenter( map.getCenter() );
    if( eea_was_hidden ) hideOverlay(1);
    hideOverlay(0);
    updateCopyrights();
  }
  
  function onEEAClick() {
    var checked = eeaButton.isPress();
    eeaButton.press();
    var i2k_was_hidden = isOverlayHidden(0);
    if(isOverlayHidden(1)) {
      showOverlay(1, eea_layer);
      // Force a refresh of the map to reload the copyright string
      map.setCenter( map.getCenter() );
      if( i2k_was_hidden ) hideOverlay(0);
      updateCopyrights();
      return;
    }
    // Force a refresh of the map to reload the copyright string
    hideOverlay(1);
    map.setCenter( map.getCenter() );
    if( i2k_was_hidden ) hideOverlay(0);
    hideOverlay(1);
    updateCopyrights();
  }

  function onHybClick() {
    if( !hybButton.isPress() ) {
      hybButton.press();
      if( satButton.isPress() ) satButton.press();
      if( normalButton.isPress() ) normalButton.press();
      map.setMapTypeId(google.maps.MapTypeId.HYBRID);
      restoreOverlays();
    }
  }
  
  function onSatClick() {
    if( !satButton.isPress() ) {
      if( hybButton.isPress() ) hybButton.press();
      satButton.press();
      if( normalButton.isPress() ) normalButton.press();
      map.setMapTypeId(google.maps.MapTypeId.SATELLITE);
      restoreOverlays();
    }
  }
  
  function onNormalClick() {
    if( !normalButton.isPress() ) {
      if( hybButton.isPress() ) hybButton.press();
      if( satButton.isPress() ) satButton.press();
      normalButton.press();
      map.setMapTypeId(google.maps.MapTypeId.ROADMAP);
        restoreOverlays();
  	}
  }

  function onZoomEnd() {
    restoreOverlays();
  }
  
  var nearbyicon = "'.NEARBYICON.'";
  var coldicon = "'.ICOLDICON.'";
  var validicon = "'.VALIDICON.'";
  
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
  
  $ret.= '
  }
  //When changing map type (onSatClick/onHybClick), preserve overlay state of visibility 
  function restoreOverlays()
  {
    if(isOverlayHidden(0)) hideOverlay(0);
    if(isOverlayHidden(1)) hideOverlay(1);
  }
  
  satButton.press();
  
  var exclude0x = '.$exclude0x.';
  var exclude0y = '.$exclude0y.';
  var exclude1x = '.$exclude1x.';
  var exclude1y = '.$exclude1y.';
';
  if( $showNearbyDams ) {
    $ret .= '  
      google.maps.event.clearListeners(map, "idle");
      google.maps.event.addListener(map, "idle", function() {
        var bounds =  map.getBounds();
        startRequestNearbyDams(bounds);
      });
';
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
  return "var point$id = new google.maps.Point($x, $y); var marker$id = createMarkerMain(point$id, \"$id\", \"$iconurl\", \"$name\"); marker$id.setMap(map); markers.push(marker$id);";
}

function createCrossMarker( $markerID, $title, $x, $y, $icon, $markerType ) {
  return "var point$markerID = new google.maps.Point($x, $y); var marker$markerID = createCrossMarker(point$markerID, \"$title\", \"$icon\", $markerType); marker$markerID.setMap(map); markers.push(marker$markerID);";
}

/**
 * Ends the script created by startGoogleViewport. 
 * @return string
 */
function endGoogleViewport () {
  return '</script>';
}

?>
