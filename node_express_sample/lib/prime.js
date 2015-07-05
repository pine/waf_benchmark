'use strict';

module.exports = function(max) {
	var table = new Array(max);
	var i_max = Math.floor(Math.sqrt(max)) + 2;

	if (max < 3) {
		return -1;
	}

	// init table
	table[0] = table[1] = true; // 0 & 1 is not prime number

	// make table
	for (var i = 2; i < i_max; i++) {
		if (!table[i]) {
			for (var j = i + i; j < max; j += i) {
				table[j] = true;
			}
		}
	}

	// search
	for (var i = max - 1; i < max; i--) {
		if (!table[i]) {
			return i
		}
	}

	return -1
};
