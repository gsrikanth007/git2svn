/* Custom control for Google Maps */
function LayerSelectControl(text, clickHandler, position ) 
{
  this.text = text;
  this.onClickHandler = clickHandler;
  this.pressed = false;
  this.buttonDiv = null;
  this.btnPosition = position;
}

LayerSelectControl.prototype.press = function()
{
  this.pressed = !this.pressed;
  this.setButtonStyle_( this.buttonDiv, this.pressed );
}

LayerSelectControl.prototype.isPress = function()
{
  return this.pressed;
}


LayerSelectControl.prototype.getDiv = function()
{
  return this.buttonDiv;
}


LayerSelectControl.prototype.initialize = function(map) 
{
  var container = document.createElement("div");
  this.buttonDiv = document.createElement("div");
  this.setButtonStyle_(this.buttonDiv, false);
  container.appendChild(this.buttonDiv);
  this.buttonDiv.appendChild(document.createTextNode(this.text));
  google.maps.event.addDomListener(this.buttonDiv, "click", this.onClickHandler);
  map.controls[google.maps.ControlPosition.TOP_RIGHT].push(container);
  return container;
}


LayerSelectControl.prototype.getDefaultPosition = function() 
{
  return new GControlPosition( G_ANCHOR_TOP_RIGHT, this.btnPosition );
}

      
LayerSelectControl.prototype.setButtonStyle_ = function(button, pressed) 
{
  button.style.borderBottomColor = "#B0B0B0";
  button.style.borderBottomStyle = "solid";
  button.style.borderBottomWidth = "1px";
  button.style.borderLeftColor = "white";
  button.style.borderLeftStyle = "solid";
  button.style.borderLeftWidth = "1px";
  button.style.borderRightColor = "#B0B0B0";
  button.style.borderRightStyle = "solid";
  button.style.borderRightWidth = "1px";
  button.style.borderTopColor = "#B0B0B0";
  button.style.borderTopStyle = "solid";
  button.style.borderTopWidth = "1px";
  button.style.color = "black";
  button.style.backgroundColor = "white";
  button.style.cursor = "pointer";
  button.style.fontSize = "12px";
  button.style.width = "50px";
  button.style.textAlign = "center";
  button.style.fontFamily = "Arial,sans-serif";
  button.style.fontWeight = ( pressed == true ) ? "bold" : "normal";
}

function createMarkerMain( point, id, iconimg, damName ) {
  var icon = {
    url: iconimg,
    size: google.maps.Size(20, 34),
    anchor: google.maps.Point(6, 20)
  }
  var position = new google.maps.LatLng(point.y, point.x);
  var marker = new google.maps.Marker({icon: icon, title: damName, position: position});
  google.maps.event.addListener(marker, "click", function() { location.replace ("dams.php?cd="+id);});
  return marker;
}


function createCrossMarker(point, desc, iconimg, mkType ) {
  var icon = {
    url: iconimg,
    size: new google.maps.Size(37, 37),
    anchor: new google.maps.Point(19, 19)
  }
  var marker = null;
  var position = new google.maps.LatLng(point.y, point.x);
  if( mkType == 3 ) // Green cross
  {
    marker = new google.maps.Marker({
      icon: icon,
      position: position,
      draggable: true,
      title: desc
    });
    google.maps.event.addListener( marker, "dragend", damDragEndListener );
  } else {
    marker = new google.maps.Marker({
      icon: icon,
      position: position,
      draggable: false,
      title: desc
    });
  }
  marker.markerType = mkType;
  var html = "" + desc + " <br/>Longitude :"+ point.x+"<br/>Latitude :"+ point.y;
  var infowindow = new google.maps.InfoWindow({
      content: html
  });
  google.maps.event.addListener(marker, "click", function() 
  {
    infowindow.open(map, marker);
  });
  return marker;
}

