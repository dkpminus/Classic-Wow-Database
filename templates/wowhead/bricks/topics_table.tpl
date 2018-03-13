{strip}
	fo_addPageNavigation({$count}, 2, 0, '?', 999999999);
	new Listview({ldelim}
		template:'forumslist',
		id: '{$id}',
		{*note: LANG.bt_pleaseusesearch,*}
		onBeforeCreate: Listview.funcBox.beforeTopics,hiddenCols:['id', 'da', 'dev', 'stared', 'score', 'category', 'category2', 'status'],
		sort: ['-status'],
		data: [
			{section name=i loop=$data}
				{ldelim}
					id:{$data[i].id},
					author:'{$data[i].author.author}',
					roles:{$data[i].author.gl},
					replies:{$data[i].replies},
					views:{$data[i].views},
					{*firstpost:'2011/07/08 20:16:29',*}
					lastpost:['{$data[i].lastpost}',0,{$data[i].lastpost_id},'{$data[i].lastpost_user}',0],
					status:{$data[i].status},
					{*da:34,*}
					{*obj:[5,296,0,'','Месть Ормера'],*}
					subject:'{$data[i].subject}',
					{*category:1,
					category2:11,
					stared:1,
					score:15,*}
					locked:{$data[i].locked}
				{rdelim}
				{if $smarty.section.i.last}{else},{/if}
			{/section}
		]
	{rdelim});
{/strip}

