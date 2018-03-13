{include file='header.tpl'}
<script type="text/javascript">
					var g_pageInfo = {ldelim}type: {$page.type}, typeId: {$page.typeid}, name: 'Feedback'{rdelim};
				</script>
		<div id="main">
			<div id="main-precontents"></div>
			<div id="main-contents">
				<div class="pad3"></div>
				<form action="?feedback=send&amp;next={$query}" method="post" onsubmit="return co_validateForm(this, 2)">
					<div class="inputbox" style="position: relative">
						<h1>Enter your username and your message</h1>
                        <input class="sign-inup" type="text" name="username" {if $user}value="{$user.name}" readonly="true"{/if} maxlength="16" id="username-generic" />

                                <div id="feedback-text"></div>
                                <input type="submit" value="Submit"></input>
                    </div>
				</form>

				<div class="pad3"></div>
<script type="text/javascript">Listview.funcBox.coEditAppend(ge('feedback-text'), {ldelim}body: ''{rdelim}, 1)</script>
				<script type="text/javascript">ge('username-generic').focus()</script>
				{if $user.roles == 2}
				{foreach name=foo from=$feedback key=id item=feedback}
				<div class="quote" id="feedback-{$feedback.id}">
					<div class="comment-header">By user {$feedback.userid}(<a href="?user={$feedback.username}">{$feedback.username}</a>) on {$feedback.date} from <a href="{$feedback.referer}">{$feedback.referer}</a></div>
					{$feedback.message}
					<div class="comment-links"><a href="javascript:;" onclick="Lightbox.show('feedback-reply', {ldelim}onShow: aowow.feedback.form{rdelim});">Reply</a></div>
					</div>
				{/foreach}
				{/if}
				<div class="clear"></div><div class="pad"></div><div class="pad"></div><div class="pad"></div>
			</div>
		</div>

{include file='footer.tpl'}
{*}
				*}