<?php

class Zend_View_Helper_MultiLine extends Zend_View_Helper_Abstract {

    /**
     * Method to prepare multi line content for output to view
     * @param string $content
     * @return string
     * @access public
     */
    public function multiLine($content) {
        return nl2br(trim($content, "\n"));
    }

}