{config_load file=test.conf section="setup"}
{include file="header.tpl" pagetitle=$help}


{include file="login.tpl"}

<div id="workarea">      
	<p>{$helptext}
	</p>
</div>
{include file="footer.tpl"}


