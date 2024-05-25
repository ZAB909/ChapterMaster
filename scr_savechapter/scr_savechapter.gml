// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function savechapter(){
	//saves a player made chapter into an ini file for use later
	chaptersave  = "chaptersave#1.ini"
	if(file_exists(chaptersave)){
	file_delete(chaptersave);
	}
	    ini_open(chaptersave);

	    // Global variables
		ini_write_string("Save","chapter_id",chapter)
	    ini_write_string("Save","chapter_name",chapter);
		ini_write_real("Save","icon#",icon);
	    ini_write_string("Save","icon_name",icon_name);
	    ini_write_real("Save","strength",strength);
	    ini_write_real("Save","purity",purity);
	    ini_write_real("Save","stability",stability);
		ini_write_real("Save","cooperation",cooperation);
		ini_write_real("Save","founding",founding);
		
		ini_write_real("Save","fleet_type",fleet_type);
		ini_write_string("Save","homeworld",homeworld);
		ini_write_string("Save","homeworld_name",homeworld_name);
		ini_write_string("Save","recruiting",recruiting);
		ini_write_string("Save","recruiting_name",recruiting_name);
		ini_write_real("Save","home_worldexists",homeworld_exists);
		ini_write_real("Save","recruiting_exists",recruiting_exists);
		ini_write_real("Save","home_world_rule",homeworld_rule);
		ini_write_string("Save","aspirant_trial",aspirant_trial);
		ini_write_string("Save","discipline",discipline);
		
		ini_write_string("Controller","main_color",col[main_color]);
	    ini_write_string("Controller","secondary_color",col[secondary_color]);
	    ini_write_string("Controller","trim_color",col[trim_color]);
	    ini_write_string("Controller","pauldron2_color",col[pauldron2_color]);
	    ini_write_string("Controller","pauldron_color",col[pauldron_color])
	    ini_write_string("Controller","lens_color",col[lens_color]);
	    ini_write_string("Controller","weapon_color",col[weapon_color]);
	    ini_write_real("Controller","col_special",col_special);
	    ini_write_real("Controller","trimmed",trim);
		ini_write_real("Controller","equal_specialists",equal_specialists)
		
	
	
	
		ini_write_real("Creation","preomnor",preomnor);
	    ini_write_real("Creation","voice",voice);
	    ini_write_real("Creation","doomed",doomed);
	    ini_write_real("Creation","lyman",lyman);
	    ini_write_real("Creation","omophagea",omophagea);
	    ini_write_real("Creation","ossmodula",ossmodula);
	    ini_write_real("Creation","membrane",membrane);
	    ini_write_real("Creation","zygote",zygote);
	    ini_write_real("Creation","betchers",betchers);
	    ini_write_real("Creation","catalepsean",catalepsean);
	    ini_write_real("Creation","secretions",secretions);
	    ini_write_real("Creation","occulobe",occulobe);
	    ini_write_real("Creation","mucranoid",mucranoid)
		ini_write_string("Creation","battle_cry",battle_cry);
		
		ini_write_string("Creation","recruiter_name",recruiter);
		ini_write_string("Creation","mutation",mutations);
		ini_write_string("Creation","mutations_selected",mutations_selected);
	    ini_write_real("Creation","successors",successors);
	    ini_write_real("Creation","progenitor_disposition",disposition[1]);
	    ini_write_real("Creation","imperium_disposition",disposition[2]);
	    ini_write_real("Creation","admech_disposition",disposition[3]);
		ini_write_real("Creation","astartes_disposition",disposition[6]);
		ini_write_real("Creation","inquisition_disposition",disposition[4]);
		ini_write_real("Creation","ecclesiarchy_disposition",disposition[5]);
		ini_write_real("Creation","reserved_disposition",disposition[7]);
		
		
		
	    ini_write_string("Creation","chief_name",clibrarian);
	    ini_write_string("Creation","high_name",hchaplain);
	    ini_write_string("Creation","high2_name",hapothecary);
	    ini_write_string("Creation","forgey_name",fmaster);
	    ini_write_string("Creation","lord_name",admiral);
		ini_write_string("Creation","master_name",chapter_master_name);
		ini_write_real("Creation","chapter_master_melee",chapter_master_melee);
		ini_write_string("Creation","master_ranged",chapter_master_ranged);
		ini_write_string("Creation","master_specialty",chapter_master_specialty);
		for(var i =1;i<=4;i++){
			ini_write_string("Creation","adv21"+string(i),adv[i])
			ini_write_string("Creation","dis21"+string(i),dis[i])
		}
		
		for(var i=0;i<=22;i++){
    ini_write_string("Save","role_21"+string(i),role[100][i]);
	ini_write_string("Save","wep1_21"+string(i),wep1[100][i]);
	ini_write_string("Save","wep2_21"+string(i),wep2[100][i])
	ini_write_string("Save","armour_21"+string(i),armour[100][i]);
	ini_write_string("Save","gear_21"+string(i),gear[100][i]);
	ini_write_string("Save","mobi_21"+string(i),mobi[100][i]);
}
		
		
		

		
		
