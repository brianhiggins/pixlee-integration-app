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
	});
	
	$.ajax({
		url: "getAuth",
		type: "GET",
		data: {},
		dataType: "json",
	}).done(function(resp) {
		console.log(resp + " end. ");
		 auth_token = resp;
	});
	window.alert(auth_token);
	return auth_token;
}