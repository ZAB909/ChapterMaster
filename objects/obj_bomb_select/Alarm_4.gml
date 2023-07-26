var i;i=-1;
repeat(31){
    i+=1;
    ship[i]="";
    ship_all[i]=0;
    ship_use[i]=0;
    ship_max[i]=0;
    ship_ide[i]=0;
}

max_ships=sh_target.capital_number+sh_target.frigate_number+sh_target.escort_number;

var fleet = sh_target;
for (var i = 0; i < max_ships; i++) {
	ship[i] = fleet.ships[i].name;
	ship_use[i] = 0;
	ship_max[i] = fleet.ships[i].carrying;
	ship_ide[i] = array_get_index(obj_ini.ship, fleet.ships[i]);
	bomb_b += ship_max[i];
	bomb_c += ship_max[i];
	
	if (fleet.ships[i].size = SHIP_SIZE.capital) {
		bomb_a += 3;	
	}
	else if (fleet.ships[i].size = SHIP_SIZE.frigate) {
		bomb_a += 1;
	}
}