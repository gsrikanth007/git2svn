<?php

class Application_Model_Answer extends Iris_Model_Abstract {

    /**
     * Model database table class
     * @var string
     */
    protected $_dbTableClass = 'Application_Model_DbTable_Answer';

    /**
     * Model relationships
     * @var array
     */
    protected $_relationships = array('questionHierarchy');


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
     * Method to get answer question hierarchy
     * @return Iris_Model_Abstract
     * @access protected
     */
    public function getQuestionHierarchy() {
        return Application_Model_QuestionHierarchy::find($this->questionHierarchyId);
    }

}