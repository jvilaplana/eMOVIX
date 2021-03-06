<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<style>
blockquote.twitter-tweet {
  display: inline-block;
  font-family: "Helvetica Neue", Roboto, "Segoe UI", Calibri, sans-serif;
  font-size: 12px;
  font-weight: bold;
  line-height: 16px;
  border-color: #eee #ddd #bbb;
  border-radius: 5px;
  border-style: solid;
  border-width: 1px;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.15);
  margin: 10px 5px;
  padding: 16px 16px 16px 16px;
  border-bottom: 1px solid #e1e8ed;
  cursor: pointer;
}
 
blockquote.twitter-tweet p {
  font-size: 16px;
  font-weight: normal;
  line-height: 20px;
}
 
blockquote.twitter-tweet a {
  color: inherit;
  font-weight: normal;
  text-decoration: none;
  outline: 0 none;
}
 
blockquote.twitter-tweet a:hover,
blockquote.twitter-tweet a:focus {
  text-decoration: underline;
}

blockquote.twitter-tweet img {
  float: left;
  padding-right: 0px;
  margin-right: 10px;
  border-radius: 5px;
  width: 48px;
  height: 48px;
}
</style>
<script type="text/javascript">

var statusCount = 1;
var userCount = 1;
var updateSpeed = 1;
var isNotFirst = false;

function updateData() {
	$.get("${g.createLink(controller: 'twitter', action: 'ajaxUpdateData')}", function( data ) {
		var tweetsPerSecond = (data.statusCount - statusCount) / updateSpeed;
		$( "#tweetsPerSecond" ).html( tweetsPerSecond );
		statusCount = data.statusCount;
		$( "#statusCount" ).html( data.statusCount );

		var usersPerSecond = (data.userCount - userCount) / updateSpeed;
		$( "#usersPerSecond" ).html( usersPerSecond );
		userCount = data.userCount;
		$( "#userCount" ).html( data.userCount );

		var chart = $('#seriesChart').highcharts();
		if(tweetsPerSecond < 100 || isNotFirst) {
			chart.series[0].addPoint([(new Date()).getTime(), tweetsPerSecond]);
			chart.series[1].addPoint([(new Date()).getTime(), usersPerSecond]);
			isNotFirst = true;
		}

		var rateChart = $('#rateChart').highcharts();
		var left = rateChart.series[0].points[0];
        var right = rateChart.series[1].points[0];

        left.update(tweetsPerSecond, false);
        right.update(usersPerSecond, false);
        rateChart.redraw();
	});
}



$(function () {
	setInterval(updateData, updateSpeed * 1000);

	$('#rateChart').highcharts({
		credits: {
            enabled: false
        },
        chart: {
            type: 'gauge',
            plotBorderWidth: 1,
            plotBackgroundColor: {
                linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                stops: [
                    [0, '#FFF4C6'],
                    [0.3, '#FFFFFF'],
                    [1, '#FFF4C6']
                ]
            },
            plotBackgroundImage: null,
            height: 200
        },

        title: {
            text: ''
        },

        pane: [{
            startAngle: -45,
            endAngle: 45,
            background: null,
            center: ['25%', '145%'],
            size: 300
        }, {
            startAngle: -45,
            endAngle: 45,
            background: null,
            center: ['75%', '145%'],
            size: 300
        }],

        yAxis: [{
            min: 0,
            max: 30,
            minorTickPosition: 'outside',
            tickPosition: 'outside',
            labels: {
                rotation: 'auto',
                distance: 20
            },
            plotBands: [{
                from: 0,
                to: 6,
                color: '#C02316',
                innerRadius: '100%',
                outerRadius: '105%'
            }],
            pane: 0,
            title: {
                text: 'New Tweets<br/><span style="font-size:8px">per second</span>',
                y: -40
            }
        }, {
            min: 0,
            max: 30,
            minorTickPosition: 'outside',
            tickPosition: 'outside',
            labels: {
                rotation: 'auto',
                distance: 20
            },
            plotBands: [{
                from: 0,
                to: 6,
                color: '#C02316',
                innerRadius: '100%',
                outerRadius: '105%'
            }],
            pane: 1,
            title: {
                text: 'New Users<br/><span style="font-size:8px">per second</span>',
                y: -40
            }
        }],

        plotOptions: {
            gauge: {
                dataLabels: {
                    enabled: false
                },
                dial: {
                    radius: '100%'
                }
            }
        },


        series: [{
            data: [-20],
            yAxis: 0
        }, {
            data: [-20],
            yAxis: 1
        }]

    }

    );






	$(document).ready(function () {
        Highcharts.setOptions({
            global: {
                useUTC: false
            }
        });

        $('#seriesChart').highcharts({
        	credits: {
                enabled: false
            },
            chart: {
                type: 'spline',
                animation: Highcharts.svg, // don't animate in old IE
                marginRight: 10
            },
            title: {
                text: 'New Tweets (per second)'
            },
            xAxis: {
                type: 'datetime',
                tickPixelInterval: 150
            },
            yAxis: {
                title: {
                    text: 'Value'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                },
                {
                    value: 0,
                    width: 1,
                    color: '#801080'
                }]
            },
            tooltip: {
                formatter: function () {
                    return '<b>' + this.series.name + '</b><br/>' +
                        Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>' +
                        Highcharts.numberFormat(this.y, 2);
                }
            },
            legend: {
                enabled: true
            },
            exporting: {
                enabled: false
            },
            series: [{
                name: 'New tweets',
                data: []
            },
            {
                name: 'New Users',
                data: []
            }]
        });
    });
});
</script>
</head>
<body>
	<div class="container">
		<h1>Twitter Streaming API Stats</h1>
		<div class="well">
			<table class="table bordered">
			<thead>
				<tr>
					<th># tweets</th>
					<th># users</th>
					<th>tweets / second</th>
					<th>users / second</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<span id="statusCount"></span>
					</td>
					<td>
						<span id="userCount"></span>
					</td>
					<td>
						<span id="tweetsPerSecond"></span>
					</td>
					<td>
						<span id="usersPerSecond"></span>
					</td>
				</tr>
			</tbody>
			</table>
		</div>
		<div id="rateChart"></div>
		<div id="seriesChart"></div>
	</div>
	<div class="well">
	<p>Catalan tweets count: ${catalanTweetsCount}</p>
	
	<g:each in="${catalanTweets}" var="tweet">
		<blockquote class="twitter-tweet">
		<img src="${tweet.status.getTwitterUser().getBiggerProfileImageURL()}" />
		<p>${tweet.status.getText()}</p>
		- ${tweet.status.getTwitterUser().getName()} (@${tweet.status.getTwitterUser().getScreenName()}) 
		<a target="_blank" href="https://twitter.com/${tweet.status.getTwitterUser().getScreenName()}/status/${tweet.status.statusId}">
			<g:formatDate date="${tweet.status.getCreatedAt()}" format="MMM d, yyyy" />
		</a>
		</blockquote>
		
	</g:each>
	</div>
</body>
</html>
