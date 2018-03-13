{include file='header.tpl'}

	<div id="main">

		<div id="main-precontents"></div>
		<div id="main-contents" class="main-contents">

			 <script type="text/javascript">
				g_initPath({$page.path});
			</script>
				<div id="lv-characters" class="listview"></div>

				<script type="text/javascript">
					{include file='bricks/characters_table.tpl' id='characters' data=$characters name='characters'}
				</script>
			
			</div>
		</div>

{include file='footer.tpl'}
