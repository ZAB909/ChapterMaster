if (owner == 1) {
	var _x_position = 104;
	
	var _ship_height = 0;
	var _ship_count = array_length(ships);
	for (var i = 0; i < 6; i++) {
		if(obj_fleet.column[i] == SHIP_SIZE.capital) {
			obj_fleet.column_num[i] = obj_fleet.capital;
			_ship_height = 160;

		}
		else if(obj_fleet.column[i] == SHIP_SIZE.frigate) {
			obj_fleet.column_num[i] = obj_fleet.frigate;
			_ship_height = 96;

		}
		else if(obj_fleet.column[i] == SHIP_SIZE.escort) {
			obj_fleet.column_num[i] = obj_fleet.escort;
			_ship_height = 64;
		}
	}
	
	for (var i = 0; i < 6; i++) {
		_x_position += 20;
		if(obj_fleet.column[i] != 0) {
			var _column_height = obj_fleet.column_num[i] * _ship_height;				
			var _y_position = y - (_column_height/2) + 64;			
			for(var j = 0; j < _ship_count; j++) {
				var _ship = undefined;
				if(obj_fleet.column[i] == SHIP_SIZE.capital) {
					_ship = instance_create(_x_position,_y_position,obj_p_capital);
				}
				else if(obj_fleet.column[i] == SHIP_SIZE.frigate) {
					_ship = instance_create(_x_position,_y_position,obj_p_cruiser);
				}
				else {
					_ship = instance_create(_x_position,_y_position,obj_p_escort);
				}
				_ship.class = ships[i].class;
				_y_position += _ship_height;
			}
		}
	}
}
else if (owner == 2) {
	var _ship_count = array_length(ships);
	
	en_column[4] = SHIP_CLASS.sword_class_frigate;
	en_column[3] = SHIP_CLASS.avenger_class_grand_cruiser;
	en_column[2] = SHIP_CLASS.apocalypse_class_battleship;
	en_column[1] = SHIP_CLASS.nemesis_class_fleet_carrier;
	
	for (var i = 0; i < _ship_count; i++) {
		var _ship = ships[i];
		if(_ship.class == SHIP_CLASS.sword_class_frigate) {
			en_num[4]++;
			en_size[4] = SHIP_SIZE.escort;
		}
		else if(_ship.class == SHIP_CLASS.avenger_class_grand_cruiser) {
			en_num[3]++;
			en_size[3] = SHIP_SIZE.frigate;			
		}
		else if(_ship.class == SHIP_CLASS.apocalypse_class_battleship) {
			en_num[2]++;
			en_size[2] = SHIP_SIZE.capital;			
		}
		else if(_ship.class == SHIP_CLASS.nemesis_class_fleet_carrier) {
			en_num[1]++;
			en_size[1] = SHIP_SIZE.capital;			
		}
		
	}
}
else if (owner == 6) {
	var _ship_count = array_length(ships);
	
	en_column[4] = SHIP_CLASS.aconite;
	en_column[3] = SHIP_CLASS.hellebore;
	en_column[2] = SHIP_CLASS.shadow_class;
	en_column[1] = SHIP_CLASS.void_stalker;
	
	for (var i = 0; i < _ship_count; i++) {
		var _ship = ships[i];
		if(_ship.class == SHIP_CLASS.aconite) {
			en_num[4]++;
			en_size[4] = SHIP_SIZE.escort;
		}
		else if(_ship.class == SHIP_CLASS.hellebore) {
			en_num[3]++;
			en_size[3] = SHIP_SIZE.escort;			
		}
		else if(_ship.class == SHIP_CLASS.shadow_class) {
			en_num[2]++;
			en_size[2] = SHIP_SIZE.frigate;			
		}
		else if(_ship.class == SHIP_CLASS.void_stalker) {
			en_num[1]++;
			en_size[1] = SHIP_SIZE.capital;			
		}
		
	}
}
else if (owner == 7) {
	var _ship_count = array_length(ships);
	
	en_column[5] = SHIP_CLASS.ravager;
	en_column[4] = SHIP_CLASS.battlekroozer;
	en_column[3] = SHIP_CLASS.kroolboy;
	en_column[2] = SHIP_CLASS.gorbags_revenge;
	en_column[1] = SHIP_CLASS.dethdeala;
	
	for (var i = 0; i < _ship_count; i++) {
		var _ship = ships[i];
		if(_ship.class == SHIP_CLASS.ravager) {
			en_num[5]++;
			en_size[5] = SHIP_SIZE.escort;
		}
		else if(_ship.class == SHIP_CLASS.battlekroozer) {
			en_num[4]++;
			en_size[4] = SHIP_SIZE.frigate;
		}
		else if(_ship.class == SHIP_CLASS.kroolboy) {
			en_num[3]++;
			en_size[3] = SHIP_SIZE.capital;			
		}
		else if(_ship.class == SHIP_CLASS.gorbags_revenge) {
			en_num[2]++;
			en_size[2] = SHIP_SIZE.capital;			
		}
		else if(_ship.class == SHIP_CLASS.dethdeala) {
			en_num[1]++;
			en_size[1] = SHIP_SIZE.capital;			
		}
	}
}
else if (owner == 8) {
	var _ship_count = array_length(ships);
	
	en_column[5] = SHIP_CLASS.warden;
	en_column[4] = SHIP_CLASS.castellan;
	en_column[3] = SHIP_CLASS.protector;
	en_column[2] = SHIP_CLASS.emissary;
	en_column[1] = SHIP_CLASS.custodian;
	
	for (var i = 0; i < _ship_count; i++) {
		var _ship = ships[i];
		if(_ship.class == SHIP_CLASS.warden) {
			en_num[5]++;
			en_size[5] = SHIP_SIZE.escort;
		}
		else if(_ship.class == SHIP_CLASS.castellan) {
			en_num[4]++;
			en_size[4] = SHIP_SIZE.escort;
		}
		else if(_ship.class == SHIP_CLASS.protector) {
			en_num[3]++;
			en_size[3] = SHIP_SIZE.frigate;			
		}
		else if(_ship.class == SHIP_CLASS.emissary) {
			en_num[2]++;
			en_size[2] = SHIP_SIZE.frigate;			
		}
		else if(_ship.class == SHIP_CLASS.custodian) {
			en_num[1]++;
			en_size[1] = SHIP_SIZE.capital;			
		}
	}
}
else if (owner == 9) {
	var _ship_count = array_length(ships);
	
	en_column[4] = SHIP_CLASS.prowler;
	en_column[3] = SHIP_CLASS.razorfiend;
	en_column[2] = SHIP_CLASS.stalker;
	en_column[1] = SHIP_CLASS.leviathan;
	
	for (var i = 0; i < _ship_count; i++) {
		var _ship = ships[i];
		if(_ship.class == SHIP_CLASS.prowler) {
			en_num[4]++;
			en_size[4] = SHIP_SIZE.escort;
		}
		else if(_ship.class == SHIP_CLASS.razorfiend) {
			en_num[3]++;
			en_size[3] = SHIP_SIZE.frigate;			
		}
		else if(_ship.class == SHIP_CLASS.stalker) {
			en_num[2]++;
			en_size[2] = SHIP_SIZE.escort;			
		}
		else if(_ship.class == SHIP_CLASS.leviathan) {
			en_num[1]++;
			en_size[1] = SHIP_SIZE.capital;			
		}
	}
}
else if (owner == 10) {
	var _ship_count = array_length(ships);
	
	en_column[5] = SHIP_CLASS.iconoclast;
	en_column[4] = SHIP_CLASS.daemon;
	en_column[3] = SHIP_CLASS.carnage;
	en_column[2] = SHIP_CLASS.avenger;
	en_column[1] = SHIP_CLASS.desecrator;
	
	for (var i = 0; i < _ship_count; i++) {
		var _ship = ships[i];
		if(_ship.class == SHIP_CLASS.iconoclast) {
			en_num[5]++;
			en_size[5] = SHIP_SIZE.escort;
		}
		else if(_ship.class == SHIP_CLASS.daemon) {
			en_num[4]++;
			en_size[4] = SHIP_SIZE.frigate;
		}
		else if(_ship.class == SHIP_CLASS.carnage) {
			en_num[3]++;
			en_size[3] = SHIP_SIZE.frigate;			
		}
		else if(_ship.class == SHIP_CLASS.avenger) {
			en_num[2]++;
			en_size[2] = SHIP_SIZE.frigate;			
		}
		else if(_ship.class == SHIP_CLASS.desecrator) {
			en_num[1]++;
			en_size[1] = SHIP_SIZE.capital;			
		}
	}
}
else if (owner == 13) {
	var _ship_count = array_length(ships);
	
	en_column[4] = SHIP_CLASS.dirge;
	en_column[3] = SHIP_CLASS.jackal;
	en_column[2] = SHIP_CLASS.shroud;
	en_column[1] = SHIP_CLASS.reaper;
	
	for (var i = 0; i < _ship_count; i++) {
		var _ship = ships[i];
		if(_ship.class == SHIP_CLASS.dirge) {
			en_num[4]++;
			en_size[4] = SHIP_SIZE.escort;
		}
		else if(_ship.class == SHIP_CLASS.jackal) {
			en_num[3]++;
			en_size[3] = SHIP_SIZE.escort;			
		}
		else if(_ship.class == SHIP_CLASS.shroud) {
			en_num[2]++;
			en_size[2] = SHIP_SIZE.frigate;			
		}
		else if(_ship.class == SHIP_CLASS.reaper) {
			en_num[1]++;
			en_size[1] = SHIP_SIZE.capital;			
		}
	}
}

if (owner != 1) {
	for (var i = 0; i < 6; i++) {
		if (en_column[i] != undefined) {
			var _sprite = get_ship_sprite(en_column[i]);
			en_width[i] = sprite_get_width(_sprite) + 30;
			en_height[i] = sprite_get_height(_sprite) + 30;
		}
	}
}

action_set_alarm(1, 1);
