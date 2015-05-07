
<%@ page import="com.jordiv.emovix.TwitterQuery"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName" value="${message(code: 'twitterQuery.label', default: 'TwitterQuery')}" />
<link rel="stylesheet" href="${resource(dir: 'css', file: 'dashboard.css')}" />
<script type="text/javascript" src="${resource(dir: 'js/highcharts', file: 'highcharts.js')}"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=visualization"></script>
<script src="http://d3js.org/d3.v3.min.js"></script>
<script type="text/javascript">
			var _d3_url = "${g.createLink(action: 'graphJson', id: twitterQueryInstance?.id)}";
		</script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'd3-verified.js')}"></script>
<title><g:message code="default.list.label" args="[entityName]" /></title>
<style>
.link {
	fill: none;
	stroke: #666;
	stroke-width: 1.5px;
}

#licensing {
	fill: green;
}

.link.licensing {
	stroke: green;
}

.link.resolved {
	stroke-dasharray: 0, 2 1;
}

circle {
	fill: #58ACFA;
	stroke: #A4A4A4;
	stroke-width: 1.5px;
}

text {
	font: 10px sans-serif;
	pointer-events: none;
	text-shadow: 0 1px 0 #fff, 1px 0 0 #fff, 0 -1px 0 #fff, -1px 0 0 #fff;
}
</style>
<style>
#geoMap {
	height: 100%;
	margin: 0px;
	padding: 0px
}

#geoMapContainer {
	margin: 0px;
	padding: 0px
}
</style>
<script type="text/javascript">
		$(function () {
			$('#geoMap').height($('.sidebar').height() - 180);
		$('#container').highcharts({
	        chart: {
	            type: 'column'
	        },
	        title: {
	            text: 'Most used words in bullying Tweets'
	        },
	        subtitle: {
	            text: null
	        },
	        credits: {
	            enabled: false
	        },
	        xAxis: {
	            type: 'category',
	            labels: {
	                rotation: -45,
	                style: {
	                    fontSize: '13px',
	                    fontFamily: 'Verdana, sans-serif'
	                }
	            }
	        },
	        yAxis: {
	            min: 0,
	            title: {
	                text: 'Number of occurrences'
	            }
	        },
	        legend: {
	            enabled: false
	        },
	        tooltip: {
	            pointFormat: 'Found <b>{point.y:.0f}</b> times in twitter messages'
	        },
	        series: [{
	            name: 'Words',
	            data: [
					<g:each in="${words}" var="w" status="i">
					<g:if test="${i < 20}">
					['${w.key}', ${w.value}],
					</g:if>
					</g:each>
	            ],
	            dataLabels: {
	                enabled: true,
	                rotation: -90,
	                color: '#FFFFFF',
	                align: 'right',
	                format: '{point.y:.0f}', // one decimal
	                y: 10, // 10 pixels down from the top
	                style: {
	                    fontSize: '13px',
	                    fontFamily: 'Verdana, sans-serif'
	                }
	            }
	        }]
	    });


		var gmap, pointarray, heatmap;

		var taxiData = [
			<g:each in="${geolocations}" var="gl">
				new google.maps.LatLng(${gl[0]}, ${gl[1]}),
			</g:each>
		];
		
		function initialize() {
		  var mapOptions = {
		    //zoom: 2,
		    //center: new google.maps.LatLng(54.58952, -5.92234),
		    zoom: 2,
    		center: new google.maps.LatLng(52, 11),
		    mapTypeId: google.maps.MapTypeId.ROADMAP
		  };
		
		  gmap = new google.maps.Map(document.getElementById('geoMap'), mapOptions);
		
		  var pointArray = new google.maps.MVCArray(taxiData);
		
		  heatmap = new google.maps.visualization.HeatmapLayer({
		    data: pointArray
		  });
		<%--
		  new google.maps.Marker({
		    position: new google.maps.LatLng(-25.363882,131.044922),
		    map: gmap,
		    title:"Hello World!"
		  })
		--%>
		  heatmap.setMap(gmap);
		}
		
		function toggleHeatmap() {
		  heatmap.setMap(heatmap.getMap() ? null : gmap);
		}
		
		function changeGradient() {
		  var gradient = [
		  'rgba(0, 255, 255, 0)',
		  'rgba(0, 255, 255, 1)',
		  'rgba(0, 191, 255, 1)',
		  'rgba(0, 127, 255, 1)',
		  'rgba(0, 63, 255, 1)',
		  'rgba(0, 0, 255, 1)',
		  'rgba(0, 0, 223, 1)',
		  'rgba(0, 0, 191, 1)',
		  'rgba(0, 0, 159, 1)',
		  'rgba(0, 0, 127, 1)',
		  'rgba(63, 0, 91, 1)',
		  'rgba(127, 0, 63, 1)',
		  'rgba(191, 0, 31, 1)',
		  'rgba(255, 0, 0, 1)'
		  ]
		  heatmap.set('gradient', heatmap.get('gradient') ? null : gradient);
		}
		
		function changeRadius() {
		  heatmap.set('radius', heatmap.get('radius') ? null : 20);
		}
		
		function changeOpacity() {
		  heatmap.set('opacity', heatmap.get('opacity') ? null : 0.2);
		}
		
		initialize();
		changeRadius();

		
	    
		});
		</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<g:render template="/twitterQuery/dashboardMenu" />
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">Human-verified bullying messages</h1>
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
				<div role="tabpanel">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Map</a></li>
						<li role="presentation"><a href="#tabMap" aria-controls="tabMap" role="tab" data-toggle="tab">Overview</a></li>
						<li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Words</a></li>
						<li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">Tweets</a></li>
						<li role="presentation"><a href="#graph" aria-controls="graph" role="tab" data-toggle="tab">Relationship
								graph</a></li>
					</ul>
					<!-- Tab panes -->
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane fade in active" id="home">
							<%--
						    	<div id="panel">
							      <button onclick="toggleHeatmap()">Toggle Heatmap</button>
							      <button onclick="changeGradient()">Change gradient</button>
							      <button onclick="changeRadius()">Change radius</button>
							      <button onclick="changeOpacity()">Change opacity</button>
							    </div>
							    --%>
							<div id="geoMapContainer">
								<div id="geoMap"></div>
							</div>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="tabMap">
							<p>&nbsp;</p>
							<p>
								Total gathered tweets:
								${responseCount}
							</p>
							<p>
								Total suspected bullying messages:
								${bullyingCount}
							</p>
							<p>
								Total verified as bullying messages:
								${verifiedCount}
							</p>
							<p>
								Total false positives:
								${falsePosCount}
							</p>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="profile">
							<div id="container"></div>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="settings">
							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>Date</th>
										<th>User</th>
										<th>Tweet</th>
									</tr>
								</thead>
								<tbody>
									<g:each in="${results}" var="r">
										<tr>
											<td><g:formatDate format="MM-dd-yy HH:mm" date="${r.date}" /></td>
											<td><a href="https://twitter.com/${r.user}" target="_blank">
													${r.user}
											</a></td>
											<td>
												${r.tweet}
											</td>
										</tr>
									</g:each>
								</tbody>
							</table>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="graph">
							<div id="graphSvg"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
