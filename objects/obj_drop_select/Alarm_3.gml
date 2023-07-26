var i;i=-1;
repeat(61){
    i+=1;
    ship[i]="";
    ship_all[i]=0;
    ship_use[i]=0;
    ship_max[i]=0;
    ship_ide[i]=0;
}

max_ships=0;

if (sh_target!=-50){
    max_ships=sh_target.capital_number+sh_target.frigate_number+sh_target.escort_number;


    var tump;tump=0;
	
    var fleet = sh_target;
	for (var i = 0; i < max_ships; i++) {
		ship[i] = fleet.ships[i].name;
		ship_use[i] = 0;
		ship_max[i] = fleet.ships[i].carrying;
		ship_ide[i] = array_get_index(obj_ini.ship, fleet.ships[i]);
		purge_b += ship_max[i];
		purge_c += ship_max[i];
	
		if (fleet.ships[i].size = SHIP_SIZE.capital) {
			ship_size[i] = 3;
			purge_a += 3;	
		}
		else if (fleet.ships[i].size = SHIP_SIZE.frigate) {
			ship_size[i] = 2;
			purge_a += 1;
		}
		else if (fleet.ships[i].size = SHIP_SIZE.escort) {
			ship_size[i] = 1;
		}
	}
}

