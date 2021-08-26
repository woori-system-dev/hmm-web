var Charts = {
	measurement: function(id, data) {
		AmCharts.ready(function () {
			// SERIAL CHART
			var chart = new AmCharts.AmSerialChart();
	
		    chart.dataProvider = data;
		    chart.categoryField = "date";
	
		    chart.synchronizeGrid = true; // this makes all axes grid to be at the same intervals
	
		    // AXES
		    // category
		    var categoryAxis = chart.categoryAxis;
		    categoryAxis.parseDates = true; // as our data is date-based, we set parseDates to true
		    categoryAxis.minPeriod = "DD"; // our data is daily, so we set minPeriod to DD
		    categoryAxis.minorGridEnabled = true;
		    categoryAxis.axisColor = "#DADADA";
		    categoryAxis.twoLineMode = true;
		    categoryAxis.dateFormats = [{
		         period: 'fff',
		         format: 'JJ:NN:SS'
		     }, {
		         period: 'ss',
		         format: 'JJ:NN:SS'
		     }, {
		         period: 'mm',
		         format: 'JJ:NN'
		     }, {
		         period: 'hh',
		         format: 'JJ:NN'
		     }, {
		         period: 'DD',
		         format: 'DD'
		     }, {
		         period: 'WW',
		         format: 'DD'
		     }, {
		         period: 'MM',
		         format: 'MMM'
		     }, {
		         period: 'YYYY',
		         format: 'YYYY'
		     }];
			     // first value axis (on the left)
		    var valueAxis1 = new AmCharts.ValueAxis();
		    valueAxis1.title = "유량";
		    valueAxis1.axisColor = "#FF1111";
		    valueAxis1.axisThickness = 2;
		    chart.addValueAxis(valueAxis1);
			     // second value axis (on the right)
		    var valueAxis2 = new AmCharts.ValueAxis();
		    valueAxis2.title = "수압";
		    valueAxis2.position = "right"; // this line makes the axis to appear on the right
		    valueAxis2.axisColor = "#1111FF";
		    valueAxis2.gridAlpha = 0;
		    valueAxis2.axisThickness = 2;
		    chart.addValueAxis(valueAxis2);

		    // GRAPHS
		    // first graph
		    var graph1 = new AmCharts.AmGraph();
		    graph1.valueAxis = valueAxis1; // we have to indicate which value axis should be used
		    graph1.title = "유량";
		    graph1.valueField = "visits";
		    graph1.bullet = "round";
		    graph1.lineColor = "#FF1111";
		    graph1.hideBulletsCount = 30;
		    graph1.bulletBorderThickness = 1;
		    chart.addGraph(graph1);
	
		    // second graph
		    var graph2 = new AmCharts.AmGraph();
		    graph2.valueAxis = valueAxis2; // we have to indicate which value axis should be used
		    graph2.title = "수압";
		    graph2.valueField = "hits";
		    graph2.bullet = "square";
		    graph2.lineColor = "#1111FF";
		    graph2.hideBulletsCount = 30;
		    graph2.bulletBorderThickness = 1;
		    chart.addGraph(graph2);
	
		    // CURSOR
		    var chartCursor = new AmCharts.ChartCursor();
		    chartCursor.cursorAlpha = 0.1;
		    chart.addChartCursor(chartCursor);
	
		    // LEGEND
		    var legend = new AmCharts.AmLegend();
		    legend.marginLeft = 100;
		    legend.useGraphSettings = true;
		    chart.addLegend(legend);
		    
		    // WRITE
		    chart.write(id);
		});
	},
	pressure: function(id, data) {
		AmCharts.ready(function () {
			// SERIAL CHART
			var chart = new AmCharts.AmSerialChart();

			chart.dataProvider = data;
			chart.categoryField = "date";
			chart.dataDateFormat = "YYYY-MM-DD";

			// AXES
			// category
			var categoryAxis = chart.categoryAxis;
			categoryAxis.title = "수압";
			categoryAxis.parseDates = true; // as our data is date-based, we set parseDates to true
			categoryAxis.minPeriod = "DD"; // our data is daily, so we set minPeriod to DD
			categoryAxis.dashLength = 1;
			categoryAxis.gridAlpha = 0.15;
			categoryAxis.axisColor = "#DADADA";

			// value
			var valueAxis = new AmCharts.ValueAxis();
			valueAxis.title = "비율(%)";
			valueAxis.axisColor = "#DADADA";
			valueAxis.dashLength = 1;
			valueAxis.logarithmic = true; // this line makes axis logarithmic
			chart.addValueAxis(valueAxis);

			// GRAPH
			var graph = new AmCharts.AmGraph();
			graph.type = "smoothedLine";
			graph.bullet = "round";
			graph.bulletColor = "#FFFFFF";
			graph.useLineColorForBulletBorder = true;
			graph.bulletBorderAlpha = 1;
			graph.bulletBorderThickness = 2;
			graph.bulletSize = 7;
			graph.title = "비율(%)";
			graph.valueField = "price";
			graph.lineThickness = 2;
			graph.lineColor = "#0000FF";
			chart.addGraph(graph);

			// CURSOR
			var chartCursor = new AmCharts.ChartCursor();
			chartCursor.cursorPosition = "mouse";
			chart.addChartCursor(chartCursor);

			// WRITE
			chart.write(id);
		});
	},
	pressurePie: function(id) {
		Highcharts.chart(id, {
		    chart: {
		        plotBackgroundColor: null,
		        plotBorderWidth: null,
		        plotShadow: false,
		        type: 'pie'
		    },
			exporting: {
				enabled: false
			},
		    title: {
		        text: false
		    },
		    tooltip: {
		        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
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
		        name: 'Brands',
		        colorByPoint: true,
		        data: [{
		            name: '4이상 4.5미만',
		            y: 11.84,
		        }, {
		            name: '4.5이상 5미만',
		            y: 10.85
		        }],
		        colors: ['#d0544d', '#4c86c3']
		    }]
		});
	},
	leakage: function(id, data) {
		AmCharts.ready(function () {
			// SERIAL CHART
			var chart = new AmCharts.AmSerialChart();

			chart.dataProvider = data;
			chart.categoryField = "date";
			chart.dataDateFormat = "YYYY-MM-DD";

			// AXES
			// category
			var categoryAxis = chart.categoryAxis;
			categoryAxis.parseDates = true; // as our data is date-based, we set parseDates to true
			categoryAxis.minPeriod = "DD"; // our data is daily, so we set minPeriod to DD
			categoryAxis.dashLength = 1;
			categoryAxis.gridAlpha = 0.15;
			categoryAxis.axisColor = "#DADADA";

			// value
			var valueAxis = new AmCharts.ValueAxis();
			valueAxis.title="유량";
			valueAxis.axisColor = "#DADADA";
			valueAxis.dashLength = 1;
			valueAxis.logarithmic = true; // this line makes axis logarithmic
			chart.addValueAxis(valueAxis);

			// GRAPH
			var graph = new AmCharts.AmGraph();
			graph.useLineColorForBulletBorder = true;
			graph.bulletBorderAlpha = 1;
			graph.bulletBorderThickness = 2;
			graph.bulletSize = 7;
			graph.title = "비율(%)";
			graph.valueField = "price";
			graph.lineThickness = 2;
			graph.lineColor = "#00FF00";
			chart.addGraph(graph);

			// CURSOR
			var chartCursor = new AmCharts.ChartCursor();
			chartCursor.cursorPosition = "mouse";
			chart.addChartCursor(chartCursor);

			// WRITE
			chart.write(id);
		});
	},
	demand: function(id, data) {
		AmCharts.ready(function () {
			// SERIAL CHART
			var chart = new AmCharts.AmSerialChart();

			chart.dataProvider = data;
			chart.categoryField = "date";
			chart.dataDateFormat = "YYYY-MM-DD";

			// AXES
			// category
			var categoryAxis = chart.categoryAxis;
			categoryAxis.parseDates = true; // as our data is date-based, we set parseDates to true
			categoryAxis.minPeriod = "DD"; // our data is daily, so we set minPeriod to DD
			categoryAxis.dashLength = 1;
			categoryAxis.gridAlpha = 0.15;
			categoryAxis.axisColor = "#DADADA";

			// value
			var valueAxis = new AmCharts.ValueAxis();
			valueAxis.title="유량";
			valueAxis.axisColor = "#DADADA";
			valueAxis.dashLength = 1;
			valueAxis.logarithmic = true; // this line makes axis logarithmic
			chart.addValueAxis(valueAxis);

			// GRAPH
			var graph = new AmCharts.AmGraph();
			graph.useLineColorForBulletBorder = true;
			graph.bulletBorderAlpha = 1;
			graph.bulletBorderThickness = 2;
			graph.bulletSize = 7;
			graph.title = "비율(%)";
			graph.valueField = "price";
			graph.lineThickness = 2;
			graph.lineColor = "#0000FF";
			chart.addGraph(graph);

			var graph2 = new AmCharts.AmGraph();
			graph2.useLineColorForBulletBorder = true;
			graph2.bulletBorderAlpha = 1;
			graph2.bulletBorderThickness = 2;
			graph2.bulletSize = 7;
			graph2.title = "비율(%)";
			graph2.valueField = "testVlaue";
			graph2.lineThickness = 2;
			graph2.lineColor = "#FF0000";
			chart.addGraph(graph2);

			// CURSOR
			var chartCursor = new AmCharts.ChartCursor();
			chartCursor.cursorPosition = "mouse";
			chart.addChartCursor(chartCursor);

			// WRITE
			chart.write(id);
		});
	},
	minFlow: function(id, data) {
		AmCharts.ready(function () {
			// SERIAL CHART
			var chart = new AmCharts.AmSerialChart();

			chart.dataProvider = data;
			chart.categoryField = "date";
			chart.dataDateFormat = "YYYY-MM-DD";

			// AXES
			// category
			var categoryAxis = chart.categoryAxis;
			categoryAxis.parseDates = true; // as our data is date-based, we set parseDates to true
			categoryAxis.minPeriod = "DD"; // our data is daily, so we set minPeriod to DD
			categoryAxis.dashLength = 1;
			categoryAxis.gridAlpha = 0.15;
			categoryAxis.axisColor = "#DADADA";

			// value
			var valueAxis = new AmCharts.ValueAxis();
			valueAxis.title="유량";
			valueAxis.axisColor = "#DADADA";
			valueAxis.dashLength = 1;
			valueAxis.logarithmic = true; // this line makes axis logarithmic
			chart.addValueAxis(valueAxis);

			// GRAPH
			var graph = new AmCharts.AmGraph();
			graph.useLineColorForBulletBorder = true;
			graph.bulletBorderAlpha = 1;
			graph.bulletBorderThickness = 2;
			graph.bulletSize = 7;
			graph.valueField = "price";
			graph.lineThickness = 2;
			graph.lineColor = "#0000FF";
			chart.addGraph(graph);

			var graph2 = new AmCharts.AmGraph();
			graph2.useLineColorForBulletBorder = true;
			graph2.bulletBorderAlpha = 1;
			graph2.bulletBorderThickness = 2;
			graph2.bulletSize = 7;
			graph2.valueField = "testVlaue";
			graph2.lineThickness = 2;
			graph2.lineColor = "#FF0000";
			chart.addGraph(graph2);

			// CURSOR
			var chartCursor = new AmCharts.ChartCursor();
			chartCursor.cursorPosition = "mouse";
			chart.addChartCursor(chartCursor);

			// WRITE
			chart.write(id);
		});
	}
}