function makeRedGaugeChart(divId, value) {
	var gaugeChart = AmCharts.makeChart(divId, {
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
}

function makeGreenGaugeChart(divId, value) {
	var gaugeChart = AmCharts.makeChart(divId, {
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
}

function makeBgReadGaugeChart(divId, value) {
	var gaugeChart = AmCharts.makeChart(divId, {
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
			    "endValue": 100,
			    "radius": "100%",
			    "innerRadius": "75%"
		    }
		  	]}
	  	],
		"allLabels": [{
			"text": value.toFixed(2),
			"x": (value.toFixed(2) + '').length == 4 ? "44%" : "42%",
		  	"y": "41%",
		  	"size": 15,
		  	"bold": true,
		  	"color": "#383838"
		}],
		"creditsPosition" : "bottom-left"
	});
	
	return gaugeChart;
}

function makeBgGrayGaugeChart(divId, value, x) {
	console.log((value.toFixed(2) + '').length);
	var gaugeChart = AmCharts.makeChart(divId, {
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
			    "color": "#FFFFFF",
			    "startValue": 0,
			    "endValue": 0,
			    "radius": "100%",
			    "innerRadius": "75%"
		    }
		  	]}
	  	],
		"allLabels": [{
			"text": value.toFixed(2),
		  	"x": x == undefined ? (value.toFixed(2) + '').length == 4 ? "44%" : "42%" : x,
		  	"y": "41%",
		  	"size": 15,
		  	"bold": true,
		  	"color": "#383838"
		}],
		"creditsPosition" : "bottom-left"
	});
	
	return gaugeChart;
}