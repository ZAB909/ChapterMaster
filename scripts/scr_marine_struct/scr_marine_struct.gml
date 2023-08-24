// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function TTRPG_stats(faction, comp, mar, class = "marine") constructor{
	if (class == "marine"){
		company = comp;
		marine_number = mar;
		alligence =faction;
		if (faction ="chapter"){
			alligence = global.chapter_name;
		}
		if (instance_exists(obj_controller)){
			role_history = [[obj_ini.role[company,marine_number], obj_controller.turn]]; //marines_promotion and demotion history
			marine_ascension = obj_controller.turn; // on what day did turn did this marine begin to exist
		} else {
			role_history = [[obj_ini.role[company,marine_number], "pre_game"]];
			marine_ascension = "pre_game"; // on what day did turn did this marine begin to exist

		}
		weapon_skills = {"bolter":3, "chainsword":3};
		strength = 5;
		constitution = 5;
		dexterity = 5;
		intelligence = 5;
		wisdom = 5;
		charisma = 5;
		religion = "Imperial Cult";
		piety = 5;
		static experience =  function(){return obj_ini.experience[company,marine_number];}//get exp
		static update_exp = function(new_val){obj_ini.experience[company,marine_number] =new_val}//change exp
		static bionics = function(){return obj_ini.bio[company,marine_number];}// get marine bionics count
		static update_bionics = function(new_val){obj_ini.bio[company,marine_number] = new_val;}
		static age = function(){return obj_ini.age[company,marine_number];}// age
		static update_age = function(new_val){obj_ini.age[company,marine_number] = new_val;}		
		static name = function(){return obj_ini.name[company,marine_number];}// get marine health

		static hp = function(){ 
			return obj_ini.hp[company,marine_number]
		};
		//update_marine health
       static update_health = function(new_health){
            obj_ini.hp[company,marine_number] = new_health;
	   };
		static weapon_one = function(){ 
			return obj_ini.wep1[company,marine_number];
		};
       static update_weapon_one = function(new_weapon){
            obj_ini.wep1[company,marine_number] = new_weapon;
	   };
		static weapon_two = function(){ 
			return obj_ini.wep1[company,marine_number];
		};
       static update_weapon_two = function(new_weapon){
            obj_ini.w[company,marine_number] = new_weapon;
	   };
		static armour = function(){ 
			return obj_ini.armour[company,marine_number];
		};	   
       static update_armour = function(new_armour){
            obj_ini.armour[company,marine_number] = new_armour;
			get_unit_size(); //every time armour is changed see if the marines size has changed
	   };	
		static corruption = function(){ 
			return obj_ini.chaos[company,marine_number];
		};	   
       static update_corruption = function(new_corruption){
            obj_ini.chaos[company,marine_number] = new_corruption;
	   };	
		static specials = function(){ 
			return obj_ini.spe[company,marine_number];
		};	   
       static update_specials = function(new_specials){
            obj_ini.spe[company,marine_number] = new_specials;
	   };
	   	static mobility_item = function(){ 
			return obj_ini.mobi[company,marine_number];
		};	   
       static update_mobility_item = function(new_mobility_item){
            obj_ini.mobi[company,marine_number] = new_mobility_item;
			get_unit_size(); //every time mobility_item is changed see if the marines size has changed
	   };	
	   	static race = function(){ 
			return obj_ini.race[company,marine_number];
		};	
		static role = function(){
			return obj_ini.role[company,marine_number];
		};
		static update_role = function(new_role){
			obj_ini.role[company,marine_number]= new_role;
			array_append(role_history ,[obj_ini.wep1[company,marine_number], obj_controller.turn])
		};
		
		static get_unit_size = function(){
			var r = role();
			var arm = armour();
		    var sz = 1;
		    if (r!=""){
				var bulky_armour = ["Terminator Armour", "Tartaros"]
		        if (string_count("Dread",arm)>0) {sz+=5;}else if (array_contains(bulky_armour,arm)){sz +=1};
		        if (r="Rhino") {sz=10;}
		        else if (r="Predator") {sz=10;}
		        else if (r="Land Raider") {sz=20;} 
		        else if (r="Land Speeder") {sz=5;}
		        else if (r="Whirlwind") {sz=10;}
		        else if (r="Harlequin Troupe") {sz=5;}
				else if (r="Chapter Master"){sz+=1;}
				
				var mobi =  mobility_item();
				if (mobi == "Jump Pack"){
					sz += 1;
				}
		        size =sz;
		    }
	
			size = 0;			
		};
		
		static marine_location = function(){
			var location_id,location_name;
			var location_type = obj_ini.wid[company,marine_number];
			if ( location_type > 0){ //if marine is on planet
				location_id = location_type; //planet_number marine is on
				location_type = "planet"; //state marine is on planet
				location_name = obj_ini.loc[company,marine_number]; //system marine is in
			} else {
				location_type = "ship"; //marine is on ship
				location_id = obj_ini.lid[_company, _unit]; //ship array location
				location_name = obj_ini.ship_location[location_id]; //location of ship
			}
			return [location_type,location_id ,location_name];
		};
		
		static load_marine =function(ship){
			 get_unit_size(); // make sure marines size given it's current equipment is correct
			 var current_location = marine_location();
			 if (current_location[0] == "planet"){//if marine is on a planet
				 
				 //check if ship is in the same location as marine and has enough space;
				 if ( obj_ini.ship_location[ship] == (current_location[2])) and ((obj_ini.ship_carrying[ship] + size) <= obj_ini.ship_capacity[ship]){
					 obj_ini.wid[_company, _unit] = 0; //mark marine as no longer on planet
					 obj_ini.lid[_company, _unit] = ship; //id of ship marine is now loaded on
					 obj_ini.ship_carrying[ship] += size; //update ship capacity
				 }
			 } else if (current_location[0] == "ship"){ //with this addition marines can now be moved between ships freely as long as they are in the same system
				 var off_loading_ship = current_location[2];
				 if ( (obj_ini.ship_location[ship] == obj_ini.ship_location[off_loading_ship]) and ((obj_ini.ship_carrying[ship] + size) <= obj_ini.ship_capacity[ship])){
					 obj_ini.ship_carrying[off_loading_ship] -= size; // remove from previous ship capacity
					 obj_ini.lid[_company, _unit] = ship;             // change marine location to new ship
					  obj_ini.ship_carrying[ship] += size;            //add marine capacity to new ship
				 }
			 }
		}
	   
	}
	static load_json_data = function(data){
		 var names = variable_struct_get_names(data);
		 for (var i = 0; i < array_length(names); i++) {
            variable_struct_set(self, names[i], variable_struct_get(data, names[i]))
        }
	}	
}
