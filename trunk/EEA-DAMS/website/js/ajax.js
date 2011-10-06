/**
 * EEA-DAMS 
 *
 * @abstract	 Ajax manager.
 * @author       Fran�ois-Xavier Prunayre <fx.prunayre@oieau.fr>
 * @copyright    2005
 * @version    	 1.0
 *
 */
 
var url = new String (document.location);
//alert (url.substr(0,url.indexOf('dams/')+5));
var wwwroot = url.substr(0,url.indexOf('user.php'));

function XMLProcess() {
    msg = "";
    var items = req.responseXML.getElementsByTagName("dam");
	//alert (req.responseText);
	if (items.length==0)
		alert ("no dams found.");
	else {	
		removeAllOptions (document.dams_form.listunselect);
	
		for (i=0; i<items.length; i++){
			name = items[i].getAttribute('name');
			id 	 = items[i].getAttribute('noeea');
			document.dams_form.listunselect.options[i] = new Option(name +" ("+ id +")" , id);
		}
	}
}

function processReqChange() {
    // only if req shows "loaded"
    if (req.readyState == 4) {
        // only if "OK"
        if (req.status == 200) {
            // ...processing statements go here...
          	//  alert ("Connecting to server...");
			XMLProcess ();
        } else {
            alert("There was a problem retrieving the XML data:\n" +
                req.statusText);
        }
    }
}

function loadXMLDoc(url, type) {
  req = false;
  // branch for native XMLHttpRequest object
  if(window.XMLHttpRequest) {
    try {
      req = new XMLHttpRequest();
    } catch(e) {
      req = false;
    }
    // branch for IE/Windows ActiveX version
  } else if(window.ActiveXObject) {
    try {
      req = new ActiveXObject("Msxml2.XMLHTTP");
    } catch(e) {
      try {
        req = new ActiveXObject("Microsoft.XMLHTTP");
      } catch(e) {
        alert ("Fonctionnality not available with this browser.");
        req = false;
      }
    }
  }
	if( req ) {
    req.onreadystatechange = processReqChange ;
		req.open("GET", url, true);
		//req.settimeout();
		req.send("");
	}
}

function applyFilter (){
	url = wwwroot+"damfilter.php?srcName="+document.filter_form.srcName.value+
			"&cd="+document.filter_form.cd.value+
			"&srcCountry="+document.filter_form.srcCountry.value;
	//alert (url);
	loadXMLDoc (url, "damfilter");
}

function saveDams (){
	/*var userId = document.dams_form.userId.value;
	var url = "http://dev.sandre.eaufrance.fr/eeadams/damfilter.php?userId="+userId+"&act=remove";
	var str = "";
	
	for (i=document.dams_form.listselect.options.length-1; i>=0; i--){
			str += document.dams_form.listselect.options[i].value;
	}
	alert (userId +" "+str);
	*/
	// TODO : save - use POST form 
}

function saveNewPos (){
	url = wwwroot+"damfilter.php?damId="+document.carto_form.damId.value+"&x"+document.carto_form.x.value+"&y"+document.carto_form.y.value;
	alert (url);
	//loadXMLDoc (url, "damUpdateComment");
}

function updateComment(){
	url = wwwroot+"damfilter.php?damId="+document.carto_form.damId.value+"&comment="+document.carto_form.comment.value;
	alert (url);
	loadXMLDoc (url, "damUpdateComment");
}

function setDamIdsOrder(that, table){
    var baseURL = url.substring(0, url.indexOf('/', 14));
    damIds = "damIds=";
    for (i = 0; i < table.tBodies[0].rows.length; i++){
        damIds += that.getInnerText(table.tBodies[0].rows[i].cells[1])+",";
    }
    var damIds = damIds.substring(0, damIds.length-1);

    var xmlHttpReq = false;
    var self = this;
    if (window.XMLHttpRequest) {
        self.xmlHttpReq = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
        self.xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
    }
    self.xmlHttpReq.open('POST', baseURL+"/dams.php?setDamIdsOrder", true);
    self.xmlHttpReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    self.xmlHttpReq.send(damIds);    
}
