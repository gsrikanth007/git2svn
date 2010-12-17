<?php

class Application_Model_QuestionHierarchy extends Iris_Model_Abstract {

    /**
     * Model database table class
     * @var string
     */
    protected $_dbTableClass = 'Application_Model_DbTable_QuestionHierarchy';

    /**
     * Model relationships
     * @var array
     */
    protected $_relationships = array('answer', 'children', 'question');


    /**
     * Method to find model by unique identifer
     * @param mixed
     * @return Iris_Model_Abstract
     * @access public
     */
    public static function find($id) {
        return parent::find(__CLASS__, $id);
    }

    /**
     * Method to find model by question id
     * @param mixed
     * @return Iris_Model_Abstract
     * @access public
     */
    public static function findByQuestionId($questionId) {
        $cacheId = "question_hierarchy_by_question_{$questionId}";
        $instance = self::getInstance(__CLASS__);

        // Retrieve question hierarchy if cache entry exists - otherwise create
        if(($questionHierarchy = $instance->_cache->load($cacheId)) === false) {
            $attributes = $instance->getDbTable()->select()
                ->where('question_id = ?', $questionId)
                ->limit(1)
                ->order('id ASC')
                ->query()
                ->fetch();

            // Check whether token retrieved
            if(!empty($attributes)) {
                $questionHierarchy = new self($attributes);
            }
            
            // Save question hierarchy to cache
            $instance->_cache->save($questionHierarchy, $cacheId);
        }

        return $questionHierarchy;
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
     * Method to get question hierarchy answer
     * @return Iris_Model_Abstract
     * @access public
     */
    public function getAnswer() {
        $cacheId = "question_hierarchy_answer_{$this->id}";

        // Retrieve answer if cache entry exists - otherwise create
        if(($answer = $this->_cache->load($cacheId)) === false) {
            $attributes = $instance->getDbTable()->select()
                ->from('answer')
                ->where('question_hierarchy_id = ?', $this->id)
                ->limit(1)
                ->order('id ASC')
                ->query()
                ->fetch();

            // Check whether token retrieved
            if(!empty($attributes)) {
                $answer = new Application_Model_Answer($attributes);
            }

            // Save answer to cache
            $this->_cache->save($answer, $cacheId);
        }

        return $answer;
    }

    /**
     * Method to get question hierarchy children
     * @return array
     * @access public
     */
    public function getChildren() {
        $cacheId = "question_hierarchy_children_{$this->id}";

        // Retrieve children if cache entry exists - otherwise create
        if(($children = $this->_cache->load($cacheId)) === false) {
            $children = Application_Model_QuestionHierarchy::fetchAll(array('response_id' => $this->responseId, 'left_limit > ?' => $this->leftLimit, 'right_limit < ?' => $this->rightLimit));

            // Save children to cache
            $this->_cache->save($children, $cacheId);
        }

        return $children;
    }

    /**
     * Method to get question hierarchy question
     * @return Iris_Model_Abstract
     * @access public
     */
    public function getQuestion() {
        return Application_Model_Question::find($this->questionId);
    }

}