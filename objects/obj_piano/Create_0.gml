

	#macro c_ivory #FFFFF0
	#macro c_piano_black #222222
	
	var xx = 0; // current x-pos of keys
	var key_w = 40; // width of key
	var key_h = key_w * 6; // height of key
	var key_margin = 2; // keys margin
	
	notes = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "H"];
	
	var white_keys = [];
	var black_keys = [];
	
	// setup keys
	for(var i = -12; i < 13; i++) {
		var _note_in_octave = (i+12) % 12; // adding +12 to negative number is a dirty hack to have proper modulo
		
		// for first five keys, black are even, then they are uneven until next octave
		if ((_note_in_octave < 5 and _note_in_octave % 2 == 1) or (_note_in_octave > 5 and _note_in_octave % 2 == 0)) {
			// black key
			array_push(black_keys, {i: i, x: xx - key_w/2.5, w: key_w/1.25, h: key_h/2, clicked: 0});
		} else {
			// ivory key
			array_push(white_keys, {i: i, x: xx, w: key_w, h: key_h, clicked: 0});
			// move x-axis positions of keys only for white keys, it helps to render black key next to last white
			xx += key_w + key_margin;
		}
	}
	
	// prepare array with black and white key settings
	sets = [
		{keys: white_keys, key_color: c_ivory, text_color: c_black},
		{keys: black_keys, key_color: c_piano_black, text_color: c_ivory},
	];
	
	// align piano horiozntally
	x = room_width/2 - (array_length(white_keys)/2 * key_w+key_margin);
	
	// html5 checkoup, as audio doesn't play there on start, requires click first
	is_enabled = true;
	if (os_browser != browser_not_a_browser) {
		is_enabled = false;
	}