<?php

class Zend_View_Helper_QuestionTree extends Zend_View_Helper_Abstract {

    /**
     * Comparison token
     * @var string
     */
    protected $_token;

    /**
     * Asynchronous request flag
     * @var boolean
     */
    protected $_isAsync;


    /**
     * Method to transform nested hierarchy an unordered HTML list
     * @param array $tree
     * @param string $token
     * @param boolean $isAsync
     * @return string
     * @access public
     */
    public function questionTree(array $tree, $token, $isAsync = false) {
        // Set token and asynchronous flag values
        $this->_token = $token;
        $this->_isAsync = $isAsync;

        return $this->_renderTree($tree, true);
    }

    /**
     * Method to iterate through nested tree hierarchy and build unordered HTML list
     * @param array $tree
     * @param boolean $isTopLevel
     * @return string
     * @access protected
     */
    protected function _renderTree(array $tree, $isTopLevel = false) {
        $html = '';

        // Check that populated tree provided
        if(!empty($tree)) {
            $html .= "<ul>\n";

            // Iterate through each leaf within tree
            foreach($tree as $leaf) {
                // Prepare URL and question number
                $url = $this->view->url(array('token' => $this->_token, 'question' => $leaf['question_id']), 'compare_token');
                $questionId = $leaf['question_id'];
                $questionNo = $leaf['question_no'];
                $questionNo .= ($leaf['is_mapped'] === '1') ? ' [M]' : '';
                $questionText = $leaf['question_text'];
                $class = (isset($leaf['children'])) ? 'hasChildren' : 'noChildren';
                
                $html .= "<li class='{$class} collapsed'>\n";                
                $html .= "<a class='question' href='{$url}' title='{$questionText}'>{$questionNo}</a>\n";
                $html .= ($this->_isAsync && isset($leaf['children'])) ? "<a class='showHide' href='#' rel='{$questionId}' title='Expand/collapse question tree'>Expand</a>\n" : '';

                // Process children of current leaf (if any)
                if(isset($leaf['children'])) {
                    $html .= $this->_renderTree($leaf['children']);
                }

                $html .= "</li>\n";
            }

            $html .= "</ul>\n";
        }

        return $html;
    }
    
}