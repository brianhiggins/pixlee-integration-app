function attach(pic_url, pic_name, pic_extension) {
	var time = event.timeStamp;

	createToken(pic_url, time);
	// var auth_token = 
	getToken(pic_url, pic_name, pic_extension, time);
	// window.alert("raw: " + auth_token + " stringify: " + auth_token.stringify);
	// hsp.attachFileToMessage ({ 
	// 	url: pic_url, 
	// 	name: pic_name, 
	// 	extension: pic_extension, 
	// 	timestamp: time, 
	// 	token: auth_token
	// });

}

function createToken(pic_url, time) {
	$.ajax({
		url: "createAuth",
		type: "POST", 
		data: {
			url: pic_url,
			timeStamp: time
		},
		dataType: "json",
	});
}

function getToken(pic_url, pic_name, pic_extension, time) {
	return $.ajax({
		url: "getAuth",
		type: "GET",
		data: {},
		dataType: "json",
	})
	.always(function(resp) {

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