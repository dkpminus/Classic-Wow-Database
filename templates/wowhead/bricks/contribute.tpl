{if $user}
<div class="text">
<h2>{#Contribute#}</h2>
</div>
<div id="tabs_contribute-generic" style="width: 50%"></div>
<div class="text" style="margin-right: 310px">
	<div class="tabbed-contents" style="clear: none">
		<div id="tab-add-your-comment" style="display: none">
			<form name="addcomment" action="?comment=add&amp;type={$page.type}&amp;typeid={$page.typeid}" method="post" onsubmit="return co_validateForm(this)">
				<div id="gjkdlfgkjh436" style="display: none">
					{#Replying_to_comment_by#} <span></span>. &nbsp;<a href="javascript:;" onclick="co_cancelReply()">{#Cancel#}</a>
					<div class="pad"></div>
				</div>
				<div id="funcbox-generic"></div>
				<script type="text/javascript">Listview.funcBox.coEditAppend(ge('funcbox-generic'), {ldelim}body: ''{rdelim}, 1)</script>
				<div class="pad"></div>
				<input type="submit" value="{#Submit#}"></input>
				<input type="hidden" name="replyto" value=""></input>
			</form>
		</div>
		{if $ss_conf!=null & $ss_conf!=3}
{* TAB SCREENSHOTS *}
		<div id="tab-submit-a-screenshot" style="display: none">
				Simply browse for your screenshot using the form below.
			<ul>
				<li><div>In-game screenshots are preferred over model-viewer-generated ones.</div></li>
				<li><div>The higher the quality the better!</div></li>
			</ul>
			<form action="?screenshot=add&amp;type={$page.type}.{$page.typeid}" enctype="multipart/form-data" method="post">
					<input type="hidden" name="MAX_FILE_SIZE" value="1000000" />
					<input id="screenshotfile" type="file" name="image" onChange="ge('submit').disabled = false;ge('caption').style.display = ''">
					<br><small>Only JPEG and PNG images up to 500KB are accepted.</small>
					<div id="caption" style="display:none;margin-top:5px;">
					<label for="caption"><small>You may add a short description:</small></label>
					<br><input type="text" name="caption">
					</div>
				<br><input style="margin-top:0px;" onclick="submit(); return false" id="submit" type="submit" name="screenshotfile" value="{#Submit#}" disabled="true">
				<br><small class="q0">Note: Your screenshot will need to be approved before appearing on the site.</small>

			</form>
			<div class="q10" id="upload-error"></div>
		</div>
		{/if}
</div>
<script type="text/javascript">
	var tabsContribute = new Tabs({ldelim}parent: ge('tabs_contribute-generic'){rdelim});
	tabsContribute.add(LANG.tab_addyourcomment, {ldelim}id: 'add-your-comment'{rdelim});
	{if $ss_conf!=null & $ss_conf!=3}tabsContribute.add(LANG.tab_submitascreenshot, {ldelim}id: 'submit-a-screenshot'{rdelim});{/if}
	tabsContribute.flush();
</script>
<div class="clear"></div>
{else}
<div class="announcement announcement-contenttop">
	<div class="announcement-inner text" style="padding-left: 350px;margin:10px 0 0 0;border:none;color:#202020!important;">
		<b><a href="?account=signin&amp;next={$query|escape}">Sign in</a> if you want to contribute to this page.</b><div style="clear: both; "></div></div></div>
{/if}