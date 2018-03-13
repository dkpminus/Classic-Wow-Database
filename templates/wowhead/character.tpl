{include file='header.tpl'}

	<div id="main">

		<div id="main-precontents"></div>
		<div id="main-contents" class="main-contents">

			<script type="text/javascript">
				{include file='bricks/allcomments.tpl'}
				var g_pageInfo = {ldelim}type: {$page.type}, typeId: {$page.typeid}, name: '{$acc.name|escape:"quotes"}'{rdelim};
				g_initPath({$page.path});
			</script>
			
<div class="profiler" id="fj08dg9zho">
	<div class="profiler-header">
		<a href="javascript:;" class="button-red"><em><b><i>Manage character</i></b><span>Manage character</span></em></a>
		<a href="javascript:;" class="button-red"><em><b><i>Custom profile</i></b><span>Custom profile</span></em></a>
		{*AVATAR*}
		<div id="{$character.id}-avatar"></div>
		<div class="profiler-header-line1"><b>{$character.name}</b> ({$character.zone})</div>
		{if $character.guild}<div class="profiler-header-line2"><var>&lt;</var><a href="?guild={$character.guildid}">{$character.guild}</a><var>&gt;</var></div>{/if}
		<div class="profiler-header-line3"><span>{#Level#} {$character.level} {$character.race} <font class="c{$character.classid}">{$character.class}</font></span>
			<a class="profiler-header-editlink icon-edit" href="javascript:;">Edit</a>
		</div>
	</div>

		<div class="profiler-message" style="display: none; "><span style="color: red">Warning:</span> Your changes haven't been saved!</div>
			{* MODELS ETC COME HERE *}
					<div class="profiler-model-outer">
						<div class="profiler-model" id="model">
							<object type="application/x-shockwave-flash" style="outline-style: none; outline-width: initial; outline-color: initial; visibility: visible; " data="http://static.wowhead.com/modelviewer/ModelView.swf" width="100%" height="100%" id="hsae8y8hjidj">
								<param name="wmode" value="opaque">
								<param name="quality" value="high">
								<param name="allowscriptaccess" value="always">
								<param name="allowfullscreen" value="true">
								<param name="menu" value="false">
								<param name="bgcolor" value="#141414">
								<param name="flashvars" value="model={$character.race|replace:' ':''|lower|replace:undead:scourge}{$character.gender}&amp;modelType=16&amp;equipList={foreach name=model from=$character.inventory key=k item=i}{if $i.model}{$i.slot},{$i.model}{else}99,99{/if}{if $smarty.foreach.model.last}{else},{/if}{/foreach}{if !$character.inventory.22.model or $character.classid == 3},22,{$character.inventory.27.model}{/if}&amp;ha={$character.model.ha}&amp;hc={$character.model.hc}&amp;fa={$character.model.fa}&amp;sk={$character.model.sk}&amp;fh={$character.model.fh}&amp;fc={$character.model.hc}&amp;mode=1&amp;contentPath=http://static.wowhead.com/modelviewer/">
							</object>
						</div>
					</div>
					<div id="tab-inventory" style="">
						<div style="">
							<table class="infobox">
								<tbody>
									<tr><th colspan="3">Quick Facts</th></tr>
									<tr><td colspan="3">
										<div class="infobox-spacer"></div>
											<ul>
												<li>
													<div>Spec: {$character.ts[1]}/{$character.ts[2]}/{$character.ts[3]}</div>
												</li>
											</ul>
											{if $character.skills}<center><h3 id="prof">Professions<h3></center>{/if}
											<div id="c_skills"></div>
									</td></tr>
								</tbody>
							</table>
							
							<div class="profiler-inventory" id="inventory">
								<div class="profiler-inventory-inner">
									{*SOME BUTTON*}
									<a href="javascript:;" class="button-red"><em><b><i>Compare</i></b><span>Compare</span></em></a>
									{*LEFT EQUIP PANEL*}
									<div class="profiler-inventory-left" id="in-left">
										<div id="slot-1"></div>
										<div id="slot-0"></div>
										<div id="slot-3"></div>
										<div id="slot-16"></div>
										<div id="slot-5"></div>
										<div id="slot-4"></div>
										<div id="slot-19"></div>
										<div id="slot-9"></div>
									</div>
										{*RIGHT EQUIP PANEL*}
									<div class="profiler-inventory-right" id="in-right">
										<div id="slot-10"></div>
										<div id="slot-6"></div>
										<div id="slot-7"></div>
										<div id="slot-8"></div>
										<div id="slot-30"></div>
										<div id="slot-31"></div>
										<div id="slot-32"></div>
										<div id="slot-33"></div>
									</div>
								{* BOTTOM EQUIP PANEL *}
									<div style="height:45px;width:150px;" class="profiler-inventory-bottom" id="in-bot">
										<div id="slot-26"></div>
										<div id="slot-22"></div>
										<div id="slot-27"></div>
									</div>
								</div>
							</div>
		<script type="text/javascript" defer>
			$fx('#in-left').fxAdd({ldelim}type: 'opacity', from: 0, to: 100, step: 10, delay: 30{rdelim}).fxHold(2000).fxRun();
			$fx('#in-right').fxAdd({ldelim}type: 'opacity', from: 0, to: 100, step: 10, delay: 30{rdelim}).fxHold(2200).fxRun();
			$fx('#in-bot').fxAdd({ldelim}type: 'opacity', from: 0, to: 100, step: 10, delay: 30{rdelim}).fxHold(2100).fxRun();
			$fx('#{$character.id}-avatar').fxAdd({ldelim}type: 'opacity', from: 0, to: 100, step: 10, delay: 30{rdelim}).fxRun();
			$fx('#model').fxAdd({ldelim}type: 'opacity', from: 0, to: 100, step: 10, delay: 30{rdelim}).fxHold(3000).fxRun();
			$fx('#inventory').fxAdd({ldelim}type: 'opacity', from: 0, to: 100, step: 30, delay: 30{rdelim}).fxHold(500).fxRun();
			ge('{$character.id}-avatar').appendChild(Icon.create('chr_'+g_file_races[{$character.raceid}]+'_'+g_file_genders[{$character.genderid}]+'_'+g_file_classes[{$character.classid}]+'0{$character.cool}', 2, 2, 0, "q4"));
			{foreach from=$character.skills key=k item=i}ge('c_skills').appendChild(g_createProgressBar({ldelim}bgcolor:"", width:"{$i.progress}", text:"{$i.skillname}", color:"{if $i.cat==11}green{else}yellow{/if}", hoverText:"{$i.value} / {$i.max}"{rdelim}));{/foreach}
			{foreach name=i from=$character.inventory key=k item=i}ge('slot-{$i.slot}').appendChild(Icon.create('{$i.iconname}', 1, 0, {if $i.item}"?item={$i.item}"{else}0{/if}, "pcs:21998"{if $i.quality}, 0, "q{$i.quality}"{else}{/if}));{/foreach}
		</script>
							<div style="clear: left; "></div>
<div class="clear"></div>
<div class="pad"></div>
</div>
</div>

{if $user=="null"}
{include file='bricks/contribute.tpl'}
{/if}
			</div>
		</div>
	</div>

{include file='footer.tpl'}
