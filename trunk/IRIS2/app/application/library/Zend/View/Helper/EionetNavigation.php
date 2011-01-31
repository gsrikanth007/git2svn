<?php

class Zend_View_Helper_EionetNavigation extends Zend_View_Helper_Abstract {

    /**
     * Method to retrieve and output Eionet navigation
     * 
     * @param string $location
     * @param integer $page
     * @return string
     * @access public
     */
    public function eionetNavigation($location = 'header', $page = 0) {
        $navigation = '';

        switch($location) {
            case 'header':
                $url = 'http://www.eionet.europa.eu/dropdownmenus.txt';
                $navigation = file_get_contents($url);
                break;
            case 'left':
                $baseUrl = $this->view->baseUrl();
                $baseUrl = substr($baseUrl, 0, strrpos($baseUrl, '/'));
                $url = "http://{$_SERVER['SERVER_NAME']}{$baseUrl}/home/LeftNavigation?page=%d";
                $navigation = file_get_contents(sprintf($url, $page));
                break;
        }

        return $navigation;
    }

}