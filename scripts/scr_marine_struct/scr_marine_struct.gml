// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


global.trait_list = {
	"shitty_luck":{
		luck:-4
	},
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
		charisma:2
	},
	"warp_touched":{
		intelligence:4
	}
}
global.base_stats = { //tempory stats subject to change by anyone that wishes to try their luck
	"chapter_master":{
			title : "Chapter Master",
			strength:12,
			constitution:22,
			dexterity:12,
			intelligence:12,
			wisdom:12,
			charisma :12,
			religion : "imperial_cult",
			piety : 5,
			technology :10,
			luck :12,		
	},
	"marine":{
			title : "Adeptus Astartes",
			strength:10,
			constitution:20,
			dexterity:10,
			intelligence:10,
			wisdom:10,
			charisma :10,
			religion : "imperial_cult",
			piety : 5,
			luck :10,
			technology :10,
			skills: {weapons:{"bolter":3, "chainsword":3, "ccw":3, "bolt_pistol":3}},
			gear:{"armour":"power_armour", "wep1":"bolter", "wep2":"chainsword"}
	},
	"skitarii":{
			title : "Skitarii",
			strength:6,
			constitution:8,
			dexterity:6,
			intelligence:7,
			wisdom:2,
			charisma :2,
			religion : "cult_mechanicus",
			piety : 10,
			technology :8,
			luck :5,
			skills: {weapons:{"hellgun":1,}},	
			gear:{"armour":"skitarii_armour", "wep1":"hellgun"}
	},
	"tech_priest":{
			strength:4,
			constitution:10,
			dexterity:7,
			intelligence:14,
			wisdom:13,
			charisma :3,
			religion : "cult_mechanicus",
			title : "Tech Priest",
			piety : 15,
			luck :6,
			technology :15,
			skills: {weapons:{"power_weapon":2,}},	
			gear:{"armour":"dragon_scales", "wep1":"power_weapon"}
	},
	"skitarii_ranger":{
			title : "Skitarii Ranger",
			strength:5,
			constitution:6,
			dexterity:7,
			intelligence:7,
			wisdom:2,
			charisma :2,
			religion : "cult_mechanicus",
			piety : 10,
			technology :8,
			luck :5,
			skills: {weapons:{"ranger_long_rifle":1,}},	
			gear:{"armour":"skitarii_armour", "wep1":"hellgun", "wep2":"shuriken_pistol"}
	},
	"inquisition_crusader":{
			title : "Inquisiton Crusador",
			strength:4,
			constitution:6,
			dexterity:4,
			intelligence:3,
			wisdom:2,
			charisma :2,
			religion : "imperial_cult",
			piety : 10,
			technology :3,
			luck :4,
			skills: {},	
			gear:{"armour":"Power Armour", "wep1":"Power Sword", "wep2":"Storm Shield"}
	},
	"sister_of_battle":{
			title : "Sister of Battle",
			strength:5,
			constitution:8,
			dexterity:6,
			intelligence:5,
			wisdom:5,
			charisma :2,
			religion : "imperial_cult",
			piety : 20,
			technology :3,
			luck :4,
			skills: {},	
			gear:{"armour":"Power Armour", "wep1":"Power Sword", "wep2":"Storm Shield"}
	},
	"sister_hospitaler":{
			title : "Sister of Battle",
			strength:5,
			constitution:8,
			dexterity:6,
			intelligence:5,
			wisdom:5,
			charisma :5,
			religion : "imperial_cult",
			piety : 20,
			technology :3,
			luck :4,
			skills: {},	
			gear:{"armour":"Power Armour", "wep1":"Power Sword", "wep2":"Storm Shield"}
	},
	"ork_sniper":{
			title : "Ork Sniper",
			strength:5,
			constitution:9,
			dexterity:8,
			intelligence:2,
			wisdom:3,
			charisma :4,
			religion : "gorkamorka",
			piety : 20,
			technology :2,
			luck :4,
			skills: {},	
			gear:{"armour":"Power Armour", "wep1":"Power Sword", "wep2":"Storm Shield"}
	},
	"flash_git":{
			title : "Flash Git",
			strength:8,
			constitution:13,
			dexterity:6,
			intelligence:2,
			wisdom:3,
			charisma :4,
			religion : "gorkamorka",
			piety : 20,
			technology :2,
			luck :4,
			skills: {},	
			gear:{"armour":"Power Armour", "wep1":"Power Sword", "wep2":"Storm Shield"}
	}
}
function TTRPG_stats(faction, comp, mar, class = "marine") constructor{
	
	// used both to load unit data from save and to add preset base_stats
	static load_json_data = function(data){
		 var names = variable_struct_get_names(data);
		 for (var i = 0; i < array_length(names); i++) {
            variable_struct_set(self, names[i], variable_struct_get(data, names[i]))
        }
	}	
	traits = [];			//marine trait list
	company = comp;			//marine company
	marine_number = mar;	//marine number in company
	allegiance =faction;	//faction alligience defaults to the chapter
	gear = {"armour":0, "wep1":0, "wep2":0, "mobi":0}; //item used to re-equip marine
	
	//adds a trait to a marines trait list
	static add_trait = function(trait){
			var selec_trait = global.trait_list[$ trait];
			var edits = variable_struct_get_names(selec_trait);
			
			//loop over stats and add stats where needed
			var stats = ["constitution", "strength", "luck", "dexterity", "wisdom", "piety", "charisma", "technology"]
			for (var stat_iter =0; stat_iter <array_length(stats);stat_iter++;){
				if (array_contains(edits ,stats[stat_iter])){
					 variable_struct_set(self,stats[stat_iter],  (variable_struct_get(self, stats[stat_iter])+  variable_struct_get(selec_trait, stats[stat_iter])));
				}
			}
			//max_health = 100 * (1+((constitution - 20)*0.05));
			array_push(traits, trait);
	}
	
	//takes dict and plumbs dict values into unit struct
	if (array_contains(variable_struct_get_names(global.base_stats), class)){
		load_json_data(global.base_stats[$ class]);
	}
	

	switch class{
		case "marine":				//basic marine class //adds specific mechanics not releveant to most units
			if (faction ="chapter"){
				allegiance = global.chapter_name;
			}
			if (instance_exists(obj_controller)){
				role_history = [[obj_ini.role[company,marine_number], obj_controller.turn]]; //marines_promotion and demotion history
				marine_ascension = obj_controller.turn; // on what day did turn did this marine begin to exist
			} else {
				role_history = [[obj_ini.role[company,marine_number], "pre_game"]];
				marine_ascension = "pre_game"; // on what day did turn did this marine begin to exist

			}
			if (irandom(99)>98){
				 add_trait("very_hard_to_kill");	 //chance for marine to be exceedingly tough
			};
			if (irandom(999)>998){
				 add_trait("paragon");				//paragon chance just like cm
			};
			if (irandom(49)>48){
				 add_trait("warp_touched");			//has phychic potential
			};		
			if (allegiance == "Lamentors"){		//lamentors are unlucky
				if (irandom(3)>2){
					add_trait("shitty_luck");
				}
			}
			break;
		case "skitarii":
			break;
			
		
	}
		static race = function(){return obj_ini.race[company,marine_number];}		//get race
		static experience =  function(){return obj_ini.experience[company,marine_number];}//get exp
		static update_exp = function(new_val){obj_ini.experience[company,marine_number] =new_val}//change exp
		static bionics = function(){return obj_ini.bio[company,marine_number];}// get marine bionics count
		static update_bionics = function(new_val){obj_ini.bio[company,marine_number] = new_val;}
		static age = function(){return obj_ini.age[company,marine_number];}// age
		static update_age = function(new_val){obj_ini.age[company,marine_number] = new_val;}		
		static name = function(){return obj_ini.name[company,marine_number];}// get marine name
				
		max_health = 100 * (1+((constitution - 20)*0.05));
		static increase_max_health = function(increase){
			max_health += (increase*(1+((constitution - 20)*0.05))); //calculate the effect of health buffs
		}
		static hp = function(){ 
			return obj_ini.hp[company,marine_number] //return current health
		};
		//update_marine health
       static update_health = function(new_health){
            obj_ini.hp[company,marine_number] = new_health;
	   };
	   update_health(max_health); //set marine health to max
	   
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
			 var system = current_location[2];
			 var ship_location= obj_ini.ship_location[ship]
			 if (ship_location == "home" ){ship_location = obj_ini.home_name}
			
			 if (current_location[0] == "planet"){//if marine is on a planet
				  if (current_location[2] == "home" ){system = obj_ini.home_name}
				 //check if ship is in the same location as marine and has enough space;
				 if (ship_location == system) and ((obj_ini.ship_carrying[ship] + size) <= obj_ini.ship_capacity[ship]){
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
}
