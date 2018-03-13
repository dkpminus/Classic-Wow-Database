{include file='header.tpl'}

<div id="main">
	<div id="main-precontents"></div>
	<div id="main-contents" class="main-contents">
		<div class="text">
		<script type="text/javascript">var g_pageInfo = {ldelim}type: {$page.type}, typeId: {$page.typeid}, name: 'Latest'{rdelim};
					g_initPath({$page.path})</script>
			<div class="h1-links"></div>
			{* <h1>{#Latest_Comments#}</h1> *}
		</div>
		{if $comments}
		<div id="lv-comments" class="listview"></div>
		<script type="text/javascript">
			{strip}
			new Listview({ldelim}template: 'commentpreview', id: 'comments', data: [
			{foreach name=foo from=$comments key=number item=comment}
				{ldelim}
					id:{$comment.id},
					type:{$comment.type},
					typeId:{$comment.typeID},
					subject:'{$comment.subject|escape:"javascript"}',
					preview:'{$comment.preview|escape:"javascript"}',
					user:'{$comment.user|escape:"javascript"}',
					rating: {$comment.rating},
					date:'{$comment.date|date_format:"%Y/%m/%d %H:%M:%S"}',
					elapsed:{$comment.elapsed},
					purged:{$comment.purged},
					deleted:0
				{rdelim}
				{if $smarty.foreach.foo.last}{else},{/if}
			{/foreach}
			]{rdelim});
			{/strip}
		</script>
		{/if}
		{if !$comments}
		<div id="lv-screenshots" class="listview"></div>
		<script type="text/javascript">
			{strip}
			new Listview({ldelim}template: 'screenshot', id: 'screenshots', data: [
			{foreach name=foo from=$screenshots key=id item=screenshots}
				{ldelim}
					id:'{$screenshots.id}',
					user:'{$screenshots.user}',
					date:'{$screenshots.date}',
					caption:'{$screenshots.caption|escape:"javascript"}',
					sticky:'{$screenshots.sticky}',
					width:'{$screenshots.width}',
					height:'{$screenshots.height}',
					approved:'{$screenshots.approved}',
					type:'{$screenshots.type}',
					typeid:'{$screenshots.typeid}',
					subject:'{$screenshots.subject|escape:"javascript"}'
				{rdelim}
				{if $smarty.foreach.foo.last}{else},{/if}
			{/foreach}
			]{rdelim});
			{/strip}
		</script>
		{/if}
		<div class="clear"></div>
	</div>
</div>

{include file='footer.tpl'}
