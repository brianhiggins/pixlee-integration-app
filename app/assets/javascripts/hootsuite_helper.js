function attach(pic_url, pic_extension, pic_name) {
	var time = event.timeStamp;

	var auth_token = authenticate(pic_url, time);

	hsp.attachFileToMessage ({ 
		url: pic_url, 
		name: pic_name, 
		extension: pic_extension, 
		timestamp: time, 
		token: auth_token
	});

}

function authenticate(pic_url, time) {
	var auth_token = null;
	
		$.ajax({
		url: "createAuth",
		type: "POST", 
		data: {
			url: pic_url,
			timeStamp: time
		},
		dataType: "json",
	}).done(
		$.ajax({
			url: "getAuth",
			type: "GET",
			data: {},
			dataType: "string",
		}).always(function(resp) {
			console.log(resp[1] + " end. ");
			 window.alert(resp);
		})
	);
	return auth_token;
}