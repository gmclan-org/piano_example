

	draw_set_halign(fa_center);
	
	var _hovered = undefined;
	
	for(var s = 0; s < 2; s++) { // 2 is number of "sets"
		for(var i = 0, n = array_length(sets[s].keys); i < n; i++) {
			
			var k = sets[s].keys[i]; // assign current key to shorter variable
			// draw key
			draw_set_color(sets[s].key_color);
			draw_rectangle(x + k.x, y, x+k.x + k.w, y + k.h, false);
			// if it was recently clicked, draw it, and decrease animation
			if (k.clicked) {
				draw_sprite_ext(spr_key_pressed, 0, x + k.x, y + k.h - 80, k.w/40, 2, 0, c_white, k.clicked);
				k.clicked = max(0, k.clicked - 0.08);
			}
			//
			draw_set_color(sets[s].text_color);
			draw_text(x + k.x + (k.x + k.w - k.x)/2, y + k.h - 40, notes[(k.i+12)%12]);
			
			if (mouse_x >= x + k.x and mouse_x <= x+k.x + k.w) {
				if (mouse_y >= y and mouse_y <= y + k.h) {
					// this key was hovered
					// we're setting this to "var", cause if black key is hovered,
					// it will override underlying white key this way
					_hovered = k;
				}
			}
		}
	}
	
	// if hovered - draw hover
	if (is_enabled and _hovered != undefined) {
		draw_set_color(c_orange);
		var k = _hovered;
		draw_sprite_ext(spr_key_pressed, 0, x + k.x, y + k.h + 4, k.w/40, 2/40, 0, c_yellow, 1);
		
		// if clicked - play nice sound :)
		if (mouse_check_button_pressed(mb_left)) {
			audio_play_sound(snd_c, 0, 0, 1, 0, power(2, k.i/12));
			k.clicked = 1;
		}
	}
	
	// for HTML5, display info, that you need to activate audio
	if (is_enabled == false) {
		draw_set_color(c_white);
		draw_text(room_width/2, room_height - 40, "To enable sound in this example, please click anywhere inside canvas.");
		if (mouse_check_button_pressed(mb_any)) {
			is_enabled = true;
		}
	}
	
	// credits - but you don't need to add them in your game
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_text(5, 5, "Piano keys example");
	draw_text(5, 25, "Created by @gnysek for gmclan.org");