{include file='header.tpl'}

	<div id="main">

		<div id="main-precontents"></div>
		<div id="main-contents" class="main-contents">

			<script type="text/javascript">
				{if $ss_conf!=null}{include file='bricks/screenshots_table.tpl'}{/if}
				{include file='bricks/allcomments.tpl'}
				var g_pageInfo = {ldelim}type: {$page.type}, typeId: {$page.typeid}, name: '{$object.name|escape:"quotes"}'{rdelim};
				g_initPath({$page.path});				
			</script>

{if isset($object.key) or isset($object.lockpicking) or isset($object.mining) or isset($object.herbalism) or isset($wh_ss)}
			<table class="infobox">
				{*<tr><th>{#Quick_Facts#}</th></tr>*}
				<tr><td><div class="infobox-spacer"></div>
				<ul>
					{if isset($object.key)}<li><div>{#Key#}: <a class="q{$object.key.quality}" href="?item={$object.key.id}">[{$object.key.name}]</a></div></li>{/if}
					{if isset($object.lockpicking)}<li><div>{#Lockpickable#} (<span class="tip" onmouseover="Tooltip.showAtCursor(event, '{#Required_lockpicking_skill#}', 0, 0, 'q')" onmousemove="Tooltip.cursorUpdate(event)" onmouseout="Tooltip.hide()">{$object.lockpicking}</span>)</div></li>{/if}
					{if isset($object.mining)}<li><div>{#Mining#} (<span class="tip" onmouseover="Tooltip.showAtCursor(event, '{#Required_mining_skill#}', 0, 0, 'q')" onmousemove="Tooltip.cursorUpdate(event)" onmouseout="Tooltip.hide()">{$object.mining}</span>)</div></li>{/if}
					{if isset($object.herbalism)}<li><div>{#Herb#} (<span class="tip" onmouseover="Tooltip.showAtCursor(event, '{#Required_herb_skill#}', 0, 0, 'q')" onmousemove="Tooltip.cursorUpdate(event)" onmouseout="Tooltip.hide()">{$object.herbalism}</span>)</div></li>{/if}
				</ul>
				</td></tr>
				{if $ss_conf!= null}
						<th>{#Screenshots#}<span id="ss_num"></span>
						<div id="infobox-sticky" class="infobox-sticky"></div>
						<script type="text/javascript">ss_appendSticky()</script>
						</th>
				{/if}
			</table>
{/if}

			<div class="text">
			{if $option.wp_button==1}<a {if $object.entry!=null} onmouseover="Tooltip.showAtCursor(event, '<sub><img width=15 src=templates/wowhead/images/wowpedia.ico></sub> {#Wsearch#} {"WoWpedia.org"}', 0, 0, 'q')" onmousemove="Tooltip.cursorUpdate(event)" onmouseout="Tooltip.hide()" href="http://www.wowpedia.org/index.php?title=Special:Search&search={$object.name}&go=Go"{/if} class="button-red{if $object.entry==null}-disabled{/if}"><em><b><i>Wowpedia</i></b><span>Wowpedia</span></em></a>{/if}
			{if $option.wh_button==1}<a {if $option.wh_tooltip==1}rel="wowhead" href="http://www.wowhead.com/?{$query}"{else}onmouseover="Tooltip.showAtCursor(event, '<sub><img width=15 src=templates/wowhead/images/wowhead.png></sub> {#Wsearch#} {"Wowhead.com"}', 0, 0, 'q')" onmousemove="Tooltip.cursorUpdate(event)" onmouseout="Tooltip.hide()" href="http://www.wowhead.com/{$query}"{/if} class="button-red"><em><b><i>Wowhead</i></b><span>Wowhead</span></em></a>{/if}
				<h1>{$object.name}</h1>

{if $object.position}
				<div>{#This_Object_can_be_found_in#}
{strip}
				<span id="locations">
					{foreach from=$object.position item=zone name=zone}
						<a href="javascript:;" onclick="
							myMapper.update(
								{ldelim}
								{if $zone.atid}
									zone:{$zone.atid}
									{if $zone.points}
										,
									{/if}
								{else}
									show:false
								{/if}
								{if $zone.points}
									coords:[
										{foreach from=$zone.points item=point name=point}
												[{$point.x},{$point.y},
												{ldelim}
													label:'$<br>
													<div class=q0>
														<small>{#Respawn#}:
															{if isset($point.r.h)} {$point.r.h}{#hr#}{/if}
															{if isset($point.r.m)} {$point.r.m}{#min#}{/if}
															{if isset($point.r.s)} {$point.r.s}{#sec#}{/if}
															{if isset($point.events)}<br>{$point.events|escape:"quotes"}{/if}
														</small>
													</div>',type:'{$point.type}'
												{rdelim}]
												{if !$smarty.foreach.point.last},{/if}
										{/foreach}
									]
								{/if}
								{rdelim});
							g_setSelectedLink(this, 'mapper'); return false" onmousedown="return false">
							{$zone.name}</a>{if $zone.population > 1}&nbsp;({$zone.population}){/if}{if $smarty.foreach.zone.last}.{else}, {/if}
					{/foreach}
				</span></div>
{/strip}
				<div id="mapper-generic"></div>
				<div class="clear"></div>

				<script type="text/javascript">
					var myMapper = new Mapper({ldelim}parent: 'mapper-generic', zone: '{$object.position[0].atid}'{rdelim});
					gE(ge('locations'), 'a')[0].onclick();
				</script>

{else}
				{#This_Object_cant_be_found#}
{/if}

{if isset($object.pagetext)}
	<h3>Content</h3>
	<div id="book-generic"></div>
	{strip}
		<script>
			new Book({ldelim} parent: 'book-generic', pages: [
			{foreach from=$object.pagetext item=pagetext name=j}
				'{$pagetext|escape:"javascript"|replace:'InterfacePvPRankBadges':'templates/wowhead/images/pvp/'|replace:'PvPRank':'rank'|replace:'rankAlliance':'rank_a'|replace:'rankHorde':'rank_h'}'
				{if $smarty.foreach.j.last}{else},{/if}
			{/foreach}
			]{rdelim})
		</script>
	{/strip}
{/if}
				<h2>{#Related#}</h2>

			</div>

			<div id="tabs-generic"></div>
			<div id="listview-generic" class="listview"></div>
<script type="text/javascript">
var tabsRelated = new Tabs({ldelim}parent: ge('tabs-generic'){rdelim});
{if isset($object.drop)}{include			file='bricks/item_table.tpl'		id='contains'		name='contains'		tabsid='tabsRelated'	data=$object.drop		}{/if}
{if isset($object.starts)}{include			file='bricks/quest_table.tpl'		id='starts'			name='starts'		tabsid='tabsRelated'	data=$object.starts		}{/if}
{if isset($object.ends)}{include			file='bricks/quest_table.tpl'		id='ends'			name='ends'			tabsid='tabsRelated'	data=$object.ends		}{/if}
{if isset($object.criteria_of)}{include		file='bricks/achievement_table.tpl'	id='criteria-of'	name='criteriaof'	tabsid='tabsRelated'	data=$object.criteria_of}{/if}
new Listview({ldelim}template: 'comment', id: 'comments', name: LANG.tab_comments, tabs: tabsRelated, parent: 'listview-generic', data: lv_comments{rdelim});
{if $ss_conf<=2}new Listview({ldelim}template: 'screenshot', id: 'screenshots', name: LANG.tab_screenshots, tabs: tabsRelated, parent: 'listview-generic', data: lv_screenshots{rdelim});{/if}
new Listview({ldelim}template: 'comment', id: 'wh-comments', name: LANG.tab_wh_comments, tabs: tabsRelated, parent: 'listview-generic', data: wh_comments{rdelim});
{if $ss_conf>=2}new Listview({ldelim}template: 'screenshot', id: 'wh-screenshots', name: LANG.tab_wh_screenshots, tabs: tabsRelated, parent: 'listview-generic', data: wh_screenshots{rdelim});{/if}
tabsRelated.flush();
</script>
{if $user!=null}
{include file='bricks/contribute.tpl'}
{/if}
			</div>
		</div>
	</div>

{include file='footer.tpl'}
