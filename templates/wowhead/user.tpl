{include file='header.tpl'}

	<div id="main">

		<div id="main-precontents"></div>
		<div id="main-contents" class="main-contents">

			<script type="text/javascript">
				{include file='bricks/allcomments.tpl'}
				var g_pageInfo = {ldelim}status: 4, starred: 0, score: 2, status_name: '', locked: 0, topic: 5815, page: 1, subject: 'Эмблема Заиндевевшего Копыта'{rdelim};
			</script>

			<table class="infobox">
				<tr><th>{#Quick_Facts#}</th></tr>
				<tr><td><div class="infobox-spacer"></div>
				<ul>
					<li><div>{#level#}: {$acc.level} ({if $acc.level==0}{#l0#}{elseif $acc.level==1}{#l1#}{elseif $acc.level==2}{#l2#}{else}{#l3#}{/if})</div></li>				
					<li><div>{#exp#}: {if $acc.expansion==0}World of Warcraft{elseif $acc.expansion==1}<sub><img src="templates/wowhead/images/tbc.gif"></sub> The Burning Crusade{elseif $acc.expansion==2}<sub><img src="templates/wowhead/images/wrath.png"></sub> Wrath of the Lich King{/if}</div></li>
					<li><div>{#loc#}: {$acc.locale}</div></li>		
					<li><div>{#realm#}: {if $acc.realmid!=0}<font class=tip onmouseover="Tooltip.showAtCursor(event, '{if $acc.realmflag==2}<center><sub><img align=left width=16 src=templates/wowhead/images/down.gif></sub><font color=#FFD100>{$acc.realm}</font><sub><img align=right width=16 src=templates/wowhead/images/down.gif></sub></center>{else}<center><sub><img align=left width=16 src=templates/wowhead/images/up.gif></sub><font color=#FFD100>{$acc.realm}</font><sub><img align=right width=16 src=templates/wowhead/images/up.gif></sub></center>{/if}<br>{#rpop#}: {if $acc.realmflag!=2}{if $acc.realmpop==low}<span class=q2>{#rlow#}</span>{elseif $acc.realmpop==medium}<font color=#FFD100>{#rmedium#}</font>{else}<span class=q10>{#rhigh#}</span>{/if}{else}<font color=grey>{#offline#}</font>{/if}<br>{#rtype#}: <span class=q{if $acc.realmtype==6}2>RP</span>{elseif $acc.realmtype==1}10>PvP</span>{elseif $acc.realmtype==8}10>RP PvP</span>{else}6><font color=#FFD100>PvE</font></span>{/if}{if $acc.realmflag==64}<br><br><span class=q2>{#recommended#}</span>{/if}{if $acc.realmflag==32}<br><br><span class=q9>{#newplayers#}</span>{/if}{""}', 0, 0, 'n')" onmousemove="Tooltip.cursorUpdate(event)" onmouseout="Tooltip.hide()">{$acc.realm}</font>{else}{#undefined#}{/if}</div></li>		
					<li><div>{#nchars#}: {$acc.realmchars}</div></li>
					<li><div>{#locked#}: {if $acc.locked==1}<span class="q10">{#Yeh#}</span>{elseif $acc.locked==0}<span class="q2">{#Nah#}</span>{/if}</div></li>					
					<li><div>{#joindate#}: {$acc.joindate}</div></li>
					{if $user.roles>=1}<li><div>{#lastip#}: {$acc.lastip}</div></li>{/if}
					{if $user.roles>=1}<li><div>{#email#}: <a href="mailto:{$acc.email}">{$acc.email}</a></div></li>{/if}
				</ul>
				</td></tr>
			</table>

			<div class="text">
				<h1>[ {$acc.name} ]</h1>
				<h2>{#Related#}</h2>
			</div>
			{*<div id="announcement-13"></div> 
			<script type="text/javascript">//<![CDATA[
new Announcement({ldelim} parent: 'announcement-13', id: 13, text: '[h3]First Time?[/h3]\n\nThe [b]Profiler[/b] tool lets you [span class=tip title="e.g. See how\'d you look as a different race, try different gear or talents, and more!"]edit your character[/span], find gear upgrades, check your gear score, and more!\n\n[ul]\n[li][b]Right-click[/b] slots to change items, add gems/enchants, or find upgrades.[/li]\n[li]Use the [b]Claim character[/b] button to add your own characters to your [url=/?user]user page[/url].[/li]\n[li]Save a modified character to your Wowhead account by using the [b]Save as[/b] button.[/li]\n[li][b]Statistics[/b] will update in real time as you make tweaks.[/li]\n[/ul]\n\nFor more information, check out our extensive [url=/?help=profiler]help page[/url]!', name: 'Help: Profiler', style: 'padding-left: 80px;', status: 1, mode: 1 {rdelim});
//]]></script>

{if $user=="null"}
{include file='bricks/contribute.tpl'}
{/if}*}
			</div>
		</div>
	</div>

{include file='footer.tpl'}
