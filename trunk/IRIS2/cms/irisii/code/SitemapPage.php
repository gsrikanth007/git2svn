<?php
class SitemapPage extends Page {

	public static $db = array();

	public static $has_one = array();

    public static $icon = 'themes/eionet/images/tree/sitemap';

}
class SitemapPage_Controller extends Page_Controller {

    /**
     * Method to build sitemap structure and return as a HTML unordered list
     * @return string
     */
    public function Sitemap() {
        $pages = DataObject::get('Page', 'ParentID = 0');
        return $this->_recursiveCrawlPages($pages);
    }


    /**
     * Method to recursively crawl page children to build each level of the sitemap
     * @param DataObjectSet $pages
     * @param integer $depth
     * @return string
     */
    protected function _recursiveCrawlPages($pages, $depth = 0) {
        $sitemapLevel = '';

        // Check whether one or more pages provided
        if(0 < count($pages)) {
            // Increment site map depth and prepare new unordered list
            $depth += 1;
            $sitemapLevel = "<ul class='sitemap sitemapLevel{$depth}'>\n";

            foreach($pages as $page) {
                if(($page->ID <> $this->ID) && !($page instanceof ErrorPage)) {
                    $sitemapLevel .= "<li><a href='{$page->AbsoluteLink()}' title='{$page->Title}'>{$page->Title}</a>";

                    $pages = DataObject::get('Page', "ParentID = {$page->ID} AND ShowInMenus = 1");
                    $sitemapLevel .= $this->_recursiveCrawlPages($pages, $depth);

                    $sitemapLevel .= "</li>\n";
                }
            }

            $sitemapLevel .= '</ul>';
        }

        return $sitemapLevel;
    }

}