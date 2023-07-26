
var i;i=-1;
repeat(31){
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
}


if (ship_max[500]!=0) then max_ships+=1;

ship_all[500]=0;
ship_use[500]=0;
if (l_size>0) then l_size=l_size*-1;



if (sh_target!=-50){
	
	var fleet = sh_target;
	var ship_count = array_length(fleet.ships);
	for (var i = 0; i < ship_count; i++) {
		if (fleet.ships[i].carrying > 0) {
			ship[i] = fleet.ships[i].name;
			ship_use[i] = 0;
			ship_max[i] = fleet.ships[i].carrying;
			ship_ide[i] = array_get_index(obj_ini.ship, fleet.ships[i]);
			
			if (fleet.ships[i].size = SHIP_SIZE.capital) {
				ship_size[i] = 3;	
			}
			else if (fleet.ships[i].size = SHIP_SIZE.frigate) {
				ship_size[i] = 2;
			}
			else if (fleet.ships[i].size = SHIP_SIZE.escort) {
				ship_size[i] = 1;
			}
		}
	}
}


