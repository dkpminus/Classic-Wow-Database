{include file='header.tpl'}
		<div id="main">
			<div id="main-precontents"></div>
			<div id="main-contents" class="main-contents">
			<script type="text/javascript">
					var g_pageInfo = {ldelim}type: {$page.type}, typeId: {$page.typeid}, name: 'Trololo'{rdelim};
					g_initPath({$page.path});
				</script>
{if $query=="guide" && $user.roles > 1}
{include file='guides/guides.tpl'}
{/if}
{if $query=="guide=pve"}
{include file='guides/pve.tpl'}
{/if}
{if $query=="guide=aq-war-effort"}
{include file='stats.tpl'}
{/if}
{if $query=="tooltips"}
{include file='guides/tips.tpl'}
{/if}
{if $query=="guide=repeatable"}
{include file='guides/repeatable.tpl'}
{/if}
{if $query=="guide=add" && $user.roles > 1}
{include file='guides/add.tpl'}
{/if}
				<div class="clear"></div>
			</div>
		</div>
{include file='footer.tpl'}
