
m = function() {
	if(this.Year <= 2000)
		emit("XX", 1);
	else
		emit("XXI", 1);
};

r = function(key, values) {
	var result = 0;
	values.forEach(function(count) {
		result += count;
	});
	return result;
};	 

res = db.filmy.mapReduce(m, r, {out: "odp"});
printjson(res);
