function scr_crusade() {

	// Executed to kill the fuck out of the player's marines
	// Think it is ran in the obj_p_fleet object when arriving back from crusade

	var co, i, apoth, roll1, roll2, roll3, type, artifacts, shi, shipp, eff, clean, good, seed, marines_lost, command_lost;
	co=0;i=0;apoth=0;roll1=0;roll2=0;roll3=0;type="";artifacts=0;shi=0;shipp="";eff=0;clean=0;good=0;seed=0;marines_lost=0;command_lost=0;

	roll1=floor(random(100))+1;roll3=floor(random(100))+1;
	if (roll1<=50){type="normal";artifacts=choose(0,0,0,0,0,1);}
	if (roll1>50){type="hard";artifacts=choose(0,0,1);}
	if (roll1>80){type="brutal";artifacts=choose(0,1,2);}

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
	                roll1=floor(random(100))+1;roll2=roll1;roll1-=obj_ini.experience[co][i];
	                if (string_count("Slow",obj_ini.strin)>0) then roll1-=20;
                
	                var dead;dead=false;
	                if (type="normal") and ((roll1>80) or (roll2>90)) then dead=true;
	                if (type="hard") and ((roll1>60) or (roll2>80)) then dead=true;
	                if (type="brutal") and ((roll1>20) or (roll2>65)) then dead=true;
                
	                if (obj_ini.role[co][i]="Standard Bearer") then dead=false;
	                if (obj_ini.role[co][i]="Chapter Master") then dead=false;
                
	                if (dead=true){
	                    var man_size;man_size=0;
	                    man_size=scr_unit_size(obj_ini.armour[co][i],obj_ini.role[co][i],true);
                    
	                    /*
                    
	                    // if (obj_ini.armour[co][i]="Terminator Armour") then man_size+=1;
	                    if (obj_ini.armour[co][i]="Tartaros") then man_size+=1;
	                    if (string_count("Terminator",obj_ini.armour[co][i])>0) then man_size+=1;
	                    if (string_count("Dread",obj_ini.armour[co][i])>0) then man_size+=7;
	                    // if (obj_ini.mobi[co][i]="Jump Pack") then man_size+=1;
	                    if (obj_ini.role[co][i]="Chapter Master") then man_size+=1;*/
	                    obj_ini.ship_carrying[obj_ini.lid[co][i]]-=man_size;
                    
	                    if (obj_ini.role[co][i]="Chapter Master") then command_lost+=1;
	                    if (obj_ini.role[co][i]="Master of Sanctity") then command_lost+=1;
	                    if (obj_ini.role[co][i]="Master of the Apothecarion") then command_lost+=1;
	                    if (obj_ini.role[co][i]="Chief "+string(obj_ini.role[100,17])) then command_lost+=1;
	                    if (obj_ini.role[co][i]="Forge Master") then command_lost+=1;
	                    if (obj_ini.role[co][i]=obj_ini.role[100,17]) then command_lost+=1;
	                    if (obj_ini.role[co][i]=obj_ini.role[100][14]) then command_lost+=1;
	                    if (obj_ini.role[co][i]=obj_ini.role[100][15]) then command_lost+=1;
	                    if (obj_ini.role[co][i]=obj_ini.role[100][16]) then command_lost+=1;
	                    if (obj_ini.role[co][i]=obj_ini.role[100][6]) then command_lost+=1;
	                    if (obj_ini.role[co][i]=obj_ini.role[100][5]) then command_lost+=1;
	                    if (obj_ini.role[co][i]="Codiciery") then command_lost+=1;
	                    if (obj_ini.role[co][i]="Lexicanum") then command_lost+=1;
	                    if (obj_ini.role[co][i]=string(obj_ini.role[100,17])+" Aspirant") then command_lost+=1;
	                    if (obj_ini.role[co][i]=string(obj_ini.role[100][14])+" Aspirant") then command_lost+=1;
	                    if (obj_ini.role[co][i]=string(obj_ini.role[100][15])+" Aspirant") then command_lost+=1;
	                    if (obj_ini.role[co][i]=string(obj_ini.role[100][16])+" Aspirant") then command_lost+=1;
	                    if (obj_ini.role[co][i]="Venerable "+string(obj_ini.role[100][6])) then command_lost+=1;
                    
	                    clean[co]=1;obj_controller.marines-=1;marines_lost+=1;
	                    obj_ini.race[co][i]=1;obj_ini.loc[co][i]="";obj_ini.name[co][i]="";obj_ini.role[co][i]="";
	                    obj_ini.wep1[co][i]="";obj_ini.lid[co][i]=0;obj_ini.wid[co][i]=0;obj_ini.wep2[co][i]="";
	                    obj_ini.armour[co][i]="";obj_ini.gear[co][i]="";obj_ini.mobi[co][i]="";obj_ini.hp[co][i]=0;
	                    obj_ini.chaos[co][i]=0;obj_ini.experience[co][i]=0;obj_ini.age[co][i]=0;
	                    seed+=2;
	                }
	                if (dead=false) and ((obj_ini.role[co][i]=obj_ini.role[100][15]) or (obj_ini.role[co][i]="Master of the Apothecarion")) and (obj_ini.gear[co][i]="Narthecium") then apoth+=1;
	                if (dead=false){
	                    if (type="normal") then obj_ini.experience[co][i]+=floor(random(2))+4;
	                    if (type="hard") then obj_ini.experience[co][i]+=floor(random(2))+10;
	                    if (type="brutal") then obj_ini.experience[co][i]+=floor(random(5))+15;
                    
	                    if (obj_ini.role[co][i]=obj_ini.role[100,17]) then scr_powers_new(co,i);
	                    if (obj_ini.role[co][i]="Codiciery") then scr_powers_new(co,i);
	                    if (obj_ini.role[co][i]="Lexicanum") then scr_powers_new(co,i);
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
