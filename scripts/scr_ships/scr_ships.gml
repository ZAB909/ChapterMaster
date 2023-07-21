enum SHIP_CLASS {
	battle_barge,
	strike_cruiser,
	gladius,
	hunter
};

enum SHIP_WEAPON {
	weapons_battery,
	thunderhawk_launch_bays,
	torpedo_tubes,
	torpedoes,
	bombardment_cannons
};

enum WEAPON_FACING {
	front,
	side, 
	special,
	left,
	right,
	most // I don't know what that means
}


// this could be redundant, we will see 
enum SHIP_SIZE {
	capital,
	frigate,
	escort
}

// Ships have: 
// according to older code
// Name
// Owner(faction)
// class
// size(redundant?)
// uid ??
// leadership (never user)
// max_hp
// hp
// location ??
// conditions (never used)
// speed
// turning battle stats
// front and other armor
// max weapons
// shields
// weapons
// weapon facing
// weapon conditions
// carry cap
// current carry
// turrets
// contents
function new_ship(ship_class, ship_name = "") constructor {
	class = ship_class;
	name = ship_name;
	selected = true;

	if(ship_class == SHIP_CLASS.battle_barge) {
		if (name == ""){
			name = scr_ship_name("imperial");
		}
		owner = 1;
		location = "home";
		size = SHIP_SIZE.capital;
		
		max_hp = 1200;
		hp = max_hp;	
		front_armor = 6;
		other_armor = 6;
		shields = 12;
		movespeed = 20;
		turning = 45;
		capacity = 600;
		carrying = 0;		
				
		max_weapons = 5;
		weapons = [];
		array_push(weapons, new new_ship_weapon(SHIP_WEAPON.weapons_battery, WEAPON_FACING.left));
		array_push(weapons, new new_ship_weapon(SHIP_WEAPON.weapons_battery, WEAPON_FACING.right));
		array_push(weapons, new new_ship_weapon(SHIP_WEAPON.thunderhawk_launch_bays, WEAPON_FACING.special));
		array_push(weapons, new new_ship_weapon(SHIP_WEAPON.torpedo_tubes, WEAPON_FACING.front));
		array_push(weapons, new new_ship_weapon(SHIP_WEAPON.bombardment_cannons, WEAPON_FACING.most));

		turrets = 3; 
	}
	else if(ship_class == SHIP_CLASS.strike_cruiser) {
		if (name == ""){
			name = scr_ship_name("imperial");
		}
		owner = 1;
		location = "home";
		size = SHIP_SIZE.frigate;
		
		max_hp = 600;
		hp = max_hp;
		front_armor = 6;
		other_armor = 6;
		shields = 6;
		movespeed = 25;
		turning = 90;
		capacity = 250;
		carrying = 0;
		
		max_weapons = 4;
		weapons = [];
		array_push(weapons, new new_ship_weapon(SHIP_WEAPON.weapons_battery, WEAPON_FACING.left));
		array_push(weapons, new new_ship_weapon(SHIP_WEAPON.weapons_battery, WEAPON_FACING.right));
		array_push(weapons, new new_ship_weapon(SHIP_WEAPON.thunderhawk_launch_bays, WEAPON_FACING.special));
		array_push(weapons, new new_ship_weapon(SHIP_WEAPON.bombardment_cannons, WEAPON_FACING.most));
			
		turrets = 1;
	}
	else if(ship_class == SHIP_CLASS.gladius) {
		if (name == ""){
			name = scr_ship_name("imperial");
		}
		owner = 1;
		location = "home";
		size = SHIP_SIZE.escort;

		
		max_hp = 200;
		hp = max_hp;
		front_armor = 5;
		other_armor = 5;
		shields = 1;
		movespeed = 30;
		turning = 90;
		capacity = 100;
		carrying = 0;
		
		max_weapons = 1;
		weapons = [];
		array_push(weapons, new new_ship_weapon(SHIP_WEAPON.weapons_battery, WEAPON_FACING.most));
		// according to a comment from duke the gladius weapon should do 25% more damage that the hunter
		// weapons[1].conditions = ; add something here ????
		
		turrets = 1;
	}
	else if(ship_class == SHIP_CLASS.hunter) {
		if (name == ""){
			name = scr_ship_name("imperium");
		}
		owner = 1;
		location = "home";
		size = SHIP_SIZE.escort;
	
	
		max_hp = 200;
		hp = max_hp;
		front_armor = 5;
		other_armor = 5;
		shields = 1;
		movespeed = 35;
		turning = 90;
		capacity = 50;
		carrying = 0;
		
		max_weapons = 2;
		weapons = [];
		array_push(weapons, new new_ship_weapon(SHIP_WEAPON.torpedoes, WEAPON_FACING.front));
		array_push(weapons, new new_ship_weapon(SHIP_WEAPON.weapons_battery, WEAPON_FACING.most));
		
		turrets = 1;
	}
}


function new_ship_weapon(ship_weapon, ship_facing) constructor {
	weapon = ship_weapon;
	facing = ship_facing;
	conditions = []; // not really needed for now
}

function count_ecsorts(ships) {
	if (!is_array(ships)) {
		return 0;
	}

	var count = 0;
	
	array_foreach(ships, 
		function(ship, index) {
			if (ship.size == SHIP_SIZE.escort) then ++count;
	});
	
	return count;
}

function count_frigates(ships) {
	if (!is_array(ships)) {
		return 0;
	}

	var count = 0;
	
	array_foreach(ships, 
		function(ship, index) {
			if (ship.size == SHIP_SIZE.frigate) then ++count;

	});
	
	return count;
}

