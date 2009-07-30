<?php
require_once 'support.php';
standard_html_header("");

require_once 'Helper.php';
require_once 'DB.php';
require_once 'View.php';
require_once 'Model.php';

try {
    DB::vInit();
?>
<h1 class="documentFirstHeading">
Climate change policies and measures in Europe <em>– under review by countries</em>
</h1>
<div class="visualClear"><!--&nbsp; --></div>

<p>
The following search engine gives access to a list of policies and
measures (PAM) that European countries have implemented or planned to
reduce greenhouse gas emissions. All these PAM have been officially
reported to the European Commission or under the United Framework
Convention on Climate Change (UNFCCC). In some cases, countries have
provided an estimate of the expected reduction of greenhouse gas emissions
resulting from a specific PAM.
</p>
<p>
The <strong>normal search</strong> mode allows the user to search by country, status and
policy type, sector and greenhouse gas affected.
</p>
<p>
The <strong>expert search</strong> mode allows the user to search for the PAM related
to specific the EU-wide policies, or common and coordinated policy
and measure (CCPM), in addition to the search criteria of the normal
search mode.
</p>

<div class="notice">
    <a  href="sector">Switch to expert search mode</a>
</div>
<h2>Normal search mode</h2>
        <div id="minigrid">
            <form action="output" method="get">
              <!-- TODO: split into rows programatically in View.php -->
              <div class="row">
                <div id="textsearch" class="c12">
                    <label for="any_word" class="question">Any word</label><br/>
                    <input type="text" name="any_word" id="any_word"/>
                    <input type="submit" value="SEARCH" name="normal"/>
                    <input type="reset" value="RESET" name="reset"/>
                </div>
              </div>
              <div class="row">
                <?php
                View::vRenderCheckboxList(8, Model::rgGetMemberStates(), 'Member State', 'member_state');
                View::vRenderCheckboxList(4, Model::rgGetSectors(), 'Sector', 'sector');
                ?>
              </div>
              <div class="row">
                <?php
                View::vRenderCheckboxList(4, Model::rgGetTypes(), 'Policy Type', 'type', true);
                View::vRenderCheckboxList(4, Model::rgGetGhgs(), 'GHG affected', 'ghg_output', true, 'id_ghg');
                View::vRenderCheckboxList(4, Model::rgGetStatusList(), 'Status', 'status', true);
                ?>
              </div>
              <div class="row">
                <?php
                // NOTICE: The following call produces a different "id" attribute on the input tag than the original code
                View::vRenderCheckboxList(4, Model::rgGetScenarios(), 'Scenario', 'with_or_with_additional_measure', true);
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
