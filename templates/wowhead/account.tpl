{include file='header.tpl'}

	<div id="main">

		<div id="main-precontents"></div>
		<div id="main-contents" class="main-contents">

			{* <script type="text/javascript">
				{include file='bricks/allcomments.tpl'}
				var g_pageInfo = {ldelim}type: {$page.type}, typeId: {$page.typeid}, name: '{$zone.name|escape:"quotes"}'{rdelim};
				g_initPath({$page.path});
			</script> *}

			<div class="text">
				<h1>Account Settings : {$account.username}</h1>
			</div>

<div id="tabs_contribute-generic"></div>
<div>
	<div class="tabbed-contents" style="clear: none">
		<div id="tab-general-settings" style="display: none">
			
		<div class="panels">
				<h2 id="change-sig" class="text">Change signature!</h2>
					<form name="setsig" method="post" onsubmit="aowow.account.setsig();return false">
						<div id="sig-change"></div>
					<input id="submit" type="submit" value="{#Submit#}"></input>
					</form>
		</div>
		
		</div>
		{*<div id="tab-interface-settings" style="display: none">
		<table>
			<tr>
			<td width="55%">
			<div class="panels">
				<h2 id="change-buttons" class="text">Button options</h2>
				<form name="sbuttons" method="post" onsubmit="aowow.account.set_buttons();return false">
				<table>
					<tr>
						<td align="center"><input id="whb" type="checkbox" value="whb">Wowhead button</input></td>
						<td align="center"><input id="wht" type="checkbox" value="wht">Wowhead tootlip</input></td>
						<td align="center"><input id="wpb" type="checkbox" value="wpb">Wowpedia button</input></td>
						<td align="center"><input id="3db" type="checkbox" value="3db">3D button</input></td>
					</tr>
					<tr>
						<td><a onmouseover="Tooltip.showAtCursor(event, '<sub><img width=15 src=templates/wowhead/images/wowhead.png></sub> {#Wsearch#} {"Wowhead.com"}', 0, 0, 'q')" onmousemove="Tooltip.cursorUpdate(event)" onmouseout="Tooltip.hide()" href="http://www.wowhead.com/" class="button-red"><em><b><i>Wowhead Button</i></b><span>Wowhead Button</span></em></a></td>
						<td><a rel="wowhead" href="http://www.wowhead.com/?item=17782" class="button-red"><em><b><i>Wowhead + Tooltip</i></b><span>Wowhead + Tooltip</span></em></a></td>
						<td><a onmouseover="Tooltip.showAtCursor(event, '<sub><img width=15 src=templates/wowhead/images/wowpedia.ico></sub> {#Wsearch#} {"WoWpedia.org"}', 0, 0, 'q')" onmousemove="Tooltip.cursorUpdate(event)" onmouseout="Tooltip.hide()" href="http://www.wowpedia.org/" class="button-red"><em><b><i>Wowpedia Button</i></b><span>Wowpedia Button</span></em></a></td>
						<td><a id="modelviewer-mode" onclick="this.blur();ModelViewer.show({ldelim}type: 1,typeId: 15514,displayId: 15512{rdelim})" class="button-red"><em><b><i>3D Button</i></b><span>3D Button</span></em></a></td>
					</tr>
				</table>
					<input id="submit" type="submit" value="{#Submit#}"/>
				</form>
			</div>
			</td>
			<td>
				<div class="panels">
				<table>
				<tr>
					<td>
						<h2 id="change-buttons" class="text">3D Plus Options</h2>
						3D Image for items/npcs<br>
						<form name="spicture" method="post" onsubmit="aowow.account.set_3dplus();return false">
							<input id="2dp" type="checkbox" value="2d">3D Plus</input>
							<input id="3dp" type="checkbox" value="3d">3D on-click</input>
							<input id="submit" type="submit" value="{#Submit#}"/>
						</form>
					</td>
					<td>
						<div id="minibox"></div>
						<script type="text/javascript">Markup.printHtml("[minibox][img src=http://static.wowhead.com/modelviewer/thumbs/npc/15512.png]", "minibox");</script>
					</td>
				</tr>
				</table>
				</div>
			</td></tr>
			</table>
		</div>
*}
</div>
<script type="text/javascript">
	var tabsContribute = new Tabs({ldelim}parent: ge('tabs_contribute-generic'){rdelim});
	tabsContribute.add('General', {ldelim}id: 'general-settings'{rdelim});
	//tabsContribute.add('Interface', {ldelim}id: 'interface-settings'{rdelim});
	tabsContribute.flush();
</script>
<div class="clear"></div>
			<div id="markup-fc98fed7"></div><script type="text/javascript">Markup.printHtml("", "markup-fc98fed7");</script>
			<script>Listview.funcBox.coEditAppend(ge('sig-change'), {ldelim}body: '{$account.sig|escape:javascript}'{rdelim}, 4);{if $account.avatar}ge("avatar-current").appendChild(Icon.create('{$account.avatar}', 2, 0, 0, 0, '{$account.avatar}', 'q6'));{/if}{foreach from=$account.avatar_recent key=k item=i}ge("avatar-recent-{$k}").appendChild(Icon.create('{$i}', 2, 0, 0, 0, '{$i}', 'q0', 0, 0, 1));{/foreach}</script>
		</div>
	</div>
	</div>

{include file='footer.tpl'}
