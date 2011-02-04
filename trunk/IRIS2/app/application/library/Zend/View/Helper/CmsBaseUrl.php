<?php

class Zend_View_Helper_CmsBaseUrl extends Zend_View_Helper_Abstract {

    /**
     * Returns CMS base url or file with CMS base url prepended
     *
     * @param string $file
     * @return string
     */
    public function cmsBaseUrl($file = null) {
        $cmsBaseUrl = $this->getCmsBaseUrl();

        // Remove trailing slashes
        if (!is_null($file)) {
            $file = '/' . ltrim($file, '/\\');
        }

        return $cmsBaseUrl . $file;
    }

    /**
     * Get CMS base url as defined in application.ini
     *
     * @return string
     */
    public function getCmsBaseUrl() {
        $config = new Zend_Config_Ini(APPLICATION_PATH . '/configs/application.ini', APPLICATION_ENV);
        $cmsBaseUrl = (isset($config->options->cms->baseUrl)) ? $config->options->cms->baseUrl : '';
        $cmsBaseUrl = (1 < strlen($cmsBaseUrl)) ? rtrim($cmsBaseUrl, '/') : $cmsBaseUrl;
        return $cmsBaseUrl;
    }

}
