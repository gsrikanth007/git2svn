<?php
require_once 'support.php';
standard_html_header("Expert search");

require_once 'Helper.php';
require_once 'DB.php';
require_once 'Model.php';
require_once 'View.php';
require_once 'Controller.php';

try {
    DB::vInit();
    if (null != ($ixSector = Controller::ixSectorFromRequest())) {
        $mpSector = Model::mpGetSector($ixSector);
        if (null === $mpSector) {
            header('Location: ./sector.php');
            exit(0);
        }
    } else {
        header('Location: ./sector.php');
        exit(0);
    }
?>
		<h1>
			Expert Search Mode
		</h1>
		<div class="advice-msg">
			Sector: <?=$mpSector['sector']?>
            [<a href="sector">Select a new sector</a>]
		</div>
        <div id="minigrid">
		  <form action="output" method="get">
            <!-- TODO: split into rows programatically in View.php -->
            <div class="row">
              <div class="c12">
                <label class="question">Any word</label><br/>
                <input name="any_word" type="text"/>
                <input type="hidden" value="<?=$mpSector['id_sector']?>" name="id_sector[]"/>
                <input type="submit" value="SEARCH" name="expert"/>
                <input type="reset" value="RESET" name="reset"/>
              </div>
            </div>
            <div class="row">
                <?php
                View::vRenderCheckboxList(8, Model::rgGetMemberStates(), 'Member State', 'member_state');
                View::vRenderCheckboxList(4, Model::rgGetTypes(), 'Policy Type', 'type', true);
                ?>
            </div>
            <div class="row">
                <?php
                View::vRenderCheckboxList(4, Model::rgGetGhgs(), 'GHG affected', 'ghg_output', true, 'id_ghg');
                View::vRenderCheckboxList(4, Model::rgGetStatusList(), 'Status', 'status', true);
                // NOTICE: The following call produces a different "id" attribute on the input tag than the original code
                View::vRenderCheckboxList(4, Model::rgGetScenarios(), 'Scenario', 'with_or_with_additional_measure', true);
                ?>
            </div>
            <div class="row">
                <?php
                View::vRenderCheckboxList(12, Model::rgGetCcpmsBySector($mpSector['id_sector']), 'Related CCPM', 'related_ccpm');
                ?>
            </div>
            <div class="row">
              <!-- FIXME: this is a hack just to clear floating because grid ends here -->
            </div>
		  </form>
        </div>
<?php
} catch (Exception $e) {
    Helper::vSendCrashReport($e);
    View::vRenderErrorMsg($e);
}
standard_html_footer();
?>
