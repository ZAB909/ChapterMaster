//in future would be better to store old guard data in a struct like this but for now while working out kinks have left hardcoded
/*old_guard_equipment :{
	role[100][5]:{"armour":[["MK3 Iron Armour",25]]},
	role[100][14]:{"armour":[["MK3 Iron Armour",25]],
	role[100][15]:{"armour":[["MK3 Iron Armour", 10]]}, //apothecary
	role[100][16]:{"armour":},
	"Standard Bearer":{"armour":[["MK3 Iron Armour", 3]]},
	role[100][7]:{"armour":[]},  //company champion
	role[100][8]:{"armour":[["MK8 Errant", 3],["MK3 Iron Armour", 3],["MK4 Maximus", 3],["MK5 Heresy", 3]]},     //tacticals
	role[100][10]:{"armour":},		
	role[100][9]:{"armour":},
	role[100][12]:{"armour":},
}*/

/*
		where the notation is[int,int, "string"] e.g [1,2,"max"]
		the first int is a base or mean value the second int is a sd number to be passed to the gauss() function
		the string (usually max) is guidance so in the instance of max it will pick the larger value of the mean and the gauss function return
*/
global.stat_list = ["constitution", "strength", "luck", "dexterity", "wisdom", "piety", "charisma", "technology","intelligence", "weapon_skill", "ballistic_skill"];

// will swap these out for enums or some better method as i develop where this is going
global.body_parts = ["left_leg", "right_leg", "torso", "right_arm", "left_arm", "left_eye", "right_eye", "throat", "jaw","head"];
global.body_parts_display = ["Left Leg", "Right Leg", "Torso", "Right Arm", "Left Arm", "Left Eye", "Right eye", "Throat", "Jaw","Head"];
global.religions={
	"imperial_cult":{"name":"Imperial Cult"},
	"cult_mechanicus":{"name":"Cult Mechanicus"}, 
	"eight_fold_path":{"name":"The Eight Fold Path"}
};
global.power_armour=["MK7 Aquila","MK6 Corvus","MK5 Heresy","MK3 Iron Armour","MK4 Maximus","Power Armour"];
enum location_types {
	planet,
	ship,
	space_hulk,
	ancient_ruins,
	warp
}

