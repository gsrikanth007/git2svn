<?php

class Application_Model_GbrSearch extends Iris_Model_Abstract {

    /**
     * Model form class
     * @var string
     */
    protected $_formClass = 'Application_Form_GbrSearch';
    
    /**
     * Database adapter
     * @var Zend_Db_Adapter
     */
    protected $_db;

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
     * Method to create new Iris_Model_Abstract instance and populate with attribute values provided
     * @param array $attributes
     * @return Iris_Model_Abstract
     * @access public
     */
    public function  __construct(array $attributes = null) {
        $this->_db = Zend_Registry::get('gbrDb');
        parent::__construct($attributes);
    }

    /**
     * Method to perform search
     * @return void
     * @access public
     */
    public function performSearch() {
        // Check if model attributes are valid
        if($this->isValid()) {
            $select = $this->_db->select()
                ->from('fact', array('country_id', 'region'))
                ->joinInner('installation', 'fact.id = installation.fact_id', array('installation_id' => 'id', 'fact_id', 'gbr', 'sectoral', 'cross_sectoral', 'no_installations', 'air', 'water', 'other'))
                ->joinInner('annex', 'installation.annex_id = annex.id', array('activity', 'code'))
                ->order('fact.country_id ASC')
                ->order('installation.id ASC');

            // Check whether single country specified
            if(!empty($this->country)) {
                switch($this->country) {
                    case '2a':
                        $select->where('fact.country_id = ?', 2)
                            ->where('fact.region = ?', 'Belgium - Flanders');
                        break;
                    case '2b':
                        $select->where('fact.country_id = ?', 2)
                            ->where('fact.region = ?', 'Belgium - Brussels');
                        break;

                    case '2c':
                        $select->where('fact.country_id = ?', 2)
                            ->where('fact.region = ?', 'Belgium - Walloon');
                        break;

                    default:
                        $select->where('fact.country_id = ?', $this->country);
                        break;
                }
            }

            // Check whether single installation activity specified
            if(!empty($this->activity)) {
                $select->where('annex.id = ?', $this->activity);
            }

            // Check whether emission limit value specified
            if(!empty($this->elv)) {
                $where = array();

                if(in_array('air',   $this->elv)) $where[] = $this->_db->quoteInto('air = ?', 1);
                if(in_array('water', $this->elv)) $where[] = $this->_db->quoteInto('water = ?', 1);
                if(in_array('other', $this->elv)) $where[] = $this->_db->quoteInto('CHAR_LENGTH(other) > ?', 0);

                $where = implode(' OR ', $where);
                $select->where("({$where})");
            }
            
            $searchResults = $select->query()->fetchAll();

            // Check if any search results found
            if(!empty($searchResults)) {
                $this->_searchResults = $searchResults;
                $this->_searchResultsCount = count($searchResults);
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
     * Method to get country options
     * @return array
     * @access public
     */
    public function getCountryOptions() {
        $options = array('0' => 'Any country', '2a' => 'Belgium - Flanders', '2b' => 'Belgium - Brussels', '2c' => 'Belgium - Walloon');

        $select = $this->_db->select()
            ->from('country', array('id', 'name'))
            ->where('id <> ?', 2)
            ->order('id ASC');

        // Get all matching countries
        if(($countries = $select->query()->fetchAll())) {
            foreach($countries as $country) {
                $options[$country['id']] = $country['name'];
            }
        }

        ksort($options);
        return $options;
    }

    /**
     * Method to get installation activity options
     * @return array
     * @access public
     */
    public function getActivityOptions() {
        $options = array('0' => 'Any installation activity');

        $select = $this->_db->select()
            ->from('annex', array('id', 'activity'))
            ->order('id ASC');

        // Get all matching installation activities
        if(($installations = $select->query()->fetchAll())) {
            foreach($installations as $installation) {
                $options[$installation['id']] = $installation['activity'];
            }
        }

        return $options;
    }

    /**
     * Method to get details for specified installation
     * @param integer $installationId
     * @return array
     * @access public
     */
    public function getInstallationDetails($installationId) {
        $details = array();

        if(!is_null($installationId)) {
            $details = $this->_db->select()
                ->from('fact')
                ->joinInner('installation', 'fact.id = installation.fact_id')
                ->joinInner('annex', 'installation.annex_id = annex.id')
                ->where('installation.id = ?', $installationId)
                ->query()
                ->fetch();
        }

        return $details;
    }
    
}