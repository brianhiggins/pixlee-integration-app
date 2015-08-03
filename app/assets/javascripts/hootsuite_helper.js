function attach(pic_url, pic_extension, pic_name) {
	var time = event.timeStamp;
	createToken(pic_url, time);

	var auth_token = getToken();

	hsp.attachFileToMessage ({ 
		url: pic_url, 
		name: pic_name, 
		extension: pic_extension, 
		timestamp: time, 
		token: auth_token
	});

}

function createToken(pic_url, time) {
	var auth_token = null;
	
		$.ajax({
		url: "createAuth",
		type: "POST", 
		data: {
			url: pic_url,
			timeStamp: time
		},
		dataType: "script",
	});
}

function getToken() {
	$.ajax({
		url: "getAuth",
		type: "GET",
		data: {},
		dataType: "script",
	}).always(function(resp) {
		auth_token = resp.responseText;
		console.log("auth_token: " + auth_token);
		console.log("resp.responseText: " + resp.responseText);

	});

	console.log("outside ajax: " + auth_token);
	return auth_token;
}