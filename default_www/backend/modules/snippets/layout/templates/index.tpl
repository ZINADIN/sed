{include:file="{$BACKEND_CORE_PATH}/layout/templates/header.tpl"}
{include:file="{$BACKEND_CORE_PATH}/layout/templates/sidebar.tpl"}
		<td id="contentHolder">
			<div id="statusBar">
				<p class="breadcrumb">{$msgHeaderIndex}</p>
			</div>
	
			<div class="inner">
				{option:report}
					<div class="report fadeOutAfterMouseMove">{$reportMessage}</div>
					{option:highlight}
						<script type="text/javascript">
							var highlightId = '#{$highlight}';
						</script>
					{/option:highlight}
				{/option:report}
	
				<div class="datagridHolder">
					<div class="tableHeading">
						<div class="buttonHolderRight">
							<a href="{$var|geturl:'add'}" class="button icon iconAdd" title="{$lblAdd}">
								<span><span><span>{$lblAdd}</span></span></span>
							</a>
						</div>
					</div>
					{option:datagrid}{$datagrid}{/option:datagrid}
					{option:!datagrid}{$msgNoItems}{/option:!datagrid}
				</div>
			</div>
		</td>
	</tr>
</table>
{include:file="{$BACKEND_CORE_PATH}/layout/templates/footer.tpl"}