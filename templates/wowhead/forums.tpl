{include file='header.tpl'}

	<div id="main">

		<div id="main-precontents"></div>
		<div id="main-contents" class="main-contents">

			<script type="text/javascript">
				var g_pageInfo = {ldelim}{if $page.topic!=null}locked: {$topic[0].locked}, {/if}{if $page.board!=null}board: {$page.board}{else}topic :{$page.topic}{/if},  page: 2,  mode:{$page.mode}{rdelim};
				g_initPath({$page.path});
			</script>
			{if $page.topic!=null}<div class="text"><h1>{$topic[0].subject}</h1></div>{/if}
				<div class="forums-band-top">
					<div id="nmvnct34cg46"></div>
					<p><a href="#post-comment" onclick="(fo_goToNewPost.bind(this, 1))()" class="icon-newtopic">{if $page.topic != null}{#reply#}{else}{#new_topic#}{/if}</a></p>
					<div class="clear"></div>
				</div>
				<div id="lv-forums" class="listview"></div>
				<div class="forums-band-bottom">
					<div id="nmvnct34cg47"></div>
					{if $page.topic}<p><a href="?forums&board={$topic[0].board}" class="icon-return">Return to Board</a></p>{/if}
					<div class="clear"></div>
				</div>
				
				<script type="text/javascript">
				{if $page.board!=null}
					{include file='bricks/topics_table.tpl' id='forums' data=$topics name='forums' count=$page.count}
				{else}
					{include file='bricks/posts_table.tpl' id='forums' data=$topic name='forums' count=$page.count}
				{/if}
				</script>
			{if $user & $page.board!=null}
			<div class="text">
				<h2 id="new-topic">{#new_topic#}</h2>
			</div>
			<div class="text" style="margin-right: 310px">
				<form action="?forums&postreply&amp;board={$page.board}&amp;page=1" name="newtopic" method="post" onsubmit="return fo_validateForm(this, 0)">
					{#subject#}: <input type="text" name="subject" size="60" style="width: 50%" maxlength="100" value=""> <small>{#char_limit#}</small>
						<div class="pad2"></div>
					<div id="jktbewtbwklj56"></div>
					<script type="text/javascript">Listview.funcBox.coEditAppend(ge('jktbewtbwklj56'), {ldelim}body: ''{rdelim}, 3)</script>
					<div id="klrbetkjerbt46"></div>

					<div class="pad"></div>
					<input type="submit" value="Submit">

				</form>
			</div>
			{/if}
			{if $user!=null & $page.topic!=null}
			<div class="text">
				<h2 id="post-comment">{#post_reply#}</h2>
			</div>
			
			<div class="text" style="margin-right: 310px">
				<form action="{if $topic[0].locked!=1}?forums&postreply&amp;topic={$page.topic}&amp;page=1{else}/{/if}" name="newtopic" method="post" onsubmit="return fo_validateForm(this, 3)">
					<div id="jktbewtbwklj56"></div>
					{if $topic[0].locked!=1}<script type="text/javascript">Listview.funcBox.coEditAppend(ge('jktbewtbwklj56'), {ldelim}body: ''{rdelim}, 3, false, false)</script>
					{/if}
					<div id="klrbetkjerbt46"></div>
					<div class="pad"></div>
					{if $topic[0].locked!=1}<input type="submit" value="Submit">{/if}
				</form>
			</div>
			{elseif $page.topic!=null & $topic[0].locked==1}
			<h3 class=q2 id="post-comment">Topic is Locked. You cannot post a reply.</h3>
			{elseif $user==null}
			<a id="post-comment" href="?account=signin&next={$query}"><h3 class="q2">You must be signed in to post a reply!</h3></a> 
			{/if}
			{*MARKUP DOC <div id="trash"></div>
			<script type="text/javascript">ge('trash').innerHTML = Markup._generateTagDocs("youtube");</script>
			*}
		</div>
	</div>

{include file='footer.tpl'}
