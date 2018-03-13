
				<div class="pad3"></div>
				<form action="?guide=addguide&amp;next={$query}" method="post" onsubmit="return co_validateForm(this, 2)">
					<div class="inputbox" style="position: relative; width:85em;">
						<h1>Enter your name (will pe displayed as the author of the guide)</h1>
                        <input class="sign-inup" type="text" name="username" {if $user}value="{$user.name}" readonly="true"{/if} maxlength="16" id="username-generic" style="margin-right:14px;" />
                        <b>Title</b>: <input maxlength="50" type="text" name="title" style="width:300px;"/><br />
                        <input type="radio" name="category" value="1"> Instances<br />
                        <input type="radio" name="category" value="2"> Classes<br />
                        <input type="radio" name="category" value="3"> Leveling<br />
                        <input type="radio" name="category" value="4"> Professions<br />

                                <div id="guide-text"></div>
                                <input type="submit" value="Submit"></input>
                    </div>
				</form>

				<div class="pad3"></div>
<script type="text/javascript">Listview.funcBox.coEditAppend(ge('guide-text'), {ldelim}body: ''{rdelim}, 3)</script>
				<script type="text/javascript">ge('username-generic').focus()</script>
				<div class="clear"></div><div class="pad"></div><div class="pad"></div><div class="pad"></div>