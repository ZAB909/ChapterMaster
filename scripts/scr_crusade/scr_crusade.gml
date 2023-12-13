function scr_crusade() {

	// Executed to kill the fuck out of the player's marines
	// Think it is ran in the obj_p_fleet object when arriving back from crusade

	var co, i, apoth, death_determination, death_determination_2, roll3, type, artifacts, shi, shipp, eff, clean, good, seed, marines_lost, command_lost, unit;
	co=0;i=0;apoth=0;death_determination=0;death_determination_2=0;roll3=0;type="";artifacts=0;shi=0;shipp="";eff=0;clean=0;good=0;seed=0;marines_lost=0;command_lost=0;

	death_determination=floor(random(100))+1;roll3=floor(random(100))+1;
	if (death_determination<=50){type="normal";artifacts=choose(0,0,0,0,0,1);}
	if (death_determination>50){type="hard";artifacts=choose(0,0,1);}
	if (death_determination>80){type="brutal";artifacts=choose(0,1,2);}

	i=-1;
	repeat(11){i+=1;clean[i]=0;}

	i=-1;co=-1;
	repeat(11){
	    co+=1;i=0;
        
    
	    repeat(305){
	        i+=1;// man_c[i]=0;man_i[i]=0;
        
	        /*show_message(string(co)+"."+string(i)+": "+string(obj_ini.name[co][i])+"
	        "+string(co)+"."+string(i+1)+": "+string(obj_ini.name[co,i+1])+"
	        "+string(co)+"."+string(i+2)+": "+string(obj_ini.name[co,i+2])+"
	        "+string(co)+"."+string(i+3)+": "+string(obj_ini.name[co,i+3])+"
	        "+string(co)+"."+string(i+4)+": "+string(obj_ini.name[co,i+4]));*/
        
	        shi=0;good=0;dead=false;
        
	        var command_lost;comand_lost=0;
        
	        repeat(capital_number+frigate_number+escort_number){
	            shi+=1;
            
	            if (shi<=capital_number) and (capital_number>0){shipp="capital";eff=shi;}
	            if (shi>capital_number) and (frigate_number>0){shipp="frigate";eff=shi-capital_number;}
	            if (shi>capital_number+frigate_number) and (escort_number>0){shipp="escort";eff=shi-(capital_number+frigate_number);}
            
	            if (shipp="capital"){if (obj_ini.lid[co][i]=capital_num[eff]) then good=1;}
	            if (shipp="frigate"){if (obj_ini.lid[co][i]=frigate_num[eff]) then good=1;}
	            if (shipp="escort"){if (obj_ini.lid[co][i]=escort_num[eff]) then good=1;}
            
	            if (obj_ini.name[co][i]!="") and (good=1){
	            	unit=obj_ini.TTRPG[co][i];
	                death_determination=floor(random(100))+1;
	                if (unit.has_trait("very_hard_to_kill")) then death_determination-=10;
	                death_determination_2=death_determination;
	                death_determination-=obj_ini.experience[co][i];
	                if (string_count("Slow",obj_ini.strin)>0) then death_determination-=20;
                
	                var dead=false;
	                if (type="normal") and ((death_determination>80) or (death_determination_2>90)) then dead=true;
	                if (type="hard") and ((death_determination>60) or (death_determination_2>80)) then dead=true;
	                if (type="brutal") and ((death_determination>20) or (death_determination_2>65)) then dead=true;
                
	                if (obj_ini.role[co][i]="Standard Bearer") then dead=false;
	                if (obj_ini.role[co][i]="Chapter Master") then dead=false;
                
	                if (dead=true){
	                    var man_size;man_size=0;
	                    man_size=scr_unit_size(obj_ini.armour[co][i],obj_ini.role[co][i],true);
                    
	                    obj_ini.ship_carrying[obj_ini.lid[co][i]]-=man_size;
                    	if (unit.IsSpecialist("standard",true)){
                    		command_lost++;
                    	}
                    
	                    clean[co]=1;
	                    obj_controller.marines-=1;
	                    marines_lost+=1;
	                    scr_kill_unit(co,i);
	                    seed+=2;
	                }
	                if (dead=false) and ((obj_ini.role[co][i]=obj_ini.role[100][15]) or (obj_ini.role[co][i]="Master of the Apothecarion")) and (obj_ini.gear[co][i]="Narthecium") then apoth+=1;
	                if (dead=false){
	                	var new_exp=0;
	                	switch (type){
	                		case "normal":
	                			new_exp=irandom(2)+4;
								break
	                		case "hard":
	                			new_exp=irandom(2)+10;
	                		case "brutal":
	                			new_exp=irandom(5)+15;	                				                			
	                	}
	                	unit.add_exp(new_exp);
                    
	                    if (unit.IsSpecialist("libs")) then unit.update_powers()
	                }
	            }
        
	        }
        
	    }
	}

	obj_controller.marines+=command_lost;
	obj_controller.command-=command_lost;




	if (obj_ini.doomed=0){
	    if (apoth>0){
	        if (type="normal") then seed=min(seed,apoth*40);
	        if (type="hard") then seed=min(seed,apoth*30);
	        if (type="brutal") then seed=min(seed,apoth*20);
	    }
	    if (apoth=0) then seed=floor(seed*0.2);
	    obj_controller.gene_seed+=seed;
	}

	// i=-1;
	// repeat(11){
	    // i+=1;

	if (clean[0]=1) then with(obj_ini){scr_company_order(0);}
	if (clean[1]=1) then with(obj_ini){scr_company_order(1);}
	if (clean[2]=1) then with(obj_ini){scr_company_order(2);}
	if (clean[3]=1) then with(obj_ini){scr_company_order(3);}
	if (clean[4]=1) then with(obj_ini){scr_company_order(4);}
	if (clean[5]=1) then with(obj_ini){scr_company_order(5);}
	if (clean[6]=1) then with(obj_ini){scr_company_order(6);}
	if (clean[7]=1) then with(obj_ini){scr_company_order(7);}
	if (clean[8]=1) then with(obj_ini){scr_company_order(8);}
	if (clean[9]=1) then with(obj_ini){scr_company_order(9);}
	if (clean[10]=1) then with(obj_ini){scr_company_order(10);}

	// }

	if (roll3<=10) then artifacts+=1;
	if (artifacts>0) then repeat(artifacts){
	    if (obj_ini.fleet_type=1) then scr_add_artifact("random","",4,obj_ini.home_name,2);
	    if (obj_ini.fleet_type!=1) then scr_add_artifact("random","",4,obj_ini.ship[1],501);
	}


	var tixt;tixt="Your ships have returned from the Crusade.  ";
	if (type="normal") then tixt+="The combat was as could be expected- ";
	if (type="hard") then tixt+="The combat was fairly grueling- ";
	if (type="brutal") then tixt+="The combat was absolutely brutal- your marines were the first into the fray, and as a result ";

	tixt+=string(marines_lost)+" of your battle brothers fell in combat.";

	if (obj_ini.doomed=0){
	    if (apoth>0) and (seed>0) then tixt+="  The "+string(apoth)+" surviving "+string(obj_ini.role[100][15])+" were able to recover "+string(seed)+" Gene-Seed.";
	    if (apoth=0) and (seed>0) then tixt+="  You had no able-bodied "+string(obj_ini.role[100][15])+", or all of them perished in the Crusade.  Foreign Apothecaries were able to recover "+string(seed)+" of your Gene-Seed.";
	}
	if (obj_ini.doomed=1){
	    tixt+="  Due to fatal mutations in your marines none of the fallen Gene-Seed was recoverable.";
	}

	if (artifacts>0) then tixt+="  "+string(artifacts)+" Artifacts were granted to your Chapter or looted.";
	if (roll3<=10) and (artifacts>1) then tixt+="  One of them were given as a bonus for exceptional valor.";

	scr_popup("Crusade Results",tixt,"crusade","");
	// title / text / image / speshul


}
