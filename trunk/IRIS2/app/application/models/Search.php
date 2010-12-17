<?php

class Application_Model_Search extends Iris_Model_Abstract {

    /**
     * Model database table class
     * @var string
     */
    protected $_dbTableClass = 'Application_Model_DbTable_Search';

    /**
     * Model form class
     * @var string
     */
    protected $_formClass = 'Application_Form_Search';

    /**
     * Results from last search
     * @var array
     */
    protected $_searchResults = array();

    /**
     * Results count from last search
     * @var integer
     */
    protected $_searchResultsCount = 0;

    /**
     * Match count from last search
     * @var integer
     */
    protected $_searchMatchCount = 0;


    /**
     * Method to perform search
     * @return void
     * @access public
     */
    public function performSearch() {
        // Check if model attributes are valid
        if($this->isValid()) {
            $select = $this->getDbTable()->getAdapter()->select()
                ->from('answer', array('matches' => new Zend_Db_Expr("SUM(ROUND(((CHAR_LENGTH(answer.answer_text) - CHAR_LENGTH(REPLACE(answer.answer_text, '{$this->q}', ''))) / CHAR_LENGTH('{$this->q}'))))")))
                ->joinLeft('question_hierarchy', 'question_hierarchy.id = answer.question_hierarchy_id', array())
                ->joinInner('response', 'response.id = question_hierarchy.response_id', array())
                ->joinInner('member_state', 'member_state.id = response.member_state_id', array(
                    'member_state_id'   => 'id',
                    'member_state_name' => 'country_name',
                ))
                ->joinInner('questionnaire', 'questionnaire.id = response.questionnaire_id', array(
                    'questionnaire_id'    => 'id',
                    'questionnaire_start' => "DATE_FORMAT(period_start, '%Y')",
                    'questionnaire_end'   => "DATE_FORMAT(period_end, '%Y')",
                ))
                ->joinInner('directive', 'directive.id = questionnaire.directive_id', array(
                    'directive_id'   => 'id',
                    'directive_name' => 'name',
                ))
                ->joinInner('question', 'question.id = question_hierarchy.question_id', array())
                ->joinLeft('question_sector', 'question_sector.question_id = question.id', array())
                ->joinLeft('sector', 'sector.id = question_sector.sector_id', array())
                ->where('directive.id = ?', $this->directive)
                ->group('response.id')
                ->order('member_state.country_name ASC');

            // Check whether query text specified
            if(!empty($this->q)) {
                $select->where('answer.answer_text LIKE ?', "%{$this->q}%");
            }

            // Check whether reporting period start year selected
            if(!empty($this->periodStart)) {
                $select->where("DATE_FORMAT(questionnaire.period_start, '%Y') >= ?", $this->periodStart);
            }

            // Check whether reporting period end year selected
            if(!empty($this->periodEnd)) {
                $select->where("DATE_FORMAT(questionnaire.period_end, '%Y') <= ?", $this->periodEnd);
            }

            // Check whether sector selected
            if(!empty($this->sector)) {
                $select->where('sector.id IN (?)', $this->sector);
            }

            $cacheId = 'search_' . sha1($select);

            // Retrieve search results if cache entry exists - otherwise create
            if(($searchResults = $this->_cache->load($cacheId)) === false) {
                // Retrieve search matches
                $searchResults = $select->query()->fetchAll();

                // Save search results to cache
                $this->_cache->save($searchResults, $cacheId);
            }

            // Check if any search results found
            if(!empty($searchResults)) {
                foreach($searchResults as $searchResult) {
                    // Create new datasheet token for each search result
                    $token = new Application_Model_Token_Datasheet(array('preferences' => array(
                        'directive'     => $searchResult['directive_id'],
                        'questionnaire' => $searchResult['questionnaire_id'],
                        'member_state'  => $searchResult['member_state_id'],
                        'search_text'   => $this->q,
                    )));
                    $token->save();

                    // Store results and token in search results array and increment count
                    $this->_searchResults[] = array(
                        'directive'     => $searchResult['directive_name'],
                        'questionnaire' => "{$searchResult['questionnaire_start']} - {$searchResult['questionnaire_end']}",
                        'member_state'  => $searchResult['member_state_name'],
                        'token'         => $token,
                        'matches'       => $searchResult['matches'],
                    );

                    $this->_searchResultsCount += 1;
                    $this->_searchMatchCount += (!is_null($searchResult['matches'])) ? (int)$searchResult['matches'] : 0;
                }
            }
        }
    }

    /**
     * Method to return search results array
     * @return array
     * @access public
     */
    public function getResults() {
        return $this->_searchResults;
    }

    /**
     * Method to return number of search results
     * @return integer
     * @access public
     */
    public function getResultsCount() {
        return $this->_searchResultsCount;
    }

    /**
     * Method to return number of search matches
     * @return integer
     * @access public
     */
    public function getMatchCount() {
        return $this->_searchMatchCount;
    }

    /**
     * Method to get directive options
     * @return array
     * @access public
     */
    public function getDirectiveOptions() {
        $options = array();

        $select = $this->getDbTable()->getAdapter()->select()
            ->from('directive', array('id', 'name'))
            ->order('name asc');

        // Get all matching directives
        if(($directives = $select->query()->fetchAll())) {
            foreach($directives as $directive) {
                $options[$directive['id']] = $directive['name'];
            }
        }

        return $options;
    }

    /**
     * Method to get reporting period year options
     * @param string $type
     * @return array
     * @access public
     */
    public function getReportingPeriodOptions($type) {
        $options = array('0' => '');
        
        // Determine which field to query
        switch($type) {
            case 'start':
                $field = 'period_start';
                break;

            case 'end':
                $field = 'period_end';
                break;

            default:
                throw new Iris_Exception("Invalid reporting period type provided - {$type}");
                break;
        }

        $select = $this->getDbTable()->getAdapter()->select()
            ->from('questionnaire', array(
               'minimum' => "MIN(DATE_FORMAT({$field}, '%Y'))",
               'maximum' => "MAX(DATE_FORMAT({$field}, '%Y'))",
            ));

        // Get matching minimum and maximum years
        if(($years = $select->query()->fetch())) {
            // Add option for each year between minimum and maximum year inclusive
            for($year = $years['minimum']; $year <= $years['maximum']; $year++) {
                $options["{$year}"] = "{$year}";
            }
        }

        return $options;
    }

    /**
     * Method to get sector options
     * @return array
     * @access public
     */
    public function getSectorOptions() {
        $options = array('0' => '');

        $select = $this->getDbTable()->getAdapter()->select()
            ->from('sector', array('id', 'name'))
            ->order('name asc');

        // Get all matching sectors
        if(($sectors = $select->query()->fetchAll())) {
            foreach($sectors as $sector) {
                $options[$sector['id']] = $sector['name'];
            }
        }

        return $options;
    }

}