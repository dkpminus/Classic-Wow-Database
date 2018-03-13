{strip}
var lv_screenshots = [
{foreach name=foo from=$screenshots key=id item=screenshots}
	{ldelim}
		id:'{$screenshots.id}',
		user:'{$screenshots.user}',
		date:'{$screenshots.date}',
		caption:'{$screenshots.caption}',
		sticky:{$screenshots.sticky},
		width:{$screenshots.width},
		height:{$screenshots.height},
		approved:'{$screenshots.approved}',
		type:'{$screenshots.type}',
		typeid:'{$screenshots.typeid}'
	{rdelim}
	{if $smarty.foreach.foo.last}{else},{/if}
{/foreach}
];
var wh_screenshots = [
{if $wh_ss.status!=false & $wh_ss.content!=null & $wh_ss.content != 'noss'}{$wh_ss.content}{/if}
];
{/strip}