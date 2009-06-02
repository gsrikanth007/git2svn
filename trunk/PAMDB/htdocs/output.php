<?php
require_once 'support.php';
standard_html_header("Search Results");

require_once 'config.inc.php';
require_once 'DB.php';
require_once 'Model.php';
require_once 'View.php';
require_once 'Controller.php';

require_once 'db/StarQuery.php';
require_once 'db/WhereClause.php';
require_once 'db/Dimension.php';
require_once 'db/FulltextMatch.php';

try {
    DB::vInit();

    $q = new StarQuery('pam', 'id');
    $whrT = new WhereClause();
    $whrT->vNotNull('name_pam');
    $q->vAddWhere($whrT);
	
    if (null != ($rgFilter = Controller::rgFilterFromRequest('id_member_state'))) {
        if (!in_array('select_all', $rgFilter)) {
            if (in_array('1', $rgFilter)) {
                $rgFilter = Model::rgGetEu15StateIds();
            } else if (in_array('2', $rgFilter)) {
                $rgFilter = Model::rgGetEu10StateIds();
            }
            $dim = new Dimension('pam_member_state', 'id');
            $dim->vSetFilter('id_member_state', $rgFilter);
            $q->vAddDimension($dim);
        }
    }

	$valves = array("sector","ghg","type","status","related_ccpm","with_or_with_additional_measure");
	
	foreach($valves as $valve) {
		$val_id = "id_" . $valve;
		$val_pam = "pam_" . $valve;
        
        if (null != ($rgFilter = Controller::rgFilterFromRequest($val_id))) {
            if (in_array('no_value', $rgFilter) && in_array('select_all', $rgFilter)) {
                // allowing all dimension values plus NULL is equivalent
                // to ignoring the dimension table completely.
                continue;
            }
            $dim = new Dimension($val_pam, 'id');
            if (in_array('no_value', $rgFilter)) {
                $dim->vAllowNull();
            }
            if (!in_array('select_all', $rgFilter)) {
                $dim->vSetFilter($val_id, $rgFilter);
            }
            $q->vAddDimension($dim);
        }
    }

    if (!empty($_GET['any_word'])) {
        $whrMatch = new FulltextMatch($_GET['any_word'], Model::rgGetPamTextFields());
        $q->vAddWhere($whrMatch);
    }

    $sql = $q->sqlRender(array('id'));
    View::vRenderInfoBox($sql);
    $rgPams = DB::rgSelectRows($sql);
    for ($c = 0, $cMax = count($rgPams); $c < $cMax; $c++) {
        // TODO: This issues two extra SQL queries per row
        //       which is quite inefficient, but "everything is
        //       fast for small n", so we don't bother for now.
        //
        //       The proper way to do it would be to get the
        //       additional info by joining in more tables to
        //       the star query, but that means to line up the
        //       Select and StarQuery classes better beforehand.
        $rgPams[$c] = Model::mpGetPamSummaryById($rgPams[$c]['id']);
    }

    if (null != ($fnComp = Controller::fnGetSortFunc())) {
        usort($rgPams, $fnComp);
    }

    // TODO: Presentation of clusters should be improved
    $rgPams = array_merge($rgPams, Model::rgGetRelatedClusters($rgPams));

    View::vRenderSearchResults($rgPams);
} catch (Exception $e) {
    Helper::vSendCrashReport($e);
    View::vRenderErrorMsg($e);
}
standard_html_footer();
?>
