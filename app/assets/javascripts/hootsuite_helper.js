function attach(pic_url, pic_extension, pic_name) {
	var time = event.timeStamp;
	var auth_token = null;
	function createAuth(pic_url, time) {
		$.ajax({
			url: "createAuth",
			type: "POST", 
			data: {
				url: pic_url,
				timeStamp: time
			},
			dataType: "json",
		}).success(function(resp) {
			console.log(resp + " end. ");
		});
	}
	function getAuth() {
		var auth_token = null;
		$.ajax({
			url: "getAuth",
			type: "GET",
			data: {},
			dataType: "json",
		}).success(function(resp) {
			console.log(resp + " end. ");
			 auth_token = resp;
		});
		return auth_token;
	}

	hsp.attachFileToMessage ({ 
		url: pic_url, 
		name: pic_name, 
		extension: pic_extension, 
		timestamp: time, 
		token: auth_token
	});

}