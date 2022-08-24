var Charts = {
	pressure: function(id, data) {
		var chart = AmCharts.makeChart(id, {
			type: "serial",
		    theme: "light",
		    dataProvider: data,
		    synchronizeGrid: true,
		    valueAxes: [{
		        title: "비율(%)",
		        axisColor: "#DADADA",
		        dashLength: 1,
		        logarithmic: true
		    }],
		    graphs: [{
		    	type: "smoothedLine",
		    	bullet: "round",
				bulletColor: "#FFFFFF",
				useLineColorForBulletBorder: true,
				bulletBorderAlpha: 1,
				bulletBorderThickness: 2,
				bulletSize: 7,
				title: "비율(%)",
				valueField: "price",
				lineThickness: 2,
				lineColor: "#0000FF"
		    }],
		    chartCursor: {
		    	cursorPosition: "mouse",
		    },
		    categoryField: "date",
		    categoryAxis: {
		    	title: "수압",
		    	parseDates: true,
		    	minPeriod: "DD",
		    	dashLength: 1,
		    	gridAlpha: 0.15,
		    	axisColor: "#DADADA"
		    }
		});
		
		return chart;
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
		var chart = AmCharts.makeChart(id, {
			type: "serial",
		    theme: "light",
		    dataProvider: data,
		    dataDateFormat: "YYYY-MM-DD",
		    categoryField: "date",
		    categoryAxis: {
		    	parseDates: true,
		    	minPeriod: "DD",
		    	dashLength: 1,
		    	gridAlpha: 0.15,
		    	axisColor: "#DADADA"
		    },
		    valueAxes: [{
		        title: "유량",
		        axisColor: "#DADADA",
		        dashLength: 1,
		        logarithmic: true
		    }],
		    graphs: [{
				useLineColorForBulletBorder: true,
				bulletBorderAlpha: 1,
				bulletBorderThickness: 2,
				bulletSize: 7,
				title: "비율(%)",
				valueField: "price",
				lineThickness: 2,
				lineColor: "#0000FF"
		    }],
		    chartCursor: {
		    	"cursorPosition": "mouse",
		    }
		});
		
		return chart;
	},
	demand: function(id, data) {
		var chart = AmCharts.makeChart(id, {
			type: "serial",
		    theme: "light",
		    dataProvider: data,
		    dataDateFormat: "YYYY-MM-DD",
		    categoryField: "date",
		    categoryAxis: {
		    	parseDates: true,
		    	minPeriod: "DD",
		    	dashLength: 1,
		    	gridAlpha: 0.15,
		    	axisColor: "#DADADA"
		    },
		    valueAxes: [{
		        title: "유량",
		        axisColor: "#DADADA",
		        dashLength: 1,
		        logarithmic: true
		    }],
		    graphs: [{
				useLineColorForBulletBorder: true,
				bulletBorderAlpha: 1,
				bulletBorderThickness: 2,
				bulletSize: 7,
				title: "비율(%)",
				valueField: "price",
				lineThickness: 2,
				lineColor: "#0000FF"
		    },{
				useLineColorForBulletBorder: true,
				bulletBorderAlpha: 1,
				bulletBorderThickness: 2,
				bulletSize: 7,
				title: "비율(%)",
				valueField: "testVlaue",
				lineThickness: 2,
				lineColor: "#FF0000"
		    }],
		    chartCursor: {
		    	"cursorPosition": "mouse",
		    }
		});
		
		return chart;
	},
	minFlow: function(id, data) {
		var chart = AmCharts.makeChart(id, {
			type: "serial",
		    theme: "light",
		    dataProvider: data,
		    dataDateFormat: "YYYY-MM-DD",
		    categoryField: "date",
		    categoryAxis: {
		    	parseDates: true,
		    	minPeriod: "DD",
		    	dashLength: 1,
		    	gridAlpha: 0.15,
		    	axisColor: "#DADADA"
		    },
		    valueAxes: [{
		        title: "유량",
		        axisColor: "#DADADA",
		        dashLength: 1,
		        logarithmic: true
		    }],
		    graphs: [{
				useLineColorForBulletBorder: true,
				bulletBorderAlpha: 1,
				bulletBorderThickness: 2,
				bulletSize: 7,
				title: "비율(%)",
				valueField: "price",
				lineThickness: 2,
				lineColor: "#0000FF"
		    },{
				useLineColorForBulletBorder: true,
				bulletBorderAlpha: 1,
				bulletBorderThickness: 2,
				bulletSize: 7,
				title: "비율(%)",
				valueField: "testVlaue",
				lineThickness: 2,
				lineColor: "#FF0000"
		    }],
		    chartCursor: {
		    	"cursorPosition": "mouse",
		    }
		});
		
		return chart;
	}
}