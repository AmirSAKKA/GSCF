<g:if test="${canWrite}">
	<value class="${css}">
		<input type="number" name="${field.name}" class="editable" required="${field.required}" value="${value}"/>
	</value>
</g:if>
<g:else>
	<value class="${css}">${value}</value>
</g:else>