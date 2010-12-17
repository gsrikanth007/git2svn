<?php

class Iris_Chart_Pie extends Iris_Chart_Abstract implements Iris_Chart_Interface {

    /**
     * Method to get chart series in specified structured format
     * @param string $format
     * @param boolean $refresh
     * @return mixed
     * @access public
     */
    public function getData($format = self::DATA_FORMAT_JSON, $refresh = false) {
        $data = array();

        if(empty($this->_data) || $refresh) {
            $this->_prepareData();
        }

        // Bluff.Pie chart accepts only one data point per series
        // Iterate through data series and remove key values
        if(!empty($this->_data)) {
            foreach($this->_data as $series) {
                foreach($series[1] as $key => $value) {
                    array_push($data, array($key, $value));
                }
            }
        }
        
        return $this->_format($data, $format);
    }
    
}