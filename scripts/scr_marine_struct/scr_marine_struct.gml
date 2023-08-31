// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


trait_list = {
	"very_hard_to_kill":{
		constitution:10,
		luck:2,
	},
	"paragon":{
		constitution:6,
		luck:2,
		strength:2,
		dexterity:2,
		intelligence:2,
	}
}
function TTRPG_stats(faction, comp, mar, class = "marine") constructor{
	traits = [];
	company = comp;
	marine_number = mar;
	alligence =faction;
	static add_trait = function(trait){
			var selec_trait = trait_list[trait];
			constitution += selec_trait.constitution;
			luck += selec_trait.luck;
			array_push(traits, "very_hard_to_kill");
		}	
	switch class{
		case "marine":
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
			strength = 5;
			constitution = 10;
			dexterity = 5;
			intelligence = 5;
			wisdom = 5;
			charisma = 5;
			religion = "Imperial Cult";
			piety = 5;
			luck = 5;
			skills= {weapons:{"bolter":3, "chainsword":3}};
			if (irandom(100)>99){
				 add_trait("very_hard_to_kill");	
			};
			if (irandom(1000)>999){
				 add_trait("paragon");	
			};			
		
		}
		static experience =  function(){return obj_ini.experience[company,marine_number];}//get exp
		static update_exp = function(new_val){obj_ini.experience[company,marine_number] =new_val}//change exp
		static bionics = function(){return obj_ini.bio[company,marine_number];}// get marine bionics count
		static update_bionics = function(new_val){obj_ini.bio[company,marine_number] = new_val;}
		static age = function(){return obj_ini.age[company,marine_number];}// age
		static update_age = function(new_val){obj_ini.age[company,marine_number] = new_val;}		
		static name = function(){return obj_ini.name[company,marine_number];}// get marine name
				
		max_health = 100 * (1+((constitution - 10)*0.05));
		static increase_max_health(increase){
			max_health += (increase*(1+((constitution - 10)*0.05)));
		}
		static hp = function(){ 
			return obj_ini.hp[company,marine_number]
		};
		//update_marine health
       static update_health = function(new_health){
            obj_ini.hp[company,marine_number] = new_health;
	   };
	   update_health(max_health);
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
			var sz = 0;
			sz = 1;
			var bulky_armour = ["Terminator Armour", "Tartaros"]
		    if (string_count("Dread",arm)>0) {sz+=5;} else if (array_contains(bulky_armour,arm)){sz +=1};
			var mobi =  mobility_item();
			if (mobi == "Jump Pack"){
				sz++;
			}
			if (r == "Chapter Master"){sz++}
			size =sz;
			return size
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
				location_id = obj_ini.lid[company,marine_number]; //ship array position
				location_name = obj_ini.ship_location[location_id]; //location of ship
			}
			return [location_type,location_id ,location_name];
		};
		
		static load_marine =function(ship){
			 get_unit_size(); // make sure marines size given it's current equipment is correct
			 var current_location = marine_location();
			 show_debug_message("{0},{1}", current_location,  obj_ini.ship_location[ship]);
			 var system = current_location[2];
			
			 if (current_location[0] == "planet"){//if marine is on a planet
				  if (current_location[2] == obj_ini.home_name){system = "home"}
				 //check if ship is in the same location as marine and has enough space;
				 if ( obj_ini.ship_location[ship] == system) and ((obj_ini.ship_carrying[ship] + size) <= obj_ini.ship_capacity[ship]){
					 obj_ini.wid[company,marine_number] = 0; //mark marine as no longer on planet
					 obj_ini.lid[company,marine_number] = ship; //id of ship marine is now loaded on
					 obj_ini.ship_carrying[ship] += size; //update ship capacity
				 }
			 } else if (current_location[0] == "ship"){ //with this addition marines can now be moved between ships freely as long as they are in the same system
				 var off_loading_ship = current_location[1];
				 if ( (obj_ini.ship_location[ship] == obj_ini.ship_location[off_loading_ship]) and ((obj_ini.ship_carrying[ship] + size) <= obj_ini.ship_capacity[ship])){
					 obj_ini.ship_carrying[off_loading_ship] -= size; // remove from previous ship capacity
					 obj_ini.lid[company,marine_number] = ship;             // change marine location to new ship
					  obj_ini.ship_carrying[ship] += size;            //add marine capacity to new ship
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
