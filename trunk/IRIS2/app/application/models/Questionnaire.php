<?php

class Application_Model_Questionnaire extends Iris_Model_Abstract {

    /**
     * Model database table class
     * @var string
     */
    protected $_dbTableClass = 'Application_Model_DbTable_Questionnaire';

    /**
     * Model relationships
     * @var array
     */
    protected $_relationships = array('directive', 'questions', 'questionSectors', 'responses');


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
     * Method to get questionnaire reporting period as formatted string
     * @param string $dateFormat
     * @return string
     * @access public
     */
    public function getReportingPeriod($dateFormat = 'd/m/Y') {
        return date($dateFormat, strtotime($this->periodStart)) . ' - ' . date($dateFormat, strtotime($this->periodEnd));
    }

    /**
     * Method to get questionnaire directive
     * @return Iris_Model_Abstract
     * @access public
     */
    public function getDirective() {
        return Application_Model_Directive::find($this->directiveId);
    }

    /**
     * Method to get all questionnaires questions
     * @return array
     * @access public
     */
    public function getQuestions() {
        $cacheId = "questionnaire_questions_{$this->id}";

        // Retrieve questions if cache entry exists - otherwise create
        if(($questions = $this->_cache->load($cacheId)) === false) {
            $questions = Application_Model_Question::fetchAll(array('questionnaire_id = ?' => $this->id));

            // Save questions to cache
            $this->_cache->save($questions, $cacheId);
        }

        return $questions;
    }

    /**
     * Method to get all questionnaire question sectors
     * @return array
     * @access public
     */
    public function getQuestionSectors() {
        $cacheId = "questionnaire_question_sectors_{$this->id}";

        // Retrieve question sectors if cache entry exists - otherwise create
        if(($questionSectors = $this->_cache->load($cacheId)) === false) {
            $questionSectors = Application_Model_QuestionSector::fetchAll(array('questionnaire_id = ?' => $this->id));

            // Save question sectors to cache
            $this->_cache->save($questionSectors, $cacheId);
        }

        return $questionSectors;
    }

    /**
     * Method to get all questionnaire responses
     * @return array
     * @access public
     */
    public function getResponses() {
        $cacheId = "questionnaire_responses_{$this->id}";

        // Retrieve responses if cache entry exists - otherwise create
        if(($responses = $this->_cache->load($cacheId)) === false) {
            $responses = Application_Model_Response::fetchAll(array('questionnaire_id = ?' => $this->id));

            // Save responses to cache
            $this->_cache->save($responses, $cacheId);
        }

        return $responses;
    }

    /**
     * Method to get questionnaire hierarchy
     * @param boolean $isNested
     * @param integer $questionId
     * @param boolean $isRecursive
     * @return array
     * @access protected
     */
    public function getHierarchy($isNested = true, $questionId = null, $isRecursive = true) {
        $cacheId = "questionnaire_hierarchy_{$this->id}_" . (int)$questionId . '_' . (int)$isNested . '_' . (int)$isRecursive;

        // Retrieve hierarchy if cache entry exists - otherwise create
        if(($hierarchy = $this->_cache->load($cacheId)) === false) {
            $select = $this->getDbTable()->getAdapter()->select()
                ->from(array('parent' => 'question_hierarchy'), array())
                ->joinInner(array('child' => 'question_hierarchy'), 'parent.response_id = child.response_id')
                ->joinInner('question', 'child.question_id = question.id', array('question_no', 'question_text', 'questionnaire_id', 'is_mapped'))
                ->joinInner('response', 'parent.response_id = response.id', array())
                ->where('parent.left_limit <= child.left_limit')
                ->where('child.left_limit <= parent.right_limit')
                ->where('response.questionnaire_id = ?', $this->id)
                ->where('response.member_state_id = ?', 999)
                ->group('child.id')
                ->order('child.left_limit asc');

            // Add where clause if start question id specified
            if($questionId) {
                $select->where('parent.question_id = ?', $questionId);
            }

            if($questionId && !$isRecursive) {
                // If output is to be nested, include parent of children in results
                $select->where(($isNested) ? 'child.level <= parent.level + 1' : 'child.level = parent.level + 1');

            } elseif(!$isRecursive) {
                $select->where('child.level = 1');
            }

            // Save hierarchy to cache
            $this->_cache->save($hierarchy, $cacheId);
        }

        //
        $hierarchy = $select->query()->fetchAll();
        
        // Nest hierarchy where applicable
        if($isNested) {
            $hierarchy = $this->_buildHierarchy($hierarchy);
        }

        if($isNested && $questionId && !$isRecursive) {
            // If output is nested but not recursive return only children in results
            $hierarchy = (isset($hierarchy[0]['children'])) ? $hierarchy[0]['children'] : array();
        }

        return $hierarchy;
    }

    /**
     * Method to iterate through flat hierarchy array and to build nested tree hierarchy
     * @param array $hierarchy
     * @return array
     * @access protected
     */
    protected function _buildHierarchy(array $hierarchy) {
        // Get hierarchy root node and start building recursively
        $questionHierarchy = $hierarchy[0];
        $questionHierarchy['children'] = $this->_buildHierarchyRecursive($hierarchy, (int)$questionHierarchy['right_limit'], $index = 1, $count = count($hierarchy));
        return array($questionHierarchy);
    }

    /**
     * Method to iterate through flat hierarchy array and to build nested tree hierarchy
     * @param array $hierarchy
     * @param integer $rightLimit
     * @param integer $index
     * @return array
     * @access protected
     */
    protected function _buildHierarchyRecursive(&$hierarchy, $rightLimit, &$index, &$count) {
        $tree = array();
        $break = false;

        do {
            // Get current question hierarchy node
            if(isset($hierarchy[$index]) && ($questionHierarchy = $hierarchy[$index])) {
                // Check whether current node is child of previous node
                if((int)$questionHierarchy['right_limit'] < $rightLimit) {
                    // Increment index (before attempting to retrieve child nodes)
                    $index += 1;
                    //$questionHierarchy['children'] = array();

                    // If left limit + 1 is less than right limit current node has children
                    if((int)$questionHierarchy['left_limit'] + 1 < (int)$questionHierarchy['right_limit']) {
                        $questionHierarchy['children'] = $this->_buildHierarchyRecursive($hierarchy, (int)$questionHierarchy['right_limit'], $index, $count);
                    }

                    // Add leaf to tree
                    $tree[] = $questionHierarchy;

                } else {
                    // Set break to true and do not increment
                    $break = true;
                }
            }
        } while($index < $count && false === $break);

        return $tree;
    }

}