function createCrossMarker2(id, point, desc, iconimg, mkType ) {
  var icon = {
    url: iconimg,
    size: new google.maps.Size(37, 37),
    anchor: new google.maps.Point(19, 19),
  }
  var position = new google.maps.LatLng(point.y, point.x);
  var marker = null;
  if( mkType == 3 ) // Green cross
  {
    marker = new google.maps.Marker({
      icon: icon,
      position: position,
      draggable: true,
      title: desc
    });
    marker.enableDragging();
    google.maps.event.addListener( marker, "dragend", damDragEndListener );
  } else {
    marker = new google.maps.Marker({
      icon: icon,
      position: position,
      draggable: false,
      title: desc,
      zIndex: Math.round(position.lat()*-100000)<<5
    });
  }
  marker.markerType = mkType;
  var url = new String ( document.location );
  url = url.substr( 0, url.lastIndexOf( "/" ) );
  url += "/dams.php?cd=" + id;
  var html = "" + desc + " <br/>Longitude :"+ point.x+"<br/>Latitude :"+ point.y+"<br/><a href=\"" + url + "\">Make dam active</a>";
  var infowindow = new google.maps.InfoWindow({
      content: html
  });
  google.maps.event.addListener(marker, "click", function() 
  {
    infowindow.open(map, marker);
  });
  return marker;
}

function updateMarker(mkType, position) {
  var available = false;
  for (var i=0, len=markers.length; i<len; i++) {
    if (markers[i].markerType == mkType) {
      markers[i].setPosition(position);
      available = true;
    }  
  }
  if (!available) {
    var title, marker_icon;
    if (mkType === 3) {
      marker_icon = validicon;
      title = "Validated position";
    } else {
      marker_icon = coldicon;
      title = "ICOLD position";
    }
    var x = position.lng();
    var y = position.lat();
    var point = new google.maps.Point(x, y);
    marker = createCrossMarker( point, title, marker_icon, mkType );
    marker.setMap(map);
    markers.push(marker);
  }
}

/**
  Whenever user clicks on map, this handler is called, filling the form fields.
  This method is a click handler on the map object in google viewport of dam detail (dam.php).
*/
function damMapClickListener(event) {
  var ctrl = document.getElementById( "setWhichPoint" );
  var position = event.latLng;
  try {
    if( ctrl != null )
    {
      if ( ctrl.checked == true ) {
        updateMarker(3, position);
        var xCtrl = document.getElementById( "x" );
        var yCtrl = document.getElementById( "y" );
        if( xCtrl != null ) xCtrl.value = position.lng();
        if( yCtrl != null ) yCtrl.value = position.lat();
      } else {
        updateMarker(1, position);
        var xIniCtrl = document.getElementById( "xini" );
        var yIniCtrl = document.getElementById( "yini" );
        if( xIniCtrl != null ) xIniCtrl.value = position.lng();
        if( yIniCtrl != null ) yIniCtrl.value = position.lat();       
      }
    }
  } catch( e ) {
    //alert( "Exception while setting values into controls (x, y, xini, yini). Reason: " + e.message );
  }
}


function damDragEndListener() {
  try {
    var marker = this;
    var position = marker.getPosition();
    switch( marker.markerType ) {
      case 3: // Validated position - Green cross
        var xCtrl = document.getElementById( "x" );
        var yCtrl = document.getElementById( "y" );
        if( xCtrl != null ) xCtrl.value = position.lng();
        if( yCtrl != null ) yCtrl.value = position.lat();
      break;
/*
        case 1: // Seed position - Red cross
        var xIniCtrl = document.getElementById( "xini" );
        var yIniCtrl = document.getElementById( "yini" );
        if( xIniCtrl != null ) xIniCtrl.value = position.x;
        if( yIniCtrl != null ) yIniCtrl.value = position.y;       
      break;
*/      
    }
  } catch( e ) {
    alert( "Dragging exception. Reason: " + e.message );
  } 
}


function resetSeed( x, y ) {
  var xCtrl = document.getElementById( "x" );
  var yCtrl = document.getElementById( "y" );
  if( xCtrl != null ) xCtrl.value = x;
  if( yCtrl != null ) yCtrl.value = y;
}

var reqObj = false;

function startRequestNearbyDams(bbox) {
  var xtop = bbox.getNorthEast().lng();
  var ytop = bbox.getNorthEast().lat();
  var xbtm = bbox.getSouthWest().lng();
  var ybtm = bbox.getSouthWest().lat();

  var url = new String ( document.location );
  url = url.substr( 0, url.lastIndexOf( "/" ) );
  url += "/ajax.php?op=displayNearbyDams&xtop=" + xtop + "&ytop=" + ytop + "&xbtm=" + xbtm + "&ybtm=" + ybtm;
  url += "&exclude0x=" + exclude0x + "&exclude0y=" + exclude0y + "&exclude1x=" + exclude1x + "&exclude1y=" + exclude1y;
  web_log( "* Start requesting nearby dams" );
  web_log( "  xtop=" + xtop );
  web_log( "  ytop=" + ytop );
  web_log( "  xbtm=" + xbtm );
  web_log( "  ybtm=" + ybtm );
  web_log( url );
  serverRequest( url, endRequestNearbyDams );
}

