{strip}
	new Listview({ldelim}
		template:'profile',
		id:'{$id}',
		name:LANG.tab_{$name},
		hiddenCols: ['location'],
		visibleCols: ['race','classs','level'],
		{if $tabsid}tabs:tabsRelated,parent:'listview-generic',{/if}
		data:[
			{section name=i loop=$data}
				{ldelim}
					id:'{$data[i].id}',
					name:'{$data[i].name} {if $data[i].account.gl > 0}<GM>{/if}',
					guildrank:'{$data[i].guildrank}',
					realm:'OMG REALM',
					level:'{$data[i].level}',
					race:'{$data[i].race}',
					gender:'{$data[i].gender}',
					classs:'{$data[i].class}',
					{if $data[i].account.gl > 0}description:'GM',{/if}
					faction:'',
					guild:'{$data[i].guild}',
					{* deleted:'1', *}
					{* rank:'Noob Goda' *}
					{*achievementpoints:3655*}
				{rdelim}
				{if $smarty.section.i.last}{else},{/if}
			{/section}
		]
	{rdelim});
{/strip}

