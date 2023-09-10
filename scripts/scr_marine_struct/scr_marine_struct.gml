
function gauss(base, sd){
    var x1, x2, w;
    do {
        x1 = random(2) - 1;
        x2 = random(2) - 1;
        w = (x1 * x1) + (x2 * x2);
    } until (0 < w and w < 1);
 
    w = sqrt(-2 * ln(w) / w);
    return base + sd * x1 * w;
}
global.body_parts = ["left_leg", "right_leg", "torso", "right_arm", "left_arm", "left_eye", "right_eye"];
enum location_types {
	planet,
	ship,
	space_hulk,
	ancient_ruins,
	warp
}
global.trait_list = {
	"champion":{
		weapon_skill : 20,
		ballistic_skill:20,
		display_name : "Champion",
		flavour_text : "Through either natural talent, or obsessive training {0} is a master or arms"
	},
	"lightning_warriors":{
		constitution: -6,
		dexterity :6,
		weapon_skill : 5,
		flavour_text : "{0} is a master of speed covering distances quickly to enter the fray",
		display_name : "Lightning Warrior",
	},
	"slow_and_purposeful":{
		constitution:6,
		dexterity : -6,
		strength : 2,
		flavour_text : "{0} is implacable advancing in combat with methodical reason",
		display_name : "Slow and Purposeful",

	},
	"melee_enthusiast":{
		weapon_skill : 5,
		strength : 3,		
		flavour_text : "nothing can keep {0} from the fury of close up battle",	
		display_name : "Melee Enthusiast",

	},
	"shitty_luck":{
		luck:-4,
		flavour_text : "for all their talent {0} is dogged by poor luck",
		display_name : "Shitty Luck",
	},
	"very_hard_to_kill":{
		constitution:15,
		luck:2,
		flavour_text : "{0} is possed of a toughness and luck unsurpassed by most",
		display_name : "Very Hard To Kill",
		
	},
	"paragon":{
		constitution:12,
		luck:2,
		strength:6,
		dexterity:6,
		intelligence:6,
		charisma:6,
		weapon_skill:10,
		ballistic_skill:10,
		flavour_text : "{0} walks in the footsteps of the primarchs of old",
		display_name : "Paragon",

	},
	"warp_touched":{
		intelligence:4,
		flavour_text : "has phychic potential even if unknown to them",
		display_name : "Warp Touched",		
	},
	"lucky":{
		luck : 4,
		flavour_text : "Is inexplicably lucky",
		display_name : "Lucky"
	}
}
global.base_stats = { //tempory stats subject to change by anyone that wishes to try their luck
	"chapter_master":{
			title : "Adeptus Astartes",
			strength:[42,5],
			constitution:[44,3],
			dexterity:[44,3],
			weapon_skill : [50,5],
			ballistic_skill : [50,5],			
			intelligence:[44,3],
			wisdom:[44,3],
			charisma :[35,3],
			religion : "imperial_cult",
			piety : [30,3],
			luck :10,
			technology :[30,3],	
			base_group : "astartes",
	},
	"marine":{
			title : "Adeptus Astartes",
			strength:[40,4],
			constitution:[40,3],
			weapon_skill : [40,5],
			ballistic_skill : [40,5],
			dexterity:[40,3],
			intelligence:[40,3],
			wisdom:[40,3],
			charisma :[30,3],
			religion : "imperial_cult",
			piety : [30,3],
			luck :10,
			technology :[30,3],
			skills: {weapons:{"bolter":3, "chainsword":3, "ccw":3, "bolt_pistol":3}},
			gear:{"armour":"power_armour", "wep1":"bolter", "wep2":"chainsword"},
			base_group : "astartes",
	},
	"skitarii":{
			title : "Skitarii",
			strength:20,
			constitution:28,
			weapon_skill : [20,5],
			ballistic_skill : [20,5],			
			dexterity:25,
			intelligence:25,
			wisdom:10,
			charisma :5,
			religion : "cult_mechanicus",
			piety : 20,
			technology :30,
			luck :5,
			skills: {weapons:{"hellgun":1,}},	
			gear:{"armour":"skitarii_armour", "wep1":"hellgun"},
			base_group : "skitarri",
	},
	"tech_priest":{
			strength:16,
			constitution:30,
			dexterity:35,
			weapon_skill : [15,5],
			ballistic_skill : [15,5],				
			intelligence:50,
			wisdom:20,
			charisma :8,
			religion : "cult_mechanicus",
			title : "Tech Priest",
			piety : 30,
			luck :6,
			technology :50,
			skills: {weapons:{"power_weapon":2,}},	
			gear:{"armour":"dragon_scales", "wep1":"power_weapon"},
			base_group : "tech_priest",
	},
	"skitarii_ranger":{
			title : "Skitarii Ranger",
			strength:20,
			constitution:26,
			weapon_skill : [20,5],
			ballistic_skill : [20,5],				
			dexterity:34,
			intelligence:7,
			wisdom:2,
			charisma :2,
			religion : "cult_mechanicus",
			piety : 10,
			technology :8,
			luck :5,
			skills: {weapons:{"ranger_long_rifle":1,}},	
			gear:{"armour":"skitarii_armour", "wep1":"hellgun", "wep2":"shuriken_pistol"},
			base_group : "skitarii",
	},
	"inquisition_crusader":{
			title : "Inquisiton Crusador",
			strength:4,
			constitution:26,
			dexterity:4,
			intelligence:3,
			wisdom:2,
			charisma :2,
			religion : "imperial_cult",
			piety : 10,
			technology :3,
			luck :4,
			skills: {},	
			gear:{"armour":"Power Armour", "wep1":"Power Sword", "wep2":"Storm Shield"},
			base_group : "human",
	},
	"sister_of_battle":{
			title : "Sister of Battle",
			strength:5,
			constitution:28,
			dexterity:6,
			intelligence:5,
			wisdom:5,
			charisma :2,
			religion : "imperial_cult",
			piety : 20,
			technology :3,
			luck :4,
			skills: {},	
			gear:{"armour":"Power Armour", "wep1":"Power Sword", "wep2":"Storm Shield"},
			base_group : "human",
	},
	"sister_hospitaler":{
			title : "Sister of Battle",
			strength:5,
			constitution:28,
			dexterity:6,
			intelligence:5,
			wisdom:5,
			charisma :5,
			religion : "imperial_cult",
			piety : 20,
			technology :3,
			luck :4,
			skills: {},	
			gear:{"armour":"Power Armour", "wep1":"Power Sword", "wep2":"Storm Shield"},
			base_group : "human",
	},
	"ork_sniper":{
			title : "Ork Sniper",
			strength:24,
			constitution:29,
			dexterity:30,
			intelligence:10,
			wisdom:20,
			charisma :25,
			religion : "gorkamorka",
			piety : 20,
			technology :8,
			luck :6,
			skills: {},	
			gear:{"armour":"Power Armour", "wep1":"Power Sword", "wep2":"Storm Shield"},
			base_group : "ork",
	},
	"flash_git":{
			title : "Flash Git",
			strength:30,
			constitution:23,
			dexterity:15,
			intelligence:5,
			wisdom:3,
			charisma :4,
			religion : "gorkamorka",
			piety : 20,
			technology :2,
			luck :4,
			skills: {},	
			gear:{"armour":"Power Armour", "wep1":"Power Sword", "wep2":"Storm Shield"},
			base_group : "ork",
	}
}
function TTRPG_stats(faction, comp, mar, class = "marine") constructor{
	company = comp;			//marine company
	marine_number = mar;			//marine number in company
	obj_ini.bio[company,marine_number] = 0;   //need to rework init of 2d arrays( and eventually remove)
	static bionics = function(){return obj_ini.bio[company,marine_number];}// get marine bionics count	
	// used both to load unit data from save and to add preset base_stats
	static load_json_data = function(data){							//this also allows us to create a pre set of anysort for a marine
		 var names = variable_struct_get_names(data);
		 for (var i = 0; i < array_length(names); i++) {
            variable_struct_set(self, names[i], variable_struct_get(data, names[i]))
        }
	}	
	traits = [];			//marine trait list	
	allegiance =faction;	//faction alligience defaults to the chapter
	gear = {"armour":0, "wep1":0, "wep2":0, "mobi":0}; //item used to re-equip marine
	
	//adds a trait to a marines trait list
	static add_trait = function(trait){
			if struct_exists(global.trait_list, trait){
				var selec_trait = global.trait_list[$ trait];
				var edits = variable_struct_get_names(selec_trait);
				var edit_stat,random_stat,stat_mod;
			
				//loop over stats and add stats where needed
				var stats = ["constitution", "strength", "luck", "dexterity", "wisdom", "piety", "charisma", "technology","intelligence", "weapon_skill", "ballistic_skill"]
				for (var stat_iter =0; stat_iter <array_length(stats);stat_iter++;){
					if (array_contains(edits ,stats[stat_iter])){
						edit_stat = variable_struct_get(selec_trait, stats[stat_iter]);
						if (is_array(edit_stat)){
							stat_mod = gauss(edit_stat[0], edit_stat[1]);
						} else{stat_mod = edit_stat}
						variable_struct_set(self,stats[stat_iter],  (variable_struct_get(self, stats[stat_iter])+  stat_mod));
					}
				}
				//max_health() = 100 * (1+((constitution - 20)*0.05));
				array_push(traits, trait);
			}
	}
	
	//takes dict and plumbs dict values into unit struct
	if (array_contains(variable_struct_get_names(global.base_stats), class)){
		load_json_data(global.base_stats[$ class]);
	}
	var random_stat,edit_stat, stat_mod;
	var stats = ["constitution", "strength", "luck", "dexterity", "wisdom", "piety", "charisma", "technology","intelligence", "weapon_skill", "ballistic_skill"];
	for (var stat_iter =0; stat_iter <array_length(stats);stat_iter++;){
		if struct_exists(self, stats[stat_iter]){

			if (is_array(variable_struct_get(self, stats[stat_iter]))){
				//show_debug_message("is array");
				edit_stat = variable_struct_get(self, stats[stat_iter]);
				stat_mod =  gauss(edit_stat[0], edit_stat[1]);

				variable_struct_set(self, stats[stat_iter],  stat_mod);			
			}
		}
	}
	
	switch base_group{
		case "astartes":				//basic marine class //adds specific mechanics not releveant to most units
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
			if ((allegiance="Iron Hands") or (obj_ini.progenitor=6)) and (bionics() == 0){ obj_ini.bio[company,marine_number]=choose(2,3,4,5);}
			
			//need a niftier way of doing this as it's a lot of bulk and hard coding
			if (irandom(99)>98){
				 add_trait("very_hard_to_kill");	 //chance for marine to be exceedingly tough
			};
			if (irandom(999)>998){
				 add_trait("paragon");				//paragon chance just like cm
			};
			if (irandom(49)>48){
				 add_trait("warp_touched");			//has phychic potential
			};		
			if (array_contains(obj_ini.dis,"Shitty Luck")){		//lamentors are unlucky
				if (irandom(3)>2){
					add_trait("shitty_luck");
				} else {
					if (irandom(99)>98){
						add_trait("lucky");
					};				
				}
			}else{
				if (irandom(99)>98){
					add_trait("shitty_luck");
				} else{
					if (irandom(99)>98){
						add_trait("lucky");
					};					
				}
			};
			if (array_contains(obj_ini.adv, "Slow and Purposeful")){
				if (irandom(2)>0){								//two thirds
					add_trait("slow_and_purposeful");
				}				
			}else{
				if (irandom(99)>98){
					add_trait("slow_and_purposeful");
				};
			};
			if (array_contains(obj_ini.adv, "Melee Enthusiasts")){
				if (irandom(2)>0){								//two thirds
					add_trait("melee_enthusiast");
				}				
			}else{
				if (irandom(99)>98){
					add_trait("melee_enthusiast");
				};
			};
			if (array_contains(obj_ini.adv, "Lightning Warriors")){
				if (irandom(2)>0){								//two thirds
					add_trait("lightning_warriors");
				}				
			}else{
				if (irandom(99)>98){
					add_trait("lightning_warriors");
				};
			};			
			break;
		/*case "skitarii":
			break;*/	
	}
		body = {"left_leg":{}, "right_leg":{}, "torso":{}, "left_arm":{}, "right_arm":{}, "left_eye":{}, "right_eye":{}}; //body parts list can be extended as much as people want
		static race = function(){return obj_ini.race[company,marine_number];}		//get race
		static experience =  function(){return obj_ini.experience[company,marine_number];}//get exp
		static update_exp = function(new_val){obj_ini.experience[company,marine_number] =new_val}//change exp
		static add_bionics = function(){
			var new_bionic_pos, part, new_bionic = {quality :"standard"};
			if (obj_ini.bio[company,marine_number] < 10){
				obj_ini.bio[company,marine_number]++;
				var bionic_possible = [];
				for (var body_part = 0; body_part < array_length(global.body_parts);body_part++;){
					part = global.body_parts[body_part];
					if (!struct_exists(body[$part], "bionic")){
						array_push(bionic_possible, part);
					}
				}
				if (array_length(bionic_possible) > 0){
					new_bionic_pos = bionic_possible[irandom(array_length(bionic_possible)-1)]
					variable_struct_set(body[$ new_bionic_pos], "bionic", new_bionic);
					if (array_contains(["left_leg", "right_leg"], new_bionic_pos)){
						constitution += 2;
						strength++;
						dexterity -= 2;
					}
					if (array_contains(["left_eye", "right_eye"], new_bionic_pos)){
						constitution += 1;
						wisdom += 1;
						dexterity++;
					}
					if (array_contains(["left_arm", "right_arm"], new_bionic_pos)){
						constitution += 2;
						strength += 2;
						weapon_skill--;
					}	
					if (new_bionic_pos == "torso"){
						constitution += 4;
						strength++;
						dexterity--;						
					}
				} else{ constitution++;}
			}
		}
		var needed_bionics = obj_ini.bio[company,marine_number];
		obj_ini.bio[company,marine_number] = 0;
		for (var bionic_allocate = 0;bionic_allocate < needed_bionics;bionic_allocate++;){
			add_bionics();
		}
		static age = function(){return obj_ini.age[company,marine_number];}// age
		static update_age = function(new_val){obj_ini.age[company,marine_number] = new_val;}		
		static name = function(){return obj_ini.name[company,marine_number];}// get marine name
		static max_health =function(){
			return 100 * (1+((constitution - 40)*0.025));
		}
		static gear = function(){return obj_ini.gear[company,marine_number]}
		static update_gear = function(new_val){obj_ini.gear[company,marine_number]= new_val;}
		static increase_max_health = function(increase){
			return max_health() + (increase*(1+((constitution - 40)*0.025))); //calculate the effect of health buffs
		}
		static hp = function(){ 
			return obj_ini.hp[company,marine_number]; //return current health
		};
       static update_health = function(new_health){
            obj_ini.hp[company,marine_number] = new_health;
	   };
	   update_health(max_health()); //set marine health to max
	   
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
		static damage_resistance = function(){
			 damage_res = (constitution*0.005) + (experience()/1000);
			 return damage_res
		};
		static ranged_attack = function(){
			ranged_att = ((ballistic_skill/50) + (dexterity/400)+ (experience()/500));
			return ranged_att;
		};
		
		static melee_attack = function(){
			melee_att = (((weapon_skill/100) * (strength/20)) + (experience()/1000)+0.1);
			return melee_att;
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
				location_type = location_types.planet; //state marine is on planet
				location_name = obj_ini.loc[company,marine_number]; //system marine is in
			} else {
				location_type =  location_types.ship; //marine is on ship
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
			
			 if (current_location[0] == location_types.planet){//if marine is on a planet
				  if (current_location[2] == "home" ){system = obj_ini.home_name}
				 //check if ship is in the same location as marine and has enough space;
				 if (ship_location == system) and ((obj_ini.ship_carrying[ship] + size) <= obj_ini.ship_capacity[ship]){
					 obj_ini.wid[company,marine_number] = 0; //mark marine as no longer on planet
					 obj_ini.lid[company,marine_number] = ship; //id of ship marine is now loaded on
					 obj_ini.ship_carrying[ship] += size; //update ship capacity
				 }
			 } else if (current_location[0] == location_types.ship){ //with this addition marines can now be moved between ships freely as long as they are in the same system
				 var off_loading_ship = current_location[1];
				 if ( (obj_ini.ship_location[ship] == obj_ini.ship_location[off_loading_ship]) and ((obj_ini.ship_carrying[ship] + size) <= obj_ini.ship_capacity[ship])){
					 obj_ini.ship_carrying[off_loading_ship] -= size; // remove from previous ship capacity
					 obj_ini.lid[company,marine_number] = ship;             // change marine location to new ship
					  obj_ini.ship_carrying[ship] += size;            //add marine capacity to new ship
				 }
			 }
		}	
}
