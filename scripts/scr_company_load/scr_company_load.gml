function scr_company_load(_location) {

	var s = 1;
	
	var _ship_count = array_length(obj_ini.ship);
	for (var i = 0; i < _ship_count; i++) {
		var _ship = obj_ini.ship[i];
		if(_ship.location == _location) {
			sh_ide[s] = i;
	        sh_name[s] = _ship.name;
	        sh_class[s] = print_class(_ship.class);
	        sh_loc[s] = _ship.location;
	        //sh_uid[s] = obj_ini.ship_uid[i];
	        var _healt_percent = round(_ship.hp/_ship.max_hp)*100;
	        sh_hp[s] = string(_healt_percent)+"% HP";
	        sh_cargo[s] = _ship.carrying;
	        sh_cargo_max[s] = _ship.capacity;
		}
	}
	
	ship_current=1;
	ship_max=s;
	ship_see=30;


}
