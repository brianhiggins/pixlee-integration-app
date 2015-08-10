function attach(pic_url, pic_name, pic_extension) {
	var time = event.timeStamp;
	// calls controller function that will create the token to allow the post in
	// hootsuite's backend
	$.ajax({
		url: "getAuth",
		type: "GET",
		data: {
			url: pic_url,
		},
		dataType: "script",
	}).always(function(resp) { // gets the auth token as resp.responseText
		console.log(resp.responseText);
		// uses hootsuite api function to attach file
		hsp.attachFileToMessage ({ 
			url: pic_url, 
			name: pic_name,
			extension: pic_extension, 
			timestamp: resp.responseText[1], 
			token: resp.responseText[0]
		});
	});
}