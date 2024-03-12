function disposition_description_chart(dispo){
	if (dispo<10){
		return "Very Hostile";
	} else if (dispo<30){
		return "Hostile";
	}else if (dispo<50){
		return "Uneasy";
	}else if (dispo<60){
		return "Neutral";
	}else if (dispo<70){
		return "Friendly";
	}else if (dispo<80){
		return "Very Freindly";
	}else if (dispo<90){
		return "Excellent";
	}else if (dispo<100){
		return "Unquestionable";
	}
}

function garrison_force(planet_operatives)constructor{
	garrison_squads=[];
	total_garrison = 0;
	garrison_leader=false;
	garrison_force=false;
	 for (var ops=0;ops<array_length(planet_operatives);ops++){
      	if(planet_operatives[ops].type=="squad"){
      		if (planet_operatives[ops].job == "garrison"){//marine garrison on planet
      			if (array_length(obj_ini.squads[planet_operatives[ops].reference].members)>0){
	      			array_push(garrison_squads, obj_ini.squads[planet_operatives[ops].reference])
	      			total_garrison += array_length(obj_ini.squads[planet_operatives[ops].reference].members);
	      			garrison_force=true;
	      		} else {
	      			array_delete(planet_operatives, ops,1);
	      		}
      		}
      	}		 	
	 }

	static find_leader = function(){//find leader of garrison by finding most senior squad leader
		garrison_leader="none";
		var hierarchy = role_hierarchy();
		var leader_hier_pos=array_length(hierarchy);
		var unit;
		for (var squad=0;squad<array_length(garrison_squads);squad++){
			var leader = garrison_squads[squad].determine_leader();
			unit = obj_ini.TTRPG[leader[0]][leader[1]];
			if (garrison_leader=="none"){
				garrison_leader=unit;
				for (var r=0;r<array_length(hierarchy);r++){
					if (hierarchy[r]==unit.role()){
						leader_hier_pos=r;
						break;
					}
				}				
			}else if (hierarchy[leader_hier_pos]==unit.role()){
				if (garrison_leader.experience()<unit.experience()){
					garrison_leader=unit;
				}
			}else{
				for (var r=0;r<leader_hier_pos;r++){
					if (hierarchy[r]==unit.role()){
						leader_hier_pos=r;
						garrison_leader=unit;
						break;
					}
				}
			}
		}
	};

	static exp_rewards =  function(){
		var mem;
		var unit;
		for (var s=0;s<array_length(garrison_squads);s++){
			squad = garrison_squads[s];
			for (mem=0; mem<array_length(squad.members);mem++){
				unit = obj_ini.TTRPG[squad.members[mem][0]][squad.members[mem][1]];
			}
		}
	}

	static garrison_report = function(){
		var system = obj_star_select.target;
		var planet = obj_controller.selecting_planet;
		var report_string = "Hail My lord.##";
		report_string+=$"Report for garrison on {system.name} {scr_roman_numerals()[planet-1]} is as follows#";
		if ((array_length(garrison_squads)) > 1){
			report_string+= $"The garrison is comprised of {array_length(garrison_squads)} squads,"
		} else {report_string+="The garrison is comprised of a single squad,"}

		report_string+= $" with a total man count of {total_garrison}.#"
		if (system.dispo[planet]>-1){
			var disposition = disposition_description_chart(system.dispo[planet]);
			report_string+=$"Our Relationship with the Rulers of the planet is {disposition}";
		} else if( dispo<-1000){
			report_string+=$"Rule of the planet is going well";
		}

		return report_string;
	}

	/* this is probably going to become infinatly complex with many different functions and far more complex inputs
	but for now i'm just trying to set up a concept with some simple examples*/
	static determine_battle = function(attack_defend, win, margin, enemy, location, planet=0, ship=0){
		if (win){

		}else{
			//var squad_positions;
			var leader;
			var mem;
			var unit;
			var effort="failed";
			switch(enemy){
				case eFACTION.Ork://trying to come up with how we might auto evaluate a squads fate in a battle
					for (var s=0;s<array_length(garrison_squads);s++){//loop squads in the garrison
						squad = garrison_squads[s];
						leader = obj_ini.TTRPG[squad.squad_leader[0]][squad.squad_leader[1]];
						/*here we decide if a squad had favourable positioning for the coming battle
						   take a random of their wisdom plus their luck minus how bad the combat loss was
						*/
						squad_position=irandom(leader.wisdom)+leader.luck-margin;//maybe modify this by the overall garrison commander value
						//under 20 unlucky, over 20 standard over 30 good, over 40 great
						if (squad_position<20){
							combat_type = choose(1,2,3);//1= close combat 2=fire fight 3=both
							switch(combat_type){
								case 1:
									for (mem=0; mem<array_length(squad.members);mem++){//see how squad members faired in their circumstances
										unit = obj_ini.TTRPG[squad.members[mem][0]][squad.members[mem][1]];
										if (irandom(unit.weapon_skill)>margin){//if unit "wins" in combat test against weapon skill as this is a cc enagement
											if (irandom(4999)<unit.weapon_skill+unit.luck){//chance unit does something heroic
												//wonder if luck should be renamed to fate ??
												var alligience="imperial";
												switch (choose("still_standing","slay_champion", "hold_breach")){
													//feats and traits are stored seperatly but use very similar mechanics
													//this is because i am not linking feats to indepth mecanics theyre just logs of unit deeps
													//however a unit that collects a couple of slay_champion feats may earn the warlord_slayer trait with built in mechanics
													//think of it as a more story lead skill tree
													//equally a feat does not be stored anywhere you can just makeem up on the fly where as a trait has to be stored in teh global trait list
													//this may all be subject to change but in my head it's coming together
													case "hold_breach":
														unit.add_feat({
															ident:"hold_breach",
															planet:planet,
															location:"location",
															text : $"Single Handedly held a breach in the {alligience} during the {effort} {attack_defend} of {location} {scr_roman_numeral[planet-1]} from the Orks"
														})
												}
											}
										} else {//unit "looses combat"
											var toughness_check = irandom(99)-(floor(unit.constitution)/8);//we can build some static test functions for these sorts of things
											//now we need some sort of toughness to chart to check against
											//then take a roll against a seperate injury chart or some such thing
											//roll against piett??? chance or a miracle ??
										}
									}
									break;
							}
						}
					}
					scr_popup("Garrison Report", "Garrison forces on......", "imperial", "");
					break;
			}
		}
	}
}