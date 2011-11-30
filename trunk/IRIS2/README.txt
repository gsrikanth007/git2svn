IRIS II Project Notes
----------------------------------------------------------------------------------------------------------


1. Data Query Tool (DQT) & General Binding Rules (GBR)
   ----------------------------------------------------

   The application side of the project (/app/) utilizes Zend Framework v1.11. During installation the Zend/       library should be available from /app/library 


2. IRIS II Content Management Site 
   ----------------------------------------------------

   The CMS part uses SilverStripe version 2.4 (which should be all included within the SVN)

   The silverstripe document should be refered to when using the CMS


3. Charts within IRIS II
   ----------------------------------------------------

   The site uses static charts, which are images stored within the CMS admin interface "Files & Images"
   with various folders. These charts come from various sources including the VITO report.

   Charts can be added/updated when required and pulled into Pages, via the Insert Image facility provided         within the SilverStripe CMS Editor. Image source can be specifed on the right had side. In somecases it         might be quicker to delete any existing charts from a page and re-insert them with the modified charts.

   For more information on using Silverstripe please check SilverStripe.org