<?php

class Iris_Chart_AccumulatorBar extends Iris_Chart_Abstract implements Iris_Chart_Interface {

    /**
     * Method to get all chart series
     * @return array
     * @access public
     */
    public function getSeries() {
        $cacheId = "chart_series_{$this->id}";

        // Retrieve chart series if cache entry exists - otherwise create
        if(($series = $this->_cache->load($cacheId)) === false) {
            // Bluff.AccumulatorBar chart accepts only series
            $series = Iris_Chart_Series::fetchAll(array('chart_id = ?' => $this->id), 'id ASC', 1);

            // Save chart series to cache
            $this->_cache->save($series, $cacheId);
        }

        return $series;
    }

}