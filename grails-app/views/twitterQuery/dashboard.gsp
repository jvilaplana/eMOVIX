
<%@ page import="com.jordiv.emovix.TwitterQuery" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'twitterQuery.label', default: 'TwitterQuery')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'dashboard.css')}" />
		<script type="text/javascript" src="${resource(dir: 'js/highcharts', file: 'highcharts.js')}"></script>
		<script type="text/javascript" src="${resource(dir: 'js/highcharts', file: 'highcharts-more.js')}"></script>
		<script type="text/javascript" src="${resource(dir: 'js/highcharts/modules', file: 'solid-gauge.js')}"></script>
		<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=visualization"></script>
		
		<script type="text/javascript">
		$(function () {
		    $('#chart-distribution').highcharts({
		        chart: {
		            plotBackgroundColor: null,
		            plotBorderWidth: 0,
		            plotShadow: false
		        },
		        title: {
		            text: null
		        },
		        credits: {
		            enabled: false
		        },
		        tooltip: {
		            pointFormat: '<b>{point.percentage:.1f}%</b> ({point.y})'
		        },
		        plotOptions: {
		            pie: {
		                dataLabels: {
		                    enabled: false,
		                    distance: -50,
		                    style: {
		                        fontWeight: 'bold',
		                        color: 'white',
		                        textShadow: '0px 1px 2px black'
		                    }
		                },
		                startAngle: -90,
		                endAngle: 90,
		                center: ['50%', '75%']
		            }
		        },
		        series: [{
		            type: 'pie',
		            name: 'Messages',
		            innerSize: '50%',
		            data: [
		                ['Neutral', ${neutralCount}],
		                ['Bullying', ${bullyingCount}],
		                ['Improper', ${improperCount}],
		                ['Mood', ${moodCount}]
		            ]
		        }]
		    });


		    var gaugeOptions = {
			        chart: {
			            type: 'solidgauge'
			        },

			        title: null,

			        pane: {
			            center: ['50%', '70%'],
			            size: '100%',
			            startAngle: -90,
			            endAngle: 90,
			            background: {
			                backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || '#EEE',
			                innerRadius: '60%',
			                outerRadius: '100%',
			                shape: 'arc'
			            }
			        },

			        tooltip: {
			            enabled: false
			        },

			        // the value axis
			        yAxis: {
			            stops: [
			                [0.1, '#55BF3B'], // green
			                [0.5, '#DDDF0D'], // yellow
			                [0.9, '#DF5353'] // red
			            ],
			            lineWidth: 0,
			            minorTickInterval: null,
			            tickPixelInterval: 400,
			            tickWidth: 0,
			            title: {
			                y: -70
			            },
			            labels: {
			                y: 16
			            }
			        },

			        plotOptions: {
			            solidgauge: {
			                dataLabels: {
			                    y: 5,
			                    borderWidth: 0,
			                    useHTML: true
			                }
			            }
			        }
			    };

			    // The speed gauge
			    $('#chart-unreviewed').highcharts(Highcharts.merge(gaugeOptions, {
			        yAxis: {
			            min: 0,
			            max: 100,
			            title: {
			                text: null
			            }
			        },
			        credits: {
			            enabled: false
			        },
			        series: [{
			            name: 'Speed',
			            data: [${unreviewedCount}],
			            dataLabels: {
			                format: '<div style="text-align:center"><span style="font-size:25px;color:' +
			                    ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y:.1f}</span><br/>' +
			                       '<span style="font-size:12px;color:silver">%</span></div>'
			            },
			            tooltip: {
			                valueSuffix: ' %'
			            }
			        }]

			    }));


			    $(function () {
				    $('#chart-reviewed').highcharts({
				        chart: {
				        	type: 'column'
				        },
				        title: {
				            text: null
				        },
				        credits: {
				            enabled: false
				        },
				        yAxis: {
				            min: 0,
				            title: {
				                text: null
				            }
				        },
				        xAxis: {
				            title: {
				                text: null
				            }
				        },
				        tooltip: {
				        	headerFormat: '',
				            pointFormat: '<b>{point.y}</b>'
				        },
				        plotOptions: {
				        	column: {
				                pointPadding: 0.2,
				                borderWidth: 0
				            }
				        },
				        series: [{
				            name: 'Verified',
				            data: [${verifiedCount}]
				        },
				        {
				        	name: 'False positives',
				        	data: [${falsePositives}]
				        }]
				    });
			    });


			 	// Build the chart
		        $('#chart-map').highcharts({
		            chart: {
		                plotBackgroundColor: null,
		                plotBorderWidth: null,
		                plotShadow: false
		            },
		            credits: {
			            enabled: false
			        },
		            title: {
		                text: null
		            },
		            tooltip: {
		                pointFormat: '<b>{point.percentage:.1f}%</b> ({point.y})'
		            },
		            plotOptions: {
		                pie: {
		                    allowPointSelect: true,
		                    cursor: 'pointer',
		                    dataLabels: {
		                        enabled: false
		                    },
		                    showInLegend: true
		                }
		            },
		            series: [{
		                type: 'pie',
		                name: 'Geolocation',
		                data: [
		                    ['Geolocation', ${geolocationOn}],
		                    ['No Geolocation', ${geolocationOff}]
		                ]
		            }]
		        });

			         
		});
		</script>
	</head>
	<body>
		<div class="container-fluid">
			<div class="row">
				<g:render template="/twitterQuery/dashboardMenu" />
				<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
					<h1 class="page-header">${twitterQueryInstance?.name}</h1>
					<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>
					<div class="row placeholders">
						<div class="col-xs-6 col-sm-3 placeholder">
							<div id="chart-distribution" style="min-width: 200px; height: 200px; margin: 0 auto"></div>
							<h4>Messages</h4>
							<span class="text-muted">Message distribution</span>
						</div>
						<div class="col-xs-6 col-sm-3 placeholder">
							<div id="chart-unreviewed" style="min-width: 200px; height: 200px; margin: 0 auto"></div>
							<h4>Unreviewed</h4>
							<span class="text-muted">Pending review. <g:link action="review" id="${twitterQueryInstance.id}">Review now!</g:link></span>
						</div>
						<div class="col-xs-6 col-sm-3 placeholder">
							<div id="chart-reviewed" style="min-width: 200px; height: 200px; margin: 0 auto"></div>
							<h4><g:link action="verified" id="${twitterQueryInstance.id}">Verified</g:link></h4>
							<span class="text-muted">Human-verified bullying tweets</span>
						</div>
						<div class="col-xs-6 col-sm-3 placeholder">
							<div id="chart-map" style="min-width: 200px; height: 200px; margin: 0 auto"></div>
							<h4><g:link action="geolocation" id="${twitterQueryInstance.id}">Geolocation</g:link></h4>
							<span class="text-muted">Tweets with embedded geolocation</span>
						</div>
					</div>
					<g:if test="${twitterQueryInstance?.query}">
						<div class="panel panel-primary">
					      	<div class="panel-body">
					      		<table class="table">
									<thead>
										<tr>
											<th>Total</th>
											<th>Neutral</th>
											<th>Bullying</th>
											<th>Improper</th>
											<th>Mood</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>${responseCount}</td>
											<td>${neutralCount}</td>
											<td><g:link action="bullying" id="${twitterQueryInstance.id}">${bullyingCount}</g:link></td>
											<td>${improperCount}</td>
											<td>${moodCount}</td>
										</tr>
									</tbody>
								</table>
				      		</div>
					    </div>
					</g:if>
				</div>
			</div>
		</div>
	</body>
</html>
