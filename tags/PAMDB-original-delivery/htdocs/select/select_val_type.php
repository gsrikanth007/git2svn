<?php
	// Variablen zum �bergeben:
	// $where_select = "where val_type.id_type = '$id_type'"
	// $where_select = "where val_type.type = '$type'"
	// $pos_mes (positive mitteilungen anzeigen?)
	$sql = "select id_type, type " .
		"from val_type " . $where_select;
	$val_type = @mysql_query($sql);
	$val_type_num = @mysql_num_rows($val_type);
	if (!$val_type) {
		echo("<p>Es gab einen Fehler beim Zugriff auf die Tabelle \"val_type\".</p><p>$sql</p>");
	} else {
		if ($pos_mes) {echo(" ... val_type");}
	}
?>