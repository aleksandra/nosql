
m = function() {
	regexp = /[0-9]{1,2}/g;
	if (regexp.test(this.Runtime)) {
		var runtime = this.Runtime.match(regexp);
		if (runtime.length == 2) {
			var h = parseFloat(runtime[0]);
			var min = parseFloat(runtime[1]);
		}
		else {
			var h = 0;
			var min = parseFloat(runtime[0]);
		}
		h = h + min/60;
		emit("runtime", h);
	}
};

r = function(key, values) {
	var result = 0, counter = 0;
	values.forEach(function(count) {
		result += count;
		counter += 1;
	});

	var time = result/counter;
	var h = time.toPrecision(1);
	var min = ((time % 1) * 60).toFixed();	
	return h + "h " + min + "min";
};	 

res = db.filmy.mapReduce(m, r, {out: "odp"});
printjson(res);
