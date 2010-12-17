<?php

class Application_Model_Question extends Iris_Model_Abstract {

    /**
     * Model database table class
     * @var string
     */
    protected $_dbTableClass = 'Application_Model_DbTable_Question';

    /**
     * Model relationships
     * @var array
     */
    protected $_relationships = array('chart', 'mappings', 'type');


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
     * Method to determine whether question has a chart
     * @return boolean
     * @access public
     */
    public function hasChart() {
        return (bool)(isset($this->chartId) && 0 < $this->chartId);
    }

    /**
     * Method to get question chart
     * @return Iris_Model_Abstact
     * @access public
     */
    public function getChart() {
        return Application_Model_Chart::find($this->chartId);
    }

    /**
     * Method to get mapped questions
     * @param integer $mappedQuestionnaireId
     * @return array
     * @access public
     */
    public function getMappings($mappedQuestionnaireId = 0) {
        $cacheId = "question_mappings_{$this->id}_{$mappedQuestionnaireId}";

        // Retrieve mappings if cache entry exists - otherwise create
        if(($mappings = $this->_cache->load($cacheId)) === false) {
            $select = $this->getDbTable()->getAdapter()->select()
                ->from('question')
                ->joinLeft('question_mapping', 'question_mapping.mapped_question_id = question.id', array())
                ->where('question_mapping.question_id = ?', $this->id)
                ->where('question_mapping.questionnaire_id = ?', $this->questionnaireId);

            if(0 < $mappedQuestionnaireId) {
                $select->where('question_mapping.mapped_questionnaire_id = ?', $mappedQuestionnaireId);
            }

            $mappings = $select->query()->fetchAll();

            if(0 < count($mappings)) {
                foreach($mappings as $index => $attributes) {
                    $mappings[$index] = new self($attributes);
                }
            }

            // Save mappings to cache
            $this->_cache->save($mappings, $cacheId);
        }

        return $mappings;
    }

    /**
     * Method to get question type
     * @return Iris_Model_Abstact
     * @access public
     */
    public function getType() {
        return Application_Model_QuestionType::find($this->questionTypeId);
    }

    /**
     * Method to get question children
     * @param boolean $recursive
     * @return array
     * @access public
     */
    public function getChildren($recursive = false) {
        $cacheId = "question_children_{$this->id}_" . (int)$recursive;

        // Retrieve children if cache entry exists - otherwise create
        if(($children = $this->_cache->load($cacheId)) === false) {
            // Check whether question hierarchy instance found
            if(($questionHierarchy = Application_Model_QuestionHierarchy::findByQuestionId($this->id))) {
                $select = $this->getDbTable()->getAdapter()->select()
                    ->from('question')
                    ->joinLeft('question_hierarchy', 'question.id = question_hierarchy.question_id', array())
                    ->where('question_hierarchy.left_limit > ?', $questionHierarchy->leftLimit)
                    ->where('question_hierarchy.right_limit < ?', $questionHierarchy->rightLimit)
                    ->where('question_hierarchy.response_id = ?', $questionHierarchy->responseId)
                    ->group('question_hierarchy.question_id');

                if(false === $recursive) {
                    $select->where('question_hierarchy.level = ?', $questionHierarchy->level + 1);
                }

                $children = $select->query()->fetchAll();

                // Create Application_Model_Question instance for each child question found
                if(0 < count($children)) {
                    foreach($children as $index => $attributes) {
                        $children[$index] = new self($attributes);
                    }
                }

                // Save children to cache
                $this->_cache->save($children, $cacheId);
            }
        }

        return $children;
    }

    /**
     * Method to get question ancestors
     * @return array
     * @access public
     */
    public function getAncestors() {
        $cacheId = "question_ancestors_{$this->id}";

        // Retrieve ancestors if cache entry exists - otherwise create
        if(($ancestors = $this->_cache->load($cacheId)) === false) {
            $ancestors = $this->getDbTable()->getAdapter()
                ->query(
                    'select question.*
                    from (
                        select question_hierarchy.question_id, question_hierarchy.left_limit, question_hierarchy.right_limit
                        from question_hierarchy
                        left join response on question_hierarchy.response_id = response.id
                        where response.questionnaire_id = ?
                        group by question_hierarchy.question_id
                        order by question_hierarchy.left_limit asc
                    ) as parent
                    inner join (
                        select question_hierarchy.question_id, question_hierarchy.left_limit, question_hierarchy.right_limit
                        from question_hierarchy
                        left join response on question_hierarchy.response_id = response.id
                        where response.questionnaire_id = ?
                        group by question_hierarchy.question_id
                        order by question_hierarchy.left_limit asc
                    ) as leaf
                    left join question on parent.question_id = question.id
                    where leaf.left_limit > parent.left_limit
                    and leaf.left_limit < parent.right_limit
                    and leaf.question_id = ?
                    order by parent.left_limit asc',
                    array($this->questionnaireId, $this->questionnaireId, $this->id)
                )
                ->fetchAll();

            // Create Application_Model_Question instances for each ancestor found
            if(0 < count($ancestors)) {
                foreach($ancestors as $index => $attributes) {
                    $ancestors[$index] = new self($attributes);
                }
            }

            // Save ancestors to cache
            $this->_cache->save($ancestors, $cacheId);
        }

        return $ancestors;
    }

}