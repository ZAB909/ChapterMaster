// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_unit_detail_text(){
	var unit_data_string = "";
	var is_astartes = false;
	var unit_name = name();
	var body_augmentations = {mutations:[], bionics:[[],[]]}
	if(base_group == "astartes"){
		is_astartes = true;
	}	
	if (squad != "none"){
		var chapter_role = ""
		chapter_role += " of the ";
		if (company > 0){
			chapter_role += scr_convert_company_to_string(company);
		} //else{chapter_role = "Command"}
		chapter_role += string(" {0} {1}", squad, obj_ini.squad_types[$ obj_ini.squads[squad].type][$ "display_name"]) + "#";
		unit_data_string += chapter_role

		if (base_group == "astartes"){
			unit_data_string += $"He is {age()}, first becoming a marine in {marine_ascension}#"
		}

		if (array_contains([obj_ini.role[100][18], obj_ini.role[100][19]], role())){
			unit_data_string +="#";
			if (charisma < 25){
				unit_data_string+= "He is generally disliked by the members of his squad.";
			}else if(charisma >39){
				unit_data_string+= "He is liked grealty by the members of his squad.";
			}
			if (wisdom < 30){
				unit_data_string+= "His squad generally are disatisfied with his tactical decisions";
			} else if ((wisdom < 35) and (wisdom >=30)){
				unit_data_string+= "His squad do not always have a positive veiw his tactical abilities.";
			} else if (wisdom < 45){
				unit_data_string+= "He is considered a good tactician.";
			}
			if (ballistic_skill+weapon_skill>80){
				unit_data_string+= "He is respected by those under his command for his skill at arms.";
			} else if (ballistic_skill+weapon_skill>100){
				unit_data_string+= "He is revered by those under his command and many look to him fo inspiration.";
			} else if(ballistic_skill+weapon_skill<70){
				unit_data_string+= "His men tend to find his skills as a warrior lacking considereing his position";
			}
			else if (wisdom >= 45){
				unit_data_string+= "His military mind has saved his squad many times.";
			}
			unit_data_string +="#";
		}
		} else {unit_data_string+="#"}
		if (religion != "none"){
			unit_data_string += unit_name+string(" is a follower of the {0}",global.religions[$ religion][$ "name"])
			if (religion_sub_cult != "none"){
				unit_data_string += $", in particular a sub cult known as {religion_sub_cult}"
			}
			if ((piety > 25)and (piety <40)){
				unit_data_string += " and is a close follower of the faith"
			}else if(piety <= 25){
				unit_data_string += " however does not put much stock in religion"
			}else if(piety >= 40){
				unit_data_string += " and is zealous in his worship"
			}else if(piety >= 50){
				unit_data_string += " and is fanatical in his worship"
			}
			unit_data_string+="##";
		}
		unit_data_string += $"{unit_name} Has a Imperial Assignment: Positive Psionic Level value of {global.phy_levels[psionic]} ";
		var is_lib = array_contains(["Lexicanum", "Codiciery",obj_ini.role[100,17]], role());
		if (psionic<2){
			unit_data_string += "as such has almost no presence in the warp";
		} else if(psionic<8){
			unit_data_string += "and has a limited presence in the warp causing them to be more prone to attacks from the immaterium";
		} else if(psionic<11){
			unit_data_string += "And is therefore considered a low level psyker with Conscious levels of psionic talent.";
			if (is_astartes){
				if (!is_lib){
					unit_data_string += " He would be eligible for a role in the Librarium however is unlikely to ever exceed the role of Lexicanum";
				}
			}
		}else if(psionic<13){
			unit_data_string += "and has a very high level of mental psychic activity, making them a potent psyker, their presence in the warp is obvious to the daemons of the immaterium"
			if (is_astartes){
				if (!is_lib){
					unit_data_string += " He would be eligible for a role in the Librarium capable of wielding his power to good effect";
				}
			}
		}else if(psionic<15){
			unit_data_string += "Occurring in approximately one-per-billion human births, they are a very potent psyker."
			if (is_astartes){
				if (!is_lib){
					unit_data_string += " He would be eligible for a role in the Librarium And should be enrolled at once in order to train his abilities and stop his untrained mind causing damage to the chapter";
				} else {
					unit_data_string += " His rare talent is of great benefit to the chapter and could one day be a candidate for Chief of the librariam"
				}
			}		       				       			
		} else if(psionic<15){
			unit_data_string += "Exceedingly rare and dangerous but unfathomably powerful."
			if (is_astartes){
				unit_data_string += " Their Talents are both a great boon and huge risk to the chapter."
				if (!is_lib){
					unit_data_string += " He must brought into the guided sphere of the librarium immediately or else dealt with by other methods for the good of the chapter";
				} else {
					unit_data_string += " His rare talent is of great benefit to the chapter and will likely one day be a candidate for Chief of the librariam if he does not succumb to either the material or immaterium"
				}
			}
		}
		unit_data_string += "##"
		if (is_astartes){
			var bionic_count = bionics();
			if (bionic_count ==0){
				unit_data_string+= unit_name + " has no bodily augmentations besides his astartes gene seed and organs #"
			}else if(bionic_count == 1 && array_length(body_augmentations.bionics[0])>0){
				unit_data_string+= unit_name + string(" Has a bionic {0}#", global.body_parts_display[body_augmentations.bionics[0][0]])
			}else if((bionic_count >1) and (bionic_count <=4)){
				unit_data_string+= unit_name + " Has some bionic replacements #"
			}else if((bionic_count >=5) and (bionic_count <8)){
				unit_data_string+= unit_name + " Has many bionic replacements #"
			}else if (bionic_count >8){
				unit_data_string+= unit_name + " Is mostly machine having replaced most of his flesh with bionic replacements."
			}
			if (array_contains(body_augmentations.bionics[1], "throat")){
				unit_data_string+="People tend to find the sound from his augmetic throat unnerving"
			}

			unit_data_string+="#";
			var has_carpace =false;
			if (struct_exists(body[$ "torso"], "black_carpace")){
				if (body[$ "torso"][$"black_carpace"]){
					has_carpace=true;
				}
			}
			if (!has_carpace){
				unit_data_string+="He does not benefit from the full black carpace and therefore cannot equip power armour#"
			}
			var mutation_names = struct_get_names(gene_seed_mutations);
			var pure_seed =true;
			var mutation_string = unit_name + " has an impure gene seed."
		for (var mute =0; mute <array_length(mutation_names); mute++){
			if (gene_seed_mutations[$ mutation_names[mute]] == 1){
				pure_seed = false;
				switch(mutation_names[mute]){
					case "preomnor":
						mutation_string += "He lacks the detoxifying gland called the Preomnor- he is more susceptible to poisons and toxins,";
						break;
					case "lyman":
						mutation_string += "Lacks a working Lyman's ear, And therefore struggles with deep strikes and certain other actions";
						break;
					case "omophagea":
						mutation_string += "suffers from a faulty Omophagea,";
						break;
					case "ossmodula":
						mutation_string += "suffers from a faulty Ossmodula, and takes longer to heal from injuries,";
						break;
					case "zygote":
						mutation_string +="One of his Zygotes is faulty or missing.";
						break;
					case "betchers":
						mutation_string +="He is missing his Betchers Gland and therefore cannot spit acid.";
						break;
					case "catalepsean":
						mutation_string +="He has a faulty Catalepsean Node reducing his awareness when tired.";
						break;
					case "occulobe":
						mutation_string += "He suffers from a faulty occulobe limiting his eyesight enhancements.";
						break;
					case "mucranoid":
						mutation_string += "He suffers from a faulty mucranoid reducing his resistance to extreme heat and cold.";
						break;
					case "membrane":
						mutation_string += "He cannot properly activate his Sus-an Membrane, this limits his ability to survive mortal wounds";
						break;
					case "voice":
						mutation_string += "the marine implantation process caused his voice to warp and now produces a sound that the average member of the Imperium finds unnerving to hear.";
				}
			}
		}
		if (pure_seed){
			unit_data_string += "Has a pure gene seed suffering no mutations";
		} else{
			unit_data_string += mutation_string;
		}
		unit_data_string+="#";
		if (is_astartes){
			if (strength > 49){
				unit_data_string+= unit_name + "s strength greatly exceeds that of the standard astartes allowing him to wield weapons that normally require two hands in one.#"
			} 
			if ((technology >=35) and (technology<45)){
				if(!array_contains(traits, "mars_trained")){
					unit_data_string +="displays a talent with technology that might make him suited to a role within the armentarium.#";
				}
			} else if(technology >= 45){
				unit_data_string +="Is a technological prodigy able to understand and build most anything that takes his interest.#";
			} else if (technology <25){
				unit_data_string +="Is a technological luddite capable of little more than cleaning his own bolter.#";
			} else if (technology <35){
				unit_data_string +="Is capable enough with technical skills to carry out basic tasks in the field.#";
			}
		}
		unit_data_string += "#";
	}
	for (var i=0;i<array_length(traits);i++){
		unit_data_string += string(global.trait_list[$ traits[i]].flavour_text, unit_name);
		if (struct_exists(global.trait_list[$ traits[i]], "effect")){
			unit_data_string += $" ({global.trait_list[$ traits[i]].effect})";
		}
		unit_data_string+="#"
	}
	return unit_data_string
}





