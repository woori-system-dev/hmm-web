function makeMeasurementDualAmChart(divId, chartInfo) {
	var chart = AmCharts.makeChart(divId, {
	    "type": "serial",
	    "theme": "light",
	    "legend": {
	    	"equalWidths": false,
	        "useGraphSettings": true,
	        "align": "center",
	        "valueAlign": "left",
	        "valueWidth": 90
	    },
	    "dataProvider": chartInfo.chartDualDatas,
	    "synchronizeGrid": true,
	    "valueAxes": [{
	        "id":"v1",
	        "position": "left",
	        "title": "유량"
	    }, {
	        "id":"v2",
	        "position": "right",
	        "title": "수압"
	    }],
	    "graphs": [{
	        "valueAxis": "v1",
	        "lineColor": "#FF5E00",
	        "title": "유량",
	        "valueField": "first",
			"fillAlphas": 0,
			"balloonText": "유량 : [[value]] m²/hr",
			"legendValueText": "[[value]] m²/hr",
	    }, {
	        "valueAxis": "v2",
	        "lineColor": "#0054FF",
	        "title": "수압",
	        "valueField": "second",
			"fillAlphas": 0,
			"balloonText": "수압 : [[value]] kg/cm²",
			"legendValueText": "[[value]] kg/cm²",
	    }],
	    "chartScrollbar": {},
	    "chartCursor": {
	    	"categoryBalloonDateFormat": "YYYY-MM-DD JJ:NN:SS",
	        "cursorPosition": "mouse"
	    },
	    "categoryField": "date",
	    "categoryAxis": {
	    	"dateFormats": [
	    		{period: 'fff', format: 'JJ:NN:SS'},
	    		{period: 'ss', format: 'JJ:NN:SS'},
	    		{period: 'mm', format: 'JJ:NN'},
	    		{period: 'hh', format: 'JJ:NN'},
	    		{period: 'DD', format: 'MM월 DD일'},
	    		{period: 'WW', format: 'MM월 DD일'},
	    		{period: 'MM', format: 'MM월'},
	    		{period: 'YYYY', format: 'YYYY년'},
	    		{period: 'MM24', format: 'MM월'}],
    		"minPeriod": "ss",
    		"parseDates": true,
    		"autoGridCount": false,
    		"axisColor": "#DADADA",
    		"minorGridEnabled": true
	    },
	    "export": {
	    	"enabled": true,
	        "position": "bottom-right"
	     }
	});
	
	return chart
}

function makeMeasurementHourAmChart(divId, chartInfo) {
	var chart = AmCharts.makeChart(divId, {
	    "type": "serial",
	    "theme": "light",
	    "legend": {
	    	"equalWidths": false,
	        "useGraphSettings": true,
	        "align": "center",
	        "valueAlign": "left",
	        "valueWidth": 90
	    },
	    "dataProvider": chartInfo.chartDualDatas,
	    "synchronizeGrid": true,
	    "valueAxes": [{
	        "id":"v1",
	        "position": "left",
	        "title": "유량",
	        "axisColor": "#FF5E00",
	        "axisThickness": 2
	    }, {
	        "id":"v2",
	        "position": "right",
	        "title": "수압",
	        "axisColor": "#0054FF",
	        "axisThickness": 2
	    }],
	    "graphs": [{
	        "valueAxis": "v1",
	        "lineColor": "#FF5E00",
	        "title": "유량",
	        "valueField": "first",
			"fillAlphas": 0,
			"balloonText": "유량 : [[value]] m²/hr",
			"legendValueText": "[[value]] m²/hr",
	    }, {
	        "valueAxis": "v2",
	        "lineColor": "#0054FF",
	        "title": "수압",
	        "valueField": "second",
			"fillAlphas": 0,
			"balloonText": "수압 : [[value]] kg/cm²",
			"legendValueText": "[[value]] kg/cm²",
	    }],
	    /*"chartScrollbar": {},*/
	    "chartCursor": {
	    	"categoryBalloonDateFormat": "YYYY-MM-DD JJ:NN:SS",
	        "cursorPosition": "mouse"
	    },
	    "categoryField": "date",
	    "export": {
	    	"enabled": false,
	        "position": "bottom-right"
	     }
	});
	
	return chart
}