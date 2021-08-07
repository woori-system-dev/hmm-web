function makeLeakageAnalysisChart(divId, chartInfo) {
	Highcharts.theme = {
	    colors: ['#8F67B2', '#4898D6', '#63BF70', '#53B298', '#D65E49', '#D78137', '#E8BE32']
	};
	
	Highcharts.setOptions(Highcharts.theme);
	
	var chart = Highcharts.chart(divId, {
	    title: {
	        text: ''
	    },
	    subtitle: {
	        text: ''
	    },
	    yAxis: {
	        title: {
	            text: '유량'
	        }
	    },
	    xAxis: {
			categories: chartInfo.categories
		},
	    series: chartInfo.seriesList,
	    responsive: {
	        rules: [{
	            condition: {
	                maxWidth: 500
	            },
	            chartOptions: {
	                legend: {
	                    layout: 'horizontal',
	                    align: 'center',
	                    verticalAlign: 'bottom'
	                }
	            }
	        }]
	    },
	    exporting: {
			enabled: false
		},
		credits: {
			enabled: false
		}
	});
	
	return chart
}

function makeMinFlowAnalysisChart(divId, chartInfo) {
	Highcharts.theme = {
	    colors: ['#FF0000', '#07D5D5', '#63BF70', '#53B298', '#D65E49', '#D78137', '#E8BE32']
	};
	
	Highcharts.setOptions(Highcharts.theme);
	
	return Highcharts.chart(divId, {
	    title: {
	        text: chartInfo.title
	    },
	    yAxis: {
	        title: {
	            text: chartInfo.yaxis
	        }
	    },
	    xAxis: {
			categories: chartInfo.categories
		},
		legend: {
			enabled: false
		},
		tooltip: {
	        crosshairs: true,
	        shared: true
	    },
	    series: chartInfo.seriesList,
	    exporting: {
			enabled: false
		},
		credits: {
			enabled: false
		}
	});
}

function makePressureAnalysisChart(divId, chartInfo) {
	Highcharts.theme = {
	    colors: ['#E69D34', '#4898D5', '#C35E26', '#53B298']
	};
	
	Highcharts.setOptions(Highcharts.theme);
	
	return Highcharts.chart(divId, {
	    title: {
	        text: chartInfo.title
	    },
	    yAxis: {
	        title: {
	            text: chartInfo.yaxis
	        }
	    },
	    xAxis: {
			categories: chartInfo.categories
		},
		legend: {
			enabled: false
		},
		tooltip: {
	        crosshairs: true,
	        shared: true
	    },
	    series: chartInfo.seriesList,
	    exporting: {
			enabled: false
		},
		credits: {
			enabled: false
		}
	});
}

function makeDistributionLineChart(divId, chartInfo) {
	var chart = Highcharts.chart(divId, {
		title: {
	        text: false
	    },
	    subtitle: {
	        text: false
	    },
	    xAxis: {
			minRange: 5
		},
	    yAxis: {
	        title: {
	            text: '비율(%)'
	        }
	    },
	    tooltip: {
	        shared: true,
	        crosshairs: true
	    },
	    legend: {
	        enabled: false
	    },
	    series: chartInfo.lineSeriesList,
	    exporting: {
			enabled: false
		},
		credits: {
			enabled: false
		}
	});
	
	return chart;
}

function makePatternLineChart(divId, chartInfo) {
	Highcharts.theme = {
	    colors: ["#EC7959", "#3198C7"]
	};
	
	Highcharts.setOptions(Highcharts.theme);
		
	var chart = Highcharts.chart(divId, {
	    title: {
	        text: false
	    },
	    subtitle: {
	        text: false
	    },
	    yAxis: {
	        title: {
	            text: "수압"
	        }
	    },
	    plotOptions: {
	        series: {
	            label: {
	                connectorAllowed: false
	            },
	            pointStart: 2010
	        }
	    },
	    series: [{
	        name: 'Installation',
	        data: [43934, 52503, 57177, 69658, 97031, 119931, 137133, 154175]
	    }, {
	        name: 'Manufacturing',
	        data: [24916, 24064, 29742, 29851, 32490, 30282, 38121, 40434]
	    }],
	    legend: {
			enabled: false
		},
	    exporting: {
			enabled: false
		},
		credits: {
			enabled: false
		}
	});
	
	return chart;
}