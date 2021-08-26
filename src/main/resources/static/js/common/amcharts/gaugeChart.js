var GaugeCharts = {
	red: function(id, value) {
		var gaugeChart = AmCharts.makeChart(id, {
			"type": "gauge",
		 	"theme": "light",
		  	"axes": [{
			    "axisAlpha": 0,
			    "tickAlpha": 0,
			    "labelsEnabled": false,
			    "startValue": 0,
			    "endValue": 100,
			    "startAngle": 0,
			    "endAngle": 360,
			    "bands": [{
				    "color": "#4D343B",
				    "startValue": 0,
				    "endValue": 100,
				    "radius": "100%",
				    "innerRadius": "75%",
				    "bandAlpha":0
			    },{
				    "color": "#E3090A",
				    "startValue": 0,
				    "endValue": value,
				    "radius": "100%",
				    "innerRadius": "75%"
			    }
			  	]}
		  	],
			"allLabels": [{
				"text": value + "%",
			  	"y": "40%",
			  	"size": 9,
			  	"bold": true,
			  	"color": "#B70607",
			  	"align": "center",
			}]
		});
		
		return gaugeChart;
	},
	green: function(id, value) {
		var gaugeChart = AmCharts.makeChart(id, {
			"type": "gauge",
		 	"theme": "light",
		  	"axes": [{
			    "axisAlpha": 0,
			    "tickAlpha": 0,
			    "labelsEnabled": false,
			    "startValue": 0,
			    "endValue": 100,
			    "startAngle": 0,
			    "endAngle": 360,
			    "bands": [{
				    "color": "#52646D",
				    "startValue": 0,
				    "endValue": 100,
				    "radius": "100%",
				    "innerRadius": "75%",
				    "bandAlpha":0
			    },{
				    "color": "#00FFFF",
				    "startValue": 0,
				    "endValue": value,
				    "radius": "100%",
				    "innerRadius": "75%"
			    }
			  	]}
		  	],
			"allLabels": [{
				"text": value + "%",
			  	"y": "40%",
			  	"size": 9,
			  	"bold": true,
			  	"color": "#04CABE",
			  	"align": "center",
			}]
		});
		
		return gaugeChart;
	},
	grayAndRed: function(id, value) {
		var gaugeChart = AmCharts.makeChart(id, {
			"type": "gauge",
		 	"theme": "light",
		  	"axes": [{
			    "axisAlpha": 0,
			    "tickAlpha": 0,
			    "labelsEnabled": false,
			    "startValue": 0,
			    "endValue": 100,
			    "startAngle": 0,
			    "endAngle": 360,
			    "bands": [{
				    "color": "#383838",
				    "startValue": 0,
				    "endValue": 100,
				    "radius": "100%",
				    "innerRadius": "75%",
				    "bandAlpha":0
			    },{
				    "color": "#FF0000",
				    "startValue": 0,
				    "endValue": value,
				    "radius": "100%",
				    "innerRadius": "75%"
			    }
			  	]}
		  	],
			"allLabels": [{
				"text": value,
			  	"y": "40%",
			  	"size": 15,
			  	"bold": true,
			  	"color": "#383838",
		  		"align": "center",
			}],
			"creditsPosition" : "bottom-left"
		});
		
		return gaugeChart;
	},
	grayAndGreen: function(id, value) {
		var gaugeChart = AmCharts.makeChart(id, {
			"type": "gauge",
		 	"theme": "light",
		  	"axes": [{
			    "axisAlpha": 0,
			    "tickAlpha": 0,
			    "labelsEnabled": false,
			    "startValue": 0,
			    "endValue": 100,
			    "startAngle": 0,
			    "endAngle": 360,
			    "bands": [{
				    "color": "#383838",
				    "startValue": 0,
				    "endValue": 100,
				    "radius": "100%",
				    "innerRadius": "75%",
				    "bandAlpha":0
			    },{
				    "color": "#00FFFF",
				    "startValue": 0,
				    "endValue": value,
				    "radius": "100%",
				    "innerRadius": "75%"
			    }
			  	]}
		  	],
			"allLabels": [{
				"text": value,
			  	"y": "41%",
			  	"size": 15,
			  	"bold": true,
			  	"color": "#383838",
			  	"align": "center",
			}],
			"creditsPosition" : "bottom-left"
		});
		
		return gaugeChart;
	},
	pressure: function(id, value) {
		var gaugeChart = AmCharts.makeChart(id, {
			"type": "gauge",
		 	"theme": "light",
		  	"axes": [{
			    "axisAlpha": 0,
			    "tickAlpha": 0,
			    "labelsEnabled": false,
			    "startValue": 0,
			    "endValue": 100,
			    "startAngle": 0,
			    "endAngle": 360,
			    "bands": [{
				    "color": "#383838",
				    "startValue": 0,
				    "endValue": 100,
				    "radius": "100%",
				    "innerRadius": "75%",
				    "bandAlpha":0
			    },{
				    "color": "#db1a48",
				    "startValue": 0,
				    "endValue": value * 6.6,
				    "radius": "100%",
				    "innerRadius": "75%"
			    }
			  	]}
		  	],
			"allLabels": [{
				"text": value,
			  	"y": "40%",
			  	"size": 15,
			  	"bold": true,
			  	"color": "#383838",
			  	"align": "center",
			}],
			"creditsPosition" : "bottom-left"
		});
	}, 
	device: function(id, value) {
		var gaugeChart = AmCharts.makeChart(id, {
			"type": "gauge",
		 	"theme": "light",
		  	"axes": [{
			    "axisAlpha": 0,
			    "tickAlpha": 0,
			    "labelsEnabled": false,
			    "startValue": 0,
			    "endValue": 100,
			    "startAngle": 0,
			    "endAngle": 360,
			    "bands": [{
				    "color": "#383838",
				    "startValue": 0,
				    "endValue": 100,
				    "radius": "100%",
				    "innerRadius": "75%",
				    "bandAlpha":0
			    },{
				    "color": "#0085bf", 
				    "startValue": 0,
				    "endValue": value * 6.6,
				    "radius": "100%",
				    "innerRadius": "75%"
			    }
			  	]}
		  	],
			"allLabels": [{
				"text": value,
			  	"y": "40%",
			  	"size": 15,
			  	"bold": true,
			  	"color": "#383838",
			  	"align": "center",
			}],
			"creditsPosition" : "bottom-left"
		});
	},
	leakage: function(id, value) {
		var gaugeChart = AmCharts.makeChart(id, {
			"type": "gauge",
		 	"theme": "light",
		  	"axes": [{
			    "axisAlpha": 0,
			    "tickAlpha": 0,
			    "labelsEnabled": false,
			    "startValue": 0,
			    "endValue": 100,
			    "startAngle": 0,
			    "endAngle": 360,
			    "bands": [{
				    "color": "#383838",
				    "startValue": 0,
				    "endValue": 100,
				    "radius": "100%",
				    "innerRadius": "75%",
				    "bandAlpha":0
			    },{
			    	"color": "#eef430",
				    "startValue": 0,
				    "endValue": value * 6.6,
				    "radius": "100%",
				    "innerRadius": "75%"
			    }
			  	]}
		  	],
			"allLabels": [{
				"text": value,
			  	"y": "40%",
			  	"size": 15,
			  	"bold": true,
			  	"color": "#383838",
			  	"align": "center",
			}],
			"creditsPosition" : "bottom-left"
		});
	}
}
