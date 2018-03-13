{include file='header.tpl'}

		<div id="main">

			<div id="main-precontents"></div>

			<div id="main-contents" class="main-contents">
				<script type="text/javascript">
					{if $ss_conf!=null}{include file='bricks/screenshots_table.tpl'}{/if}
					{include file='bricks/allcomments.tpl'}
					var g_pageInfo = {ldelim}type: {$page.type}, typeId: {$page.typeid}, name: '{$itemset.name|escape:"quotes"}'{rdelim};
					g_initPath({$page.path});
				</script>

				<table class="infobox">
					<tr><th>{#Quick_Facts#}</th></tr>
					<tr><td><div class="infobox-spacer"></div>
						<ul>
							{if $itemset.note} <li><div>{$itemset.note}</div></li>{/if}
							{if $itemset.class} <li><div>{#Class#}: {$itemset.class}{/if}
							<li><div>{#Level#}: {$itemset.minlevel}{if $itemset.minlevel!=$itemset.maxlevel - {$itemset.maxlevel}{/if}</div></li>
							{if $user.roles == 5}<li><div><a href="?admin.editarticle=5.{$itemset.entry}">Troll</a></div></li>{/if}
							{if $itemset.Aflags & 2}<li><div>{#Not_Available_to_Players#}</div></li>{/if}
							{if $itemset.Aflags & 8}<li><div>{#No_Longer_Available_to_Players#}</div></li>{/if} 
							{if $itemset.Aflags & 16}<li><div>{#Added_in_patch_24#}</div></li>{/if} 
						</ul>
					</td></tr>
					{if $ss_conf!= null}
						<th>{#Screenshots#}<span id="ss_num"></span>
						<div id="infobox-sticky" class="infobox-sticky"></div>
						<script type="text/javascript">ss_appendSticky()</script>
						</th>
						{/if}
				</table>

				<div class="text">
				{if $option.wp_button==1}<a {if $itemset.name!=null} onmouseover="Tooltip.showAtCursor(event, '<sub><img width=15 src=templates/wowhead/images/wowpedia.ico></sub> {#Wsearch#} {"WoWpedia.org"}', 0, 0, 'q')" onmousemove="Tooltip.cursorUpdate(event)" onmouseout="Tooltip.hide()" href="http://www.wowpedia.org/index.php?title=Special:Search&search={$itemset.name}&go=Go"{/if} class="button-red"><em><b><i>Wowpedia</i></b><span><font {if $itemset.name==null}color=grey{/if}>Wowpedia</font></span></em></a>{/if}
				{if $option.wh_button==1}<a onmouseover="Tooltip.showAtCursor(event, '<sub><img width=15 src=templates/wowhead/images/wowhead.png></sub> {#Wsearch#} {"Wowhead.com"}', 0, 0, 'q')" onmousemove="Tooltip.cursorUpdate(event)" onmouseout="Tooltip.hide()" href="http://www.wowhead.com/{$query}" class="button-red"><em><b><i>Wowhead</i></b><span>Wowhead</span></em></a>{/if}
				{if $option.button==1}<a href="javascript:;" id="dsgndslgn464d" onclick="ModelViewer.show({ldelim} type: 4, equipList: [{foreach name=pieces from=$itemset.pieces key=k item=i}[{$i.slot},{$i.displayid}]{if $smarty.foreach.pieces.last}{else},{/if}{/foreach}], displayAd: 1, fromTag: 1, race: 2 {rdelim});" class="button-red"><em><b><i>{#Viewin3D#}</i></b><span>{#Viewin3D#}</span></em></a>{/if}
					<h1>{$itemset.name}</h1>
					{$itemset.article}
					{$itemset.name} -{if $itemset.note} <b>{$itemset.note}</b> -{/if} {#set_cont1#} {$itemset.count} {#set_cont2#}:
					<table class="iconlist">
						{section name=i loop=$itemset.pieces}<tr><th align="right" id="iconlist-icon{$smarty.section.i.index+1}"></th><td><span class="q{$itemset.pieces[i].quality}"><a href="?item={$itemset.pieces[i].entry}">{$itemset.pieces[i].name}</a></span></td></tr>{/section} 
					</table>
					<script type="text/javascript">
						{section name=i loop=$itemset.pieces}ge('iconlist-icon{$smarty.section.i.index+1}').appendChild(g_items.createIcon({$itemset.pieces[i].entry}, 0, 0));{/section}
					</script>
					<h3>{#set_bonus1#}</h3>

					{#set_bonus2#}
					<ul>
						{section name=i loop=$itemset.spells}<li><div>{$itemset.spells[i].bonus} {#set_cont2#}: <a href="?spell={$itemset.spells[i].entry}">{$itemset.spells[i].tooltip}</a></div></li>{/section}
					</ul>
				<h2>{#Related#}</h2>

			</div>

			<div id="tabs-generic"></div>
			<div id="listview-generic" class="listview"></div>
<script type="text/javascript">
var tabsRelated = new Tabs({ldelim}parent: ge('tabs-generic'){rdelim});
new Listview({ldelim}template: 'comment', id: 'comments', name: LANG.tab_comments, tabs: tabsRelated, parent: 'listview-generic', data: wh_comments{rdelim});
{if $ss_conf<=2  && $ss_conf != null}new Listview({ldelim}template: 'screenshot', id: 'screenshots', name: LANG.tab_screenshots, tabs: tabsRelated, parent: 'listview-generic', data: lv_screenshots{rdelim});{/if}
{if $ss_conf>=2}new Listview({ldelim}template: 'screenshot', id: 'wh-screenshots', name: LANG.tab_wh_screenshots, tabs: tabsRelated, parent: 'listview-generic', data: wh_screenshots{rdelim});{/if}
tabsRelated.flush();
</script>

{include file='bricks/contribute.tpl'}
			</div>
		</div>
	</div>
{include file='footer.tpl'}
