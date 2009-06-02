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
			Database Expert Search Mode
		</h1>
		<p class="head_red">
			Sector: <?=$mpSector['sector']?>
		</p>
		<form action="output" method="get">
			<table>
				<tr>
					<td class="filter" colspan="2">
						<a class="big" href="sector">Select a new sector</a>
					</td>
					<td class="filter" style="text-align:right">&nbsp;
						<!--<a class="small" href="explain.htm">Explanation of search options</a>-->
					</td>
				</tr>
				<tr>
                    <?php
                    View::vRenderCheckboxList(Model::rgGetMemberStates(), 'Member State', 'member_state');
                    View::vRenderCheckboxList(Model::rgGetTypes(), 'Policy Type', 'type', true);
                    ?>
				</tr>
				<tr>
                    <?php
                    View::vRenderCheckboxList(Model::rgGetGhgs(), 'GHG affected', 'ghg_output', true, 'id_ghg');
                    View::vRenderCheckboxList(Model::rgGetStatusList(), 'Status', 'status', true);
                    // NOTICE: The following call produces a different "id" attribute on the input tag than the original code
                    View::vRenderCheckboxList(Model::rgGetScenarios(), 'Scenario', 'with_or_with_additional_measure', true);
                    ?>
				<tr>
                    <?php
                    View::vRenderCheckboxList(Model::rgGetCcpmsBySector($mpSector['id_sector']), 'Related CCPM', 'related_ccpm');
                    ?>
				</tr>
				<tr>	
					<td class="filter">
						<label class="question">Any word</label><br/>
						<input name="any_word" type="text"/>
					</td>
					<td class="filter" colspan="2" style="vertical-align:bottom; text-align:right;">
						<input type="hidden" value="<?=$mpSector['id_sector']?>" name="id_sector[]"/>
						<input type="submit" value="SEARCH" name="expert"/>
						<input type="reset" value="RESET" name="reset"/>
					</td>
				</tr>
			</table>
		</form>
		<p>
			<a class="big" href="index">Switch to normal search mode</a>
		</p>
<?php
} catch (Exception $e) {
    Helper::vSendCrashReport($e);
    View::vRenderErrorMsg($e);
}
standard_html_footer();
?>
