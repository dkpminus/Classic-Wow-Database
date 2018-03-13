{strip}
var lv_comments = [
{foreach name=foo from=$comments key=number item=comment}
	{ldelim}
		number:{$comment.number},
		user:'{$comment.user}',
		body:'{$comment.body|escape:"javascript"}',
		date:'{$comment.date|date_format:"%Y/%m/%d %H:%M:%S"}',
		{if $comment.roles!=0}
			roles:{$comment.roles},
		{/if}
		{if $comment.indent!=0}
			indent:{$comment.indent},
		{/if}
		rating:{$comment.rating},
		replyTo:{$comment.replyto},
		purged:{$comment.purged},
		deleted:0,
		raters:[{foreach name=foo2 key=id from=$comment.raters item=rater}[{$rater.userid},{$rater.rate}]{if $smarty.foreach.foo2.last}{else},{/if}{/foreach}],
		id:{$comment.id}
	{rdelim}
	{if $smarty.foreach.foo.last}{else},{/if}
{/foreach}
];

var wh_comments = [{if $wh_cs.status!=false & $wh_cs.content!=null & $wh_cs.content != 'nocs'}{$wh_cs.content}{/if}];

var allCommentz = wh_comments.concat(lv_comments);
{/strip}