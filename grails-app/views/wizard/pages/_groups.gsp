<%
/**
 * Subjects page
 *
 * @author  Jeroen Wesbeek
 * @since   20100113
 * @package wizard
 * @see     dbnp.studycapturing.WizardTagLib::previousNext
 * @see     dbnp.studycapturing.WizardController
 *
 * Revision information:
 * $Rev$
 * $Author$
 * $Date$
 */
%>
<wizard:pageContent>

<div class="table">
	<div class="header">
		<div class="column"></div>
		<div class="column"></div>
		<g:if test="${eventGroups}"><g:each var="eventGroup" status="g" in="${eventGroups}">
		<div class="column">${eventGroup.name}</div>
		</g:each></g:if>
	</div>
<g:each var="sTemplate" in="${subjectTemplates}">
  <g:set var="subjectTemplate" value="${sTemplate.getValue()}" />
  <g:set var="showHeader" value="${true}" />
  <g:each var="sId" in="${subjectTemplate.subjects}">
	<g:set var="subjectId" value="${sId.getValue()}" />
	<div class="row">
		<div class="column">
			<g:if test="${showHeader}">
				<g:set var="showHeader" value="${false}" />
				${subjectTemplate.name} template
			</g:if>
		</div>
		<div class="column">${subjects[ subjectId ].name}</div>
		<g:if test="${eventGroups}"><g:each var="eventGroup" status="g" in="${eventGroups}">
		<div class="column"><input type="checkbox" name="subject_${subjectId}_group_${g}" /></div>
		</g:each></g:if>
	</div>
  </g:each>
</g:each>
</div>

</wizard:pageContent>