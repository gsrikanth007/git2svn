<?php

class Application_Model_MemberState extends Iris_Model_Abstract {

    /**
     * Model database table class
     * @var string
     */
    protected $_dbTableClass = 'Application_Model_DbTable_MemberState';

    /**
     * Model relationships
     * @var array
     */
    protected $_relationships = array('responses');


    /**
     * Method to find model by unique identifer
     * @param mixed
     * @return Iris_Abstract_Model
     * @access public
     */
    public static function find($id) {
        return parent::find(__CLASS__, $id);
    }

    /**
     * Method to find all models matching specified criteria
     * @param array
     * @param array
     * @param integer
     * @param integer
     * @return array
     * @access public
     */
    public static function fetchAll($where = null, $order = null, $limit = null, $offset = null) {
        // Explicitly remove Template (id: 999) from results unless where class specified
        $where = (is_null($where)) ? array('id <> ?' => 999) : null;
        return parent::fetchAll(__CLASS__, $where, $order, $limit, $offset);
    }

    /**
     * Method to find all member state id values
     * @return array
     * @access public
     */
    public static function findIds() {
        $memberStateIds = array();
        $rowset = self::getInstance(__CLASS__)->getDbTable()->fetchAll();

        if(!empty($rowset)) {
            // Iterate through Zend_Db_Table_Rowset and add model to array
            foreach($rowset as $row) {
                array_push($memberStateIds, $row['id']);
            }
        }

        return $memberStateIds;
    }

    /**
     * Method to get member state responses
     * @return array
     */
    public function getResponses() {
        $cacheId = "member_state_responses_{$this->id}";

        // Retrieve responses if cache entry exists - otherwise create
        if(($responses = $this->_cache->load($cacheId)) === false) {
            $responses = Application_Model_Response::fetchAll(array('member_state_id = ?' => $this->id));

            // Save responses to cache
            $this->_cache->save($responses, $cacheId);
        }

        return $responses;
    }

}