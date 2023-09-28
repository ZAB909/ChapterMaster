// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_move_unit_info(start_company,end_company, start_slot, end_slot){
		obj_ini.loc[end_company,end_slot]=obj_ini.loc[start_company,start_slot];
		obj_ini.lid[end_company,end_slot]=obj_ini.lid[start_company,start_slot];
		obj_ini.name[end_company,end_slot]=obj_ini.name[start_company,start_slot];
		obj_ini.wep1[end_company,end_slot]=obj_ini.wep1[start_company,start_slot];
		obj_ini.role[end_company,end_slot]=obj_ini.role[start_company,start_slot];
		obj_ini.wid[end_company,end_slot]=obj_ini.wid[start_company,start_slot];
		obj_ini.wep2[end_company,end_slot]=obj_ini.wep2[start_company,start_slot];
		obj_ini.gear[end_company,end_slot]=obj_ini.gear[start_company,start_slot];
		obj_ini.armour[end_company,end_slot]=obj_ini.armour[start_company,start_slot];
		obj_ini.hp[end_company,end_slot]=obj_ini.hp[start_company,start_slot];
		obj_ini.chaos[end_company,end_slot]=obj_ini.chaos[start_company,start_slot];
		obj_ini.god[end_company,end_slot]=obj_ini.god[start_company,start_slot];
		obj_ini.experience[end_company,end_slot]=obj_ini.experience[start_company,start_slot];
		obj_ini.age[end_company,end_slot]=obj_ini.age[start_company,start_slot];
		obj_ini.mobi[end_company,end_slot]=obj_ini.mobi[start_company,start_slot];
		obj_ini.age[end_company,end_slot]=obj_ini.age[start_company,start_slot];
		obj_ini.bio[end_company,end_slot]=obj_ini.bio[start_company,start_slot];
		var temp_struct = jsonify_marine_struct(start_company,start_slot);
		obj_ini.TTRPG[end_company,end_slot] = new TTRPG_stats("chapter", end_company,end_slot ,"blank");
		if (is_string(temp_struct)){
			obj_ini.TTRPG[end_company,end_slot].load_json_data(json_parse(temp_struct));
			obj_ini.TTRPG[end_company,end_slot].company = end_company;
			obj_ini.TTRPG[end_company,end_slot].marine_number = end_slot;
		}		

		obj_ini.loc[start_company,start_slot]="";
		obj_ini.name[start_company,start_slot]="";
		obj_ini.wep1[start_company,start_slot]="";
		obj_ini.lid[start_company,start_slot]=0;
		obj_ini.role[start_company,start_slot]="";
		obj_ini.wid[start_company,start_slot]=0;
		obj_ini.wep2[start_company,start_slot]="";
		obj_ini.armour[start_company,start_slot]="";
		obj_ini.gear[start_company,start_slot]="";
		obj_ini.hp[start_company,start_slot]=0;
		obj_ini.chaos[start_company,start_slot]=0;
		obj_ini.god[start_company,start_slot]=0;
		obj_ini.experience[start_company,start_slot]=0;
		obj_ini.age[start_company,start_slot]=0;
		obj_ini.mobi[start_company,start_slot]="";
		obj_ini.bio[start_company,start_slot]="";
		obj_ini.TTRPG[start_company,start_slot]=new TTRPG_stats("chapter", end_company,end_slot ,"blank");
}