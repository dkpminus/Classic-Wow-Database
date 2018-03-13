{strip}
fo_addPageNavigation({$count}, 2, 1, '?', 999999999);
var _ = g_users;
{foreach from=$users key=k item=i}
	_['{$k}']={ldelim}{if $i.custom.sig}sig:'{$i.custom.sig|escape:"javascript"}',{/if}roles:{$i.roles}, posts:{$i.posts}, name: '{$i.username}',{*classs:1,race:7,gender:0,level:99,title:'ADMIN',*}avatar:{if $i.custom.avatar}1,avatarmore:'{$i.custom.avatar}'{else}0{/if}{rdelim};
{/foreach}
	new Listview({ldelim}
		template:'forumspost',
		id: '{$id}',
		data: [
			{section name=i loop=$data}
				{ldelim}
					id:{$data[i].id},
					{if $data[i].edit_date != null}
					lastEdit:['{$data[i].edit_date}','{$data[i].edit_times}','{$data[i].edit_user}'],{/if}
					body:'{$data[i].body|escape:"javascript"}',
					date:'{$data[i].date|date_format:"%Y/%m/%d %H:%M:%S"}',
					user:'{$data[i].user}',
					first:1
				{rdelim}
				{if $smarty.section.i.last}{else},{/if}
			{/section}
		]
	{rdelim});
{/strip}

