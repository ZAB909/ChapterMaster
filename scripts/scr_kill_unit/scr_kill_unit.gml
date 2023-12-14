// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_kill_unit(company, unit_slot){
	obj_ini.spe[company,unit_slot]="";
	obj_ini.race[company,unit_slot]=0;
	obj_ini.loc[company,unit_slot]="";
	obj_ini.name[company,unit_slot]="";
	obj_ini.wep1[company,unit_slot]="";
	obj_ini.lid[company,unit_slot]=0;
	obj_ini.role[company,unit_slot]="";
	obj_ini.wid[company,unit_slot]=0;
	obj_ini.wep2[company,unit_slot]="";
	obj_ini.armour[company,unit_slot]="";
	obj_ini.gear[company,unit_slot]="";
	obj_ini.hp[company,unit_slot]=0;
	obj_ini.chaos[company,unit_slot]=0;
	obj_ini.god[company,unit_slot]=0;
	obj_ini.experience[company,unit_slot]=0;
	obj_ini.age[company,unit_slot]=0;
	obj_ini.mobi[company,unit_slot]="";
	obj_ini.bio[company,unit_slot]="";
	obj_ini.TTRPG[company,unit_slot]=new TTRPG_stats("chapter", company,unit_slot ,"blank");
}