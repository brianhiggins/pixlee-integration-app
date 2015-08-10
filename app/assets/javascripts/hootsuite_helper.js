function attach(pic_url, pic_name, pic_extension) {
	var _this = this;
	this.timeStamp = 0;

	function saveTime (loginTimeStamp) {
		this.timeStamp = loginTimeStamp;
	};

	function sendAttachRequest (auth_token) {
		hsp.attachFileToMessage ({ 
			url: pic_url, 
			name: pic_name,
			extension: pic_extension, 
			timestamp: _this.timeStamp, 
			token: auth_token
		});
	}

	$.ajax({
		url: "getTime",
		type: "GET",
		data: {},
		dataType: "json",
	}).success( function(resp) {
		console.log(resp);
		saveTime(resp);
	});

	// calls controller function that will create the token to allow the post in
	// hootsuite's backend
	$.ajax({
		url: "getAuth",
		type: "GET",
		data: {
			url: pic_url,
		},
		dataType: "json",
	}).success(function(resp) { // gets the auth token as resp.responseText
		console.log(resp.responseText);
		// uses hootsuite api function to attach file
		sentAttachRequest(resp.responseText);
	});
}