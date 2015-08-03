function attach(pic_url, pic_name, pic_extension) {
	var time = event.timeStamp;
	
	$.ajax({
		url: "getAuth",
		type: "GET",
		data: {
			url: pic_url,
			timeStamp: time
		},
		dataType: "script",
	}).always(function(resp) {

		hsp.attachFileToMessage ({ 
				url: pic_url, 
				name: pic_name, 
				extension: pic_extension, 
				timestamp: time, 
				token: resp.responseText
			});

		console.log("resp.responseText: " + resp.responseText);
	});
}