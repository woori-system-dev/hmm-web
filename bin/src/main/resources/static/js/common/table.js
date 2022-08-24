/**
 * 테이블 관련 유틸
 */
$.extend($.fn.dataTable.defaults, {
	autoWidth: false,
	language: {
		emptyTable: "데이터가 없습니다.",
		infoEmpty: "",
		info: " _TOTAL_ 개의 데이터가 있습니다.",
	},
	responsive: true,
    searching: false,
	lengthChange: false,
    ordering: false,
    paging: false,
    info: false,
});

var Datatables = {
	basic: function(id, tableOption, info) {
		var table = $(id).DataTable({
			columns: tableOption.columns,
			columnDefs: [{
		    	targets : [0, 1],
				visible : false
		    }],
		});
		
		return table;
	},
	select: function(id, tableOption) {
	    var table = $(id).DataTable({
	    	select: {
		        style: "single"
		    },
			columns: tableOption.columns,
			columnDefs: [{
		    	targets : [0, 1],
				visible : false
		    }],
		});
	    
	    return table;
	},
	scroll: function(id, tableOption, info) {
		var table = $(id).DataTable({
			columns: tableOption.columns,
		    scrollY: "300px",
	        scrollCollapse: true,
	        paging: false
		});
		
		return table;
	},
	rowsAdd: function(table, url, param) {
		table.clear().draw();
		
		$.ajax({
			url: url,
			type: "POST",
			data: JSON.stringify(param),
			contentType: "application/json",
			success: function(data) {
				table.rows.add(data).draw();
		   	}
		});
	},
	refresh: function(table, data) {
		table.clear().draw();
		table.rows.add(data).draw();
	}
}
