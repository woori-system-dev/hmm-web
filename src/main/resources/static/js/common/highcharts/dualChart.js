function makeMeasurementDualHighChart(divId, chartInfo) {
	
	var tickInterval = parseInt(chartInfo.categories.length / 10);
	
	Highcharts.theme = {
	    colors: ['#FF5E00', '#0054FF', '#ED561B', '#DDDF00', '#24CBE5', '#64E572', 
	             '#FF9655', '#FFF263', '#6AF9C4']
	};
	
	Highcharts.setOptions(Highcharts.theme);
	
	var chart = Highcharts.chart(divId, {
	    chart: {
	        zoomType: 'xy'
	    },
	    title: {
	        text: ''
	    },
	    xAxis: [{
	    	tickInterval: tickInterval,
	        categories: chartInfo.categories,
	        crosshair: true,
	        labels: {
				formatter: function() {
					return moment(this.value).format("M/D HH:mm");
				}
	        }
	    }],
	    yAxis: [{ // Primary yAxis
	    	title: {
	            text: '유량',
	            style: {
	                color: Highcharts.getOptions().colors[0]
	            }
	        },
	        labels: {
	            format: '{value}',
	            style: {
	                color: Highcharts.getOptions().colors[0]
	            }
	        }
	    }, { // Secondary yAxis
	        title: {
	            text: '수압',
	            style: {
	                color: Highcharts.getOptions().colors[1]
	            }
	        },
	        labels: {
	            format: '{value}',
	            style: {
	                color: Highcharts.getOptions().colors[1]
	            }
	        },
	        opposite: true
	    }],
	    plotOptions : {
			spline: {
            	marker: {
                	enabled: false
            	}
			}
		},
	    tooltip: {
	        shared: true
	    },
	    legend: {
	        layout: 'vertical',
	        align: 'left',
	        x: 120,
	        verticalAlign: 'top',
	        y: 20,
	        floating: true,
	        backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
	    },
	    series: [{
	        name: '유량',
	        type: 'spline',
	        data: chartInfo.firstSeries.data,
	    }, {
	        name: '수압',
	        type: 'spline',
	        yAxis: 1,
	        data: chartInfo.secondSeries.data,
	    }],
	    credits: {
			enabled: false
		}
	});
	
	return chart
}

