	<div id="footer">
		<div>Classic Wow . Info</div>
		{if isset($mysql) && $user.roles > 1}
		{#Number_of_MySQL_queries#}: {$mysql.count}<br>
		{#Time_of_MySQL_queries#}: {$mysql.time}
{/if}
	</div>
</div>

</div>
<!--[if lte IE 6]></td><th class="ie6layout-th"></th></tr></table><![endif]-->
</body>
</html>
