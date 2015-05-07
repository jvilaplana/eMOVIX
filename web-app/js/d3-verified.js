$(function() {
	var links;
	$.getJSON(_d3_url,
			function(data) {
				links = data;

				var nodes = {};

				// Compute the distinct nodes from the links.
				links.forEach(function(link) {
					link.source = nodes[link.source] || (nodes[link.source] = {
						name : link.source
					});
					link.target = nodes[link.target] || (nodes[link.target] = {
						name : link.target
					});
				});

				var width = 960, height = 500;

				var force = d3.layout.force().nodes(d3.values(nodes)).links(
						links).size([ width, height ]).linkDistance(60).charge(
						-300).on("tick", tick).start();

				var svg = d3.select("#graphSvg").append("svg").attr("width",
						width).attr("height", height);

				// Per-type markers, as they don't inherit styles.
				svg.append("defs").selectAll("marker").data(
						[ "bullying", "licensing", "resolved" ]).enter()
						.append("marker").attr("id", function(d) {
							return d;
						}).attr("viewBox", "0 -5 10 10").attr("refX", 15).attr(
								"refY", -1.5).attr("markerWidth", 6).attr(
								"markerHeight", 6).attr("orient", "auto")
						.append("path").attr("d", "M0,-5L10,0L0,5");

				var path = svg.append("g").selectAll("path")
						.data(force.links()).enter().append("path").attr(
								"class", function(d) {
									return "link " + d.type;
								}).attr("marker-end", function(d) {
							return "url(#" + d.type + ")";
						});
				var labelText = svg.selectAll(".labelText")
			    .data(force.links())
			  .enter().append("text")
			    .attr("class","labelText")
			    .attr("dx",20)
			    .attr("dy",0)
			    .style("fill","red")
			  .append("textPath")
			    .attr("xlink:href",function(d,i) { return "#linkId_" + i;})
			    .text(function(d,i) { return "text for link " + i;});
				
				var circle = svg.append("g").selectAll("circle").data(
						force.nodes()).enter().append("circle").attr("r", 6)
						.on("click", click).on("dblclick", dblclick).call(
								force.drag);

				var text = svg.append("g").selectAll("text")
						.data(force.nodes()).enter().append("text")
						.attr("x", 8).attr("y", ".31em").text(function(d) {
							return d.name;
						});

				// action to take on mouse click
				function click(n) {
					console.log(n);
					console.log("click!!");
					/*
					console.log(d3.select(this));
					d3.select(this).transition().duration(750).attr("x", 22)
							.style("fill", "steelblue").style("stroke",
									"lightsteelblue").style("stroke-width",
									".5px").style("font", "20px sans-serif");
					d3.select(this).transition().duration(750).attr("r", 16)
							.style("fill", "lightsteelblue");
							*/
				}

				// action to take on mouse double click
				function dblclick() {
					d3.select(this).select("circle").transition().duration(750)
							.attr("r", 6).style("fill", "#ccc");
					d3.select(this).select("text").transition().duration(750)
							.attr("x", 12).style("stroke", "none").style(
									"fill", "black").style("stroke", "none")
							.style("font", "10px sans-serif");
				}

				// Use elliptical arc path segments to doubly-encode
				// directionality.
				function tick() {
					path.attr("d", linkArc);
					circle.attr("transform", transform);
					text.attr("transform", transform);
				}

				function linkArc(d) {
					var dx = d.target.x - d.source.x, dy = d.target.y
							- d.source.y, dr = Math.sqrt(dx * dx + dy * dy);
					return "M" + d.source.x + "," + d.source.y + "A" + dr + ","
							+ dr + " 0 0,1 " + d.target.x + "," + d.target.y;
				}

				function transform(d) {
					return "translate(" + d.x + "," + d.y + ")";
				}
			});
});