var nearbydamsPoints = new Array();

function endRequestNearbyDams() {
  try {
    if ( reqObj.readyState == 4 ) { // Loaded
      if (reqObj.status == 200) { // OK
        var items = reqObj.responseXML.getElementsByTagName( "d" );
        var batch = [];
        if( map.getZoom() < 8 ) // Hide all the markers
        {
        } else { // Display all the markers plus new ones
          web_log( "  Fetched XML for nearby dams" );
          web_log( "  Got: " + items.length + " dams" );          
          for( i = 0; i < items.length; i++ ) {
            var node = items[ i ];
            var p = new google.maps.Point( node.getAttribute( "x" ), node.getAttribute( "y" ) );
            var title = node.getAttribute( "id" ) + ": " + node.getAttribute( "n" );
            var marker = createCrossMarker2( node.getAttribute( "id" ), p, title, nearbyicon, 2 );
            {
            marker.setMap(map);
            markers.push(marker);
            }
            web_log( "  Dam: " + i + ", " + title + "(" + node.getAttribute( "x" ) + ", " + node.getAttribute( "y" ) + ")" );
          }
          web_log( "* END requesting nearby dams" );
        }
      } else {
        alert("There was a problem retrieving the XML data:\n" + reqObj.statusText);
      }
    }
  } catch( e ) {
    alert( "Previous request for nearby dams not ended, please wait to load. No new dams were displayed" );
  }
}

function duplicate( marker )
{
  for( i = 0; i < nearbydamsPoints.length; i++ )
  {
    var em = nearbydamsPoints[ i ];
    if( em.title == marker.title ) 
      return true;
  }
  nearbydamsPoints.push( marker );
  return false;
}

function showMarkers( show ) {
  for( i = 0; i < nearbydamsPoints.length; i++ )
  {
    marker = nearbydamsPoints[ i ];
    if( show ) 
    {
      marker.show();
    } else {
      marker.hide();
    }
  }   
}


/**
 * XML Calls on server using JavaSscript XML-HTTP request
 * @param url URL to request from server (must return a valid XML, non-cached)
 * @param handler Callback handler since request is asynchronous
 */

function serverRequest( url, handler ) {
  if( !reqObj )
  { 
    // branch for native XMLHttpRequest object
    if( window.XMLHttpRequest ) {
      try {
        reqObj = new XMLHttpRequest();
      } catch(e) {
        reqObj = false;
      }
      // branch for IE/Windows ActiveX version
    } else if(window.ActiveXObject) {
      try {
        reqObj = new ActiveXObject( "Msxml2.XMLHTTP" );
      } catch( e ) {
        try {
          reqObj = new ActiveXObject( "Microsoft.XMLHTTP" );
        } catch( e ) {
          alert ( "Functionality not available with this browser." );
          reqObj = false;
        }
      }
    }
  }
  // Check if the request object is in a state which allows new request
  if( reqObj ) {
    reqObj.open( "GET", url, true );
    reqObj.onreadystatechange = handler ;
    reqObj.send( "" );
  } else {
    alert( "Nearby dams cannot be displayed on this browser" );
  }
  return reqObj;
}

/*
 In order to see some debug action in your page, you must have the control
 <textarea id="debug_console" name="ajax_console" rows="10" cols="80"></textarea>
 defined within page and log_enabled = true
*/
var log_enabled = false;

function web_log( msg ) {
  if( !log_enabled ) return;
  
  try {
    var ctrl = document.getElementById( "debug_console" );
    var str = ctrl.value;
    ctrl.value += msg + "\n";
    if (typeof ctrl.scrollTop != 'undefined' && typeof ctrl.scrollHeight != 'undefined') {
      ctrl.scrollTop = ctrl.scrollHeight;
    }    
  } catch (e) {
    alert( "Unable to log in debug console! Do you have control with id 'debug_console' in your page?" );
  }
}

function clearWebConsole() {
  try {
    var ctrl = document.getElementById( "debug_console" );
    ctrl.value = "";
  } catch (e) {
    alert( "Unable to log in debug console! Do you have control with id 'debug_console' in your page?" );
  }
}
