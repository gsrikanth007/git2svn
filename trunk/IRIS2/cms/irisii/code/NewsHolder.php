<?php
class NewsHolder extends Page {

	public static $db = array();

	public static $has_one = array();

    public static $allowed_children = array(
        'NewsPage',
    );

    public static $default_child = 'NewsPage';
    public static $icon = 'themes/eionet/images/tree/newspaper';

}
class NewsHolder_Controller extends Page_Controller {

    /**
     * Method to initialise NewsHolder_Controler instance
     */
    public function init() {
        RSSFeed::linkToFeed($this->Link() . 'rss');
        parent::init();
    }


    /**
     * Method to create RSS feed of news items
     */
    public function rss() {
        $rss = new RSSFeed($this->Children(), $this->Link(), 'Latest News');
        $rss->outputToBrowser();
    }


    /**
     * Method to get paginated list of articles
     *
     * @param integer $limit
     * @return mixed
     */
    public function PaginatedArticles($limit = 10) {
        $offset = isset($_GET['start']) ? (int)$_GET['start'] : 0;
        return DataObject::get('NewsPage', "ParentID = {$this->ID}", 'Date DESC', '', "{$offset},{$limit}");
    }

}