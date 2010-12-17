<?php

class Application_Model_Directive extends Iris_Model_Abstract {

    /**
     * Model database table class
     * @var string
     */
    protected $_dbTableClass = 'Application_Model_DbTable_Directive';

    /**
     * Model relationships
     * @var array
     */
    protected $_relationships = array('questionnaires');


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
        return parent::fetchAll(__CLASS__, $where, $order, $limit, $offset);
    }

    /**
     * Method to get all directive questionnaires
     * @return array
     * @access public
     */
    public function getQuestionnaires() {
        $cacheId = "directive_questionnaires_{$this->id}";

        // Retrieve questionnaires if cache entry exists - otherwise create
        if(($questionnaires = $this->_cache->load($cacheId)) === false) {
            $questionnaires = Application_Model_Questionnaire::fetchAll(array('directive_id = ?' => $this->id));

            // Save questionnaires to cache
            $this->_cache->save($questionnaires, $cacheId);
        }

        return $questionnaires;
    }

}