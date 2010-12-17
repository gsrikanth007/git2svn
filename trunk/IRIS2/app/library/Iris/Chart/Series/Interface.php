<?php

interface Iris_Chart_Series_Interface {

    /**
     * Method to get series name and data in structured array format
     * @example array('fruits', array('12', '6', '4'));
     * @param boolean $refresh
     * @return array
     * @access public
     */
    public function getData($refresh = false);

    /**
     * Method to get chart labels in structured array format
     * @example array(0 => 'Monday', 1 => 'Tuesday', 2 => 'Wednesday');
     * @return ArrayObject
     * @access public
     */
    public function getLabels();

    /**
     * Method to set parameters for query binding
     * @param array $params
     * @return Iris_Chart_Series
     * @access public
     */
    public function setParameters(array $params);

    /**
     * Method to get query parameters for binding
     * @return array
     * @access public
     */
    public function getParameters();

}