global.phy_levels =["Rho","Pi","Omicron","Xi","Nu","Mu","Lambda","Kappa","Iota","Theta","Eta","Zeta","Epsilon","Delta","Gamma","Beta","Alpha","Alpha Plus","Beta","Gamma Plus"]
global.trait_list = {
	"champion":{
		weapon_skill : [10,5,"max"],      
		ballistic_skill:[10,5, "max"],
		display_name : "Champion",
		flavour_text : "Through either natural talent, or obsessive training {0} is a master of arms",
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
		flavour_text : "{0} is implacable, advancing in combat with methodical reason",
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
		strength:10,
		dexterity:10,
		intelligence:6,
		charisma:6,
		weapon_skill:10,
		ballistic_skill:10,
		flavour_text : "{0} walks in the footsteps of the primarchs of old",
		display_name : "Paragon",

	},
	"warp_touched":{
		intelligence:4,
		flavour_text : " {0} Has interacted with the warp in away that has forever marked them",
		display_name : "Warp Touched",		
	},
	"lucky":{
		luck : 4,
		flavour_text : "Is inexplicably lucky",
		display_name : "Lucky"
	},
	"old_guard":{
		luck : 1,
		constitution : 1,
		strength :1,
		weapon_skill : [2, 2, "max"],
		ballistic_skill :[2, 2, "max"],
		flavour_text : "{0} has seen many a young warrior rise and die before him but he remains",
		display_name : "Old Guard"
	},
	"seasoned":{
		luck : 1,
		constitution : 1,
		strength :1,
		weapon_skill : 1,
		ballistic_skill :1,
		flavour_text : "{0} is a seasoned warrior having fought for many years",
		display_name : "Seasoned",		
	},
	"ancient":{
		luck : 1,
		constitution : -1,
		strength :-1,
		weapon_skill : 3,
		ballistic_skill :4,
		wisdom : 5,
		flavour_text : "{0} is truly Ancient. While his body may ache his, skills and wisdom are to be respected",
		display_name : "Ancient",		
	},
	"tinkerer":{
		technology:[5,2,"max"],
		display_name:"Tinkerer",
		flavour_text:"{0} has a knack for tinkering around with various technological devices and apparatuses often augmenting and improving his own equipment",
	},
	"lead_example":{
		weapon_skill:[2,1,"max"],
		ballistic_skill :[2,1,"max"],
		constitution :[2,1, "max"],
		dexterity:2,
		strength:1,
		luck:1,
		intelligence:1,
		wisdom:1,
		charisma:3,
		display_name:"Lead by Example",
		flavour_text :"In his many years of service, {0} has rissen through the ranks and has always lead by example and from the front, he has the respect of all of his brothers",
	},
	"still_standing":{
		weapon_skill:[6,2,"max"],
		ballistic_skill :[6,2,"max"],
		constitution :[3,1, "max"],
		dexterity:5,
		luck:3,
		wisdom:[3,3,1],
		charisma:1,
		display_name:"Still Standing",
		flavour_text :"{0} survived inmessurable odds, either through killing a warboss, killing a nid queen, or other incredible deed, while all his brothers were injured",

	},
	"lone_survivor":{
		weapon_skill:[8,2,"max"],
		ballistic_skill :[8,2,"max"],
		constitution :[8,1, "max"],
		dexterity:[4,2, "max"],
		strength:[4,2, "max"],
		luck:5,
		wisdom:[2,1,"max"],
		intelligence:[3,3,"max"],
		charisma:[-3, 1, "min"],
		display_name:"Lone Survivor",
		flavour_text :"{0} survived a battle where all his deployed brothers died. He is more reclusive, but gained immeasurable combat capabilities and is harder to kill.",
	},
	"beast_slayer":{
		weapon_skill:[3,2,"max"],
		ballistic_skill :[4,2,"max"],
		constitution :[2,1, "max"],
		dexterity:1,
		strength:4,
		wisdom:3,
		charisma:1,
		display_name:"Lone Survivor",
		flavour_text :"{0} has defeated a huge beast in single combat, this proves his toughness and his great ability to overcome powerful enemies of the imperium",

	},	
	"mars_trained":{
		technology:[10,5,"max"],
		intelligence:[5,5,"max"],
		display_name:"Trained On Mars",
		flavour_text:"{0} Has had the best instruction in the imperium on technology from the Tech Priests of Mars"
	},
	"flesh_is_weak":{
		technology:[2,1,"max"],
		constitution:[1,1,"max"],
		piety:[3,1,"max"],
		display_name:"Weakness of Flesh",
		flavour_text:"{0} tries to cast aside all perceived weaknesses of the flesh",
		effect:"faith boosts from bionic replacements"
	},
	"zealous_faith":{
		strength:[1,1,"max"],
		texhnology:-2,
		wisdom:3,
		intelligence:-2,
		piety:[5,2,"max"],
		display_name:"Zealous Faith",
		flavour_text:"{0} puts great emphasis on his faith, able to draw strength from it in crisis"
	},
	"feet_floor":{
		wisdom:1,
		dexterity:-2,
		display_name:"Feet On the Ground",
		flavour_text:"{0} prefers to keep both feet on the ground",
		effect:"reduction in combat effectiveness when using Bikes or Jump Packs"
	},
	"tyrannic_vet":{
		wisdom :[2,3,"max"],
		dexterity:1,
		weapon_skill:1,
		ballistic_skill:1,
		constitution:1,
		display_name:"Tyrannic War Veteran",
		flavour_text:"{0} Is a veteran of the many wars against the the Tyranid swarms",
		effect:"Increased lethality against tyranids"
	},
	"blood_for_blood":{
		strength:[3,2,"max"],
		weapon_skill:1,
		piety:2,
		display_name:"Blood For the Blood God",
		flavour_text:"{0} Has spilled blood in the name of the blood god",
		effect:"Has the attention of Khorne"
	},
	"blunt":{
		strength:[2,2,"max"],
		wisdom:2,
		charisma:-2,
		intelligence:-4,
		weapon_skill:1,
		display_name:"Blunt",
		flavour_text:"{0} tends towards simplistic approaches to achieve goals",
	},
	"skeptic":{
		piety:[-6,4,"min"],
		wisdom:1,
		display_name:"Skeptic",
		flavour_text:"{0} has a skeptical outlook and puts little thought in trivial matters like religion and faith",
	},
	"scholar":{
		intelligence:[4,2,"max"],
		wisdom:1,
		technology:2,
		stength:-1,
		display_name:"Scholar",
		flavour_text:"{0} has an keen mind and enjoys to read and train it where possible",
	},
	"brute":{
		strength:[4,2,"max"],
		weapon_skill:[2,2,"max"],
		ballistic_skill:[-2,1,"min"],
		wisdom:-5,
		intelligence:-5,
		charisma:-2,
		display_name:"Brute",
		flavour_text:"{0} is a brutal character solving problems often with intimidation or violence",
	},
	"charismatic":{
		charisma:[5,3,"max"],
		display_name:"Charismatic",
		flavour_text:"{0} is liked by most without even trying",
	},
	"recluse":{
		charisma:[-2,2,"min"],
		dexterity:1,
		wisdom:1,
		display_name:"Reclusive",
		flavour_text:"{0} is generally withdrawn and reclusive avoiding social engagements were possible",
	}	,
	"nimble":{
		display_name:"Nimble",
		flavour_text:"{0} is natrually nible and light on their feet",
		dexterity:[4,3,"max"],
		weapon_skill:1,
		constitution:-3,
	},
	"jaded":{
		display_name:"Jaded",
		flavour_text:"{0}'s past has led to a deep distrust and cynicla outlook on most parts of their life",
		charisma:-2,
		wisdom:-1,
	},
	"observant":{
		display_name:"Observant",
		flavour_text:"{0} tends to notics things that most don't",
		wisdom:[5,2,"max"],
		dexterity:2
	},
	"perfectionist":{
		display_name:"Perfectionist",
		flavour_text:"{0} Is obsessive with doing things correctly",
		wisdom:[2,2,"max"],
		weapon_skill:[2,2,"max"],
		ballistic_skill:[2,2,"max"],
		intelligence:[2,1],
		piety:[2,1],
	},
	"guardian":{
		display_name:"Guardian",
		weapon_skill:[2,2,"max"],
		ballistic_skill:[2,2,"max"],
		charisma:2,
		flavour_text:"{0} Has a natural sense of protection and will guard those under his protection unto death",
		effect:"Is a better guardian or body guard",
	},
	"cunning":{
		display_name:"Cunning",
		weapon_skill:[1,1,"max"],
		ballistic_skill:[2,2,"max"],
		dexterity:[2,2,"max"],
		charisma:2,
		wisdom:1,
		flavour_text:"{0} is possessed of a fine cunning",
	},
	"strong":{
		display_name:"Strong",
		strength:[6,2,"max"],
		flavour_text:"{0} Is very strong",
	},	
	"slow":{
		display_name:"slow",
		dexterity:[-3,3,"min"],
		flavour_text:"{0} is many things but fast ain't one of em",
	},			
	"deathworld":{
		display_name:"Deathworld Born",
		strength:[2,2,"max"],
		constitution:[2,2,"max"],
		dexterity:[2,2,"max"],
		weapon_skill:[2,2,"max"],
		ballistic_skill:[2,-2,"min"],
		wisdom:[2,2,"max"],
		flavour_text:"{0} started life on a deathworld while this has greatly improved their strength and survival their abilities and skills in technology and other useful 41st millenium skills is reduced",
		intelligence:-3,
		technology:[-3,2,"min"],
		piety:[3,1],
	},
	"technophobe":{
		display_name:"Technophobe",
		technology:[-7,2,"min"],
		flavour_text:"{0} Has a deep mistrust and loathing of technology",
	},
	"fast_learner":{
		display_name:"Quick Learner",
		wisdom:[2,2,"max"],
		intelligence:[2,2,"max"],
		technology:[2,2,"max"],
		flavour_text:"{0} is a fast learner picking up new skills with ease",
		effect:"learns new skills more easily",
	}
}
global.base_stats = { //tempory stats subject to change by anyone that wishes to try their luck
	"chapter_master":{
			title : "Adeptus Astartes",
			strength:[42,5],
			constitution:[44,3],
			dexterity:[44,3],
			weapon_skill : [50,5, "max"],
			ballistic_skill : [50,5, "max"],			
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
			start_gear:{"armour":"power_armour", "wep1":"bolter", "wep2":"chainsword"},
			base_group : "astartes",
	},
	"scout":{
			title : "Adeptus Astartes",
			strength:[36,4],
			constitution:[36,3],
			weapon_skill : [30,2,"max"],
			ballistic_skill : [30,2,"max"],
			dexterity:[36,3],
			intelligence:[38,3],
			wisdom:[35,3],
			charisma :[28,3],
			religion : "imperial_cult",
			piety : [28,3],
			luck :10,
			technology :[28,3],
			skills: {weapons:{"bolter":3, "chainsword":3, "ccw":3, "bolt_pistol":3}},
			start_gear:{"armour":"power_armour", "wep1":"bolter", "wep2":"chainsword"},
			base_group : "astartes",
	},
	"dreadnought":{
			title : "Adeptus Astartes",
			strength:[70,4],
			constitution:[75,3],
			weapon_skill : [55,5],
			ballistic_skill : [55,5],
			dexterity:[30,3],
			intelligence:[45,3],
			wisdom:[50,3],
			charisma :[35,3],
			religion : "imperial_cult",
			piety : [32,3],
			luck :10,
			technology :[30,3],
			skills: {weapons:{"bolter":3, "chainsword":3, "ccw":3, "bolt_pistol":3}},
			start_gear:{"armour":"power_armour", "wep1":"bolter", "wep2":"chainsword"},
			base_group : "astartes",
			traits:["ancient","slow_and_purposeful","lead_example","zealous_faith",choose("still_standing","beast_slayer","lone_survivor")]
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
			start_gear:{"armour":"skitarii_armour", "wep1":"hellgun"},
			base_group : "skitarii",
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
			start_gear:{"armour":"dragon_scales", "wep1":"power_weapon"},
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
			start_gear:{"armour":"skitarii_armour", "wep1":"hellgun", "wep2":"shuriken_pistol"},
			base_group : "skitarii",
	},
	"inquisition_crusader":{
			title : "Inquisition Crusador",
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
			start_gear:{"armour":"Power Armour", "wep1":"Power Sword", "wep2":"Storm Shield"},
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
			start_gear:{"armour":"Power Armour", "wep1":"Power Sword", "wep2":"Storm Shield"},
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
			start_gear:{"armour":"Power Armour", "wep1":"Power Sword", "wep2":"Storm Shield"},
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
			start_gear:{"armour":"Power Armour", "wep1":"Power Sword", "wep2":"Storm Shield"},
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
			start_gear:{"armour":"Power Armour", "wep1":"Power Sword", "wep2":"Storm Shield"},
			base_group : "ork",
	}
}
function TTRPG_stats(faction, comp, mar, class = "marine") constructor{
	constitution=0; strength=0;luck=0;dexterity=0;wisdom=0;piety=0;charisma=0;technology=0;intelligence=0;weapon_skill=0;ballistic_skill=0;size = 0;
	religion="none";
	psionic=0;
	religion_sub_cult = "none";
	base_group = "none";
	role_history = [];
	home_world="";
	company = comp;			//marine company
	marine_number = mar;			//marine number in company
	squad = "none";
	static bionics = function(){return obj_ini.bio[company][marine_number];}// get marine bionics count	
	static experience =  function(){return obj_ini.experience[company][marine_number];}//get exp
	static update_exp = function(new_val){obj_ini.experience[company][marine_number] = new_val}//change exp
	static add_exp = function(add_val){obj_ini.experience[company][marine_number] += add_val}
	static armour = function(){ 
		return obj_ini.armour[company][marine_number];
	};
	static role = function(){
		return obj_ini.role[company][marine_number];
	};
	static update_role = function(new_role){
		obj_ini.role[company][marine_number]= new_role;
		if instance_exists(obj_controller){
			array_push(role_history ,[obj_ini.role[company][marine_number], obj_controller.turn])
		}
	};	
	static mobility_item = function(){ 
		return obj_ini.mobi[company][marine_number];
	};	
	static hp = function(){ 
		return obj_ini.hp[company][marine_number]; //return current health
	};
  static update_health = function(new_health){
    obj_ini.hp[company][marine_number] = new_health;
  };	
	static get_unit_size = function(){
		var unit_role = role();
		var arm = armour();
		var sz = 0;
		sz = 1;
		var bulky_armour = ["Terminator Armour", "Tartaros"]
	    if (string_count("Dread",arm)>0) {sz+=5;} else if (array_contains(bulky_armour,arm)){sz +=1};
		//var mobi =  mobility_item();
		/*if (mobi == "Jump Pack"){
			sz++;
		}*/
		if (unit_role == "Chapter Master"){sz++}
		size =sz;
		return size
	};
   static update_mobility_item = function(new_mobility_item, from_armoury = true, to_armoury=true){
   		var change_mob=mobility_item()
   		if (change_mob == new_mobility_item){
   			return "no change";
   		}
			if  (change_mob == "Bike"){
				update_health(hp()/1.25);
			}
	    obj_ini.mobi[company][marine_number] = new_mobility_item;
	    if (from_armoury) and (new_mobility_item!=""){
	   		scr_add_item(new_mobility_item,-1);
	  	}
			if (new_mobility_item == "Bike"){
				update_health(hp()*1.25);
			}
			if (change_mob != "") and (to_armoury){
				scr_add_item(change_mob,1);
			}
			get_unit_size(); //every time mobility_item is changed see if the marines size has changed
	 };		


  static update_armour = function(new_armour, from_armoury=true, to_armoury=true){
  	var change_armour=armour()
  	if (array_contains(global.power_armour, new_armour)){
  		var has_carpace =false;
  		if (struct_exists(body[$ "torso"], "black_carpace")){
  			if (body[$ "torso"][$"black_carpace"]){
  				has_carpace=true;
  			}
  		}
  		if (!has_carpace){
  			return "needs_carpace";
  		}
  	}
   	if (change_armour == new_armour){
   		return "no change";
   	}   	
  	if (from_armoury) and (new_armour!=""){
	   	scr_add_item(new_armour,-1);
	  }
		if (change_armour != "") and (to_armoury){
			scr_add_item(change_armour,1);
		}
    obj_ini.armour[company][marine_number] = new_armour;
		get_unit_size(); //every time armour is changed see if the marines size has changed
	};	
	static max_health =function(){
		var max_h = 100 * (1+((constitution - 40)*0.025));
		if (mobility_item() == "Bike"){
			max_h *= 1.25;
		}
		return max_h
	};	
	static increase_max_health = function(increase){
		return max_health() + (increase*(1+((constitution - 40)*0.025))); //calculate the effect of health buffs
	};		
	// used both to load unit data from save and to add preset base_stats
	static load_json_data = function(data){							//this also allows us to create a pre set of anysort for a marine
		 var names = variable_struct_get_names(data);
		 for (var i = 0; i < array_length(names); i++) {
            variable_struct_set(self, names[i], variable_struct_get(data, names[i]))
        }
	};
	traits = [];			//marine trait list	
	allegiance =faction;	//faction alligience defaults to the chapter
	
	//adds a trait to a marines trait list
	static add_trait = function(trait){
			var balance_value;
			if struct_exists(global.trait_list, trait){
				if (!array_contains(traits, trait)){
					var selec_trait = global.trait_list[$ trait];
					var edits = variable_struct_get_names(selec_trait);
					var edit_stat,random_stat,stat_mod;
				
					//loop over stats and add stats where needed
					stats = global.stat_list;
					for (var stat_iter =0; stat_iter <array_length(stats);stat_iter++){
						if (array_contains(edits ,stats[stat_iter])){
							edit_stat = variable_struct_get(selec_trait, stats[stat_iter]);
							if (is_array(edit_stat)){
								stat_mod = gauss(edit_stat[0], edit_stat[1]);
								if (array_length(edit_stat) > 2){
									if (edit_stat[2] == "max"){
										stat_mod = floor(max(stat_mod, edit_stat[0]));
									} else if(edit_stat[2] == "min") {
										stat_mod = floor(min(stat_mod, edit_stat[0]));
									}
								}
							} else{stat_mod = edit_stat}
							if (stats[stat_iter] == "constitution"){
								balance_value = (hp()/max_health());
							}
							variable_struct_set(self,stats[stat_iter],  (variable_struct_get(self, stats[stat_iter])+  stat_mod));
							if (stats[stat_iter] == "constitution"){
								update_health(max_health()*balance_value)
							}
						}
					}
					//max_health() = 100 * (1+((constitution - 20)*0.05));
					array_push(traits, trait);
				}
			}
	};

	static distribute_traits = function (distribution_set){
			function is_state_required(mod_area){
				is_required = false;
				if (array_length(mod_area)>2){
					if (mod_area[2] == "require"){
						is_required =true;
					}
				}
				return is_required;
			}		
		for (var i=0;i<array_length(distribution_set);i++){//standard distribution for trait
			if (array_length(distribution_set[i])==2){
				if (irandom(distribution_set[i][1][0])>distribution_set[i][1][1]){
					add_trait(distribution_set[i][0])
				}
			} else if (array_length(distribution_set[i])==3){  //trait has conditions
				var dist_modifiers =distribution_set[i][2];
				var dist_rate = distribution_set[i][1];
				if (struct_exists(dist_modifiers, "disadvantage")){
					if (array_contains(obj_ini.dis, dist_modifiers[$"disadvantage"][0])){
						dist_rate = dist_modifiers[$"disadvantage"][1];  //apply new modifier rate
					} else if (is_state_required(dist_modifiers[$"disadvantage"])){
						dist_rate=[0,0];
					}
				}
				if (struct_exists(dist_modifiers, "advantage")){
					if (array_contains(obj_ini.adv, dist_modifiers[$"advantage"][0])){
						dist_rate = dist_modifiers[$"advantage"][1];  //apply new modifier rate
					} else if (is_state_required(dist_modifiers[$"advantage"])){
						dist_rate=[0,0];
					}
				}
				if (struct_exists(dist_modifiers, "chapter_name")){
					if (global.chapter_name == dist_modifiers[$ "chapter_name"][0]){
						dist_rate = dist_modifiers[$"chapter_name"][1]; 
					}else if (is_state_required(dist_modifiers[$ "chapter_name"])){
						dist_rate=[0,0];
					}
				}
				if (struct_exists(dist_modifiers, "progenitor")){
					if (obj_ini.progenitor == dist_modifiers[$ "progenitor"][0]){
						dist_rate = dist_modifiers[$"progenitor"][1]; 
					}else if (is_state_required(dist_modifiers[$ "progenitor"])){
						dist_rate=[0,0];
					}
				}				
				if (irandom(dist_rate[0])>dist_rate[1]){
					add_trait(distribution_set[i][0]);
				}
			}
		}
	}
	
	//takes dict and plumbs dict values into unit struct
	if (array_contains(variable_struct_get_names(global.base_stats), class)){
		load_json_data(global.base_stats[$ class]);
	};
	var edit_stat, stat_mod;
	var stats = ["constitution", "strength", "luck", "dexterity", "wisdom", "piety", "charisma", "technology","intelligence", "weapon_skill", "ballistic_skill"];
	for (var stat_iter =0; stat_iter <array_length(stats);stat_iter++){
		if struct_exists(self, stats[stat_iter]){

			if (is_array(variable_struct_get(self, stats[stat_iter]))){
				edit_stat = variable_struct_get(self, stats[stat_iter]);
				stat_mod =  floor(gauss(edit_stat[0], edit_stat[1]));

				variable_struct_set(self, stats[stat_iter],  stat_mod);			
			}
		}
	};
	body = {"left_leg":{}, "right_leg":{}, "torso":{}, "left_arm":{}, "right_arm":{}, "left_eye":{}, "right_eye":{},"throat":{}, "jaw":{},"head":{}}; //body parts list can be extended as much as people want
	switch base_group{
		case "astartes":				//basic marine class //adds specific mechanics not releveant to most units
			var astartes_trait_dist = [
				["very_hard_to_kill", [99,98]],
				["scholar", [99,98]],
				["brute", [99,98]],
				["charismatic", [99,98]],
				["skeptic", [99,98]],
				["blunt", [99,98]],
				["nimble", [99,98]],
				["recluse", [99,98]],
				["perfectionist", [99,98]],
				["observant", [99,98]],
				["cunning", [99,98]],
				["guardian", [99,98]],
				["observant", [99,98]],
				["technophobe", [99,98],{"progenitor":[6,[1000,999]]}],
				["jaded", [99,98]],
				["strong", [99,98]],
				["fast_learner", [149,148]],
				["feet_floor", [199,198]],
				["paragon", [999,998]],
				["warp_touched",[299,298]],
				["shitty_luck",[99,98],{"disadvantage":["Shitty Luck",[3,2]]}],
				["lucky",[99,98]],
				["slow_and_purposeful",[99,98],{"advantage":["Slow and Purposeful",[3,1]]}],
				["melee_enthusiast",[99,98],{"advantage":["Melee Enthusiasts",[3,1]]}],
				["lightning_warriors",[99,98],{"advantage":["Lightning Warriors",[3,1]]}],
				["zealous_faith",[99,98],{"chapter_name":["Black Templars",[3,2]]}],
				["flesh_is_weak",[1000,999],{"chapter_name":["Iron Hands",[10,9],"required"],"progenitor":[6,[10,9],"required"]}],
				["tinkerer",[199,198],{"chapter_name":["Iron Hands",[49,47]]}],
			];
			distribute_traits(astartes_trait_dist);
			body[$ "torso"][$ "black_carpace"] = true;
			if (class=="scout" &&  global.chapter_name!="Space Wolves"){
				body[$ "torso"][$ "black_carpace"] = false;
			}
			if (faction ="chapter"){
				allegiance = global.chapter_name;
			}
		   gene_seed_mutations = {
		   			"preomnor":obj_ini.preomnor,
			    	"lyman":obj_ini.lyman,
			    	"omophagea":obj_ini.omophagea,
			    	"ossmodula":obj_ini.ossmodula,
			    	"zygote":obj_ini.zygote,
			    	"betchers":obj_ini.betchers,
			    	"catalepsean":obj_ini.catalepsean,
			    	"occulobe":obj_ini.occulobe,
			    	"mucranoid":obj_ini.mucranoid,
			    	"membrane":obj_ini.membrane,
			    	"voice":obj_ini.voice,
			};														
			var mutation_names = struct_get_names(gene_seed_mutations)
			for (var mute =0; mute <array_length(mutation_names); mute++){
				if (gene_seed_mutations[$ mutation_names[mute]] == 0){
					if(irandom(999)-10<obj_ini.stability){
						gene_seed_mutations[$ mutation_names[mute]] = 1;
					}
				}
			}
			if (gene_seed_mutations[$ "voice"] == 0){
				charisma-=2;
			}
			if (instance_exists(obj_controller)){
				role_history = [[obj_ini.role[company][marine_number], obj_controller.turn]]; //marines_promotion and demotion history
				marine_ascension = obj_controller.turn; // on what day did turn did this marine begin to exist
			} else {
				role_history = [[obj_ini.role[company][marine_number], "pre_game"]];
				marine_ascension = "pre_game"; // on what day did turn did this marine begin to exist

			}

			//array index 0 == trait to add
			// array index 1 == probability e.g 99,98 == if (irandom(99)>98){add_trait}
			// array index 3 == probability modifiers
			psionic = 0
			var warp_level = irandom(299)+1{
				if (warp_level<=190){
					psionic=choose(0,1);
				} else if(warp_level<=294){
					psionic=choose(2,3,4,5,6,7);
				}else if(warp_level<=297){
					psionic=choose(8,9,10);
				} else if(warp_level<=298){
					psionic=choose(11,12);
				} else if(warp_level<=299){
					psionic=choose(11,12,13,14);
				} else if warp_level<=300{
					if(irandom(4)==4){
						psionic=choose(15,16);
					} else{
						psionic=choose(13,14);
					}
				}
			}
			if (global.chapter_name=="Black Templars"){
				if (irandom(14)==0){
					body[$"torso"].robes =1;
				}				
			}
			if (global.chapter_name=="Space Wolves") or (obj_ini.progenitor=3) {
				religion_sub_cult = "The Allfather";
			} else if(global.chapter_name=="Salamanders") or (obj_ini.progenitor==8){
				religion_sub_cult = "The Promethean Cult";
			} else if (global.chapter_name=="Iron Hands") or (obj_ini.progenitor=6){
				religion_sub_cult = "The Cult of Iron";
			} 

			if (array_contains(["Dark Angels","Black Templars"],global.chapter_name) || obj_ini.progenitor==1){
				if (irandom(19)==0){
					body[$"torso"].robes =choose(0,0,1);
					if (irandom(2)<2){
						body[$"head"].hood =1;
					}
				}
			}else  if(irandom(49)==0){
				body[$"torso"].robes =choose(0,1);
				if (irandom(2)==0){
					body[$"head"].hood =1;
				}
			}
			break;
		/*case "skitarii":
			break;*/	
	};

	static race = function(){
		return obj_ini.race[company][marine_number];
	};	//get race

	static add_bionics = function(area="none", bionic_quality="standard", from_armoury=false){
		var new_bionic_pos, part, new_bionic = {quality :bionic_quality};
		if (obj_ini.bio[company][marine_number] < 10){
			update_health(hp()+30);
			var bionic_possible = [];
			for (var body_part = 0; body_part < array_length(global.body_parts);body_part++){
				part = global.body_parts[body_part];
				if (!struct_exists(body[$part], "bionic")){
					array_push(bionic_possible, part);
				}
			}
			if (array_length(bionic_possible) > 0){
				if (area!="none"){
					if (array_contains(bionic_possible, area)){
						new_bionic_pos = area;
					} else {
						return 0;
					}
				} else {
					new_bionic_pos = bionic_possible[irandom(array_length(bionic_possible)-1)];
				}
				obj_ini.bio[company][marine_number]++;
				variable_struct_set(body[$ new_bionic_pos], "bionic", new_bionic);
				if (array_contains(["left_leg", "right_leg"], new_bionic_pos)){
					constitution += 2;
					strength++;
					dexterity -= 2;
				}else if (array_contains(["left_eye", "right_eye"], new_bionic_pos)){
					body[$ new_bionic_pos][$"bionic"].variant=irandom(2);
					constitution += 1;
					wisdom += 1;
					dexterity++;
				} else if (array_contains(["left_arm", "right_arm"], new_bionic_pos)){
					body[$ new_bionic_pos][$"bionic"].variant=irandom(1);
					constitution += 2;
					strength += 2;
					weapon_skill--;
				}	else if (new_bionic_pos == "torso"){
					constitution += 4;
					strength++;
					dexterity--;						
				}	else if (new_bionic_pos == "throat"){
					charisma--;					
				}else{ 
					constitution++;
				}
				if (array_contains(traits, "flesh_is_weak")){
					piety++;
				}
			}
			if (hp()>max_health()){update_health(max_health())}
		}
	};
	static age = function(){
		return obj_ini.age[company][marine_number];
	};// age

	static update_age = function(new_val){
		obj_ini.age[company][marine_number] = new_val;
	};		

	static name = function(){
		return obj_ini.name[company][marine_number];
	};// get marine name

	static gear = function(){
		return obj_ini.gear[company][marine_number];
	};

	static update_gear = function(new_gear,from_armoury=true, to_armoury=true){
		var change_gear = gear();
		if (change_gear == new_gear){
	 		return "no change";
	 	}
		if (from_armoury && (new_gear != "")){
	   	scr_add_item(new_gear,-1);
	  }
		if (change_gear != "" && to_armoury){
			scr_add_item(change_gear,1);
		}  			
		obj_ini.gear[company][marine_number] = new_gear;
	}

	if (base_group!="none"){
		update_health(max_health()); //set marine health to max
	}
	   
	static weapon_one = function(){ 
		return obj_ini.wep1[company][marine_number];
	};

  static update_weapon_one = function(new_weapon,from_armoury=true, to_armoury=true){
  	var change_wep = weapon_one();
  	if (change_wep == new_weapon){
   		return "no change";
   	}  	
  	if (from_armoury) and (new_weapon!=""){
	   	scr_add_item(new_weapon,-1);
	  }
		if (change_wep != "") and (to_armoury){
			scr_add_item(change_wep,1);
		}       	
     obj_ini.wep1[company][marine_number] = new_weapon;
	};

		static weapon_two = function(){
			return obj_ini.wep2[company][marine_number];
		};

  static update_weapon_two = function(new_weapon,from_armoury=true, to_armoury=true){
   	var change_wep = weapon_two();
  	if (change_wep == new_weapon){
   		return "no change";
   	}     	
  	if (from_armoury) and (new_weapon!=""){
	   	scr_add_item(new_weapon,-1);
	  }
		if (change_wep != "") and (to_armoury){
			scr_add_item(change_wep,1);
		}      	
    obj_ini.wep2[company][marine_number] = new_weapon;
	 };


		static corruption = function(){ 
			return obj_ini.chaos[company][marine_number];
		};	   
       static update_corruption = function(new_corruption){
            obj_ini.chaos[company][marine_number] = new_corruption;
	   };	
		static specials = function(){ 
			return obj_ini.spe[company][marine_number];
		};	   
       static update_specials = function(new_specials){
            obj_ini.spe[company][marine_number] = new_specials;
	   };
	   	static race = function(){ 
			return obj_ini.race[company][marine_number];
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

		static assignment = function(){
			var job = "none"
			if (squad != "none"){
				if (obj_ini.squads[squad].assignment != "none"){
					job = obj_ini.squads[squad].assignment.type;
				}
			}
			return job;
		}

		static remove_from_squad = function(){
			if (squad != "none"){
				if (squad < array_length(obj_ini.squads)){
					for (var r=0;r<array_length(obj_ini.squads[squad].members);r++){
						squad_member = obj_ini.squads[squad].members[r];
						if (squad_member[0] == company) and (squad_member[1] == marine_number){
							array_delete(obj_ini.squads[squad].members, r, 1);
						}
					}				
				}
				squad = "none"
			}
		}
		static marine_location = function(){
			var location_id,location_name;
			var location_type = obj_ini.wid[company][marine_number];
			if ( location_type > 0){ //if marine is on planet
				location_id = location_type; //planet_number marine is on
				location_type = location_types.planet; //state marine is on planet
				if (obj_ini.loc[company][marine_number] == "home"){
					obj_ini.loc[company][marine_number] = obj_ini.home_name
				}
				location_name = obj_ini.loc[company][marine_number]; //system marine is in
			} else {
				location_type =  location_types.ship; //marine is on ship
				location_id = obj_ini.lid[company][marine_number]; //ship array position
				location_name = obj_ini.ship_location[location_id]; //location of ship
			}
			return [location_type,location_id ,location_name];
		};

		//quick way of getting name and role combined in string
		static name_role = function (){
			var temp_role = role();
			if (squad != "none"){
				if (struct_exists(obj_ini.squad_types[$ obj_ini.squads[squad].type], temp_role)){
					var role_info = obj_ini.squad_types[$ obj_ini.squads[squad].type][$ temp_role]
					if (struct_exists(role_info, "role")){
						temp_role = role_info[$ "role"];
					}
				}
			}
			return string("{0} {1}", temp_role, name())
		}
		
		static load_marine = function(ship){
			 get_unit_size(); // make sure marines size given it's current equipment is correct
			 var current_location = marine_location();
			 var system = current_location[2];
			 var ship_location= obj_ini.ship_location[ship];
			 if (ship_location == "home" ){ship_location = obj_ini.home_name;}
			
			 if (current_location[0] == location_types.planet){//if marine is on a planet
				  if (current_location[2] == "home" ){system = obj_ini.home_name;}
				 //check if ship is in the same location as marine and has enough space;
				 if (ship_location == system) and ((obj_ini.ship_carrying[ship] + size) <= obj_ini.ship_capacity[ship]){
					 obj_ini.wid[company][marine_number] = 0; //mark marine as no longer on planet
					 obj_ini.lid[company][marine_number] = ship; //id of ship marine is now loaded on
					 obj_ini.ship_carrying[ship] += size; //update ship capacity
					 var temp_self =self;
					 with (obj_star){
					 		if (name==system){
					 			if (p_player[current_location[1]]>0) then p_player[current_location[1]]-=temp_self.size;
					 			break;
					 		}
					 }
				 }
			 } else if (current_location[0] == location_types.ship){ //with this addition marines can now be moved between ships freely as long as they are in the same system
				 var off_loading_ship = current_location[1];
				 if ( (obj_ini.ship_location[ship] == obj_ini.ship_location[off_loading_ship]) and ((obj_ini.ship_carrying[ship] + size) <= obj_ini.ship_capacity[ship])){
					 obj_ini.ship_carrying[off_loading_ship] -= size; // remove from previous ship capacity
					 obj_ini.lid[company][marine_number] = ship;             // change marine location to new ship
					  obj_ini.ship_carrying[ship] += size;            //add marine capacity to new ship
				 }
			 }
		};
	static unload = function(planet_number, system){
		var current_location = marine_location();
		if (current_location[0]==location_types.ship){
			if (!array_contains(["Warp", "Terra", "Mechanicus Vessel"],obj_ini.ship_location[current_location[1]]) && obj_ini.ship_location[current_location[1]]==system.name){
				obj_ini.loc[company][marine_number]=obj_ini.ship_location[current_location[1]];
				obj_ini.wid[company][marine_number]=planet_number;
				obj_ini.lid[company][marine_number]=0;
				get_unit_size();
				system.p_player[planet_number]+= size;
				obj_ini.ship_carrying[current_location[1]] -= size;
			}
		}
	}
	static set_planet = function(planet_number){
		obj_ini.wid[company][marine_number]=planet_number;
	}
	static spawn_exp =function(){
		var spawn_ex = 0;
		if (obj_ini.company_spawn_buffs[company] != 0){
			spawn_ex += floor(gauss(obj_ini.company_spawn_buffs[company][0], obj_ini.company_spawn_buffs[company][1]));	//finds the on game spwan buff a marine should get from being spawned at game start
		}
		if (struct_exists(obj_ini.role_spawn_buffs, role())){ //adds exp buffs based on marine's role
			if (obj_ini.role_spawn_buffs[$ role()] != 0){
				spawn_ex += floor(gauss(obj_ini.role_spawn_buffs[$ role()][0], obj_ini.role_spawn_buffs[$ role()][1]));
			}
		}
		if (spawn_ex != 0){update_exp(spawn_ex)}  //update the marines exp with updated guass value

	};
	static spawn_old_guard =function(){
		var old_guard=irandom(100);
		var age = (obj_ini.millenium*1000)+obj_ini.year;
		var bionic_count = choose(0,0,0,0,1,2,3);
		if (global.chapter_name=="Iron Hands"){
			bionic_count = choose(2,3,4,5);
		}
		switch(role()){
			case obj_ini.role[100][5]:  //captain
				if(old_guard>=75){
					update_armour("MK3 Iron Armour",false,false);
					update_age(age - gauss(400, 200))
					add_trait("old_guard");
					add_exp(50);
					bionic_count = choose(0,0,1,2,3)
				} // 25% of iron within
				else{
					update_armour(choose("MK5 Heresy","MK6 Corvus","MK7 Aquila", "MK4 Maximus","MK8 Errant"),false,false);
					update_age(age - gauss(400, 25));
					add_trait("seasoned");
					add_exp(25);
				}
				break;
			case  obj_ini.role[100][15]:  //apothecary
				update_armour("MK7 Aquila",false,false);
				if (company<=2){update_armour(choose("MK8 Errant","MK6 Corvus"),false,false)
				}else{
					update_armour(choose("MK5 Heresy","MK6 Corvus","MK7 Aquila", "MK4 Maximus","MK8 Errant"),false,false);
				}
				update_age(age - gauss(400, 250));
				if (intelligence<40){
					intelligence=40;
				}
				break;
			case "Standard Bearer":
				 update_armour("MK5 Heresy",false,false);
				 update_age(age - gauss(400, 250));
				break;
			case  obj_ini.role[100][8]:		//tacticals
				if (old_guard=99){
						update_armour("MK3 Iron Armour",false,false)
						update_age(age - gauss(600, 150));
						add_trait("ancient");
						add_exp(choose(100,75,50));	
					} // 1%
					else if (old_guard>=97 and old_guard<=99){
						update_armour("MK4 Maximus",false,false)
						update_age(age - gauss(500, 100));
						add_trait("old_guard");	
						add_exp(choose(75,50));
					} //3%
					else if (old_guard>=91 and old_guard<=96){
						update_armour("MK5 Heresy",false,false);
						update_age(age - gauss(300, 100));
						add_trait("seasoned");
						add_exp(choose(25,50));
					} // 6%
					else if (old_guard>=79 and old_guard<=90){
						update_armour("MK6 Corvus",false,false);
						update_age(age - gauss(250, 25));
						add_exp(choose(10,25));
					} // 12%
					else if (company<=2){
						update_armour("MK6 Corvus",false,false)
						} // company 1 and 2 taccies get beakies by default
					else{update_armour("MK7 Aquila",false,false)};
				break;
			case  obj_ini.role[100][10]:		//assualts
				// due to assault marines not wanting corvus due to worse ac, given them better chances with melee oriented armours. 
				// melee is risky af anyway so let's reward players who go assault marine heavy at game start
				if (old_guard>=99 and old_guard<=97){
					update_armour("MK8 Errant",false,false);
					update_age(age - gauss(150, 30));
					add_exp(25);
				} // 3% 
				else if (old_guard>=91 and old_guard<=96){
					update_armour("MK3 Iron Armour",false,false);
					update_age(age - gauss(600, 100));
					add_trait(choose("ancient","old_guard"),false,false);
					add_exp(choose(10, 30, 50));
				} // 6% 
				else if (old_guard>=80 and old_guard<=90){
					update_armour("MK4 Maximus",false,false);
					update_age(age - gauss(300, 75));
					add_trait("old_guard")
					add_exp(25);
				} // 12%
				else if (old_guard>=57 and old_guard<=79){
					update_armour("MK5 Heresy",false,false);
					update_age(age - gauss(240, 40));
					add_trait("seasoned")
					add_exp(choose(10,25));
				} // 24%
				else{
					update_armour("MK7 Aquila",false,false);
					update_age(age - gauss(150, 30));
				};
				break;	
			case  obj_ini.role[100][9]: 		//devastators	
				if ((old_guard>=99) and (old_guard<=97)){
					update_armour("MK4 Maximus",false,false);
					update_age(age - gauss(300, 100));
					add_trait(choose("ancient","old_guard"));
					add_exp(choose(25, 50));
				} // 3% for maximus
				else if (old_guard>=78 and old_guard<=96){
					update_armour("MK6 Corvus",false,false);
					update_age(age - gauss(200, 50));
					add_trait("seasoned");
					add_exp(25);
				} // 20% chance for devos to have ranged armor, wouldn't want much else
				else if (company<=2) {
					update_armour("MK6 Corvus",false,false);
				} // company 1 and 2 taccies get beakies by default
				else{update_armour("MK7 Aquila",false,false)};
				break;
			case  obj_ini.role[100][3]: //veterans
				if ((old_guard>=80)and (old_guard>=95)){
					update_armour(choose("MK4 Maximus","MK8 Errant"),false,false);
					update_age(age - gauss(150, 30));
					add_trait(choose("old_guard"));
					add_exp(choose(50, 75));					
				} else if (old_guard>95){
					update_armour(choose("MK4 Maximus","MK3 Iron Armour"),false,false);
					update_age(age - gauss(300, 100));
					add_trait(choose("old_guard"));
					add_exp(choose(125, 100));
				} else if (old_guard<35){
					update_armour(choose("MK4 Maximus","MK3 Iron Armour"),false,false);
					update_age(age - gauss(150, 30));
					add_trait(choose("old_guard"));
					add_exp(choose(25, 50));					
				}
				if (global.chapter_name=="Ultramarines"){
					if (choose(true,false)){
						add_trait("tyrannic_vet");
						bionic_count+=irandom(1);
					}
				}
				break;
			case obj_ini.role[100][16]: //techmarines
				update_armour(choose("MK8 Errant","MK6 Corvus","MK4 Maximus","MK3 Iron Armour"),false,false)
				if ((global.chapter_name="Iron Hands") or (obj_ini.progenitor=6)){
					add_bionics("right_arm");
					bionic_count = choose(6,6,7,7,7,8,9);
					add_trait("flesh_is_weak");
				}else {
			    bionic_count = irandom(5)+1;
				  if (irandom(2) ==0){
				    add_trait("flesh_is_weak");
				  }
			  }
				if (technology<35){
					technology=35;
				}
			  add_trait("mars_trained");
			  if (irandom(1) ==0){
			    add_trait("tinkerer");
			  }
			  if (religion !="cult_mechanicus"){
			  	religion_sub_cult = "none";
			  }
			  religion = "cult_mechanicus"	
				break;
			case  obj_ini.role[100][12]: //scouts
				bionic_count = choose(0,0,0,0,0,0,0,0,0,0,0,1)
				break;
			case  obj_ini.role[100][14]:  //chaplain
				update_armour(choose("MK5 Heresy","MK6 Corvus","MK7 Aquila", "MK4 Maximus","MK8 Errant"),false,false);
				update_age(age - gauss(400, 250));
				if (piety<35){
					piety=35;
				}
				if(irandom(1) ==0){
					add_trait("zealous_faith")
				}
				break;
			case "Codiciery":
				update_armour(choose("MK5 Heresy","MK6 Corvus","MK7 Aquila", "MK4 Maximus","MK8 Errant"),false,false);
				update_age(age - gauss(150, 20));
				break;
			case "Lexicanum":
				update_armour(choose("MK5 Heresy","MK6 Corvus","MK7 Aquila", "MK4 Maximus","MK8 Errant"),false,false);
				update_age(age - gauss(200, 30));
				add_trait("seasoned");
				break;
			case obj_ini.role[100,17]:
				update_armour(choose("MK5 Heresy","MK6 Corvus","MK7 Aquila", "MK4 Maximus","MK8 Errant"),false,false);
				update_age(age - gauss(400, 250));
				add_trait("seasoned");
				break;		
		}
		if (irandom(75)>74){
			add_trait("tyrannic_vet");
			bionic_count+=irandom(2);
		};		
		if (irandom(399-experience()) == 0){
			add_trait("still_standing");
		};
		if (irandom(399-experience()) == 0){
			add_trait("beast_slayer");
		};		
		if (irandom(499-experience())==0){
			add_trait("lone_survivor");
		}
		for(var i=0;i<bionic_count;i++){
				add_bionics();
		}
		if (irandom(3)==0){
			body[$ "torso"][$ "purity_seal"] = [irandom(1),irandom(1),irandom(1),];
		}
		if (irandom(3)==0){
			body[$ "left_arm"][$ "purity_seal"] = [irandom(1),irandom(1),irandom(1),];
		}
		if (irandom(3)==0){
			body[$ "right_arm"][$ "purity_seal"] = [irandom(1),irandom(1),irandom(1),];
		}	
		if (irandom(3)==0){
			body[$ "left_leg"][$ "purity_seal"] = [irandom(1),irandom(1),irandom(1),];
		}
		if (irandom(3)==0){
			body[$ "right_leg"][$ "purity_seal"] = [irandom(1),irandom(1),irandom(1),];
		}			
	}
	static alter_equipment = function(update_equipment, from_armoury=true, to_armoury=true){
		var equip_areas = struct_get_names(update_equipment);
		for (var i=0;i<array_length(equip_areas);i++){
			switch(equip_areas[i]){
				case "wep1":
					update_weapon_one(update_equipment[$ equip_areas[i]],from_armoury,to_armoury);
					break;
				case "wep2":
					update_weapon_two(update_equipment[$ equip_areas[i]],from_armoury,to_armoury);
					break;
				case "mobi":
					update_mobility_item(update_equipment[$ equip_areas[i]],from_armoury,to_armoury);
					break;
				case "armour":
					update_armour(update_equipment[$ equip_areas[i]],from_armoury,to_armoury);
					break;
				case "gear":
					update_gear(update_equipment[$ equip_areas[i]],from_armoury,to_armoury);
					break;								
			}
		}
	}

	static draw_unit_image = scr_draw_unit_image;
	static display_wepaons = scr_ui_display_weapons;
	static unit_profile_text = scr_unit_detail_text;
}
function jsonify_marine_struct(company, marine){
		var copy_marine_struct = obj_ini.TTRPG[company, marine]; //grab marine structure
		var new_marine = {};
		var copy_part;
		var names = variable_struct_get_names(copy_marine_struct); // get all keys within structure
		for (var name = 0; name < array_length(names); name++) { //loop through keys to find which ones are methods as they can't be saved as a json string
			if (!is_method(copy_marine_struct[$ names[name]])){
				copy_part = DeepCloneStruct(copy_marine_struct[$ names[name]])
				variable_struct_set(new_marine, names[name],copy_part); //if key value is not a method add to copy structure
			}
		}
		return json_stringify(new_marine);
	}