function makePieChart(divId, warning, caution) {
	var chart = AmCharts.makeChart(divId, {
		"type" : "pie",
		"theme" : "light",
		"dataProvider" : [ {
			"country" : "경보",
			"litres" : warning
		}, {
			"country" : "주의",
			"litres" : caution
		} ],
		"valueField" : "litres",
		"titleField" : "country",
		"balloon" : {
			"fixedPosition" : true
		},
		"export" : {
			"enabled" : false
		}
	});

	return chart;
}


