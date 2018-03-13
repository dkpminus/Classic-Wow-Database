{include file='header.tpl'}

	<div id="main">

		<div id="main-precontents"></div>
		<div id="main-contents" class="main-contents">

			<script type="text/javascript">
			{if $ss_conf!=null}{include file='bricks/screenshots_table.tpl'}{/if}
				{include file='bricks/allcomments.tpl'}
				var g_pageInfo = {ldelim}type: {$page.type}, typeId: {$page.typeid}, name: '{$zone.name|escape:"quotes"}'{rdelim};
				g_initPath({$page.path});
			</script>

			<div class="text">
			<table class="infobox">
					<tr><th>{#Quick_Facts#}</th></tr>
					<tr><td><div class="infobox-spacer"></div></td></tr>
					{if $ss_conf!= null}
						<th>{#Screenshots#}<span id="ss_num"></span>
						<div id="infobox-sticky" class="infobox-sticky"></div>
						<script type="text/javascript">ss_appendSticky()</script>
						</th>
						{/if}
				</table>
				<a href="http://www.wowhead.com/?{$query}" class="button-red"><em><b><i>Wowhead</i></b><span>Wowhead</span></em></a>
				<h1>{$zone.name}</h1>
				
					<div id="mapper-generic"></div>
					<div class="clear"></div>
{if $zone.position}
				<div>
{strip}
				<span id="locations">
					{foreach from=$zone.position item=zoneitem name=zoneitem}
						<a onmouseover="Tooltip.showAtCursor(event, '{$zoneitem.name}{if $zoneitem.population > 1}&nbsp;({$zoneitem.population}){/if}', 0, 0, 'q')" onmousemove="Tooltip.cursorUpdate(event)" onmouseout="Tooltip.hide()" class="map-link" href="javascript:;" onclick="
							myMapper.update(
								{ldelim}
								{if $zoneitem.atid}
									zone:{$zoneitem.atid}
									{if isset($zoneitem.points)}
										,
									{/if}
								{else}
									show:false
								{/if}
								{if isset($zoneitem.points)}
									coords:[
										{foreach from=$zoneitem.points item=point name=point}
												[{$point.x},{$point.y},
												{ldelim}
													label:'<span class={if $point.react.A==-1 && $point.react.H==1}horde-icon{elseif $point.react.A==1 && $point.react.H==-1}alliance-icon{/if}></span>{if isset($point.name)}<b class=q>{$point.name|escape:"html"|escape:"html"}</b>&nbsp({$point.x},&nbsp{$point.y}){else}${/if}
													{if $point.subname}<br>{$point.subname|escape:"html"|escape:"html"}{/if}																																							
													{if isset($point.r.h) or isset($point.r.m) or isset($point.r.s) or isset($point.events)}
													<div class=q0>
														<small>{#Respawn#}:
															{if isset($point.r.h)} {$point.r.h}{#hr#}{/if}
															{if isset($point.r.m)} {$point.r.m}{#min#}{/if}
															{if isset($point.r.s)} {$point.r.s}{#sec#}{/if}
															{if isset($point.events)}<br>{$point.events|escape:"quotes"}{/if}
														</small>
													</div>
													{/if}
													{if isset($point.quests)}<br>Starts quests:
														{foreach from=$point.quests item=quest name=quest}
															<br>&nbsp<span class=q0>[{if $quest.lvl == 0}1{else}{$quest.lvl}{/if}]</span>&nbsp<span>{$quest.title|escape:"html"|escape:"html"}</span>{if $quest.classs}&nbsp<i class=q0>({$quest.classs})</i>{/if}
														{/foreach}
													{/if}
													<div class=q2>Click to view this NPC</div>																										
													',
													{if isset($point.url)}url:'{$point.url|escape:"quotes"}{if isset($point.quests)}#starts{/if}',{/if}
													type:'{if $point.react.A==-1 && $point.react.H==1}2{elseif $point.react.A==1 && $point.react.H==-1}3{/if}'
												{rdelim}]
												{if !$smarty.foreach.point.last},{/if}
										{/foreach}
									]
								{/if}
								{rdelim});
							g_setSelectedLink(this, 'mapper'); return false" onmousedown="return false">
							{if $zoneitem.name}<img alt="{$zoneitem.name}" id="map-prof" src="templates/wowhead/images/{$zoneitem.img}">{/if}</a>
					{/foreach}
				</span>       </div>
{/strip}
{/if}
{if $zone.herbss}
				<div>
{strip}
					{foreach from=$zone.herbs item=zoneitem name=zoneitem}
						<a onmouseover="Tooltip.showAtCursor(event, '{$zoneitem.name|escape:"javascript"}{if $zoneitem.population > 1}&nbsp;({$zoneitem.population}){/if}', 0, 0, 'q')" onmousemove="Tooltip.cursorUpdate(event)" onmouseout="Tooltip.hide()" class="map-link" href="javascript:;" onclick="
							myMapper.update(
								{ldelim}
								{if $zoneitem.atid}
									zone:{$zoneitem.atid}
									{if isset($zoneitem.points)}
										,
									{/if}
								{else}
									show:false
								{/if}
								{if isset($zoneitem.points)}
									coords:[
										{foreach from=$zoneitem.points item=point name=point}
												[{$point.x},{$point.y},
												{ldelim}
													label:'<span class={if $point.react.A==-1 && $point.react.H==1}horde-icon{elseif $point.react.A==1 && $point.react.H==-1}alliance-icon{/if}></span>{if isset($point.name)}<b class=q>{$point.name|escape:"html"|escape:"html"}</b>&nbsp({$point.x},&nbsp{$point.y}){else}${/if}
													{if $point.subname}<br>{$point.subname|escape:"html"|escape:"html"}{/if}																																							
													{if isset($point.r.h) or isset($point.r.m) or isset($point.r.s) or isset($point.events)}
													<div class=q0>
														<small>{#Respawn#}:
															{if isset($point.r.h)} {$point.r.h}{#hr#}{/if}
															{if isset($point.r.m)} {$point.r.m}{#min#}{/if}
															{if isset($point.r.s)} {$point.r.s}{#sec#}{/if}
															{if isset($point.events)}<br>{$point.events|escape:"quotes"}{/if}
														</small>
													</div>
													{/if}
													{if isset($point.quests)}<br>Starts quests:
														{foreach from=$point.quests item=quest name=quest}
															<br>&nbsp<span class=q0>[{if $quest.lvl == 0}1{else}{$quest.lvl}{/if}]</span>&nbsp<span>{$quest.title|escape:"html"|escape:"html"}</span>{if $quest.classs}&nbsp<i class=q0>({$quest.classs})</i>{/if}
														{/foreach}
													{/if}
													<div class=q2>Click to view this Object</div>																										
													',
													{if isset($point.url)}url:'{$point.url|escape:"quotes"}{if isset($point.quests)}#starts{/if}',{/if}
													type:'1'
												{rdelim}]
												{if !$smarty.foreach.point.last},{/if}
										{/foreach}
									]
								{/if}
								{rdelim});
								g_setSelectedLink(this, 'mapper'); return false" onmousedown="return false">
							{if $zoneitem.name}<img alt="{$zoneitem.name}" id="map-prof-up" src="templates/wowhead/images/school_6.png">{/if}</a>
					{/foreach}
				</div>
{/strip}
{/if}
				<script type="text/javascript">
					var myMapper = new Mapper({ldelim}parent: 'mapper-generic', zone: '{$zone.position[0].atid}'{rdelim});
					gE(ge('locations'), 'a')[0].onclick();
				</script>
{if isset($zone.parentname) and isset($zone.parent)}
				<div class="pad"></div>
				<div>{#This_zone_is_part_of#} <a href="?zone={$zone.parent}">{$zone.parentname}</a>.</div>
{/if}
				<h2>{#Related#}</h2>
			</div>

			<div id="tabs-generic"></div>
			<div id="listview-generic" class="listview"></div>
<script type="text/javascript">
var tabsRelated = new Tabs({ldelim}parent: ge('tabs-generic'){rdelim});
{if isset($zone.fishing)}{include file='bricks/item_table.tpl' id='fishing' name='fishing' tabsid='tabsRelated' data=$zone.fishing}{/if}
{if isset($zone.quests)}{include file='bricks/quest_table.tpl' id='quests' name='quests' tabsid='tabsRelated' data=$zone.quests}{/if}
{if isset($zone.subzones)}{include file='bricks/zone_table.tpl' id='zones' tabsid='tabsRelated' data=$zone.subzones name='zones'}{/if}
new Listview({ldelim}template: 'comment', id: 'comments', name: LANG.tab_comments, tabs: tabsRelated, parent: 'listview-generic', data: wh_comments{rdelim});
{if $ss_conf<=2 && $ss_conf != null}new Listview({ldelim}template: 'screenshot', id: 'screenshots', name: LANG.tab_screenshots, tabs: tabsRelated, parent: 'listview-generic', data: lv_screenshots{rdelim});{/if}

{if $ss_conf>=2}new Listview({ldelim}template: 'screenshot', id: 'wh-screenshots', name: LANG.tab_wh_screenshots, tabs: tabsRelated, parent: 'listview-generic', data: wh_screenshots{rdelim});{/if}
tabsRelated.flush();
</script>

{include file='bricks/contribute.tpl'}

			</div>
		</div>
	</div>

{include file='footer.tpl'}
