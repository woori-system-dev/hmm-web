function makeGanttChart(divId) {
	var chart = AmCharts.makeChart(divId, {
		"type": "gantt",
		"theme": "light",
		"marginRight": 70,
		"period": "DD",
		"dataDateFormat": "YYYY-MM-DD",
		"columnWidth": 0.5,
		"valueAxis": {
			"type": "date"
		},
		"brightnessStep": 7,
		"graph": {
			"fillAlphas": 1,
			"lineAlpha": 1,
			"lineColor": "#fff",
			"fillAlphas": 0.85,
			"balloonText": "<b>[[task]]</b>:<br />[[open]] -- [[value]]"
		},
		"rotate": true,
		"categoryField": "category",
		"segmentsField": "segments",
		"colorField": "color",
		"startDateField": "start",
		"endDateField": "end",
		"dataProvider": [{
			"category": "고수압(경고)",
			"segments": [{
				"start": "2016-01-01",
				"end": "2016-01-14",
				"color": "#cc4748",
				"task": "Gathering requirements"
			}, {
				"start": "2016-01-16",
				"end": "2016-01-27",
				"task": "Producing specifications"
			}, {
				"start": "2016-02-05",
				"end": "2016-04-18",
				"task": "Development"
			}, {
				"start": "2016-04-18",
				"end": "2016-04-30",
				"task": "Testing and QA"
			}]
		}, {
			"category": "고수압(주의)",
			"segments": [{
				"start": "2016-01-08",
				"end": "2016-01-10",
				"color": "#FF5E00",
				"task": "Gathering requirements"
			}, {
				"start": "2016-01-12",
				"end": "2016-01-15",
				"task": "Producing specifications"
			}, {
				"start": "2016-01-16",
				"end": "2016-02-05",
				"task": "Development"
			}, {
				"start": "2016-02-10",
				"end": "2016-02-18",
				"task": "Testing and QA"
			} ]
		}, {
			"category": "저수압(경고)",
		}, {
			"category": "저수압(주의)",
		}, {
			"category": "문열림",
		}, {
			"category": "통신이상",
		}],
		"valueScrollbar": {
			"autoGridCount": true
		},
		"chartCursor": {
			"cursorColor": "#55bb76",
			"valueBalloonsEnabled": false,
			"cursorAlpha": 0,
			"valueLineAlpha": 0.5,
			"valueLineBalloonEnabled": true,
			"valueLineEnabled": true,
			"zoomable": false,
			"valueZoomable": true
		},
		"export": {
			"enabled": false
		}
	});
	
	return chart
}


