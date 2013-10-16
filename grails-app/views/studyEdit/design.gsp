<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="main" />
	<title>Study edit wizard</title>
	
	<r:require modules="studyEdit" />
</head>
<body>
	<div class="studyEdit studyProperties">
		<h1>
			Edit study [${study.title?.encodeAsHTML()}]
			<g:render template="steps" model="[study: study, active: 'design']"  />
		</h1>
		
		<g:if test="${error}">
			<div class="errormessage">
				${error.toString().encodeAsHTML()}
			</div>
		</g:if>
		<g:if test="${message}">
			<div class="message">
				${message.toString().encodeAsHTML()}
			</div>
		</g:if>	
		
		<span class="info"> 
			<span class="title">Define or import your study design</span> 
			The study design consists of events and sampling events, grouped together in event groups. Event groups can be assigned to groups of subjects.
		</span>
		
		<g:form action="design" name="design">
			<g:hiddenField name="_action" />
			<g:hiddenField name="id" value="${study.id}" />
			
			<div id="studydesign">
				<div id="timeline-eventgroups"></div>
			</div>
			<div id="design-meta">
				<div id="eventgroups" class="eventgroups addToTimeline">
					<h3>Available event groups</h3>
					<ul>
						<g:each in="${study.eventGroups}" var="eventgroup">
							<li data-duration="${eventgroup.duration}">
								<span class="name">${eventgroup.name}</span>
								<span class="events">
									${eventgroup.contents}
								</span>
								<a href="#" class="delete">del</a>
							</li>
						</g:each>
						<li class="add" onClick=" StudyEdit.eventGroups.add();">Add new</li>
					</ul>
				</div>
			</div>
			
			<br clear="all" />
		</g:form>
		
		<div id="eventGroupDialog">
			<span class="info"> 
				<span class="title">Edit the details of the eventgroup</span> 
				Drag events and sampling events into the eventgroup
			</span>
					
			<div class="message">
				Please note: changes to this eventgroup will affect all instances of the group. 
			</div>
			
			<label>Name: </label><input type="text" name="eventgroup-name" id="eventgroup-name" /><br />
			
			<div id="timeline-events"></div>
			
			<div id="design-meta">
				<div id="events" class="events addToTimeline">
					<h3>Available treatments / challenges</h3>
					<ul>
						<g:each in="${study.events}" var="event">
							<li data-duration="0">
								<span class="name">${event.name ?: '[event without name]'}</span>
								<a href="#" class="delete">del</a>
							</li>
						</g:each>
						<li class="add"><a href="#">Add new</a></li>
					</ul>
				</div>
				<div id="sampling_events" class="sampling_events addToTimeline">
					<h3>Available sampling events</h3>
					<ul>
						<g:each in="${study.samplingEvents}" var="samplingEvent">
							<li>
								<span class="name">${samplingEvent.name ?: '[samplingevent without name]'}</span>
								<a href="#" class="delete">del</a>
							</li>
						</g:each>
						<li class="add">Add new</li>
					</ul>
				</div>
			</div>			
		</div>
		
		<r:script>	
			$(function() {
				var data = [];
				<g:each in="${study.subjectEventGroups}" var="group">
				     data.push({
				       'start': new Date(${group.startDate.time}),
				       'end': new Date(${group.endDate.time}),  // end is optional
				       'content': '${group.eventGroup?.name.encodeAsJavaScript()}',
				       'group': '${group.subjectGroup?.name.encodeAsJavaScript()}',
				       // Optional: a field 'className'
				       // Optional: a field 'editable'
				     });
     				</g:each>
				
				StudyEdit.design.initialize( data, new Date(${study.startDate?.time}) );
			});
		</r:script>
	</div>
</body>
</html>