load_to_ships=[2,0,0];
founding21 = founding;
chapter21=chapter;
chapter_id[21] = chapter21; 					

 icon21=icon;
 icon_name21=icon_name;
 fleet_type21=fleet_type;
 strength21=strength;
 purity21=purity;
 stability21=stability;
 cooperation21=cooperation;
 homeworld21=homeworld;
 homeworld_name21=homeworld_name;
 recruiting_world21=recruiting;
 recruiting_name21=recruiting_name;
 homeworld_exists21=homeworld_exists;
 recruiting_exists21=recruiting_exists;
 homeworld_rule21=homeworld_rule;
 aspirant_trial21=aspirant_trial;
 discipline21=discipline;

	    // Pauldron2: Left, Pauldron: Right
		 color_to_main21=col[main_color];
	    
	    
	    
	    
	    
	
	   
		 color_to_secondary21=    col[secondary_color]
		 color_to_trim21=col[trim_color];
	     color_to_pauldron21=col[pauldron_color];
		 color_to_pauldron2_21=col[pauldron2_color];
		 color_to_lens21=col[lens_color];
	     color_to_weapon21=col[weapon_color];
		 col_special21=col_special;
		 trim21=trim;
	     hapothecary21=hapothecary;
	     hchaplain21=hchaplain;
	     clibrarian21=clibrarian;
	     fmaster21=fmaster;
	     admiral21=admiral;
		recruiter21=recruiter;
	     battle_cry_21=battle_cry;
		 //monastery_name21=monastery_name;
		 //master_name21=master_name;
	     equal_specialists21=equal_specialists
    
	     
	    // load_to_ships=0;
    
	     successors21=successors;
	     mutations21=mutations;
		 mutations_selected21=mutations_selected;
	     preomnor21=preomnor;
		 voice21=voice;
		 doomed21=doomed;
		 lyman21=lyman;
		 omophagea21=omophagea;
		 ossmodula21=ossmodula;
		 membrane21=membrane;
	     zygote21=zygote;
		 betchers21=betchers;
		 catalepsean21=catalepsean;
		 secretions21=secretions;
		 occulobe21=occulobe;
		 mucranoid21=mucranoid;
	     disposition21[1]=disposition[1];// Prog
	     disposition21[2]=disposition[2];
		 disposition21[3]=disposition[3];
		 disposition21[4]=disposition[4];
		 disposition21[5]=disposition[5];
	     disposition21[6]=disposition[6];// Astartes
	     disposition21[7]=disposition[7];// Reserved
	     chapter_master_name21=chapter_master_name;
		 chapter_master_melee21=chapter_master_melee;
	     chapter_master_ranged21=chapter_master_ranged;
		 chapter_master_specialty21= chapter_master_specialty;
    
	     adv21[1]=adv[1];
	     adv21[2]=adv[2];
	     adv21[3]=adv[3];
	     adv21[4]=adv[4];
		
		 dis21[1]=dis[1];
	     dis21[2]=dis[2];
	     dis21[3]=dis[3];
	     dis21[4]=dis[4];
	
	  for (var i=0;i<=22;i++){
    role_21[i]=role[100][i];
	wep1_21[i]=wep1[100][i]
	wep2_21[i]=wep2[100][i]
	armour_21[i]=armour[100][i]
	gear_21[i]=gear[100][i]
	mobi_21[i]=mobi[100][i]
}
	
	/*for(var i=100;i<116;i++){
	race_21[i,2]=1;
    role_21[i]=role[i,2]
    wep1_21[i]=wep1[i,2];
    wep2_21[i]=wep2[i,2];
    armour_21[i]=armour[i,2]
	gear_21[i]=gear[i,2]
	mobi_21[i]=mobi[i,2]
	
	race_21[i]=1;
    role_21[i]=role[i,3]
    wep1_21[i]=wep1[i,3];
    wep2_21[i]=wep2[i,3];
    armour_21[i]=armour[i,3]
	gear_21[i]=gear[i,3]
	mobi_21[i]=mobi[i,3]
	
	race_21[i]=1;
    role_21[i]=role[i,4]
    wep1_21[i]=wep1[i,4];
    wep2_21[i]=wep2[i,4];
    armour_21[i]=armour[i,4]
	gear_21[i]=gear[i,4]
	mobi_21[i]=mobi[i,4]
	
	race_21[i]=1;
    role_21[i]=role[i,5]
    wep1_21[i]=wep1[i,5];
    wep2_21[i]=wep2[i,5];
    armour_21[i]=armour[i,5]
	gear_21[i]=gear[i,5]
	mobi_21[i]=mobi[i,5]
	
	race_21[i]=1;
    role_21[i]=role[i,6]
    wep1_21[i]=wep1[i,6];
    wep2_21[i]=wep2[i,6];
    armour_21[i]=armour[i,6]
	gear_21[i]=gear[i,6]
	mobi_21[i]=mobi[i,6]
	
	race_21[i]=1;
    role_21[i]=role[i,7]
    wep1_21[i]=wep1[i,7];
    wep2_21[i]=wep2[i,7];
    armour_21[i]=armour[i,7]
	gear_21[i]=gear[i,7]
	mobi_21[i]=mobi[i,7]
	
	race_21[i]=1;
    role_21[i]=role[i,8]
    wep1_21[i]=wep1[i,8];
    wep2_21[i]=wep2[i,8];
    armour_21[i]=armour[i,8]
	gear_21[i]=gear[i,8]
	mobi_21[i]=mobi[i,8]
	
	race_21[i]=1;
    role_21[i]=role[i,9]
    wep1_21[i]=wep1[i,9];
    wep2_21[i]=wep2[i,9];
    armour_21[i]=armour[i,9]
	gear_21[i]=gear[i,9]
	mobi_21[i]=mobi[i,9]
	
	race_21[i]=1;
    role_21[i]=role[i,10]
    wep1_21[i]=wep1[i,10];
    wep2_21[i]=wep2[i,10];
    armour_21[i]=armour[i,10]
	gear_21[i]=gear[i,10]
	mobi_21[i]=mobi[i,10]
	
	race_21[i]=1;
    role_21[i]=role[i,12]
    wep1_21[i]=wep1[i,12];
    wep2_21[i]=wep2[i,12];
    armour_21[i]=armour[i,12]
	gear_21[i]=gear[i,12]
	mobi_21[i]=mobi[i,12]
	
	race_21[i]=1;
    role_21[i]=role[i,14]
    wep1_21[i]=wep1[i,14];
    wep2_21[i]=wep2[i,14];
    armour_21[i]=armour[i,14]
	gear_21[i]=gear[i,14]
	mobi_21[i]=mobi[i,14]
	
	race_21[i]=1;
    role_21[i]=role[i,15]
    wep1_21[i]=wep1[i,15];
    wep2_21[i]=wep2[i,15];
    armour_21[i]=armour[i,15]
	gear_21[i]=gear[i,15]
	mobi_21[i]=mobi[i,15]
	
	race_21[i]=1;
    role_21[i]=role[i,16]
    wep1_21[i]=wep1[i,16];
    wep2_21[i]=wep2[i,16];
    armour_21[i]=armour[i,16]
	gear_21[i]=gear[i,16]
	mobi_21[i]=mobi[i,16]
	
	race_21[i]=1;
    role_21[i]=role[i,17]
    wep1_21[i]=wep1[i,17];
    wep2_21[i]=wep2[i,17];
    armour_21[i]=armour[i,17]
	gear_21[i]=gear[i,17]
	mobi_21[i]=mobi[i,17]
	
	race_21[i]=1;
    role_21[i]=role[i,18]
    wep1_21[i]=wep1[i,18];
    wep2_21[i]=wep2[i,18];
    armour_21[i]=armour[i,18]
	gear_21[i]=gear[i,18]
	mobi_21[i]=mobi[i,18]
	
	race_21[i]=1;
    role_21[i]=role[i,19]
    wep1_21[i]=wep1[i,19];
    wep2_21[i]=wep2[i,19];
    armour_21[i]=armour[i,19]
	gear_21[i]=gear[i,19]
	mobi_21[i]=mobi[i,19]
	}*/
   
   
   
		ini_close(); 
		 

}
