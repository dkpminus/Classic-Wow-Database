<a href="?guide=beginner-guide" tppabs="http://eu.battle.net/wow/ru/game/guide/" class="main-content-guide left-bnr bnr01" style="background-image:url('/templates/wowhead/images/thumb-game.jpg');">
	<span class="guide-title">Руководство для начинающих</span>
	<span class="guide-desc">Наше руководство для начинающих расскажет обо всем, что нужно знать герою, едва ступившим на свою стезю.</span>
</a>
<a href="guide/index.htm" tppabs="http://eu.battle.net/wow/ru/game/guide/" class="main-content-guide left-bnr bnr01" style="background-image:url('/templates/wowhead/images/thumb-help.jpg');">
	<span class="guide-title">Руководство для начинающих</span>
	<span class="guide-desc">Наше руководство для начинающих расскажет обо всем, что нужно знать герою, едва ступившим на свою стезю.</span>
</a>
<a href="guide/index.htm" tppabs="http://eu.battle.net/wow/ru/game/guide/" class="main-content-guide left-bnr bnr01" style="background-image:url('/templates/wowhead/images/thumb-class.jpg');">
	<span class="guide-title">Руководство для начинающих</span>
	<span class="guide-desc">Наше руководство для начинающих расскажет обо всем, что нужно знать герою, едва ступившим на свою стезю.</span>
</a>
		<div class="media-content">
		<div class="sub-gallery-list">
		<a class="thumb-wrapper" href="?guide=pvp" tppabs="http://eu.battle.net/wow/ru/media/screenshots/pvp">
<span class="thumb-bg" style="background-image:url(http://eu.media.blizzard.com/wow/media/screenshots/pvp/warsong-gulch/warsong-gulch-ss7-index-thumb.jpg)">
<span class="thumb-frame"></span>
</span>
<span class="thumb-title">
PvP
<span class="last-modified">Окунитесь в мир эпических сражений и великих побед</span>
</span>
</a>
<a class="thumb-wrapper" href="?guide=pve" tppabs="http://eu.battle.net/wow/ru/media/screenshots/pvp">
<span class="thumb-bg" style="background-image:url(http://eu.media.blizzard.com/wow/media/screenshots/pvp/warsong-gulch/warsong-gulch-ss7-index-thumb.jpg)">
<span class="thumb-frame"></span>
</span>
<span class="thumb-title">
PvE
<span class="last-modified">Одолейте злодеев и завладейте их сокровищами</span>
</span>
</a>
<a class="thumb-wrapper" href="?guide=events" tppabs="http://eu.battle.net/wow/ru/media/screenshots/pvp">
<span class="thumb-bg" style="background-image:url(http://eu.media.blizzard.com/wow/media/screenshots/pvp/warsong-gulch/warsong-gulch-ss7-index-thumb.jpg)">
<span class="thumb-frame"></span>
</span>
<span class="thumb-title">
Игровые события
<span class="last-modified">Отвлекитесь от рутины и празднуйте со всем Азеротом!</span>
</span>
</a>
<a class="thumb-wrapper" href="?guide=professions" tppabs="http://eu.battle.net/wow/ru/media/screenshots/pvp">
<span class="thumb-bg" style="background-image:url(http://eu.media.blizzard.com/wow/media/screenshots/pvp/warsong-gulch/warsong-gulch-ss7-index-thumb.jpg)">
<span class="thumb-frame"></span>
</span>
<span class="thumb-title">
Профессии
<span class="last-modified">Выберите свое ремесло и совершенствуйте свои навыки</span>
</span>
</a>
</div>
</div>
			<style>
#pform {ldelim}
position:absolute;
top:100px;
left:100px;
display:none;
border:2px solid blue;
padding:8px;
{rdelim}
</style>
<script type="text/javascript">
function prompt() {ldelim}
// get field to be validated
var pf = document.getElementById( 'pForm' );
pf.style.display = 'block';
{rdelim}

function getPdata( arg ) {ldelim}
var f = document.getElementById( 'pForm' );
if ( 'cancel' == arg ) {ldelim}
f.style.display = 'none';	// hide form
return;	// exit immediately
{rdelim}
else if ( 'default' == arg) {ldelim}
// don't know what "default" means
f.style.display = 'none';	// hide form
return;	// exit immediately
{rdelim}
else {ldelim}
var n = f.name.value;
var a = parseInt( f.age.value );
f.style.display = 'none';	// hide form
alert( 'name: ' + n + '\n age: ' + a );
{rdelim}
{rdelim}
</script>
{*}<form>
<input type="button" value="prompt" onclick="prompt()" />
</form>
<div id="p">
<form id="pForm">
name: <input type="text" name="name" /><br><br>
age: <input type="text" name="age" /><br><br>
<input type="button" value="OK" onclick="Lightbox.show('asshole', {ldelim}onShow: a3{rdelim});" />
<input type="button" value="default" onclick="getPdata( this.value )" />
<input type="button" value="cancel" onclick="getPdata( this.value )" />
</form>
</div>
</div>
<a rel="ench=4124" href="http://aowow.org/?item=21979">Asshole</a>*}