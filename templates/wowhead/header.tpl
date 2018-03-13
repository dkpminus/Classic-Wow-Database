<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>
{include file='head.tpl'}
</head>

<body {if $expansion == 1}style="background:black url(templates/wowhead/images/bg_tbc_bot.jpg) center -200px no-repeat!important;"{/if}{if $query=="guide=aq-war-effort"}style="background:rgba(26, 15, 9, 16) url(templates/wowhead/images/bg_aq.jpg) right -50px no-repeat;"{/if}>
<div id="layers"></div>
<!--[if lte IE 6]><table id="ie6layout"><tr><th class="ie6layout-th"></th><td id="ie6layout-td"><div id="ie6layout-div"></div><![endif]-->
<div id="layout">
	<div id="header">
		<div id="header-logo" {if $expansion == 1}style="background:url(templates/wowhead/images/logo_tbc.png) no-repeat!important;"{/if}>
			<a href="."></a>
			<h1>{$page.Title|escape:"html"}</h1>
		</div>
	</div>

		<div id="wrapper" class="nosidebar">
		<div id="toptabs">
			<div id="toptabs-inner">
				<div id="toptabs-right">
					<div id="toplinks" class="toplinks">
						{if $user.roles == 2 && $page.typeid && $ss_conf >= 2}<a onmouseover="Tooltip.showAtCursor(event, '{"Delete Wowhead screenshtos and comments for this article. They are re-loaded after this."}', 0, 0, 'q')" onmousemove="Tooltip.cursorUpdate(event)" onmouseout="Tooltip.hide()" id="delete-cache" href="?plugin=delinfo&type={$page.type}&typeid={$page.typeid}"><sub><img src="templates/wowhead/images/close.gif"></sub></a>{/if}
						<a onmouseover="Tooltip.showAtCursor(event, '{"Feedback!"}', 0, 0, 'q')" onmousemove="Tooltip.cursorUpdate(event)" onmouseout="Tooltip.hide()" href="javascript:;" id="feedback-connect" class="icon-email" onclick="Lightbox.show('feedback', {ldelim}onShow: aowow.feedback.form{rdelim});"></a>
						{if $user}<a id="user-link-admin" href="?account"><sub><img src="templates/wowhead/images/cog.gif"></sub></a>|<a id="toplinks-user" href="?user={$user.name}">{$user.name}</a><font size="-1" class=q0>|</font><a href="?account=signout{if $query}&amp;next={$query|escape}{/if}">{#Sign_out#}</a>{else}<a href="?account=signin{if $query!="account=signin"}&amp;next={$query|escape}{/if}">{#Sign_in#}</a>{/if}
						{*<font size="-1" class=q0>|</font><a href="javascript:;" id="toptabs-menu-language">{#Language#} <small>&#9660;</small></a> | {if $smarty.now|date_format:"%H%M" > 1800}Evening{elseif $smarty.now|date_format:"%H%M" < 1800}Day{elseif $smarty.now|date_format:"%H%M" < 1200}Morning{elseif $smarty.now|date_format:"%H%M" < 0600}Night{/if}*}
						<script type="text/javascript">g_initHeaderMenus();</script>
					</div>
				</div>
				<div id="ptewhjkst46"></div>
				<div class="clear"></div>
			</div>
		</div>
		<div id="topbar-search"><div class="topbar-search"><form action="."><a href="javascript:;"></a><input class="topbar-search" name="search" size="35" value="" id="oh2345v5ks" /></form>

		<script type="text/javascript">var _ = ge('oh2345v5ks'); LiveSearch.attach(_); _.focus();</script>

		</div></div>
		<div id="topbar"><span id="kbl34h6b43" class="menu-buttons"></span><div class="clear"></div></div>
		{strip}<script type="text/javascript">
			g_initHeader({$page.tab});

			{if $allitems}{include			file='bricks/allitems_table.tpl'		data=$allitems			}{/if}
			{if $allspells}{include			file='bricks/allspells_table.tpl'		data=$allspells			}{/if}
			{if $allachievements}{include	file='bricks/allachievements_table.tpl'	data=$allachievements	}{/if}
			{* TODO: Factions, Quests, NPCs, Objects, g_gatheredzones(?) *}
		</script>{/strip}
