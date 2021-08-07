function makePieChart(divId) {
	var chart = AmCharts.makeChart(divId, {
		"type" : "pie",
		"theme" : "light",
		"dataProvider" : [ {
			"country" : "경보",
			"litres" : 441
		}, {
			"country" : "주의",
			"litres" : 334
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

	return chart
}


