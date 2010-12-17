<?php

interface Iris_Chart_Interface {

    /**
     * Method to get chart series in structured array format
     * @example
     *     Array: array(array('fruits', array(12, 6, 4)), array('vegetables', array(14, 9)));
     *     JSON:  [['fruits', [12, 6, 4]], ['vegetables', [14, 9]]]
     * @param string $format
     * @param boolean $refresh
     * @return mixed
     * @access public
     */
    public function getData($format = 'json', $refresh = false);

    /**
     * Method to get chart labels in structured array format
     * @example
     *     Array: array(0 => 'Monday', 1 => 'Tuesday', 2 => 'Wednesday');
     *     JSON:  {0: 'Monday', 1: 'Tuesday', 2: 'Wednesday'}
     * @param string $format
     * @return mixed
     * @access public
     */
    public function getLabels($format = 'json');

    /**
     * Method to determine whether chart has associated data series
     * @return boolean
     * @access public
     */
    public function hasSeries();

    /**
     * Method to determine whether chart has associated configuration options
     * @return boolean
     * @access public
     */
    public function hasOptions();

    /**
     * Method to set parameters for query binding
     * @param array $params
     * @return Iris_Chart_Interface
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