<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'twitterQuery.label', default: 'TwitterQuery')}" />
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'dashboard.css')}" />
		<script type="text/javascript" src="https://www.google.com/jsapi?autoload={'modules':[{'name':'visualization','version':'1.1','packages':['map']}]}"></script>
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<script type="text/javascript">
			function drawMap () {
		      var data = new google.visualization.DataTable();
		      data.addColumn('number', 'Lat');
		      data.addColumn('number', 'Lon');
		      data.addColumn('string', 'Marker')

		      data.addRows([
    		      <g:each in="${geoBullying}" var="b">
    		      [${b[0]}, ${b[1]}, escape('${b[2]}: ${b[3].replace('\n', ' ')}')],
    		      </g:each>
    		      <g:each in="${geoImproper}" var="b">
    		      [${b[0]}, ${b[1]}, escape('${b[2]}: ${b[3].replace('\n', ' ')}')],
    		      </g:each>
    		      <g:each in="${geoMood}" var="b">
    		      [${b[0]}, ${b[1]}, escape('${b[2]}: ${b[3].replace('\n', ' ')}')],
    		      </g:each>
		      ]);

		      var options = {
		        zoomLevel: 3,
		        showTip: true,
		        useMapTypeControl: true,
		        icons: {
		          bullying: {
		            normal: '${resource(dir: 'images', file: 'maps_marker_bullying.png')}',
		            selected: '${resource(dir: 'images', file: 'maps_marker_bullying.png')}'
		          },
		          improper: {
		            normal:   '${resource(dir: 'images', file: 'maps_marker_bullying.png')}',
		            selected: '${resource(dir: 'images', file: 'maps_marker_bullying.png')}'
		          },
		          mood: {
		            normal: '${resource(dir: 'images', file: 'maps_marker_bullying.png')}',
		            selected: '${resource(dir: 'images', file: 'maps_marker_bullying.png')}'
		          }
		        }
		      };
		      var map = new google.visualization.Map(document.getElementById('map_div'));

		      map.draw(data, options);
		    }
			$(function () {
				drawMap();
			});
		</script>
	</head>
	<body>
		<div class="container-fluid">
			<div class="row">
				<g:render template="/twitterQuery/dashboardMenu" />
				<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
					<h1 class="page-header">Geolocated messages</h1>
					<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>
					<div id="map_div"></div>
				</div>
			</div>
		</div>
	</body>
</html>
