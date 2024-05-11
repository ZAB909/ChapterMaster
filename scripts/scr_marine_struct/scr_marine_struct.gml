//in future would be better to store old guard data in a struct like this but for now while working out kinks have left hardcoded
/*old_guard_equipment :{
	role[100][5]:{"armour":[["MK3 Iron Armour",25]]},
	role[100][14]:{"armour":[["MK3 Iron Armour",25]],
	role[100][15]:{"armour":[["MK3 Iron Armour", 10]]}, //apothecary
	role[100][16]:{"armour":},
	obj_ini.role[100][11]:{"armour":[["MK3 Iron Armour", 3]]},
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
		flavour_text : "Because of either natural talent, or obsessive training they are a master of arms",
		effect:"increase Melee Burden Cap"
	},
	"lightning_warriors":{
		constitution: -6,
		dexterity :6,
		weapon_skill : 5,
		flavour_text : "A master of speed covering distances quickly to enter the fray",
		display_name : "Lightning Warrior",
	},
	"slow_and_purposeful":{
		constitution:6,
		dexterity : -6,
		strength : 2,
		flavour_text : "Implacable, advancing in combat with methodical reason",
		display_name : "Slow and Purposeful",

	},
	"melee_enthusiast":{
		weapon_skill : 5,
		strength : 3,		
		flavour_text : "Nothing can keep them from the fury of melee combat",	
		display_name : "Melee Enthusiast",

	},
	"shitty_luck":{
		luck:-4,
		flavour_text : "For all their talent they are dogged by poor luck",
		display_name : "Shitty Luck",
	},
	"very_hard_to_kill":{
		constitution:15,
		luck:2,
		flavour_text : "Posses toughness and luck unsurpassed by most",
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
		flavour_text : "Walks in the footsteps of the Primarchs of old",
		display_name : "Paragon",

	},
	"warp_touched":{
		intelligence:4,
		flavour_text : "Interacted with the warp in a way that has forever marked them",
		display_name : "Warp Touched",		
	},
	"lucky":{
		luck : 4,
		flavour_text : "Inexplicably lucky",
		display_name : "Lucky"
	},
	"old_guard":{
		luck : 1,
		constitution : 1,
		strength :1,
		weapon_skill : [2, 2, "max"],
		ballistic_skill :[2, 2, "max"],
		flavour_text : "Seen many young warriors rise and die before them but they themselves still remain",
		display_name : "Old Guard"
	},
	"seasoned":{
		luck : 1,
		constitution : 1,
		strength :1,
		weapon_skill : 1,
		ballistic_skill :1,
		flavour_text : "A seasoned warrior, having fought for many years",
		display_name : "Seasoned",		
	},
	"ancient":{
		luck : 1,
		constitution : -1,
		strength :-1,
		weapon_skill : 3,
		ballistic_skill :4,
		wisdom : 5,
		flavour_text : "Truly Ancient. While their body may ache - skills and wisdom are to be respected",
		display_name : "Ancient",		
	},
	"tinkerer":{
		technology:[5,2,"max"],
		display_name:"Tinkerer",
		flavour_text:"They have a knack for tinkering around with various technological devices and apparatuses, often augmenting and improving their own equipment",
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
		flavour_text :"In their many years of service, they have risen through the ranks and have always led by example from the front. They have earned the respect of all their brothers",
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
		flavour_text :"Survived the unthinkable. Whether it was slaying a Warboss, vanquishing a Norn-Queen, or accomplishing another incredible feat, they stood last while their comrades fell",
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
		flavour_text :"Survived a battle where all their comrades died. They became more reclusive, but gained immeasurable combat capabilities and are harder to kill.",
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
		flavour_text :"Defeated a huge beast in single combat, this proves their toughness and their great ability to overcome powerful enemies of the imperium",

	},	
	"mars_trained":{
		technology:[10,5,"max"],
		intelligence:[5,5,"max"],
		display_name:"Trained On Mars",
		flavour_text:"Had the best instruction in the imperium on technology from the Tech Priests of Mars"
	},
	"flesh_is_weak":{
		technology:[2,1,"max"],
		constitution:[1,1,"max"],
		piety:[3,1,"max"],
		display_name:"Weakness of Flesh",
		flavour_text:"Perceive living flesh as a weakness and try to cast it aside whatever possible",
		effect:"faith boosts from bionic replacements"
	},
	"zealous_faith":{
		strength:[1,1,"max"],
		texhnology:-2,
		wisdom:3,
		intelligence:-2,
		piety:[5,2,"max"],
		display_name:"Zealous Faith",
		flavour_text:"Put great emphasis on their faith, able to draw strength from it in crisis"
	},
	"feet_floor":{
		wisdom:1,
		dexterity:-2,
		display_name:"Feet On the Ground",
		flavour_text:"Prefer to keep both feet on the ground",
		effect:"reduction in combat effectiveness when using Bikes or Jump Packs"
	},
	"tyrannic_vet":{
		wisdom :[2,3,"max"],
		dexterity:1,
		weapon_skill:1,
		ballistic_skill:1,
		constitution:1,
		display_name:"Tyrannic War Veteran",
		flavour_text:"A veteran of the many wars against the the Tyranid swarms",
		effect:"Increased lethality against tyranids"
	},
	"blood_for_blood":{
		strength:[3,2,"max"],
		weapon_skill:1,
		piety:2,
		display_name:"Blood For the Blood God",
		flavour_text:"Spilled blood in the name of the blood god",
		effect:"Has the attention of Khorne"
	},
	"blunt":{
		strength:[2,2,"max"],
		wisdom:2,
		charisma:-2,
		intelligence:-4,
		weapon_skill:1,
		display_name:"Blunt",
		flavour_text:"Tend towards simplistic approaches to achieve goals",
	},
	"skeptic":{
		piety:[-6,4,"min"],
		wisdom:1,
		display_name:"Skeptic",
		flavour_text:"Have a skeptical outlook and put little thought in trivial matters like religion and faith",
	},
	"scholar":{
		intelligence:[4,2,"max"],
		wisdom:1,
		technology:2,
		stength:-1,
		display_name:"Scholar",
		flavour_text:"Have a keen mind and enjoy reading and training it whenever possible",
	},
	"brute":{
		strength:[4,2,"max"],
		weapon_skill:[2,2,"max"],
		ballistic_skill:[-2,1,"min"],
		wisdom:-5,
		intelligence:-5,
		charisma:-2,
		display_name:"Brute",
		flavour_text:"A brutal character, often solving problems with intimidation or violence",
	},
	"charismatic":{
		charisma:[10,4,"max"],
		display_name:"Charismatic",
		flavour_text:"Liked by most without even trying",
	},
	"recluse":{
		charisma:[-3,2,"min"],
		dexterity:1,
		wisdom:1,
		display_name:"Reclusive",
		flavour_text:"Generally withdrawn and reclusive, avoiding social engagements where possible",
	}	,
	"nimble":{
		display_name:"Nimble",
		flavour_text:"Naturally nimble and light on their feet",
		dexterity:[4,3,"max"],
		weapon_skill:1,
		constitution:-3,
	},
	"jaded":{
		display_name:"Jaded",
		flavour_text:"Their past has led them to form a deep distrust and cynical outlook on most parts of their life",
		charisma:-2,
		wisdom:-1,
	},
	"observant":{
		display_name:"Observant",
		flavour_text:"Tend to notice things that most don't",
		wisdom:[5,2,"max"],
		dexterity:2
	},
	"perfectionist":{
		display_name:"Perfectionist",
		flavour_text:"Obsessed with doing things correctly",
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
		flavour_text:"Born with a guardian's heart, they vow to shield their charges, defending them unto death",
		effect:"Are a better guardian or bodyguard",
	},
	"cunning":{
		display_name:"Cunning",
		weapon_skill:[1,1,"max"],
		ballistic_skill:[2,2,"max"],
		dexterity:[2,2,"max"],
		charisma:2,
		wisdom:1,
		flavour_text:"Possessed of a fine cunning",
	},
	"strong":{
		display_name:"Strong",
		strength:[6,2,"max"],
		flavour_text:"Endowed with strength from birth",
	},	
	"slow":{
		display_name:"slow",
		dexterity:[-3,3,"min"],
		flavour_text:"Have many talents but being fast ain't one of them",
	},			
	"deathworld":{
		display_name:"Deathworld Born",
		strength:[2,2,"max"],
		constitution:[2,2,"max"],
		dexterity:[2,2,"max"],
		weapon_skill:[2,2,"max"],
		ballistic_skill:[2,-2,"min"],
		wisdom:[2,2,"max"],
		flavour_text:"Started life on a deathworld. While this has greatly improved their strength and survival abilities, their skills in technology and other advanced fields are reduced",
		intelligence:-3,
		technology:[-3,2,"min"],
		piety:[3,1],
	},
	"technophobe":{
		display_name:"Technophobe",
		technology:[-7,2,"min"],
		flavour_text:"Have a deep mistrust and loathing of technology",
	},
	"fast_learner":{
		display_name:"Quick Learner",
		wisdom:[2,2,"max"],
		intelligence:[2,2,"max"],
		technology:[2,2,"max"],
		flavour_text:"Fast learner, picking up new skills with ease",
		effect:"learns new skills more easily",
	},
	"brawler":{
		display_name:"Brawler",
		strength:[2,2,"max"],
		constitution:[2,2,"max"],
		flavour_text:"Compelled towards the thrill of combat, they revel in the raw, primal dance of battle, often relying on nothing more than the crushing power of their fists",
		effect:"bonus to fist type weaponry",
	},
	"tech_heretic":{
		display_name:"Tech Heretic",
		technology:[3,1,"max"],
		intelligence:1,
		flavour_text:"Engage in study and beliefs considered heretical in the eyes of Mars and the Imperium",
		//effect:"bonus to fist type weaponry",
	},
	"crafter":{
		display_name:"Crafter",
		technology:[6,1,"max"],
		intelligence:1,
		flavour_text:"Particularly skilled at building and making things, often improving their quality along the way",
		effect:"provides more total forge points especially when assigned to a forge",
	},	
	"natural_leader":{
		display_name:"Natural Leader",
		flavour_text:"Excels in all areas of command be that rallying his men, planning logistics or drawing up plans for engagements",
		wisdom : [4, 2, "max"],
		charisma : [4, 2, "max"],
		effect:"Bonus when commanding",		
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
			charisma :[40,3],
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
			charisma :[30,5],
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
			charisma :[30,5],
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
			strength:[12,1],
			constitution:[30,1],
			dexterity:[20,1],
			weapon_skill : [15,5],
			ballistic_skill : [15,5],				
			intelligence:[30,3],
			wisdom:[20,3],
			charisma :[8,1],
			religion : "cult_mechanicus",
			title : "Tech Priest",
			piety : [45,3],
			luck :6,
			technology :[55,3],
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
			weapon_skill : 35,
			ballistic_skill : 40,			
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
			weapon_skill : 20,
			ballistic_skill : 14,			
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
			weapon_skill : 25,
			ballistic_skill : 20,			
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
			weapon_skill : 25,
			ballistic_skill : 20,
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
	constitution=0; strength=0;luck=0;dexterity=0;wisdom=0;piety=0;charisma=0;technology=0;intelligence=0;weapon_skill=0;ballistic_skill=0;size = 0;planet_location=0;
	if (!instance_exists(obj_controller) && class!="blank"){//game start unit planet location
		planet_location=2;
	}
	ship_location=0;
	religion="none";
	master_loyalty = 0;
	job="none";
	psionic=0;
	corruption=0;
	religion_sub_cult = "none";
	base_group = "none";
	role_history = [];
	encumbered_ranged=false;
	encumbered_melee=false;
	home_world="";
	company = comp;			//marine company
	marine_number = mar;			//marine number in company
	squad = "none";
	stat_point_exp_marker = 0;
	bionics=0;
	static experience =  function(){
		return obj_ini.experience[company][marine_number];
	}//get exp
	turn_stat_gains = {};
	static update_exp = function(new_val){obj_ini.experience[company][marine_number] = new_val}//change exp
	static add_exp = function(add_val){
		var instace_stat_point_gains = {};
		stat_point_exp_marker += add_val;
		obj_ini.experience[company][marine_number] += add_val;
		if (base_group == "astartes"){
			while (stat_point_exp_marker>=15){
				var stat_gains = choose("weapon_skill", "ballistic_skill", "wisdom");
				var special_stat = irandom(3);
				if (IsSpecialist("forge") && special_stat==0) then stat_gains = "technology";
				if (IsSpecialist("libs") && special_stat==0) then stat_gains = "intelligence";
				if (IsSpecialist("chap") && special_stat==0) then stat_gains = "charisma";
				if (IsSpecialist("apoth") && special_stat==0) then stat_gains = "intelligence";
				if (role()=="Champion" && stat_gains!="weapon_skill" && special_stat==0) then stat_gains = "weapon_skill";
				if (job!="none"){
					if (job.type == "forge"){
						stat_gains="technology";
					}
				}				
				self[$ stat_gains]++;
				stat_point_exp_marker-=15;
				if (struct_exists(instace_stat_point_gains, stat_gains)){
					instace_stat_point_gains[$ stat_gains]++;
				} else {
					instace_stat_point_gains[$ stat_gains]=1;
				}
				if (struct_exists(turn_stat_gains, stat_gains)){
					turn_stat_gains[$ stat_gains]++;
				} else {
					turn_stat_gains[$ stat_gains]=1;
				}
			}
		}
		return instace_stat_point_gains;
	}
	static armour = function(raw=false){
		var wep = obj_ini.armour[company][marine_number];
		if (is_string(wep) || raw) then return wep;
		return obj_ini.artifact[wep];		
	};
	static role = function(){
		return obj_ini.role[company][marine_number];
	};

	static IsSpecialist = function(search_type="standard",include_trainee=false){
		return is_specialist(role(), search_type,include_trainee)
	}
	static update_role = function(new_role){
		if(role()==new_role){
			return "no change"
		}
		if (base_group=="astartes"){
			if (role() == obj_ini.role[100][12] && new_role!=obj_ini.role[100][12]){
		  		if (!get_body_data("black_carapace","torso")){
		  			alter_body("torso", "black_carapace", true);
		  			stat_boosts({strength:4, constitution:4,dexterity:4})//will decide on if these are needed
		  		}	
			}
			if (!is_specialist(role())){//logs changes too and from specialist status
				if (is_specialist(new_role)){
					obj_controller.marines-=1;
					obj_controller.command+=1;
				}
			} else {
				if  (!is_specialist(new_role)){
					obj_controller.marines+=1;
					obj_controller.command-=1;
				}
			}
		}		
		obj_ini.role[company][marine_number]= new_role;
		if instance_exists(obj_controller){
			array_push(role_history ,[role(), obj_controller.turn])
		}
		if (new_role==obj_ini.role[100][5]){
			if (company==2) then obj_ini.watch_master_name=name();
			if (company==3) then obj_ini.arsenal_master_name=name();
	        if (company==4) then obj_ini.lord_admiral_name=name();
			if (company==5) then obj_ini.march_master_name=name();
			if (company==6) then obj_ini.rites_master_name=name();
			if (company==7) then obj_ini.chief_victualler_name=name();
			if (company==8) then obj_ini.lord_executioner_name=name();
			if (company==9) then obj_ini.relic_master_name=name();
	        if (company==10) then obj_ini.recruiter_name=name();
	        scr_recent("captain_promote",name(),company);			
		} else  if (new_role==obj_ini.role[100][4]){
			scr_recent("terminator_promote",name(),company);
		} else if (new_role==obj_ini.role[100][2]){
			scr_recent("honor_promote",name(),company);
		} else if (new_role==obj_ini.role[100][6]){

            var dread_weapons =["Close Combat Weapon","Force Staff","Lascannon","Assault Cannon","Missile Launcher","Heavy Bolter"];

            if (!array_contains(dread_weapons,weapon_one())){
                update_weapon_one("");
            }
            if (!array_contains(dread_weapons,weapon_two())){
                update_weapon_two("");
            }  			
		}	
	};

	static mobility_item = function(raw=false){ 
		var wep = obj_ini.mobi[company][marine_number];
		if (is_string(wep) || raw) then return wep;
		return obj_ini.artifact[wep];
	};	
	static hp = function(){ 
		return obj_ini.hp[company][marine_number]; //return current health
	};
	static add_or_sub_health = function(health_augment){
		obj_ini.hp[company][marine_number]+=health_augment;
	}
	static healing = function(apoth){
		if (hp()<=0) then exit;
		var health_portion = 20;
		var m_health = max_health();
		var new_health;
		if (apoth){
			if (base_group == "astartes"){
				if (gene_seed_mutations[$ "ossmodula"]==1){
					health_portion=6;
				}else{
					health_portion=4;
				}
			} else {
				health_portion=10;
			}
		} else {
			if (base_group == "astartes"){
				health_portion = 8;
				if (gene_seed_mutations[$ "ossmodula"]==1){
					health_portion = 10;
				}
			}
		}
		new_health=hp()+(m_health/health_portion);
		if (new_health>m_health) then new_health=m_health;
		update_health(new_health);	
	}
	 static update_health = function(new_health){
	    obj_ini.hp[company][marine_number] = new_health;
	 };

	 static hp_portion = function(){
	 	return (hp()/max_health());
	 }
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
	mobility_item_quality = "standard";
   static update_mobility_item = function(new_mobility_item, from_armoury = true, to_armoury=true, quality="any"){
   		var arti = !is_string(new_mobility_item);
   		var change_mob=mobility_item()
   		if (change_mob == new_mobility_item){
   			return "no change";
   		}
	  	if (from_armoury && new_mobility_item!="" && !arti){
	  		if (scr_item_count(new_mobility_item, quality)>0){
				var exp_require = gear_weapon_data("weapon", new_mobility_item, "exp", false, quality);
	  			if (exp_require>experience()){
	  				return "exp_low";
	  			} 	  				  			
		   		quality=scr_add_item(new_mobility_item,-1, quality);
		   		quality = quality!=undefined? quality:"standard";
		    } else {
		    	return "no_items";
		    }
		} else {
			quality= quality=="any"?"standard":quality;
		}
		var portion = hp_portion();
		if (change_mob != "") and (to_armoury){
			if (!is_string(mobility_item(true))){
				obj_ini.artifact_equipped[mobility_item(true)]=false;
			} else {
				scr_add_item(change_mob,1,mobility_item_quality );
			}
		}
		obj_ini.mobi[company][marine_number] = new_mobility_item;
	 	if (arti){
	    	obj_ini.artifact_equipped[new_mobility_item] = true;
	    	mobility_item_quality = obj_ini.artifact_quality[new_mobility_item];
	    	var arti = obj_ini.artifact_struct[new_mobility_item];
			arti.bearer=[company,marine_number]; 	
	    } else {
	    	mobility_item_quality=quality;
	    }		
		update_health(portion*max_health());
		get_unit_size(); //every time mobility_item is changed see if the marines size has changed
		return "complete";
	};		

   armour_quality="standard";
   
  static update_armour = function(new_armour, from_armoury=true, to_armoury=true, quality="any"){
  		var arti = !is_string(new_armour);
	  	var change_armour=armour();
	  	var require_carpace=false;
	  	var armour_list=[];
	  	var _new_power_armour = array_contains(global.power_armour, new_armour);
	  	var _old_power_armour = array_contains(global.power_armour, change_armour);
	   	if ((change_armour == new_armour || ((_old_power_armour && _new_power_armour) && new_armour=="Power Armour"))){
	   		return "no change";
	   	}
	  	if (_new_power_armour){
	  		require_carpace=true;
	  		if (new_armour=="Power Armour"){
	  			armour_list = global.power_armour;
	  		}
	  	} else if (new_armour="Terminator Armour"){
	  		require_carpace=true;
	  		armour_list = ["Terminator Armour","Tartarus"];
	  	}
	  	if (require_carpace){
	  		if (!get_body_data("black_carapace","torso")){
	  			return "needs_carapace";
	  		}
	  	}//using this method this should be adaptable for a whole range of classes and archeotypes
	  	if (array_length(armour_list)>0){
	  		var armour_found=false;
            for (var pa=0;pa<array_length(armour_list);pa++){
            	if (scr_item_count(armour_list[pa])>0||!from_armoury){
            		new_armour = armour_list[pa];
            		armour_found=true;
            		break;
            	}
            }
            if (!armour_found){
            	return "no_items";
            } 
        }		
	   		
	  	if (from_armoury && new_armour!="" && !arti){
	  		if (scr_item_count(new_armour,quality)>0){
				var exp_require = gear_weapon_data("weapon", new_armour, "exp", false, quality);
	  			if (exp_require>experience()){
	  				return "exp_low";
	  			} 	  			
		   		quality=scr_add_item(new_armour,-1,quality);
		   		if (quality == "no_item") then return "no_items";
		   		quality = quality!=undefined? quality:"standard";
		    } else {
				return "no_items";
		    }
		} else {
			quality = quality=="any" ? "standard" : quality;
		}
		if (change_armour != "") and (to_armoury){
			if (!is_string(armour(true))){
				obj_ini.artifact_equipped[armour(true)]=false;
			} else {	
				scr_add_item(change_armour,1,armour_quality);
			}
		}
		var portion = hp_portion();
	    obj_ini.armour[company][marine_number] = new_armour;
	    if (arti){
	    	obj_ini.artifact_equipped[new_armour] = true;
	    	armour_quality = obj_ini.artifact_quality[new_armour];
			var arti = obj_ini.artifact_struct[new_armour];
			arti.bearer=[company,marine_number]; 		    	
	    } else {
	    	armour_quality=quality;
	    }
	    var new_arm_data = get_armour_data();
	    if (is_struct(new_arm_data)){
	    	if (new_arm_data.has_tag("terminator")){
	    		update_mobility_item("");
	    	}
	    }
	    if (armour()=="Dreadnought"){
	    	is_boarder = false;
	    	update_gear("");
	    	update_mobility_item("");
	    }
	    update_health(portion*max_health());
		get_unit_size(); //every time armour is changed see if the marines size has changed
		return "complete";
	};	
	static max_health =function(){
		var max_h = 100 * (1+((constitution - 40)*0.025));
		max_h += gear_weapon_data("armour", armour(), "hp_mod");
		max_h += gear_weapon_data("gear", gear(), "hp_mod");
		max_h += gear_weapon_data("mobility", mobility_item(), "hp_mod");
		max_h += gear_weapon_data("weapon", weapon_one(), "hp_mod");
		max_h += gear_weapon_data("weapon", weapon_two(), "hp_mod");
		return max_h;
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
	feats = [];
	allegiance =faction;	//faction alligience defaults to the chapter
	
	static stat_boosts = function(stat_boosters){
		stats = global.stat_list;
		var edits = struct_get_names(stat_boosters);
		var edit_stat,random_stat,stat_mod;		
		for (var stat_iter =0; stat_iter <array_length(stats);stat_iter++){
			if (array_contains(edits ,stats[stat_iter])){
				edit_stat = variable_struct_get(stat_boosters, stats[stat_iter]);
				if (is_array(edit_stat)){
					stat_mod = floor(gauss(edit_stat[0], edit_stat[1]));
					if (array_length(edit_stat) > 2){
						if (edit_stat[2] == "max"){
							stat_mod = max(stat_mod, edit_stat[0]);
						} else if(edit_stat[2] == "min") {
							stat_mod = min(stat_mod, edit_stat[0]);
						}
					}
				} else {
					stat_mod = edit_stat
				}
				if (stats[stat_iter] == "constitution"){
					balance_value = (hp()/max_health());
				}
				variable_struct_set(self,stats[stat_iter],  (variable_struct_get(self, stats[stat_iter])+  stat_mod));
				if (stats[stat_iter] == "constitution"){
					update_health(max_health()*balance_value)
				}
			}
		}		
	}
	//adds a trait to a marines trait list
	static add_trait = function(trait){
			var balance_value;
			if struct_exists(global.trait_list, trait){
				if (!array_contains(traits, trait)){
					var selec_trait = global.trait_list[$ trait];
					stat_boosts(selec_trait);
					array_push(traits, trait);
				}
			}
	};

	static has_trait = function(wanted_trait){
		return array_contains(traits, wanted_trait);
	}

	static add_feat = function(feat){
		feat_data = {};
		if struct_exists(global.trait_list, feat.ident){
			feat_data = global.trait_list[$ feat.ident];
			var feat_name_set = struct_get_names(feat);
			for (var i=0;i<array_length(feat_name_set);i++){
				feat_data[$ feat_name_set[i]] = feat[$ feat_name_set[i]];
			}
		} else {
			feat_data = feat
		}
		stat_boosts(feat_data);
		array_push(feats, feat_data);
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
				if (struct_exists(dist_modifiers, "progenitor")){
					if (obj_ini.progenitor == dist_modifiers[$ "progenitor"][0]){
						dist_rate = dist_modifiers[$"progenitor"][1]; 
					}else if (is_state_required(dist_modifiers[$ "progenitor"])){
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
				if (array_length(edit_stat)>2){
					if (edit_stat[2] == "max"){
						variable_struct_set(self, stats[stat_iter],  max(stat_mod, edit_stat[0]));
					} else if (edit_stat[2] == "min"){
						variable_struct_set(self, stats[stat_iter],  min(stat_mod, edit_stat[0]));
					} else {
						variable_struct_set(self, stats[stat_iter],  stat_mod);
					}
				} else {
					variable_struct_set(self, stats[stat_iter],  stat_mod);
				}
			}
		}
	};
	body = {
		"left_leg":{}, 
		"right_leg":{}, 
		"torso":{
			cloth:{
				variation:irandom(15),
			},
			armour_choice:irandom(1),
			variation:irandom(10),
			backpack_variation:irandom(10),
		}, 
		"left_arm":{},
		"right_arm":{}, 
		"left_eye":{}, 
		"right_eye":{},
		"throat":{}, 
		"jaw":{},
		"head":{variation:irandom(10)}
	}; //body parts list can be extended as much as people want

	static alter_body = function(body_slot, body_item_key, new_body_data, overwrite=true){//overwrite means it will replace any existing data
		if (struct_exists(body, body_slot)){
			if (!(struct_exists(body[$ body_slot], body_item_key)) || overwrite){
				body[$ body_slot][$ body_item_key] = new_body_data;
			}
		} else {
			return "invalid body area"
		}
	}

	static get_body_data = function(body_item_key,body_slot="none"){
		if (body_slot!="none"){
			if (struct_exists(body, body_slot)){
				if (struct_exists(body[$ body_slot], body_item_key)){
					return body[$ body_slot][$ body_item_key]
				} else {
					return false;
				}
			}else {
				return "invalid body area";
			}
		} else {
			var item_key_map = {};
			var body_part_area_keys
			for (var i=0;i<array_length(global.body_parts);i++){//search all body parts
				body_area = body[$ global.body_parts[i]]
				body_part_area_keys=struct_get_names(body_area);
				for (var b=0;b<array_length(body_part_area_keys);b++){
					if (body_part_area_keys[b]==body_item_key){
						item_key_map[$ global.body_parts[i]] = body_area[$ body_item_key]
					}
				}
				
			}
			return item_key_map;
		}
		return false;
	}
	/*ey so i got this concept where basically take away luck, ballistic_skill and weapon_skill 
	there are 8 other stats each of which will have more attached aspects and game play elements 
	they effect as time goes on, so that means between the 8 other stats if you had a choice of two 
	there are 64 (or 56 if you exclude double counts) variations of a choice of two, this means each 
	chapter could have two "values" maybe in terms of recruitment maybe in terms of just general chapter stuff. 
	that could be chosen to give boostes to the other stats
	so as an example salamanders could have the chapter values as  */
	loyalty = 0;
	switch base_group{
		case "astartes":				//basic marine class //adds specific mechanics not releveant to most units
			loyalty = 100;
			var astartes_trait_dist = [
				["very_hard_to_kill", [149,148]],
				["scholar", [99,98]],
				["brawler", [99,98],{"chapter_name":["Space Wolves",[10,9]]}],
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
				["feet_floor", [199,198],{"chapter_name":["Space Wolves",[10,7]]}],
				["paragon", [999,998]],
				["warp_touched",[299,298]],
				["shitty_luck",[99,98],{"disadvantage":["Shitty Luck",[3,2]]}],
				["lucky",[99,98]],
				["natural_leader",[199,198]],
				["slow_and_purposeful",[99,98],{"advantage":["Slow and Purposeful",[3,1]]}],
				["melee_enthusiast",[99,98],{"advantage":["Melee Enthusiasts",[3,1]]}],
				["lightning_warriors",[99,98],{"advantage":["Lightning Warriors",[3,1]]}],
				["zealous_faith",[99,98],{"chapter_name":["Black Templars",[3,2]]}],
				["flesh_is_weak",[1000,999],{"chapter_name":["Iron Hands",[10,9],"required"],"progenitor":[6,[10,9],"required"]}],
				["tinkerer",[199,198],{"chapter_name":["Iron Hands",[49,47]]}],
				["crafter",[299,298],{"advantage":["crafter",[199,198]]}],
			];
			distribute_traits(astartes_trait_dist);
			alter_body("torso","black_carapace",true);
			if (class=="scout" &&  global.chapter_name!="Space Wolves"){
				alter_body("torso","black_carapace",false);
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
			if (gene_seed_mutations[$ "voice"] == 1){
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
			if (array_contains(obj_ini.adv, "Psyker Abundance")){
				if (psionic<16) then psionic++;
				if (psionic<10) then psionic++;
			}
			if (array_contains(obj_ini.dis, "Psyker Intolerant")){
				if (irandom(4)==0){
					psionic = max(psionic-5, 0);
				}
			}
			if (global.chapter_name=="Space Wolves") or (obj_ini.progenitor=3) {
				religion_sub_cult = "The Allfather";
			} else if(global.chapter_name=="Salamanders") or (obj_ini.progenitor==8){
				religion_sub_cult = "The Promethean Cult";
			} else if (global.chapter_name=="Iron Hands") or (obj_ini.progenitor=6){
				religion_sub_cult = "The Cult of Iron";
			} 

			if (global.chapter_name == "Black Templars"){
				if (irandom(14)==0){
					body[$"torso"].robes =choose(0,0,0,1,1,2);
					if (body[$"torso"].robes == 0 && irandom(1) == 0){
						body[$"head"].hood = 1;
					}
				}
			}else if(global.chapter_name == "Dark Angels" || obj_ini.progenitor==1){
				body[$"torso"].robes = choose(0,0,0,1,2);
				if (body[$"torso"].robes == 0 && irandom(1) == 0){
					body[$"head"].hood = 1;
				}
			}else if(irandom(30)==0){
				body.torso.robes =choose(0,1,2,2,2,2,2);
				if (body[$"torso"].robes == 0 && irandom(1) == 0){
					body[$"head"].hood = 1;
				}
			}
			break;
		case "tech_priest":
			loyalty = obj_controller.disposition[eFACTION.Mechanicus]-10;
			religeon = "cult_mechanicus";
			bionics = (irandom(5)+4);
			add_trait("flesh_is_weak");
			psionic = irandom(4);
			break;	
	};

	static race = function(){
		return obj_ini.race[company][marine_number];
	};	//get race

	static calculate_death = function(death_threshold = 25, death_random=50,apothecary=true, death_type="normal"){
		dies = false;
		death_random += luck;
		death_threshold+=luck;
		if (death_type=="normal"){
			death_threshold += (constitution/10);
			if (has_trait("very_hard_to_kill")){
				death_threshold += 3; 
			}
		}
		var chance = irandom(death_random);
		if (death_random>death_threshold){
			dies = true;
		}
		return false; 
	}

	static add_bionics = function(area="none", bionic_quality="any", from_armoury=true){
		if (from_armoury && scr_item_count("Bionics",bionic_quality)<1){
			return "no bionics";
		}else if (from_armoury){
			remove_quality = scr_add_item("Bionics",-1, bionic_quality);
		} else {
			remove_quality=choose("standard","standard","standard","standard","standard", "master_crafted","artifact");
		}	
		var new_bionic_pos, part, new_bionic = {quality :scr_add_item};
		if (bionics < 10){
			if (has_trait("flesh_is_weak")){
				add_or_sub_health(40);
			} else {
				add_or_sub_health(30);
			}
			var bionic_possible = [];
			for (var body_part = 0; body_part < array_length(global.body_parts);body_part++){
				part = global.body_parts[body_part];
				if (!get_body_data("bionic",part)){
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
				bionics++;
				alter_body(new_bionic_pos, "bionic",new_bionic)
				if (array_contains(["left_leg", "right_leg"], new_bionic_pos)){
					constitution += 2;
					strength++;
					dexterity -= 2;
					body[$ new_bionic_pos][$"bionic"].variant=irandom(2);
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
				if (has_trait("flesh_is_weak")){
					piety++;
				}
			}
			if (hp()>max_health()){update_health(max_health())}
		}
	};
	static age = function(){
		var real_age = ((obj_controller.millenium*1000)+obj_controller.year)-obj_ini.age[company][marine_number];
		return real_age;
	};// age

	static update_age = function(new_val){
		obj_ini.age[company][marine_number] = new_val;
	};		

	static name = function(){
		return obj_ini.name[company][marine_number];
	};// get marine name

	static gear = function(raw=false){
		var wep = obj_ini.gear[company][marine_number];
		if (is_string(wep) || raw) then return wep;
		return obj_ini.artifact[wep];		
	};

	is_boarder =false;

	gear_quality="standard";
	static update_gear = function(new_gear,from_armoury=true, to_armoury=true, quality="any"){
		var arti = !is_string(new_gear);
		var change_gear = gear();
		if (change_gear == new_gear){
	 		return "no change";
	 	}
	  	if (from_armoury) and (new_gear!="") and (!arti){
	  		if (scr_item_count(new_gear,quality)>0){
				var exp_require = gear_weapon_data("gear", new_gear, "exp", false, quality);
	  			if (exp_require>experience()){
	  				return "exp_low";
	  			}
		   		quality=scr_add_item(new_gear,-1, quality);
		   		if (quality == "no_item") then return "no_items";
		   		quality = quality!=undefined? quality:"standard";
		    } else {
		    	return "no_items";
		    }
		} else {
			quality = quality=="any"?"standard":quality;
		}

		var portion = hp_portion();
		if (change_gear != "" && to_armoury){
			if (!is_string(gear(true))){
				obj_ini.artifact_equipped[gear(true)]=false;
			} else {			
				scr_add_item(change_gear,1,gear_quality);
			}
		}  			
		obj_ini.gear[company][marine_number] = new_gear;
	 	if (arti){
	    	obj_ini.artifact_equipped[new_gear] = true;
	    	gear_quality = obj_ini.artifact_quality[new_gear];
			var arti = obj_ini.artifact_struct[new_gear];
			arti.bearer=[company,marine_number]; 	    	
	    } else {
	    	gear_quality=quality;
	    }	
		update_health(portion*max_health());
		 return "complete";
	}

	if (base_group!="none"){
		update_health(max_health()); //set marine health to max
	}
	   
	static weapon_one = function(raw=false){
		var wep = obj_ini.wep1[company][marine_number];
		if (is_string(wep) || raw) then return wep;
		return obj_ini.artifact[wep];
	};

	static equipments_qual_string = function(slot, art_only=false){
		var item;
		var quality;
		switch (slot){
			case "wep1":
				item = weapon_one(true);
				quality = weapon_one_quality;
				break;
			case "wep2":
				item = weapon_two(true);
				quality = weapon_two_quality;
				break;				
			case "armour":
				item = armour(true);
				quality = armour_quality;
				break;				
			case "gear":
				item = gear(true);
				quality = gear_quality;
				break;
			case "mobi":
				item = mobility_item(true);
				quality =mobility_item_quality;
				break;				
		}

		var is_artifact = !is_string(item);
		if (!is_artifact && art_only == false){
			return $"{item}";
		} else if (is_artifact) {
			if (obj_ini.artifact_struct[item].name==""){
				return  $"{obj_ini.artifact[item]}";
			} else {
				return obj_ini.artifact_struct[item].name;
			}
		} else {
			return $"{item}";
		}
	}

	weapon_one_data={quality:"standard"};
  weapon_one_quality = "standard";

	static weapon_viable = function(new_weapon,quality){
		viable = true;
		qual_string = quality;
		if (scr_item_count(new_weapon, quality)>0){
			var exp_require = gear_weapon_data("weapon", new_weapon, "exp", false, quality);
				if (exp_require>experience()){
					viable = false;
					qual_string = "exp_low";
				}  			
	   		quality=scr_add_item(new_weapon,-1,quality);
	   		if (quality == "no_item") then return "no_items";
	   		qual_string = quality!=undefined? quality:"standard";
	    } else {
	    	viable = false;
	    	qual_string = "no_items";
	    }
	    if (new_weapon=="Company Standard"){
	    	if (unit.role()!=obj_ini.role[100][11]){
	    		viable = false;
	    		qual_string = "wrong_role";
	    	}
	    }
	    return [viable, qual_string];	
	}

  static update_weapon_one = function(new_weapon,from_armoury=true, to_armoury=true,quality="any"){
  	var arti = !is_string(new_weapon);
  	var change_wep = weapon_one();
  	var weapon_list = [];
    if (new_weapon == "Heavy Ranged"){
    	weapon_list=["Multi-Melta", "Heavy Bolter","Lascannon","Missile Launcher"];
    	if array_contains(weapon_list, change_wep){
    		return "no change";
    	}
    }else if (change_wep == new_weapon){
   		return "no change";
   	}

  	if (array_length(weapon_list)>0){
  		var weapon_found=false;
  		var _wep_choice;
  		while (array_length(weapon_list)>0){//randomises heavy weapon choice
  			_wep_choice=irandom(array_length(weapon_list)-1);
  			if (scr_item_count(weapon_list[_wep_choice])>0){
  				weapon_found=true;
  				new_weapon=weapon_list[_wep_choice];
  				break;
  			}
  			array_delete(weapon_list,_wep_choice, 1)
  		}
        if (!weapon_found){
        	return "no_items";
        } 
    } 	
  	if (from_armoury && new_weapon!="" && !arti){
  		var viability = weapon_viable(new_weapon,quality);
  		if (viability[0]){
  			quality = viability[1];
  		} else {
  			return viability[1];
  		}
	}else {
		quality= quality=="any"?"standard":quality;
	}

	if (change_wep != "") and (to_armoury){
		if (!is_string(weapon_one(true))){
			obj_ini.artifact_equipped[weapon_one(true)]=false;
		} else {			
			scr_add_item(change_wep,1, weapon_one_quality);
		}
	}       	
    obj_ini.wep1[company][marine_number] = new_weapon;
 	if (arti){
    	obj_ini.artifact_equipped[new_weapon] = true;
		var arti = obj_ini.artifact_struct[new_weapon];
		arti.bearer=[company,marine_number];    	
    	weapon_one_quality = obj_ini.artifact_quality[new_weapon];
    } else {
    	weapon_one_quality=quality;
    }
     return "complete";
	};

	static weapon_two = function(raw=false){
		var wep = obj_ini.wep2[company][marine_number];
		if (is_string(wep) || raw) then return wep;
		return obj_ini.artifact[wep];
	};

	weapon_two_quality="standard";
  	static update_weapon_two = function(new_weapon,from_armoury=true, to_armoury=true, quality="any"){
  		var arti = !is_string(new_weapon);
	   	var change_wep = weapon_two();
	  	if (change_wep == new_weapon){
	   		return "no change";
	   	}     	
	  	if (from_armoury) and (new_weapon!="") && (!arti){
	  		var viability = weapon_viable(new_weapon,quality);
	  		if (viability[0]){
	  			quality = viability[1];
	  		} else {
	  			return viability[1];
	  		}
		} else {
			quality= quality=="any"?"standard":quality;
		}
		if (change_wep != "") and (to_armoury){
			if (!is_string(weapon_two(true))){
				obj_ini.artifact_equipped[weapon_two(true)]=false;
			}else {
				scr_add_item(change_wep,1, weapon_two_quality);
			}		
		}      	
    	obj_ini.wep2[company][marine_number] = new_weapon;
	 	if (arti){
	    	obj_ini.artifact_equipped[new_weapon] = true;
	    	weapon_two_quality = obj_ini.artifact_quality[new_weapon];
			var arti = obj_ini.artifact_struct[new_weapon];
			arti.bearer=[company,marine_number]; 	    	
	    } else {
	    	weapon_two_quality=quality;
	    }
    	return "complete";
	};

		static specials = function(){ 
			return obj_ini.spe[company][marine_number];
		};	   
       static update_powers = scr_powers_new;
	   	static race = function(){ 
			return obj_ini.race[company][marine_number];
		};

		//get equipment data methods by deafult they garb all equipment data and return an equipment struct e.g new equipment_struct(item_data, core_type,quality="none")
		static get_armour_data= function(type="all"){
			return gear_weapon_data("armour", armour(), type, false, armour_quality);
		}
		static get_gear_data= function(type="all"){
			return gear_weapon_data("gear", gear(), type, false, gear_quality);
		}
		static get_mobility_data= function(type="all"){
			return gear_weapon_data("mobility", mobility_item(), type, false, mobility_item_quality);
		}
		static get_weapon_one_data= function(type="all"){
			return gear_weapon_data("weapon", weapon_one(), type, false, weapon_one_quality);
		}
		static get_weapon_two_data= function(type="all"){
			return gear_weapon_data("weapon", weapon_two(), type, false, weapon_two_quality);
		}								
		static damage_resistance = function(){
			damage_res = 0;
			damage_res+=get_armour_data("damage_resistance_mod");
			damage_res+=get_gear_data("damage_resistance_mod");
			damage_res+=get_mobility_data("damage_resistance_mod");
			damage_res+=get_weapon_one_data("damage_resistance_mod");
			damage_res+=get_weapon_two_data("damage_resistance_mod");			
			damage_res = min(75, damage_res+floor(((constitution*0.005) + (experience()/1000))*100));
			return damage_res;
		};

		static ranged_hands_limit = function(){
			var ranged_carrying = 0;
			var carry_string = "";
			var ranged_hands_limit = 2;

			var wep_one_carry = get_weapon_one_data("ranged_hands");
			if (wep_one_carry != 0){
				ranged_carrying += wep_one_carry;
				carry_string += $"{weapon_one()}: {wep_one_carry}#";
			}
			var wep_two_carry = get_weapon_two_data("ranged_hands");
			if (wep_two_carry != 0){
				ranged_carrying += wep_two_carry;
				carry_string += $"{weapon_two()}: {wep_two_carry}#";
			}
			if ranged_carrying != 0{
				carry_string = $"    =Carrying=#" + carry_string;
			}

			carry_string += $"    =Maximum=#"
			if (base_group == "astartes"){
				ranged_hands_limit = 2
			} else if base_group == "tech_priest" {
				ranged_hands_limit = 1+(technology/100);;
			}else if base_group == "human" {
				ranged_hands_limit = 1;
			}	
			carry_string+=$"Base: {ranged_hands_limit}#";
			if (strength>=50){
				ranged_hands_limit+=0.5;
				carry_string+="STR: +0.5#";
			}
			if (ballistic_skill>=50){
				ranged_hands_limit+=0.25;
				carry_string+="BS: +0.25#";
			}			
			var armour_carry = get_armour_data("ranged_hands");
			if (armour_carry!=0){
				ranged_hands_limit+=armour_carry;
				carry_string+=$"{armour()}: {format_number_with_sign(armour_carry)}#";
			}
			var gear_carry = get_gear_data("ranged_hands");
			if (gear_carry!=0){
				ranged_hands_limit+=gear_carry;
				carry_string+=$"{gear()}: {format_number_with_sign(gear_carry)}#";
			}
			var mobility_carry = get_mobility_data("ranged_hands");
			if (mobility_carry!=0){
				ranged_hands_limit+=mobility_carry;
				carry_string+=$"{mobility_item()}: {format_number_with_sign(mobility_carry)}#";
			}							
			return [ranged_carrying,ranged_hands_limit,carry_string]						
		}

		static ranged_attack = function(weapon_slot=0){
			encumbered_ranged=false;			
			//base modifyer based on unit skill set
			ranged_att = 100*(((ballistic_skill/50) + (dexterity/400)+ (experience()/500)));
			var final_range_attack=0;
			var explanation_string = $"Stat Mod: x{ranged_att/100}#  BS: x{ballistic_skill/50}#  DEX: x{dexterity/400}#  EXP: x{experience()/500}#";
			//determine capavbility to weild bulky weapons
			var carry_data =ranged_hands_limit();

			//base multiplyer
			var range_multiplyer = 1;

			//grab generic structs for weapons
			var _wep1 = get_weapon_one_data();
			var _wep2 = get_weapon_two_data();
			//default to fists
			if (!is_struct(_wep1)) then _wep1 = new equipment_struct({},"");
			if (!is_struct(_wep2)) then _wep2 = new equipment_struct({},"");
			if (allegiance==global.chapter_name){
				_wep1.owner_data("chapter");
				_wep2.owner_data("chapter");
			}
			var primary_weapon= new equipment_struct({},"");
			var secondary_weapon= new equipment_struct({},"");
			if (carry_data[0]>carry_data[1]){
				encumbered_ranged=true;					
				ranged_att*=0.6;
				explanation_string+=$"Encumbered:X0.6#";
			}			
			if (weapon_slot==0){
				//decide if any weapons are ranged
				if (_wep1.range<=1.1 && _wep2.range<=1.1){
					if (array_length(_wep1.second_profiles) + array_length(_wep2.second_profiles) ==0){
						ranged_damage_data = [final_range_attack,explanation_string,carry_data,primary_weapon, secondary_weapon];
					} else {
						var other_profiles = array_concat(_wep1.second_profiles,_wep2.second_profiles);
						for (var sec = 0;sec<array_length(other_profiles);sec++){
							var sec_profile = gear_weapon_data("weapon",other_profiles[sec],"all",false,weapon_one_quality);
							if (is_struct(sec_profile)){
								if (sec_profile.range>1.1 && sec_profile.attack>0){
									final_range_attack+=(sec_profile.attack*(ranged_att/100));
									explanation_string+=$"{sec_profile.name} +{sec_profile.attack}#";
								}
							}
						}
						if (array_length(_wep1.second_profiles)>0) then primary_weapon=gear_weapon_data("weapon",_wep1.second_profiles[0],"all",false,weapon_one_quality);
						if (array_length(_wep2.second_profiles)>0) then primary_weapon=gear_weapon_data("weapon",_wep2.second_profiles[0],"all",false,weapon_two_quality);
						ranged_damage_data = [final_range_attack,explanation_string,carry_data,primary_weapon, secondary_weapon];
					}
					return ranged_damage_data;
				} else {
					if (_wep1.range<=1.1){
						primary_weapon=_wep2;
					} else if (_wep2.range<=1.1){
						primary_weapon=_wep1;
					} else {
						//if both weapons are ranged pick best
						if (_wep1.attack>_wep2.attack){
							primary_weapon=_wep1;
							secondary_weapon=_wep2;
						} else{
							secondary_weapon=_wep1;
							primary_weapon=_wep2;
						}
					}
				}
			} else {
				if (weapon_slot==1){
					primary_weapon=_wep1;
				} else if (weapon_slot==2){
					primary_weapon=_wep2;
				}
			};
			//calculate chapter specific bonus
			if (allegiance==global.chapter_name){//calculate player specific bonuses
				if (primary_weapon.has_tag("bolt")){
					if (array_contains(obj_ini.adv, "Bolter Drilling") && base_group=="astartes"){
						range_multiplyer+=0.15;
						explanation_string+=$"Bolter Drilling:X1.15#"
					}
				}
			}
			if (!encumbered_ranged){
			 	var total_gear_mod=0;							
				total_gear_mod+=get_armour_data("ranged_mod");
				total_gear_mod+=get_gear_data("ranged_mod");
				total_gear_mod+=get_mobility_data("ranged_mod");
				total_gear_mod+=_wep1.ranged_mod;
				total_gear_mod+=_wep2.ranged_mod;
				ranged_att+=total_gear_mod;
				explanation_string+=$"Gear Mod: x{(total_gear_mod/100)+1}#";			
				if (has_trait("feet_floor") && mobility_item()!=""){
					ranged_att*=0.9;
					explanation_string+=$"{global.trait_list.feet_floor.display_name}:X0.9#";
				}
			}
			//return final ranged damage output
			final_range_attack = floor((ranged_att/100)* primary_weapon.attack);
			explanation_string = $"{primary_weapon.name}: {primary_weapon.attack}#" + explanation_string
			if (!encumbered_ranged){
				if (primary_weapon.has_tag("pistol") &&secondary_weapon.has_tag("pistol")){
					final_range_attack+=floor((ranged_att/100)* secondary_weapon.attack);
					explanation_string+=$"Dual Pistols: +{secondary_weapon.attack}#";			
				} else if (secondary_weapon.attack>0){
					var second_attack =floor((ranged_att/100)* secondary_weapon.attack)*0.5;
					final_range_attack+=second_attack;
					explanation_string+=$"Secondary: +{second_attack}#";			
				}
			}
			ranged_damage_data = [final_range_attack,explanation_string,carry_data,primary_weapon, secondary_weapon];
			return ranged_damage_data;
		};

		static melee_hands_limit = function(){
			var melee_carrying = 0;
			var carry_string = "";
			var melee_hands_limit = 2;

			var wep_one_carry = get_weapon_one_data("melee_hands");
			if (wep_one_carry != 0){
				melee_carrying += wep_one_carry;
				carry_string += $"{weapon_one()}: {wep_one_carry}#";
			}
			var wep_two_carry = get_weapon_two_data("melee_hands");
			if (wep_two_carry != 0){
				melee_carrying += wep_two_carry;
				carry_string += $"{weapon_two()}: {wep_two_carry}#";
			}
			if melee_carrying != 0{
				carry_string = $"    =Carrying=#" + carry_string;
			}

			carry_string += $"    =Maximum=#"
			if (base_group == "astartes"){
				melee_hands_limit = 2
			} else if base_group == "tech_priest" {
				melee_hands_limit = 1+(technology/100);
			}else if base_group == "human" {
				melee_hands_limit = 1;
			}				
			carry_string+="Base: 2#";
			if (strength>=50){
				melee_hands_limit+=0.25;
				carry_string+="STR: +0.25#";
			}
			if (weapon_skill>=50){
				melee_hands_limit+=0.25;
				carry_string+="WS: +0.25#";
			}
			if (has_trait("champion")){
				melee_hands_limit+=0.25;
				carry_string+="Champion: +0.25#";
			}
			var armour_carry = get_armour_data("melee_hands")
			if (armour_carry!=0){
				melee_hands_limit+=armour_carry;
				carry_string+=$"{armour()}: {format_number_with_sign(armour_carry)}#";
			}
			var gear_carry = get_gear_data("melee_hands");
			if (gear_carry!=0){
				melee_hands_limit+=gear_carry;
				carry_string+=$"{gear()}: {format_number_with_sign(gear_carry)}#";
			}
			var mobility_carry = get_mobility_data("melee_hands");
			if (mobility_carry!=0){
				melee_hands_limit+=mobility_carry;
				carry_string+=$"{mobility_item()}: {format_number_with_sign(mobility_carry)}#";
			}						
			return [melee_carrying,melee_hands_limit,carry_string]						
		}		
		static melee_attack = function(weapon_slot=0){
			encumbered_melee=false;
			melee_att = 100*(((weapon_skill/100) * (strength/20)) + (experience()/1000)+0.1);
			var explanation_string = string_concat("#Stats: ", format_number_with_sign(round(((melee_att/100)-1)*100)), "%#");
			explanation_string += "  Base: +10%#";
			explanation_string += string_concat("  WSxSTR: ", format_number_with_sign(round((((weapon_skill/100)*(strength/20))-1)*100)), "%#");
			explanation_string += string_concat("  EXP: ", format_number_with_sign(round((experience()/1000)*100)), "%#");

			melee_carrying = melee_hands_limit();
			var _wep1 = get_weapon_one_data();
			var _wep2 = get_weapon_two_data();
			if (!is_struct(_wep1)) then _wep1 = new equipment_struct({},"");
			if (!is_struct(_wep2)) then _wep2 = new equipment_struct({},"");
			if (allegiance==global.chapter_name){
				_wep1.owner_data("chapter");
				_wep2.owner_data("chapter");
			}
			var primary_weapon;
			var secondary_weapon="none";
			if (weapon_slot==0){
				//if player has not melee weapons
				var valid1 = ((_wep1.range<=1.1 && _wep1.range!=0) || (_wep1.has_tags(["pistol","flame"])));
				var valid2 = ((_wep2.range<=1.1 && _wep2.range!=0) || (_wep2.has_tags(["pistol","flame"])));
				if (!valid1 && !valid2){
					primary_weapon=new equipment_struct({},"");//create blank weapon struct
					primary_weapon.attack=strength/3;//calculate damage from player fists
					primary_weapon.name="fists";
				} else {
					if (!valid1 && valid2){
						primary_weapon=_wep2;
					} else if (valid1 && !valid2){
						primary_weapon=_wep1;
					} else {
						var highest = _wep1.attack>_wep2.attack ? _wep1 :_wep2;
						var lowest = _wep1.attack<=_wep2.attack ? _wep1 :_wep2;
						if (!highest.has_tags(["pistol","flame"])){
							primary_weapon = highest;
							secondary_weapon=lowest;
						}else if (!lowest.has_tags(["pistol","flame"])){
							primary_weapon = lowest;
							secondary_weapon=highest;
						} else {
							primary_weapon=highest;
							melee_att*=0.5;
							if (primary_weapon.has_tag("flame")){
								explanation_string+=$"Primary is Flame: -50%#"
							} else if primary_weapon.has_tag("pistol"){
								explanation_string+=$"Primary is Pistol: -50%#"
							}
							secondary_weapon=lowest;
						}
					}
				}
			} else {
				if (weapon_slot==1){
					primary_weapon=_wep1;
				} else if (weapon_slot==2){
					primary_weapon=_wep2;
				}
			};
			var basic_wep_string = $"{primary_weapon.name}: {primary_weapon.attack}#";
			if IsSpecialist("libs"){
				if (primary_weapon.has_tag("psy") ||_wep2.has_tag("psy")){
					var force_modifier = (((weapon_skill/100) * (psionic/10) * (intelligence/10)) + (experience()/1000)+0.1);
					primary_weapon.attack *= force_modifier;
					basic_wep_string += $"Active Force Weapon: x{force_modifier}#  Base: 0.10#  WSxPSIxINT: x{(weapon_skill/100)*(psionic/10)*(intelligence/10)}#  EXP: x{experience()/1000}#";
				}		
			};
			explanation_string = basic_wep_string + explanation_string

			if (melee_carrying[0]>melee_carrying[1]){
				encumbered_melee=true;	
				melee_att*=0.6;
				explanation_string+=$"Encumbered: x0.6#"
			}
			if (!encumbered_melee){
			 	var total_gear_mod=0;							
				total_gear_mod+=get_armour_data("melee_mod");
				total_gear_mod+=get_gear_data("melee_mod");
				total_gear_mod+=get_mobility_data("melee_mod");
				total_gear_mod+=_wep1.melee_mod;
				total_gear_mod+=_wep2.melee_mod;
				melee_att+=total_gear_mod;
				explanation_string+=$"#Gear Mod: {(total_gear_mod/100)*100}%#";
				//TODO make trait data like this more structured to be able to be moddable
				if (has_trait("feet_floor") && mobility_item()!=""){
					melee_att*=0.9;
					explanation_string+=$"{global.trait_list.feet_floor.display_name}: x0.9#";
				}
				if (primary_weapon.has_tag("fist") && has_trait("brawler")){
					melee_att*=1.1;
					explanation_string+=$"{global.trait_list.brawler.display_name}: x1.1#";
				}
			}
			var final_attack =  floor((melee_att/100)*primary_weapon.attack);
			if (secondary_weapon!="none" && !encumbered_melee){
				var side_arm_data="Standard: x0.5";
				var secondary_modifier = 0.5;
				if (primary_weapon.has_tag("dual") && secondary_weapon.has_tag("dual")){
					secondary_modifier=1
					side_arm_data="Dual: x1";
				} else if (secondary_weapon.has_tag("pistol")){
					if (melee_carrying[0]+0.8>=melee_carrying[1]){
						secondary_modifier=0;
					}else {
						secondary_modifier = 0.6;
						side_arm_data="Pistol: x0.8";
					}
				} else if (secondary_weapon.has_tag("flame")){
					secondary_modifier = 0.3;
					side_arm_data="Flame: x0.3";
				}
				var side_arm = floor(secondary_modifier*((melee_att/100)*secondary_weapon.attack));
				if (side_arm>0){
					final_attack+=side_arm;
					explanation_string+=$"Side Arm: +{side_arm}({side_arm_data})#";
				}
			}
			melee_damage_data=[final_attack,explanation_string,melee_carrying,primary_weapon, secondary_weapon];
			return melee_damage_data;
		};

		//TODO just did this so that we're not loosing featuring but this porbably needs a rethink
		static hammer_of_wrath =  function(){
			var wrath =  new equipment_struct({},"");
			wrath.attack=(strength*2) +(0.5*weapon_skill);
			wrath.name = "hammer_of_wrath";
			wrath.range = 1;
			wrath.ammo = -1;
			return wrath;
		}

		static armour_calc = function(){
			armour_rating=0;
			armour_rating+=get_armour_data("armour_value")
			armour_rating+=get_weapon_one_data("armour_value")
			armour_rating+=get_mobility_data("armour_value")
			armour_rating+=get_gear_data("armour_value")
			armour_rating+=get_weapon_two_data("armour_value")
            if (armour() != ""&& allegiance==global.chapter_name){ // STC Bonuses
                if (obj_controller.stc_bonus[1] == 5) {
                    armour_rating*=1.05
                }
                if (obj_controller.stc_bonus[2] == 3) {
                     armour_rating*=1.05
                }
            }	
            return armour_rating;		
		}

		static assignment = function(){
			if (squad != "none"){
				if (obj_ini.squads[squad].assignment != "none"){
					return obj_ini.squads[squad].assignment.type;
				}
			}
			if (job!= "none"){
				return job.type;
			} else {
				return "none"
			}
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
			var location_type = planet_location;
			if ( location_type > 0){ //if marine is on planet
				location_id = location_type; //planet_number marine is on
				location_type = location_types.planet; //state marine is on planet
				if (obj_ini.loc[company][marine_number] == "home"){
					obj_ini.loc[company][marine_number] = obj_ini.home_name
				}
				location_name = obj_ini.loc[company][marine_number]; //system marine is in
			} else {
				location_type =  location_types.ship; //marine is on ship
				location_id = ship_location; //ship array position
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

		static full_title = function(){
			return $"{name_role()} of the {scr_roman_numerals()[company-1]}co.";
		}
		
		static load_marine = function(ship, star="none"){
			 get_unit_size(); // make sure marines size given it's current equipment is correct
			 var current_location = marine_location();
			 var system = current_location[2];
			 var target_ship_location= obj_ini.ship_location[ship];
			 if (assignment()!="none") then return "on assignment";
			 if (target_ship_location == "home" ){target_ship_location = obj_ini.home_name;}
			
			 if (current_location[0] == location_types.planet){//if marine is on a planet
				  if (current_location[2] == "home" ){system = obj_ini.home_name;}
				 //check if ship is in the same location as marine and has enough space;
				 if (target_ship_location == system) and ((obj_ini.ship_carrying[ship] + size) <= obj_ini.ship_capacity[ship]){
					 planet_location = 0; //mark marine as no longer on planet
					 ship_location = ship; //id of ship marine is now loaded on
					 obj_ini.ship_carrying[ship] += size; //update ship capacity

					if (star=="none"){
					 	star = star_by_name(system);
	 				}
	 				if (star!="none"){
	 					if (star.p_player[current_location[1]]>0) then star.p_player[current_location[1]]-=size;
	 				}
				 }
			 } else if (current_location[0] == location_types.ship){ //with this addition marines can now be moved between ships freely as long as they are in the same system
				 var off_loading_ship = current_location[1];
				 if ( (obj_ini.ship_location[ship] == obj_ini.ship_location[off_loading_ship]) and ((obj_ini.ship_carrying[ship] + size) <= obj_ini.ship_capacity[ship])){
					 obj_ini.ship_carrying[off_loading_ship] -= size; // remove from previous ship capacity
					 ship_location = ship;             // change marine location to new ship
					  obj_ini.ship_carrying[ship] += size;            //add marine capacity to new ship
				 }
			 }
		};

	static unload = function(planet_number, system){
		var current_location = marine_location();
		if (current_location[0]==location_types.ship){
			if (!array_contains(["Warp", "Terra", "Mechanicus Vessel"],obj_ini.ship_location[current_location[1]]) && obj_ini.ship_location[current_location[1]]==system.name){
				obj_ini.loc[company][marine_number]=obj_ini.ship_location[current_location[1]];
				planet_location=planet_number;
				ship_location=0;
				get_unit_size();
				system.p_player[planet_number]+= size;
				obj_ini.ship_carrying[current_location[1]] -= size;
			}
		} else {
			ship_location=0;
			obj_ini.loc[company][marine_number]=system.name;
			planet_location=planet_number;
			system.p_player[planet_number]+= size;
		}
	}

	static allocate_unit_to_fresh_spawn = function(type="default"){
		var homestar = "none";
		var spawn_location_chosen = false;
	 	if ((type="home") or (type="default")) and (obj_ini.fleet_type==1){
	        var homestar =  star_by_name(obj_ini.home_name);
	    } else if (type !="ship"){
	    	var homestar =  star_by_name(type);	    	
	    }
	   /* if (!spawn_location_chosen){

	    }*/
    	if (homestar!="none"){
	        for (i=1;i<=homestar.planets;i++){
	        	if (homestar.p_owner[i]==eFACTION.Player||
	        		(obj_controller.faction_status[eFACTION.Imperium]!="War" && 
	        		array_contains(obj_controller.imperial_factions, homestar.p_owner[i]))){
	        		planet_location = i;
	        		obj_ini.loc[company][marine_number]=obj_ini.home_name;
	        		spawn_location_chosen=true;
	        	}
	        }
    	}	    
		if (!spawn_location_chosen){
			var player_fleet = get_largest_player_fleet();
			if (player_fleet != "none"){
				get_unit_size();
				load_unit_to_fleet(player_fleet,self);
				spawn_location_chosen=true;
			}
		}			
	}


	static is_at_location = function(location, planet, ship){
		var is_at_loc = false;
		if (planet>0){
			if (obj_ini.loc[company][marine_number]==location && planet_location=planet){
				is_at_loc=true;
			}
		} else if (ship>0){
			if (ship_location==ship){
				is_at_loc=true;
			}
		} else if (ship==0 && planet==0){
			if (ship_location>0){
				if (obj_ini.ship_location[ship_location]==location){
					is_at_loc=true;
				}
			} else if  (obj_ini.loc[company][marine_number]==location){
				is_at_loc=true;
			}
		}
		return is_at_loc;
	}
	static roll_exp =function(){
		var spawn_ex = 0;
		if (obj_ini.company_spawn_buffs[company] != 0){
			spawn_ex += floor(gauss(obj_ini.company_spawn_buffs[company][0], obj_ini.company_spawn_buffs[company][1]));	//finds the on game spwan buff a marine should get from being spawned at game start
		}
		if (struct_exists(obj_ini.role_spawn_buffs, role())){ //adds exp buffs based on marine's role
			if (obj_ini.role_spawn_buffs[$ role()] != 0){
				spawn_ex += floor(gauss(obj_ini.role_spawn_buffs[$ role()][0], obj_ini.role_spawn_buffs[$ role()][1]));
			}
		}
		if (spawn_ex != 0){add_exp(spawn_ex)}  //update the marines exp with updated guass value

	};

	static edit_corruption = function (edit){
		corruption = edit > 0 ?min(100, corruption+edit) : max(0, corruption+edit);
	}

	static in_jail = function(){
		return (obj_ini.god[company,marine_number]>=10);
	}

	static forge_point_generation = function(turn_end=false){
		var trained_person = IsSpecialist("forge");
		var crafter = has_trait("crafter");
		if (!(trained_person || crafter)) then return 0;
		var reasons = {}
		var points = 0;
		if (trained_person){
			var points = technology/10;
			reasons.trained = points;
		}
		if (job!="none"){
			if (job.type == "forge"){
				
				if (crafter){
					points*=3;
					reasons.at_forge = "x3 (Crafter)";
				} else {
					points*=2;
					reasons.at_forge = "x2";
				}
				points+=3;
				if (turn_end){
					add_exp(0.25);
				}
			}
		}
		if (crafter){
			points+=3;
			reasons.crafter = 3;
		}
		if (role()=="Forge Master"){
			points+=5;
			reasons.master = 5;
		}
		return [points,reasons];
	}

	static roll_history_armour = function(){
		var old_guard = irandom(100);
		var age = (obj_ini.millenium*1000)+obj_ini.year-4 - (company * 3);
		repeat(10-company){
			age -= (irandom(30));
		}
		var bionic_count = choose(0,0,0,0,1,2,3);
		if (global.chapter_name=="Iron Hands"){
			bionic_count = choose(2,3,4,5);
		}
		switch(role()){
			case obj_ini.role[100][5]:  //captain
				if(old_guard>=80 || company == 1){
					update_armour(choose("MK3 Iron Armour","MK4 Maximus", "MK5 Heresy"),false,false)
					age -= gauss(600, 150);
					add_trait("ancient");
					add_exp(choose(100,75));	
					bionic_count = choose(0,0,1,2,3)
				} else {
					update_armour(choose("MK6 Corvus","MK7 Aquila","MK8 Errant"),false,false);
					age -= gauss(400, 200);
					add_trait("old_guard");
					add_exp(50);
					bionic_count = choose(0,0,0,1,2)
				}
				charisma += (irandom(10));
				wisdom += (irandom(10));
				piety += (irandom(10));
				if (irandom(1)==0){
					add_trait("natural_leader");
				}
				if (array_contains(obj_ini.adv, "Melee Enthusiasts")){
					weapon_skill += irandom(5);
					if (irandom(1)==0){
						add_trait("melee_enthusiast");
					}
				}
				if (array_contains(obj_ini.adv, "Slow and Purposeful")){
					constitution += irandom(5);
					if (irandom(1)==0){
						add_trait("slow_and_purposeful");
					}
				}
				break;
			case  obj_ini.role[100][15]:  //apothecary
				if company > 0 {
					if(old_guard>=80 || company == 1){
						update_armour(choose("MK3 Iron Armour","MK4 Maximus", "MK5 Heresy"),false,false)
						age -= gauss(600, 100);
						add_trait("ancient");
						add_exp(choose(100,75));	
						bionic_count = choose(0,0,1,2,3)
					} else{
						update_armour(choose("MK6 Corvus","MK7 Aquila","MK8 Errant"),false,false);
						age -= gauss(400, 100);
						add_trait("old_guard");
						add_exp(50);
						bionic_count = choose(0,0,0,1,2)
					}
				} else {
					update_armour(choose("MK7 Aquila"),false,false);
					age -= gauss(200, 100);
					add_trait("seasoned");
					add_exp(25);
					bionic_count = choose(0,0,0,0,1)
				}
				if (intelligence<40){
					intelligence=40;
				}
				break;
			case obj_ini.role[100][11]: // Ancient
				if(old_guard>=50 || company == 1){
					update_armour(choose("MK3 Iron Armour","MK4 Maximus", "MK5 Heresy"),false,false)
					age -= gauss(600, 150);
					add_trait("ancient");
					add_exp(choose(100,75));	
					bionic_count = choose(0,0,1,2,3)
				} else{
					update_armour(choose("MK6 Corvus","MK7 Aquila","MK8 Errant"),false,false);
					age -= gauss(400, 200);
					add_trait("old_guard");
					add_exp(50);
					bionic_count = choose(0,0,0,1,2)
				}
				age -= gauss(400, 250);
				break;
			case  obj_ini.role[100][8]:		//tacticals
				if (old_guard=99){
						update_armour("MK3 Iron Armour",false,false)
						age -= gauss(600, 150);
						add_trait("ancient");
						add_exp(choose(100,75,50));	
					} // 1%
					else if (old_guard>=97 and old_guard<=99){
						update_armour("MK4 Maximus",false,false)
						age -= gauss(500, 100);
						add_trait("old_guard");	
						add_exp(choose(75,50));
					} //3%
					else if (old_guard>=91 and old_guard<=96){
						update_armour("MK5 Heresy",false,false);
						age -= gauss(300, 100);
						add_trait("seasoned");
						add_exp(choose(25,50));
					} // 6%
					else if (old_guard>=79 and old_guard<=90){
						update_armour("MK6 Corvus",false,false);
						age -= gauss(250, 25);
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
					age -= gauss(150, 30);
					add_exp(25);
				} // 3% 
				else if (old_guard>=91 and old_guard<=96){
					update_armour("MK3 Iron Armour",false,false);
					age -= gauss(600, 100);
					add_trait(choose("ancient","old_guard"),false,false);
					add_exp(choose(10, 30, 50));
				} // 6% 
				else if (old_guard>=80 and old_guard<=90){
					update_armour("MK4 Maximus",false,false);
					age -= gauss(300, 75);
					add_trait("old_guard")
					add_exp(25);
				} // 12%
				else if (old_guard>=57 and old_guard<=79){
					update_armour("MK5 Heresy",false,false);
					age -= gauss(240, 40);
					add_trait("seasoned")
					add_exp(choose(10,25));
				} // 24%
				else{
					update_armour("MK7 Aquila",false,false);
					age -= gauss(150, 30);
				};
				break;	
			case  obj_ini.role[100][9]: 		//devastators	
				if ((old_guard>=99) and (old_guard<=97)){
					update_armour("MK4 Maximus",false,false);
					age -= gauss(300, 100);
					add_trait(choose("ancient","old_guard"));
					add_exp(choose(25, 50));
				} // 3% for maximus
				else if (old_guard>=78 and old_guard<=96){
					update_armour("MK6 Corvus",false,false);
					age -= gauss(200, 50);
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
					age -= gauss(150, 30);
					add_trait(choose("old_guard"));
					add_exp(choose(50, 75));					
				} else if (old_guard>95){
					update_armour(choose("MK4 Maximus","MK3 Iron Armour"),false,false);
					age -= gauss(300, 100);
					add_trait(choose("old_guard"));
					add_exp(choose(125, 100));
				} else if (old_guard<35){
					update_armour(choose("MK4 Maximus","MK3 Iron Armour"),false,false);
					age -= gauss(150, 30);
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
				if ((global.chapter_name=="Iron Hands" || obj_ini.progenitor=6 || array_contains(obj_ini.dis, "Tech-Heresy"))){
					add_bionics("right_arm","standard",false);
					bionic_count = choose(6,6,7,7,7,8,9);
					add_trait("flesh_is_weak");
					var tech_heresy = irandom(19);
				}else {
			    	bionic_count = irandom(5)+1;
				  if (irandom(2) ==0){
				    add_trait("flesh_is_weak");
				  }
				  var tech_heresy = irandom(49);
			  	}
			  	if (array_contains(obj_ini.dis, "Tech-Heresy")){
			  		var tech_heresy = irandom(10);
			  		technology+=4;
			  	}
			  	if (tech_heresy==0){
			  		add_trait("tech_heretic");
			  		edit_corruption(30);
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
			  if (array_contains(obj_ini.adv, "Crafters")){
			  	if (irandom(2)==0){
			  		add_trait("crafter");
			  	}
			  } else if (obj_ini.progenitor==8 || obj_ini.progenitor==6){
			  	technology+=2;
			  	if (irandom(4)==0){
			  		add_trait("crafter");
			  	}			  	
			  }
			  religion = "cult_mechanicus"	
			  add_exp(irandom(50));
				break;
			case  obj_ini.role[100][12]: //scouts
				bionic_count = choose(0,0,0,0,0,0,0,0,0,0,0,1);
				break;
			case  obj_ini.role[100][14]:  //chaplain
				if company > 0 {
					if(old_guard>=80 || company == 1){
						update_armour(choose("MK3 Iron Armour","MK4 Maximus", "MK5 Heresy"),false,false)
						age -= gauss(600, 100);
						add_trait("ancient");
						add_exp(choose(100,75));	
						bionic_count = choose(0,0,1,2,3)
					} else{
						update_armour(choose("MK6 Corvus","MK7 Aquila","MK8 Errant"),false,false);
						age -= gauss(400, 100);
						add_trait("old_guard");
						add_exp(50);
						bionic_count = choose(0,0,0,1,2)
					}
				} else {
					update_armour(choose("MK7 Aquila"),false,false);
					age -= gauss(200, 100);
					add_trait("seasoned");
					add_exp(25);
					bionic_count = choose(0,0,0,0,1)
				}
				if (piety<35){
					piety=35;
				}
				if(irandom(1) ==0){
					add_trait("zealous_faith")
				}
				break;
			case "Codiciery":
				update_armour(choose("MK5 Heresy","MK6 Corvus","MK7 Aquila", "MK4 Maximus","MK8 Errant"),false,false);
				age -= gauss(150, 20);
				break;
			case "Lexicanum":
				update_armour(choose("MK5 Heresy","MK6 Corvus","MK7 Aquila", "MK4 Maximus","MK8 Errant"),false,false);
				age -= gauss(200, 30);
				add_trait("seasoned");
				break;
			case obj_ini.role[100,17]:
				update_armour(choose("MK5 Heresy","MK6 Corvus","MK7 Aquila", "MK4 Maximus","MK8 Errant"),false,false);
				age -= gauss(400, 250);
				add_trait("seasoned");
				break;	
			case obj_ini.role[100][Role.COMPANY_CHAMPION]:
				if(old_guard>=80 || company == 1){
					update_armour(choose("MK3 Iron Armour","MK4 Maximus", "MK5 Heresy"),false,false)
					age -= gauss(600, 100);
					add_trait("ancient");
					add_exp(choose(100,75));	
					bionic_count = choose(0,0,1,2,3)
				} else{
					update_armour(choose("MK6 Corvus","MK7 Aquila","MK8 Errant"),false,false);
					age -= gauss(400, 100);
					add_trait("old_guard");
					add_exp(50);
					bionic_count = choose(0,0,0,1,2)
				}
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
				add_bionics("none","standard",false);
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

		update_age(floor(age));	
	}

	static set_default_equipment= function(from_armoury=true, to_armoury=true, quality="any"){
		var role_match=-1;
		for (var i=0; i<24;i++){
			if (obj_ini.role[100][i] == role()){
				role_match=i;
				break;
			}
		}
		if (role_match!=-1){
			alter_equipment({
				"wep1":obj_ini.wep1[100][role_match],
				"wep2":obj_ini.wep2[100][role_match],
				"mobi":obj_ini.mobi[100][role_match],
				"armour":obj_ini.armour[100][role_match],
				"gear":obj_ini.gear[100][role_match]
			}, 
			from_armoury,
			to_armoury,
			quality);
		}
	}
	static alter_equipment = function(update_equipment, from_armoury=true, to_armoury=true, quality="any"){
		var equip_areas = struct_get_names(update_equipment);
		for (var i=0;i<array_length(equip_areas);i++){
			switch(equip_areas[i]){
				case "wep1":
					update_weapon_one(update_equipment[$ equip_areas[i]],from_armoury,to_armoury,quality);
					break;
				case "wep2":
					update_weapon_two(update_equipment[$ equip_areas[i]],from_armoury,to_armoury,quality);
					break;
				case "mobi":
					update_mobility_item(update_equipment[$ equip_areas[i]],from_armoury,to_armoury,quality);
					break;
				case "armour":
					update_armour(update_equipment[$ equip_areas[i]],from_armoury,to_armoury,quality);
					break;
				case "gear":
					update_gear(update_equipment[$ equip_areas[i]],from_armoury,to_armoury,quality);
					break;								
			}
		}
	}
	static stat_display = scr_draw_unit_stat_data;
	static draw_unit_image = scr_draw_unit_image;
	static display_wepaons = scr_ui_display_weapons;
	static unit_profile_text = scr_unit_detail_text;
	static unit_equipment_data= function(){
		var armour_data=get_armour_data()
		var gear_data=get_gear_data()
		var mobility_data=get_mobility_data()
		var weapon_one_data=get_weapon_one_data()
		var weapon_two_data=get_weapon_two_data()
		var equip_data = {
				armour_data:armour_data,
				gear_data:gear_data,
				mobility_data:mobility_data,
				weapon_one_data:weapon_one_data,
				weapon_two_data:weapon_two_data
			};
		return equip_data;
	}
	static equipped_artifacts=function(){
		artis = [
			weapon_one(true),
			weapon_two(true),
			gear(true),
			armour(true),
			mobility_item(true),
		];
		var arti_length = array_length(artis);
		for (var i=0;i<arti_length;i++){
			if (is_string(artis[i])){
				array_delete(artis,i,1);
				i--;
				arti_length--;
			}
		}
		return artis;
	}

	static equipped_artifact_tag = function(tag){
		var cur_artis = equipped_artifacts();
		var arti;
		var has_tag = false;
		for(var i=0;i<array_length(cur_artis);i++){
			arti = obj_ini.artifact_struct[cur_artis[i]];
			has_tag = arti.has_tag(tag);
			if (has_tag){
				break;
			}
		}
		return has_tag;
	}

	static movement_after_math = function(end_company=company, end_slot=marine_number){
		if (squad != "none"){
			var squad_data = obj_ini.squads[squad];
			var squad_member;

			for (var r=0;r<array_length(squad_data.members);r++){
				squad_member = squad_data.members[r];
				if (squad_member[0] == company && squad_member[1] == marine_number){
					if (squad_data.base_company != end_company){	
						array_delete(squad_data.members,r,1);
						squad = "none";
					// if unit will no longer be same company as squad remove unit from squad
					} else {
						squad_data.members[r]=[end_company,end_slot];
					}
				}
				
			}
		}

		var arti,artifact_list =  equipped_artifacts();
		for (var i=0; i<array_length(artifact_list);i++){
			arti = obj_ini.artifact_struct[artifact_list[i]];
			arti.bearer = [end_company,end_slot];
		}
	}
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

function fetch_unit(unit){
	return obj_ini.TTRPG[unit[0]][unit[1]];
}


function pen_and_paper_sim() constructor{
	static oppposed_test = function(unit1, unit2, stat,unit1_mod=0,unit2_mod=0,  modifiers={}){
		var stat1 = irandom(99)+1;
		var unit1_val = unit1[$ stat]+unit1_mod;
		var unit2_val = unit2[$ stat]+unit2_mod;
		var stat2 = irandom(99)+1;
		var stat1_pass_margin, stat2_pass_margin, winner, pass_margin;
		//unit 1 passes test 
		if (stat1 < unit1_val){
			stat1_pass_margin = unit1_val- stat1;

			//unit 1 and unit 2 pass tests
			if (stat2<unit2_val){
				stat2_pass_margin =  unit2_val - stat2;

				//unit 2 passes by bigger margin and thus wins
				if (stat2_pass_margin > stat1_pass_margin){
					winner = 2;
					pass_margin = stat2_pass_margin-stat1_pass_margin;
				} else {
					winner = 1;
					pass_margin = stat1_pass_margin-stat2_pass_margin;
				}
			} else {//only unit 1 passes test thus is winner
				winner = 1;
				pass_margin = unit1_val- stat1;
			}
		} else if (stat2<unit2_val){//only unit 2 passes test
			winner = 2;
			pass_margin = unit2_val-stat2;
		} else {
			winner = 0;
			pass_margin = unit1_val- stat1;
		}

		return [winner, pass_margin];
	}

	static standard_test = function(unit, stat, difficulty_mod=0){
		var passed =false;
		var margin=0
		var random_roll = irandom(99)+1;
		if (random_roll<unit[$ stat]+difficulty_mod){
			passed = true;
			margin = unit[$ stat]+difficulty_mod - random_roll;
		} else {
			passed = false;
			margin = unit[$ stat]+difficulty_mod - random_roll;
		}

		return [passed, margin];
	}
}

global.character_tester = new pen_and_paper_sim();


