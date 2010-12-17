<?php

class Bootstrap extends Zend_Application_Bootstrap_Bootstrap {

    /**
     * Method to initialise application config file
     * @return void
     * @access protected
     */
    protected function _initConfigOptions() {
        $config = new Zend_Config_Ini(APPLICATION_PATH . '/configs/application.ini', APPLICATION_ENV);
        Zend_Registry::set('config', $config);
    }

    /**
     * Method to initialise application database(s)
     * @return void
     * @access protected
     */
    protected function _initDatabase() {
        $resource = $this->getPluginResource('multidb');
        $resource->init();

        Zend_Registry::set('dqtDb', $resource->getDb('dqt'));
        Zend_Registry::set('gbrDb', $resource->getDb('gbr'));
    }

    /**
     * Method to initialise application caching
     * @return void
     * @access protected
     */
    protected function _initCaching() {
        $config = Zend_Registry::get('config');

        // Check whether cache directory path specified
        if(!isset($config->options->cache->path) || !($cacheDir = $config->options->cache->path)) {
            throw new Iris_Exception('Cache directory path must be provided');
        }

        // Check cache directory is writable
        if(!is_writable($cacheDir)) {
            throw new Iris_Exception("Unable to write to cache directory ({$cacheDir})");
        }

        // Create new Zend_Cache instance
        $cache = Zend_Cache::factory('Core', 'File', array(
            'caching' => false,
            'lifetime' => null,
            'automatic_serialization' => true,
        ), array(
            'cache_dir' => $cacheDir,
        ));

        Zend_Db_Table_Abstract::setDefaultMetadataCache($cache);
        Zend_Registry::set('cache', $cache);
    }

    /**
     * Method to initialise application routing
     * @return void
     * @access protected
     */
    protected function _initRouting() {
        // Bootstrap FrontController before attempting to get resource
        $this->bootstrap('frontController');
        $objFront = $this->getResource('frontController');

        // Read routes from ini file, prefixed by 'routes'
        $objFront->getRouter()->addConfig(new Zend_Config_Ini(APPLICATION_PATH . '/configs/routes.ini'), 'routes');
    }

}