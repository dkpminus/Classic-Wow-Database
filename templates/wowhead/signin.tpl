{include file='header.tpl'}

		<div id="main">
			<div id="main-precontents"></div>
			<div id="main-contents">
				<div class="pad3"></div>
				<script type="text/javascript">
					function inputBoxValidate(f)
					{ldelim}
						var _ = f.elements[0];
						if(_.value.length == 0)
						{ldelim}
							ge('inputbox-error').innerHTML = LANG.message_enterusername;
							_.focus();
							return false;
						{rdelim}

						_ = f.elements[1];
						if(_.value.length == 0)
						{ldelim}
							ge('inputbox-error').innerHTML = LANG.message_enterpassword;
							_.focus();
							return false;
						{rdelim}
					{rdelim}
				</script>
				<a href="?account=signup"><img onmouseover="Tooltip.showAtCursor(event, 'Sign up and share your screenshots & comments!', 0, 0, 'q')" onmousemove="Tooltip.cursorUpdate(event)" onmouseout="Tooltip.hide()" class="minibox-left" style="margin:20px;margin-top:0px;" width=200 align="left" src="templates/wowhead/images/b_ss.jpg"></a>
				<a href="?account=signup"><img onmouseover="Tooltip.showAtCursor(event, 'Sign up and see everything in 3D!', 0, 0, 'q')" onmousemove="Tooltip.cursorUpdate(event)" onmouseout="Tooltip.hide()" class="minibox" style="margin:20px;margin-top:-10px;" width=170 align="left" src="templates/wowhead/images/b_image.jpg"></a>
				<form action="?account=signin&amp;next={$query}" method="post" onsubmit="return inputBoxValidate(this)">
					<div class="inputbox" style="position: relative">
						<h1>{#Sign_in_to_your_Game_Account#}</h1>
						<div id="inputbox-error">{if $signin_error}{$signin_error}{/if}</div>

						<table align="center">
							<tr>
								<td align="right">{#Username#}:</td>
								<td><input class="sign-inup" type="text" name="username" value="" maxlength="16" id="username-generic" /></td>
							</tr>
							<tr>
								<td align="right">{#Password#}:</td>
								<td><input class="sign-inup" type="password" name="password" /></td>
							</tr>
							<tr>
								<td align="right" valign="top"><input type="checkbox" name="remember_me" id="remember_me" value="yes" checked="checked" /></td>
								<td>
									<label for="remember_me">{#Remember_me_on_this_computer#}</label>
									<div class="pad2"></div>
									<input type="submit" value="{#Sign_in#}" />
								</td>
							</tr>
						</table>
					</div>
				</form>

				<div class="pad3"></div>
				{if $register}<div style="text-align: center; line-height: 1.5em; font-size: 125%">{#Dont_have_an_account#}? <a href="?account=signup">{#Create_one_now#}!</a></div>{else}<div style="text-align: center; line-height: 1.5em; font-size: 125%; padding-bottom:0px;" id="inputbox-error">{$signup_error}</div>{/if}
				<script type="text/javascript">ge('username-generic').focus()</script>
				<div class="clear"></div><div class="pad"></div><div class="pad"></div><div class="pad"></div>
			</div>
		</div>

{include file='footer.tpl'}
