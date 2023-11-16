
function scr_move_unit_info(start_company,end_company, start_slot, end_slot, eval_squad=true){

	//eval_squad : determine whether movement of units between companies should decide to check their squad coherency or not, defaults to true
	
			//this makes sure coherency of the unit's squad and the squads logging of the unit location are kept up to date
		var unit = obj_ini.TTRPG[start_company, start_slot];
		if (eval_squad){
			if (unit.squad != "none"){
				var squad = obj_ini.squads[unit.squad];
				var squad_member;
				if (squad.base_company != end_company){		
					for (var r=0;r<array_length(squad.members);r++){
						squad_member = squad.members[r];
						if (squad_member[0] == start_company) and (squad_member[1] == start_slot){
							array_delete(squad.members,r,1);
							// if unit will no longer be same company as squad remove unit from squad
						}
					}
				}
				unit.squad = "none";
			}
		}
		obj_ini.spe[end_company][end_slot]=obj_ini.spe[start_company][start_slot];	
		obj_ini.race[end_company][end_slot]=obj_ini.race[start_company][start_slot];
		obj_ini.loc[end_company][end_slot]=obj_ini.loc[start_company][start_slot];
		obj_ini.lid[end_company][end_slot]=obj_ini.lid[start_company][start_slot];
		obj_ini.name[end_company][end_slot]=obj_ini.name[start_company][start_slot];
		obj_ini.wep1[end_company][end_slot]=obj_ini.wep1[start_company][start_slot];
		obj_ini.role[end_company][end_slot]=obj_ini.role[start_company][start_slot];
		obj_ini.wid[end_company][end_slot]=obj_ini.wid[start_company][start_slot];
		obj_ini.wep2[end_company][end_slot]=obj_ini.wep2[start_company][start_slot];
		obj_ini.gear[end_company][end_slot]=obj_ini.gear[start_company][start_slot];
		obj_ini.armour[end_company][end_slot]=obj_ini.armour[start_company][start_slot];
		obj_ini.hp[end_company][end_slot]=obj_ini.hp[start_company][start_slot];
		obj_ini.chaos[end_company][end_slot]=obj_ini.chaos[start_company][start_slot];
		obj_ini.god[end_company][end_slot]=obj_ini.god[start_company][start_slot];
		obj_ini.experience[end_company][end_slot]=obj_ini.experience[start_company][start_slot];
		obj_ini.age[end_company][end_slot]=obj_ini.age[start_company][start_slot];
		obj_ini.mobi[end_company][end_slot]=obj_ini.mobi[start_company][start_slot];
		obj_ini.bio[end_company][end_slot]=obj_ini.bio[start_company][start_slot];
		var temp_struct = jsonify_marine_struct(start_company,start_slot);			//jsonified for stransfer of struct (makes a deep copy)
		obj_ini.TTRPG[end_company][end_slot] = new TTRPG_stats("chapter", end_company,end_slot ,"blank"); // create new empty unit structure
		if (is_string(temp_struct)){
			obj_ini.TTRPG[end_company][end_slot].load_json_data(json_parse(temp_struct));				//load in originoal marine data
			obj_ini.TTRPG[end_company][end_slot].company = end_company;
			obj_ini.TTRPG[end_company][end_slot].marine_number = end_slot;
		}	else {
			obj_ini.TTRPG[end_company][end_slot] = new TTRPG_stats("chapter", end_company,end_slot ,"blank");
		}

		obj_ini.spe[start_company][start_slot]="";
		obj_ini.race[start_company][start_slot]=0;
		obj_ini.loc[start_company][start_slot]="";
		obj_ini.name[start_company][start_slot]="";
		obj_ini.wep1[start_company][start_slot]="";
		obj_ini.lid[start_company][start_slot]=0;
		obj_ini.role[start_company][start_slot]="";
		obj_ini.wid[start_company][start_slot]=0;
		obj_ini.wep2[start_company][start_slot]="";
		obj_ini.armour[start_company][start_slot]="";
		obj_ini.gear[start_company][start_slot]="";
		obj_ini.hp[start_company][start_slot]=0;
		obj_ini.chaos[start_company][start_slot]=0;
		obj_ini.god[start_company][start_slot]=0;
		obj_ini.experience[start_company][start_slot]=0;
		obj_ini.age[start_company][start_slot]=0;
		obj_ini.mobi[start_company][start_slot]="";
		obj_ini.bio[start_company][start_slot]="";
		obj_ini.TTRPG[start_company][start_slot]=new TTRPG_stats("chapter", start_company,start_slot ,"blank");
}