function count_capitals(ships) {
	if (!is_array(ships)) {
		return 0;
	}

	var count = 0;
	
	array_foreach(ships, 
		function(ship, index) {
			if (ship.size == SHIP_SIZE.capital) then ++count;
	});
	
	return count;
}

function get_escorts(ships) {
	if (!is_array(ships)) {
		return [];
	}
	
	return array_filter(ships,
		function(ship, index) {
			return ship.size == SHIP_SIZE.escort;
	});
}

function get_frigates(ships) {
	if (!is_array(ships)) {
		return [];
	}
	
	return array_filter(ships,
		function(ship, index) {
			return ship.size == SHIP_SIZE.frigate;
	});
}

function get_capitals(ships) {
	if (!is_array(ships)) {
		return [];
	}
	
	return array_filter(ships,
		function(ship, index) {
			return ship.size == SHIP_SIZE.capital;
	});
}


// this function takes an array of ships, murders the crew of the dead ships and then removes them from the array,
// when murdering the crew it also sets a var that is has done some, so if the function is used in another array that has that dead ship it doesn't try to murder the crew twice
function clean_dead_ships(ships) {
	if (!is_array(ships)) {
		exit;
	}
	
	var new_len = array_filter_ext(ships, 
		function(ship, index) {
			if(ship.hp <= 0) {
				if(!ship.crew_killed) {
					//kill crew
				}
				return false;
			}
			return true;
	});
	
	array_resize(ships, new_len);
}


function kill_ship_crew(ship) {

	// WeeeeeeEEEEEEEEEE~

	// If a ship has been destroyed this kills the fuck out relevant marines
	// Also checks for lost company standards, chapter master, and cleans up
	// the company arrays afterward.

	var i, cmp, shi;
	i=0;cmp=0;shi=999;


	var clean;i=-1;
	repeat(30){i+=1;clean[i]=0;}



	if (argument0=1){
	    obj_controller.marines=0;
	    obj_controller.command=0;
	}



	i=0;
	repeat(3300){
	    i+=1;
    
	    if (i>300){i=1;cmp+=1;}
    
	    if (cmp<11) and (i>0) and (i<=300) {// Ran by obj_fleet to calculate the number of dead marines
	        if (obj_ini.name[cmp,i]!="") and ((ship_lost[obj_ini.lid[cmp,i]]>0) or (obj_ini.ship_hp[obj_ini.lid[cmp,i]]<=0)) and (obj_ini.lid[cmp,i]>0){
	            fallen+=1;clean[cmp]=1;
            
	            /*if (is_specialist(obj_ini.role[cmp,i])=true){
	                // obj_controller.marines+=1;
	                obj_controller.command-=1;
	            }*/
            
	            if (obj_ini.role[cmp,i]="Chapter Master"){obj_controller.alarm[7]=1;if (global.defeat<=1) then global.defeat=1;}
	            if (obj_ini.wep1[cmp,i]="Company Standard") then scr_loyalty("Lost Standard","+");
	            if (obj_ini.wep2[cmp,i]="Company Standard") then scr_loyalty("Lost Standard","+");
            
	            obj_ini.race[cmp,i]=0;obj_ini.loc[cmp,i]="";obj_ini.name[cmp,i]="";obj_ini.role[cmp,i]="";obj_ini.wep1[cmp,i]="";obj_ini.lid[cmp,i]=0;
	            obj_ini.wep2[cmp,i]="";obj_ini.armor[cmp,i]="";obj_ini.gear[cmp,i]="";obj_ini.hp[cmp,i]=100;obj_ini.chaos[cmp,i]=0;obj_ini.experience[cmp,i]=0;
	            obj_ini.mobi[cmp,i]="";obj_ini.age[cmp,i]=0;obj_ini.spe[cmp,i]="";obj_ini.god[cmp,i]=0;obj_ini.bio[cmp,i]=0;// obj_controller.marines-=1;
	        }
        
	        if (obj_ini.name[cmp,i]!="") and (obj_ini.role[cmp,i]!="") and (obj_ini.race[cmp,i]=1){
	            if (is_specialist(obj_ini.role[cmp,i])=false) then obj_controller.marines+=1
	            else obj_controller.command+=1;
	        }
        
	        if (i<120){
	            if (obj_ini.veh_role[cmp,i]!="") and ((ship_lost[obj_ini.veh_lid[cmp,i]]>0) or (obj_ini.ship_hp[obj_ini.veh_lid[cmp,i]]<=0)) and (obj_ini.veh_lid[cmp,i]>0){
	                clean[cmp]=1;
	                obj_ini.veh_race[cmp,i]=0;obj_ini.veh_loc[cmp,i]="";obj_ini.veh_name[cmp,i]="";obj_ini.veh_role[cmp,i]="";obj_ini.veh_wep1[cmp,i]="";obj_ini.veh_wep2[cmp,i]="";
	                obj_ini.veh_upgrade[cmp,i]="";obj_ini.veh_hp[cmp,i]=100;obj_ini.veh_chaos[cmp,i]=0;obj_ini.veh_pilots[cmp,i]=0;obj_ini.veh_lid[cmp,i]=0;
	            }
	        }
	    }
    
	}


	i=-1;
	repeat(31){
	    i+=1;
	    if (i<=10) and (clean[i]=1){with(obj_ini){scr_company_order(i);scr_vehicle_order(i);}}
	}


}

