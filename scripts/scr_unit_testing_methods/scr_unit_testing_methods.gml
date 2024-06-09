


static TestUnitAgainstRequirements = function(requirements, unit){
	viable = true;
	if (struct_exists(requirements,"group")){
		viable = unit.IsSpecialist(requirements.group);
	}
	if (viable){
		viable = TestObstaclesUnitTruthsWeapons(unit, requirements, true, viable);
	}
	if (viable){
		viable = TestObstaclesUnitTruthsItem(unit, requirements, true, viable);
	}
	if (viable){
		viable = TestObstaclesUnitTraits(unit, requirements, true, viable);
	}	
	return viable;
}

// handles all tests to see mods or if unit needs to have a particular weapon equipped
static TestObstaclesUnitTruthsWeapons = function(unit, modifiers, require_test, test_mod){
	if (struct_exists(modifiers,"weapon")){
		var weapon_mods = modifiers.weapon;
		if (struct_exists(weapon_mods, "tag")){
			test_mod = TestObstacleTags(unit, weapon_mods.tag, ["weapon_one_data", "weapon_two_data"],require_test, test_mod)
		}
		if (struct_exists(weapon_mods, "name")){
			test_mod = TestObstacleName(unit, weapon_mods.name,require_test, test_mod)
		}
	}

	return test_mod;
}

static TestObstaclesUnitTraits = function(unit, modifiers, require_test, test_mod){
	if (struct_exists(modifiers,"traits")){
		var trait_mods = modifiers.traits;
		for (var i=0;i<array_length(trait_mods);i++){
			var saught_trait = trait_mods[i];
			if (unit.has_trait(saught_trait.name)){
				if (!require_test){
					array_push(test_mod, saught_trait);							
				}
			}else if(require_test){
				return false;
			}
		}
	}
	if (require_test){
		return true;
	} else {
		return test_mod;
	}
}

static TestObstaclesUnitTruthsItem = function(unit, modifiers, require_test, test_mod){
	if (struct_exists(modifiers,"equipment")){
		var equip_mods = test.modifiers.equipment
		if (struct_exists(equip_mods, "tag")){
			test_mod = TestObstacleTags(unit, equip_mods.tag, ,require_test, test_mod);				
		}
		if (struct_exists(equip_mods, "name")){
			test_mod = TestObstacleName(unit, equip_mods.name,require_test, test_mod);					
		}					
	}
	return test_mod;		
}

static TestObstacleTags = function(unit, tag_set, areas=["armour_data", "gear_data", "mobility_data", "weapon_one_data", "weapon_two_data"], require_test, test_mod){
	for (var i = 0;i<array_length(tag_set)i++){
		var saught_tag = tag_set[i];
		if (unit.has_equipped_tag(saught_tag.name,areas)){
			if (!require_test){
				array_push(test_mod, saught_tag);							
			}
		} else if(require_test){
			return false;
		}
	}
	if (require_test){
		return true;
	} else {
		return test_mod;
	}		
}


static TestObstacleName = function(unit, name_set,require_test, test_mod){
	for (var i = 0;i<array_length(name_set)i++){
		saught_name = name_set[i];
		if (unit.has_equipped(saught_tag.name)){
			if (!require_test){
				array_push(test_mod, saught_name);							
			}
		}else if(require_test){
			return false;
		}
	}
	if (require_test){
		return true;
	} else {
		return test_mod;
	}	
}


static TestUnitModifiers = function(modifiers, unit, test_mod){
	test_mod = TestObstaclesUnitTruthsWeapons(modifiers, unit, false, test_mod);
	test_mod = TestObstaclesUnitTruthsItem(modifiers, unit, false, test_mod);
}


function stat_valuator(search_params, unit){
	match = true;
	for (var stat = 0;stat<array_length(search_params);stat++){
		if (search_params[stat][2] =="more"){
			if (unit[$ search_params[stat][0]] < search_params[stat][1]){
				match = false;
				break;
			}
		} else if(search_params[stat][2] =="less"){
				if (unit[$ search_params[stat][0]] > search_params[stat][1]){
				match = false;
				break;
			}           					
		}
	}
	return match;	
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

