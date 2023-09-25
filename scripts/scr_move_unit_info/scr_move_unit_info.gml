// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_move_unit_info(star_company,end_company, start_slot, end_slot){
		obj_ini.loc[end_company,end_slot]=obj_ini.loc[star_company,start_slot];
		obj_ini.name[end_company,end_slot]=obj_ini.name[star_company,start_slot];
		obj_ini.wep1[end_company,end_slot]=obj_ini.wep1[star_company,start_slot];
		obj_ini.role[end_company,end_slot]=obj_ini.role[star_company,start_slot];
		obj_ini.wid[end_company,end_slot]=obj_ini.wid[star_company,start_slot];
		obj_ini.wep2[end_company,end_slot]=obj_ini.wep2[star_company,start_slot];
		obj_ini.gear[end_company,end_slot]=obj_ini.gear[star_company,start_slot];
		obj_ini.armour[end_company,end_slot]=obj_ini.armour[star_company,start_slot];
		obj_ini.hp[end_company,end_slot]=obj_ini.hp[star_company,start_slot];
		obj_ini.chaos[end_company,end_slot]=obj_ini.chaos[star_company,start_slot];
		obj_ini.god[end_company,end_slot]=obj_ini.god[star_company,start_slot];
		obj_ini.experience[end_company,end_slot]=obj_ini.experience[star_company,start_slot];
		obj_ini.age[end_company,end_slot]=obj_ini.age[star_company,start_slot];
		obj_ini.mobi[end_company,end_slot]=obj_ini.mobi[star_company,start_slot];
		obj_ini.age[end_company,end_slot]=obj_ini.age[star_company,start_slot];
		obj_ini.bio[end_company,end_slot]=obj_ini.bio[star_company,start_slot];
		var temp_struct = jsonify_marine_struct(star_company,start_slot);
		obj_ini.TTRPG[end_company,end_slot] = new TTRPG_stats("chapter", end_company,end_slot ,"blank");
		if (is_string(temp_struct)){
			obj_ini.TTRPG[end_company,end_slot].load_json_data(json_parse(temp_struct));
			obj_ini.TTRPG[end_company,end_slot].company = end_company;
			obj_ini.TTRPG[end_company,end_slot].marine = end_slot;
		}		

		obj_ini.loc[star_company,start_slot]="";
		obj_ini.name[star_company,start_slot]="";
		obj_ini.wep1[star_company,start_slot]="";
		obj_ini.lid[star_company,start_slot]=0;
		obj_ini.role[star_company,start_slot]="";
		obj_ini.wid[star_company,start_slot]=0;
		obj_ini.wep2[star_company,start_slot]="";
		obj_ini.armour[star_company,start_slot]="";
		obj_ini.gear[star_company,start_slot]="";
		obj_ini.hp[star_company,start_slot]=0;
		obj_ini.chaos[star_company,start_slot]=0;
		obj_ini.god[star_company,start_slot]=0;
		obj_ini.experience[star_company,start_slot]=0;
		obj_ini.age[star_company,start_slot]=0;
		obj_ini.mobi[star_company,start_slot]="";
		obj_ini.bio[star_company,start_slot]="";
		obj_ini.TTRPG[star_company,start_slot]=new TTRPG_stats("chapter", end_company,end_slot ,"blank");
}