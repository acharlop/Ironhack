function decode(words) {
	var i = 0;
	var secret = "";
	words.forEach(function (word){
		secret += word[i++ % 5];
	});
	return secret;
}

module.exports = decode;