<% import grails.persistence.Event %>
<%=packageName%>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
</head>
<body>
	<div class="container-fluid">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h2><g:message code="default.show.label" args="[entityName]" /></h2>
			</div>
			<div class="panel-body">
				<g:if test="\${flash.message}">
					<div class="alert alert-danger" role="alert">\${flash.message}</div>
				</g:if>
				<div class="pull-right">
					<g:link class="btn btn-primary" action="index">
						<span class="glyphicon glyphicon-list"></span> <g:message code="default.list.label" args="[entityName]" />
					</g:link>
					<g:link class="btn btn-primary" action="create">
						<span class="glyphicon glyphicon-plus"></span> <g:message code="default.new.label" args="[entityName]" />
					</g:link>
				</div>
				<div class="clearfix"></div>
				<div class="container-fluid">
				<%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
					allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
					props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && (domainClass.constrainedProperties[it.name] ? domainClass.constrainedProperties[it.name].display : true) }
					Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
					props.each { p -> %>
					<g:if test="\${${propertyName}?.${p.name}}">
					<p>
						<strong><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" />: </strong>
						<%  if (p.isEnum()) { %>
							<span class="property-value" aria-labelledby="${p.name}-label"><g:fieldValue bean="\${${propertyName}}" field="${p.name}"/></span>
						<%  } else if (p.oneToMany || p.manyToMany) { %>
							<g:each in="\${${propertyName}.${p.name}}" var="${p.name[0]}">
							<span class="property-value" aria-labelledby="${p.name}-label"><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${p.name[0]}.id}">\${${p.name[0]}?.encodeAsHTML()}</g:link></span>
							</g:each>
						<%  } else if (p.manyToOne || p.oneToOne) { %>
							<span class="property-value" aria-labelledby="${p.name}-label"><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${propertyName}?.${p.name}?.id}">\${${propertyName}?.${p.name}?.encodeAsHTML()}</g:link></span>
						<%  } else if (p.type == Boolean || p.type == boolean) { %>
							<span class="property-value" aria-labelledby="${p.name}-label"><g:formatBoolean boolean="\${${propertyName}?.${p.name}}" /></span>
						<%  } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
							<span class="property-value" aria-labelledby="${p.name}-label"><g:formatDate date="\${${propertyName}?.${p.name}}" /></span>
						<%  } else if (!p.type.isArray()) { %>
							<span class="property-value" aria-labelledby="${p.name}-label"><g:fieldValue bean="\${${propertyName}}" field="${p.name}"/></span>
						<%  } %>
					</p>
					</g:if>
				<%  } %>
				</div>
				<hr />
				<g:form url="[resource:${propertyName}, action:'delete']" method="DELETE">
					<div>
						<g:link class="btn btn-default" action="edit" resource="\${${propertyName}}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="btn btn-danger" action="delete" value="\${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</div>
				</g:form>
			</div>
		</div>
	</div>
</body>
</html>
