<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="$ContentLocale">
    <head>
        <% base_tag %>
        $MetaTags(false)
        <title>$Title - $SiteConfig.Title - Eionet</title>
        <link rel="stylesheet" type="text/css" href="http://www.eionet.europa.eu/styles/eionet2007/screen.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="$ThemeDir/stylesheets/layout.css" media="screen" />
        <link rel="shortcut icon" href="$ThemeDir/images/favicon.ico" type="image/vnd.microsoft.icon" />
        <link rel="icon" href="$ThemeDir/images/eeaicon.gif" type="image/gif" />
        <link rel="start" title="Home" href="/" />
        <link rel="alternate" type="application/rss+xml" title="Eionet headlines" href="http://www.eionet.europa.eu/announcements.rdf" />
        <script type="text/javascript" src="http://www.eionet.europa.eu/styles/eionet2007/pageops.js"></script>
        <script type="text/javascript" src="$ThemeDir/javascripts/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="$ThemeDir/javascripts/iris.js"></script>
        <script type="text/javascript">
            /*<![CDATA[*/
            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-20285006-1']);
            _gaq.push(['_trackPageview']);

            (function() {
                var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
            })();
            /*]]>*/
        </script>
    </head>

    <body>
        <div id="container">
            <div id="toolribbon">
                <div id="lefttools">
                    <a id="skiplink" href="#workarea" accesskey="2"><span>Skip to content</span></a>
                    <a id="eealink" href="http://www.eea.europa.eu/" target="_blank">EEA</a>
                    <a id="ewlink" href="http://ew.eea.europa.eu/" target="_blank">EnviroWindows</a>
                </div>

                <div id="righttools">
                    <a href="Security/login" id="loginlink">Login</a>
                    <a id="printlink" title="Print this page" href="javascript:this.print();"><span>Print</span></a>
                    <a id="fullscreenlink" href="javascript:toggleFullScreenMode()" title="Switch to/from full screen mode"><span>Switch to/from full screen mode</span></a>
                    <a id="acronymlink" href="http://www.eionet.europa.eu/acronyms" title="Look up acronyms"><span>Acronyms</span></a>
                    <a id="rsslink" type="application/rss+xml" href="http://www.eionet.europa.eu/announcements.rdf" title="Eionet headlines as RSS"><span>RSS</span></a>
                    <% include Search %>
                </div>
            </div><!-- toolribbon -->

            <div id="pagehead">
                <a title="Frontpage" href="/"><img src="http://www.eionet.europa.eu/styles/eionet2007/eea-print-logo.gif" alt="Logo" id="logo" width="428" height="87" /></a>
                <div id="networktitle">Eionet</div>
                <div id="sitetitle">Industrial emissions Reporting Information System (IRIS)</div>
                <div id="sitetagline"></div>
            </div>

            <div id="menuribbon">
                $HeaderNavigation
            </div>

            <div class="breadcrumbtrail">
				<div class="breadcrumbhead">You are here:</div>
				<div class="breadcrumbitem eionetaccronym"><a href="http://www.eionet.europa.eu">Eionet</a></div>
                $Breadcrumbs
				<div class="breadcrumbtail"></div>
			</div>

            <div id="contentWrapper">
                <div id="leftcolumn">
                    <% include LeftNavigation %>
                </div>

                <div id="workarea">
                    <div id="irisContent">
                        <a name="top"></a>
                        $Layout
                    </div>
                </div>
            </div>
        </div>

        <div id="pagefoot">
            <p>
                <a href="http://www.eea.europa.eu/legal/copyright" title="&copy; Copyright 1995 - 2008" target="_blank">&copy; Copyright 1995 - 2008</a>,
                <a href="http://www.eea.europa.eu/legal/disclaimer" title="Disclaimer" target="_blank">Disclaimer</a>,
                <a href="http://www.eea.europa.eu/legal/privacy" title="Privacy Policy" target="_blank">Privacy Policy</a>,
                Contact <a href="http://www.eea.europa.eu/help/contact-info" title="EEA Web Team" target="_blank">EEA Web Team</a>,
                Contact <a href="dqt/contact" title="DG Environment">DG Environment</a>,
                <a href="http://ec.europa.eu/environment/air/pollutants/stationary/ippc/index.htm" title="IPPC Europa" target="_blank">IPPC Europa</a>
            </p>
        </div>
    </body>
</html>