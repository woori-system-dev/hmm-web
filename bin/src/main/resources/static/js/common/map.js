function baseMap(coords) {
	var map = new ol.Map({
	    layers: [
	      new ol.layer.Tile({
	        source: new ol.source.OSM()
	      }),
	      /* vectorLayer[0] */
	    ],
	    target: 'map',
	    controls: ol.control.defaults({
	      attributionOptions: {
	        collapsible: false,
	      },
	      zoom:false
	    }),
	    view: new ol.View({
	      /* projection: 'EPSG:4326', */
			center: [14158030, 4518500],
			zoom: 12
	    })
	});
	
	var styles = {       
	    'Polygon': new ol.style.Style({
	      stroke: new ol.style.Stroke({
	        color: 'blue',
	        /* lineDash: [4], */
	        width: 2
	      }),
	      fill: new ol.style.Fill({
	        color: 'rgba(0, 0, 255, 0.1)'
	      })
	    })
	  };
		
	var styleFunction = function(feature) {
	    return styles[feature.getGeometry().getType()];
	  };
	var vectorLayer = new ol.layer.Vector({
	    style: styleFunction,
	    source: new ol.source.Vector({
	    	features: (new ol.format.GeoJSON()).readFeatures({
	    		'type': 'FeatureCollection',
	            'features':[{ 
	                "type": "Feature", 
	                "id":"HOYWON",
	                "geometry": { 
	                    "type": "Polygon",
	                    "coordinates": JSON.parse(coords)
	                } 
	            }],
			},{
	        	'dataProjection': 'EPSG:4326',
				'featureProjection': 'EPSG:3857'
	        })
	    })
	});
	map.addLayer(vectorLayer);
}


function monitoringMap(domain) {
	console.log(domain);
	var map = new ol.Map({
	    layers: [
	      new ol.layer.Tile({
	        source: new ol.source.OSM()
	      }),
	      /* vectorLayer[0] */
	    ],
	    target: 'map',
	    controls: ol.control.defaults({
	      attributionOptions: {
	        collapsible: false
	      }
	    }),
	    view: new ol.View({
	      /* projection: 'EPSG:4326', */
			center: [14158030, 4518500],
			zoom: 12
	    })
	});
	
	var styles = {       
	    'Polygon': new ol.style.Style({
	      stroke: new ol.style.Stroke({
	        color: 'blue',
	        /* lineDash: [4], */
	        width: 2
	      }),
	      fill: new ol.style.Fill({
	        color: 'rgba(0, 0, 255, 0.1)'
	      })
	    })
	  };
		
	var styleFunction = function(feature) {
	    return styles[feature.getGeometry().getType()];
	  };
	var vectorLayer = new ol.layer.Vector({
	    style: styleFunction,
	    source: new ol.source.Vector({
	    	features: (new ol.format.GeoJSON()).readFeatures({
	    		'type': 'FeatureCollection',
	            'features':[{ 
	                "type": "Feature", 
	                "id":"HOYWON",
	                "geometry": { 
	                    "type": "Polygon",
	                    "coordinates": JSON.parse(coords)
	                } 
	            }],
			},{
	        	'dataProjection': 'EPSG:4326',
				'featureProjection': 'EPSG:3857'
	        })
	    })
	});
	map.addLayer(vectorLayer);
}

function makeMap(divId) {
	var map = new ol.Map({
	    layers: [
	    	new ol.layer.Tile({
	    		source: new ol.source.OSM()
	    	}),
	    ],
	    target: divId,
	    controls: ol.control.defaults({
	    	attributionOptions: {
	    		collapsible: false
	    	}
	    }),
	    view: new ol.View({
			center: [14158530, 4518000],
			zoom: 14
	    })
	});
	
	return map;
}

function makeStyle(fill) {
	var styles = new ol.style.Style({
		stroke: new ol.style.Stroke({
	    	color: 'blue',
	        width: 2
	    }),
	    fill: new ol.style.Fill({
	    	color: fill
	    })
	});
	
	return styles;
}

function makeLabelStyle(text) {
	var labelStyle = new ol.style.Style({
		geometry: function(feature) {
	    	var geometry = feature.getGeometry();
	    	if (geometry.getType() == 'MultiPolygon') {
	    		var polygons = geometry.getPolygons();
	    		var widest = 0;
	    		for (var i = 0, ii = polygons.length; i < ii; ++i) {
	    			var polygon = polygons[i];
	    			var width = ol.extent.getWidth(polygon.getExtent());
	    			if (width > widest) {
	    				widest = width;
	    				geometry = polygon;
	    			}
	    		}
	      }
	      return geometry;
	    },
	    text: new ol.style.Text({
	    	text: text,
	    	font: '12px Calibri,sans-serif',
	    	overflow: true,
	    	fill: new ol.style.Fill({
	    		color: 'blue',
	    	}),
	    	stroke: new ol.style.Stroke({
	    		color: '#fff',
	    		width: 4
	    	})
	    })
	});
	
	return labelStyle;
}

function makeVectorLayer(blockInfo) {
	var vectorLayer = new ol.layer.Vector({
	    source: new ol.source.Vector({
	    	features: (new ol.format.GeoJSON()).readFeatures({
	    		type: "FeatureCollection",
	        	features: [{ 
	                type: "Feature", 
	                properties: {"name": blockInfo.bkNm},
	                geometry: {
	                    type: "Polygon",
	                    coordinates: JSON.parse(blockInfo.coords)
	                } 
	            }],
			},{
	        	dataProjection: "EPSG:4326",
				featureProjection: "EPSG:3857"
	        })
	    }),
		style: function(feature) {
			//labelStyle.getText().setText(feature.get("name"));
	    	return [makeStyle("#ffffff00"), makeLabelStyle(blockInfo.bkNm)];
		},
		declutter: true
	});
	
	return vectorLayer;
}