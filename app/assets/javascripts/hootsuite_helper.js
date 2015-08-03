function attach(pic_url, pic_name, pic_extension) {
	var time = event.timeStamp;

	createToken(pic_url, time);
	var auth_token = getToken();
	window.alert(auth_token.stringify);
	hsp.attachFileToMessage ({ 
		url: pic_url, 
		name: pic_name, 
		extension: pic_extension, 
		timestamp: time, 
		token: auth_token
	});

}

function createToken(pic_url, time) {
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
	var auth_token = null;


	return $.ajax({
		url: "getAuth",
		type: "GET",
		data: {},
		dataType: "script",
	})
	.always(function(resp) {
		console.log("auth_token: " + auth_token);
		console.log("resp.responseText: " + resp.responseText);
	});
}