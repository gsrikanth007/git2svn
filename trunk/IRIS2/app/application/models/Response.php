<?php

class Application_Model_Response extends Iris_Model_Abstract {

    /**
     * Model database table class
     * @var string
     */
    protected $_dbTableClass = 'Application_Model_DbTable_Response';

    /**
     * Model relationships
     * @var array
     */
    protected $_relationships = array('questionHierarchy', 'questionnaire', 'memberState');


    /**
     * Method to find model by unique identifer
     * @param mixed
     * @return Iris_Abstract_Model
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
     */
    public static function fetchAll($where = null, $order = null, $limit = null, $offset = null) {
        return parent::fetchAll(__CLASS__, $where, $order, $limit, $offset);
    }

    /**
     * Method to get response question hierarchy
     * @return array
     * @access public
     */
    public function getQuestionHierarchy() {
        $cacheId = "response_question_hierarchy_{$this->id}";

        // Retrieve question hierarchy if cache entry exists - otherwise create
        if(($questionHierarchy = $this->_cache->load($cacheId)) === false) {
            $questionHierarchy = Application_Model_QuestionHierarchy::fetchAll(array('response_id = ?' => $this->id));

            // Save question hierarchy to cache
            $this->_cache->save($questionHierarchy, $cacheId);
        }

        return $questionHierarchy;
    }

    /**
     * Method to get response questionnaire
     * @return Iris_Model_Abstract
     * @access public
     */
    public function getQuestionnaire() {
        return Application_Model_Questionnaire::find($this->questionnaireId);
    }

    /**
     * Method to get response member state
     * @return Iris_Model_Abstract
     * @access public
     */
    public function getMemberState() {
        return Application_Model_MemberState::find($this->memberStateId);
    }

    /**
     * Method to get response hierarchy
     * @param boolean $isNested
     * @return array
     * @access public
     */
    public function getHierarchy($isNested = true) {
        $cacheId = "response_hierarchy_{$this->id}";

        // Retrieve hierarchy if cache entry exists - otherwise create
        if(($hierarchy = $this->_cache->load($cacheId)) === false) {
            $hierarchy = $this->getDbTable()->getAdapter()->select()
                ->from('question_hierarchy')
                ->joinLeft('question', 'question_hierarchy.question_id = question.id', array('question_no', 'question_text', 'questionnaire_id'))
                ->joinLeft('answer', 'question_hierarchy.id = answer.question_hierarchy_id')
                ->where('question_hierarchy.response_id = ?', $this->id)
                ->order('question_hierarchy.left_limit ASC')
                ->query()
                ->fetchAll();

            // Save hierarchy to cache
            $this->_cache->save($hierarchy, $cacheId);
        }

        // Nest hierarchy where applicable
        if($isNested) {
            $hierarchy = $this->_buildHierarchy($hierarchy);
        }

        return $hierarchy;
    }

    /**
     * Method to get response hierarchy as XML
     * @param string $searchText
     * @return string
     * @access public
     */
    public function getHierarchyAsXml($searchText = null) {
        $hierarchy = $this->getHierarchy();
        return $this->_toXml($hierarchy, $searchText);
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
            // Get current question hierarchy node and right limit
            $questionHierarchy = $hierarchy[$index];

            // Check whether current node is child of previous node
            if((int)$questionHierarchy['right_limit'] < $rightLimit) {
                // Increment index (before attempting to retrieve child nodes)
                $index += 1;

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
        } while($index < $count && false === $break);

        return $tree;
    }

    /**
     * Method to transform hierarchy array into XML structure
     * @param string $searchText
     * @param array $hierarchy
     * @return string
     * @access protected
     */
    protected function _toXml(array $hierarchy, $searchText = null, $xml = null) {
        //header('content-type: text/html; charset=utf-8');
        //echo '<pre>'; print_r($hierarchy); echo '</pre>'; die;

        // Create new XML document if not provided
        if(is_null($xml)) {
            $xml = simplexml_load_string('<?xml version="1.0" encoding="utf-8"?><questionnaire />');

            $directiveNode = $xml->addChild('directive');
            $directiveNode->addChild('name', $this->questionnaire->directive->name);
            $directiveNode->addChild('period', $this->questionnaire->getReportingPeriod('Y'));

            $memberStateNode = $xml->addChild('memberState');
            $memberStateNode->addChild('name', $this->memberState->countryName);
            $memberStateNode->addChild('countryCode', $this->memberState->countryCode);
        }

        // Iterate through hierarchy nodes
        foreach($hierarchy as $node) {
            if(is_array($node)) {
                if(isset($node['children']) && !empty($node['children'])) {
                    $childNode = $xml->addChild('question');
                    $childNode->addAttribute('id', $node['question_no']);
                    $this->_toXml($node['children'], $searchText, $childNode);

                } else {
                    // Wrap search text matches in placeholder tags and convert &, >, < characters to HTML entities
                    $value = (0 < strlen($node['answer_text'])) ? str_ireplace($searchText, "<<[{$searchText}]>>", $node['answer_text']) : ' ';
                    $value = htmlspecialchars($value, ENT_NOQUOTES, 'UTF-8', false);

                    $childNode = $xml->addChild('question', $value);
                    $childNode->addAttribute('id', $node['question_no']);
                }

                // Add exception to create status attribute for installation questions
                if(in_array($node['question_no'], array('q-installation', 'q2-installation'))) {
                    $status = !empty($node['answer_text']) ? $node['answer_text'] : null;
                    $childNode->addAttribute('status', $status);
                }
            }
        }

        return $xml->asXML();
    }

}