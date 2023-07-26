function scr_ship_count(_class) {
	var _ship_count = array_length(obj_ini.ship);
	var _result = 0;
	
	for(var i = 0; i < _ship_count; i++) {
		if(obj_ini.ship[i].class == _class) {
			++_result;
		}
	}
	return _result;
}

// Move that function with the other ship functions