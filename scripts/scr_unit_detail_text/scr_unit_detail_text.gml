// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_unit_detail_text(){
	var unit_data_string = "";
	var is_astartes = false;
	var is_superior = array_contains([obj_ini.role[100][18], obj_ini.role[100][19]], role());
	var unit_name = name();
	var body_augmentations = {mutations:[], bionics:[[],[]]}
	var body_bionics = get_body_data("bionic");
	if(base_group == "astartes"){
		is_astartes = true;
	}

	// Squad text
	if (squad != "none"){
		var chapter_role = ""
		chapter_role += is_superior ? $"{unit_name}, sergeant of the" : $"{unit_name}, member of the";
		if (company > 0){
			chapter_role += scr_convert_company_to_string(company, true, true);
		} //else{chapter_role = "Command"}
		chapter_role += string(" {0} {1}.", squad, obj_ini.squads[squad].display_name);
		unit_data_string += chapter_role
	}

		// Age and ascension date
		unit_data_string += "#"
		if (base_group == "astartes"){
			var ascension_date = marine_ascension;
			if ascension_date = "pre_game" then ascension_date = "when the chapter was created";
			unit_data_string += $"{round(age())} years old. Ascended to an Astartes {ascension_date}.";
		}

		// Religion text
		unit_data_string +="##";
		if (religion != "none"){
			unit_data_string += string("Follower of the {0}",global.religions[$ religion][$ "name"])
			if (religion_sub_cult != "none"){
				unit_data_string += $", in particular a sub cult known as {religion_sub_cult}"
			}
			if ((piety > 25)and (piety <40)){
				unit_data_string += " and is a close follower of the faith."
			}else if(piety <= 25){
				unit_data_string += " however does not put much stock in religion."
			}else if(piety >= 40){
				unit_data_string += " and is zealous in his worship."
			}else if(piety >= 50){
				unit_data_string += " and is fanatical in his worship."
			}
			unit_data_string+="#";
		}

		// Psyker text
		unit_data_string += $"Has an Assignment rating of {global.phy_levels[psionic]} ({psionic}) ";
		var is_lib = array_contains(["Lexicanum", "Codiciery",obj_ini.role[100,17]], role());
		if (psionic<2){
			unit_data_string += "and as such has almost no presence in the warp.";
		} else if(psionic<8){
			unit_data_string += "and a limited presence in the warp causing them to be more prone to attacks from the immaterium.";
		} else if(psionic<11){
			unit_data_string += "and therefore is considered to be a low level psyker with conscious levels of psionic talent.";
			if (is_astartes){
				if (!is_lib){
					unit_data_string += "#";
					unit_data_string += "He would be eligible for a role in the Librarium however is unlikely to ever exceed the role of Lexicanum.";
				}
			}
		}else if(psionic<13){
			unit_data_string += "and has a very high level of mental psychic activity, making them a potent psyker, their presence in the warp is obvious to the daemons of the immaterium.";
			if (is_astartes){
				if (!is_lib){
					unit_data_string += "#";
					unit_data_string += " He would be eligible for a role in the Librarium capable of wielding his power to good effect.";
				}
			}
		}else if(psionic<15){
			unit_data_string += ", occurring in approximately one-per-billion human births, they are a very potent psyker.";
			if (is_astartes){
				if (!is_lib){
					unit_data_string += "#";
					unit_data_string += " He would be eligible for a role in the Librarium And should be enrolled at once in order to train his abilities and stop his untrained mind causing damage to the chapter.";
				} else {
					unit_data_string += "#";
					unit_data_string += " His rare talent is of great benefit to the chapter and could one day be a candidate for Chief of the librariam.";
				}
			}		       				       			
		} else if(psionic<15){
			unit_data_string += ", exceedingly rare and dangerous but unfathomably powerful.";
			if (is_astartes){
				unit_data_string += "#"
				unit_data_string += " Their talents are both a great boon and huge risk to the chapter.";
				if (!is_lib){
					unit_data_string += " He must brought into the guided sphere of the librarium immediately or else dealt with by other methods for the good of the chapter.";
				} else {
					unit_data_string += " His rare talent is of great benefit to the chapter and will likely one day be a candidate for Chief of the librariam if he does not succumb to either the material or immaterium.";
				}
			}
		}

		// Bionics text
		unit_data_string += "##"
		if (is_astartes){
			var bionic_positions = struct_get_names(body_bionics);
			var bionic_count = bionics;
			if (bionic_count == 0){
				unit_data_string+= "Has no bodily augmentations besides his astartes gene seed and organs.";
			}else if(bionic_count == 1 && array_length(bionic_positions)>0){
				for (var i=0;i<array_length(global.body_parts);i++){
					if (bionic_positions[0]==global.body_parts[i]){
						unit_data_string+= $"{unit_name} Has a bionic {global.body_parts_display[i]}";
					}
				}
			}else if((bionic_count >1) and (bionic_count <=4)){
				unit_data_string+= "Has some bionic replacements.";
			}else if((bionic_count >=5) and (bionic_count <8)){
				unit_data_string+= "Has many bionic replacements.";
			}else if (bionic_count >8){
				unit_data_string+= "Is mostly a machine, having replaced most of his flesh with bionic replacements.";
			}
			if (array_contains(bionic_positions, "throat")){
				unit_data_string+=" People tend to find the sound from his augmented throat unnerving.";
			}
			// Black carapace text
			var has_carapace;
			if (struct_exists(body[$ "torso"], "black_carapace")){
				if (body[$ "torso"][$"black_carapace"]){
					has_carapace=true;
				}else{
					has_carapace=false;
					unit_data_string+="#";
					unit_data_string+="Doesn't have black carapace installed and therefore can't use power armour to its maximum potential.";
				}
			}
			// Gene-seed text
			unit_data_string+="#";
			var mutation_names = struct_get_names(gene_seed_mutations);
			var mutation_count = 0;
			var mutation_string = "";
			for (var mute =0; mute <array_length(mutation_names); mute++){
				if (gene_seed_mutations[$ mutation_names[mute]] == 1){
					mutation_count += 1;
					mutation_string += " ";
					switch(mutation_names[mute]){
						case "preomnor":
							mutation_string += "He lacks the detoxifying gland called the Preomnor- he is more susceptible to poisons and toxins.";
							break;
						case "lyman":
							mutation_string += "He lacks a working Lyman's ear, And therefore struggles with deep strikes and certain other actions.";
							break;
						case "omophagea":
							mutation_string += "He suffers from a faulty Omophagea.";
							break;
						case "ossmodula":
							mutation_string += "He suffers from a faulty Ossmodula, and takes longer to heal from injuries.";
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
							mutation_string += "He cannot properly activate his Sus-an Membrane, this limits his ability to survive mortal wounds.";
							break;
						case "voice":
							mutation_string += "The marine implantation process caused his voice to warp and now produces a sound that the average member of the Imperium finds unnerving to hear.";
					}
					mutation_string += " ";
				}
			}
		unit_data_string += "His gene-seed ";
		if (mutation_count == 0){
			unit_data_string+= "is pure and has no mutations."
		}else if(mutation_count == 1){
			unit_data_string+= "suffered a mutation.";
		}else if((mutation_count >1) and (mutation_count <=4)){
			unit_data_string+= "suffered some mutations."
		}else if((mutation_count >=5) and (mutation_count <8)){
			unit_data_string+= "mutated considerably."
		}else if (mutation_count >8){
			unit_data_string+= "accumulated a lot of mutations and is hardly recognizable."
		}
		unit_data_string += mutation_string;
		unit_data_string+="##";

		// Sergeant text
		if (is_superior){
			var charisma_string = "";
			var wisdom_string = "";
			unit_data_string += "Marines under his command ";
			// Charisma text
			if (charisma <= 25){
				charisma_string += "dislike him";
			} else if (charisma >= 35){
				charisma_string += "like him";
			} else{
				charisma_string += "are neutral towards him"
			}
			// Wisdom text
			if (wisdom <= 30){
				wisdom_string += "are generally dissatisfied with his tactical decisions.";
			} else if (wisdom <= 35){
				wisdom_string += "do not always have a positive view of his tactical abilities.";
			} else if (wisdom <= 45){
				wisdom_string += "consider him to be a good tactician.";
			} else {
				wisdom_string += "acknowledge that his military mind has saved them many times.";
			}
			var separator = (charisma <= 25 && wisdom <= 35) || (charisma >= 35 && wisdom > 35) ? " and " : " yet ";
			unit_data_string+= string_join(separator, charisma_string, wisdom_string);
			// Combat skills text
			var combat_skill_sum = ballistic_skill + weapon_skill;
			if (combat_skill_sum >= 100){
				unit_data_string += " They are in awe of his combat skills, seeing him as a paragon of martial prowess.";
			} else if (combat_skill_sum >= 80){
				unit_data_string += " They regard him with respect, his battle prowess a testament to his leadership.";
			} else{
				unit_data_string += " They harbor doubts about his combat abilities, having skills seemingly inadequate for his rank.";
			}
			unit_data_string+="#";
		}

		// Strength text
		if (strength >= 50){
			unit_data_string+= "His strength greatly exceeds that of the standard astartes allowing him to wield weapons that normally require two hands in one."
		} 
		// Technology text
		if(!array_contains(traits, "mars_trained")){
			if (technology >= 35){
				unit_data_string +="Displays a talent with technology that might make him suited to a role within the armentarium.";
			} else{
				unit_data_string +="Is a technological luddite capable of little more than cleaning his own bolter.";
			}
		} else{
			if(technology >= 45){
				unit_data_string +="Is a technological prodigy able to understand and build most anything that takes his interest.";
			} else{
				unit_data_string +="Is capable enough with technical skills to carry out basic tasks in the field.";
			}
		}
	}

	// Traits text
	if (array_length(traits) > 0){
		unit_data_string+="##"
		for (var i=0;i<array_length(traits);i++){
			unit_data_string += string(global.trait_list[$ traits[i]].flavour_text + ". ", unit_name);
			if (struct_exists(global.trait_list[$ traits[i]], "effect")){
				unit_data_string += $" ({global.trait_list[$ traits[i]].effect})";
			}
		}
	}
	return unit_data_string
}





