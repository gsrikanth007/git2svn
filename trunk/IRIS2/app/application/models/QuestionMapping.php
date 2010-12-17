<?php

class Application_Model_QuestionMapping extends Iris_Model_Abstract {

    /**
     * Model database table class
     * @var string
     */
    protected $_dbTableClass = 'Application_Model_DbTable_QuestionMapping';

    /**
     * Model relationships
     * @var array
     */
    protected $_relationships = array('question', 'questionnaire', 'mappedQuestion', 'mappedQuestionnaire');


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
     * Method to get original question
     * @return Iris_Model_Abstract
     */
    public function getQuestion() {
        return Application_Model_Question::find($this->questionId);
    }

    /**
     * Method to get original questionnaire
     * @return Iris_Model_Abstract
     */
    public function getQuestionnaire() {
        return Application_Model_Questionnaire::find($this->questionnaireId);
    }

    /**
     * Method to get mapped question
     * @return Iris_Model_Abstract
     */
    public function getMappedQuestion() {
        return Application_Model_Question::find($this->mappedQuestionId);
    }

    /**
     * Method to get mapping questionnaire
     * @return Iris_Model_Abstract
     */
    public function getMappedQuestionnaire() {
        return Application_Model_Questionnaire::find($this->mappedQuestionnaireId);
    }

}