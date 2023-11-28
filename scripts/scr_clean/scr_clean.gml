function scr_clean(argument0) {

	/*
	    You thought the fucking targeting script was whack?  Welcome to
	    Chapter-Master-Behind-the-Scenes-late-night-edition, where anything
	    magical can and will happen.
    
	    I never expected this script to work.  It's a miracle that it does.
	    If you somehow manage to decipher what this does, or god-forbid,
	    somehow clean it up, you probably do this for a living.
    
	    Converts enemy scr_shoot damage into player marine casualties.
	*/


	if (obj_ncombat.wall_destroyed=1) then exit;

	// show_message("clean up clean up everybody clean up");

	var arg1;
	var onceh;onceh=0;
	arg1=argument0;
	var old_hs,shotted;
	old_hs=hostile_shots;
	shotted=hostile_shots;




	if (hostile_men=0) and (veh>0){// show_message("A");
	    var units_lost,going_up,you;
	    units_lost=0;going_up=0;you=1;
    
	    var p1,p2,p3,p4,p5;
	    p1="";p2="";p3="";p4="";p5="";
    
	    var important,u,hh,stahp;u=-1;hh=0;stahp=0;
	    repeat(50){u+=1;if (u<=20) then important[u]="";lost[u]="";lost_num[u]=0;}
    
    
	    repeat(hostile_shots){stahp=0;
	        if (veh>0) then you=floor(random(veh))+1;// Need a max_men / max_veh    for the amount of them initialized
	        repeat(400){// This gets a different mahreen if it is not valid
	            if (veh_hp[you]<0){
	                if (you=1) then going_up=1;
	                if (going_up=0) and (you>0) you-=1;
	                if (going_up=1) then you+=1;
	                if (going_up=1) and (you=950) then going_up=0;
	            }
	        }
	        if (veh_hp[you]<0) and (veh_dead[you]=1) then stahp=1;
        
	        if (stahp=0){
	            var minus;
	            minus=hostile_damage;shotted-=1;
	            minus-=veh_ac[you];if (minus<0) then minus=0.25;
	            if (enemy=13) and (minus<1) then minus=1;
	            veh_hp[you]-=minus;
	            if (veh_hp[you]<=0) and (veh_dead[you]=0){
            
	                var h,good,open;h=0;good=0;open=0;
	                repeat(30){// Need to find the open slot
	                    h+=1;
	                    if (veh_type[you]=lost[hh]) and (good=0){lost_num[hh]+=1;good=1;}// If one unit is all the same, and get smashed, this should speed up the repeats
	                    if (veh_type[you]=lost[h]) and (good=0){lost_num[h]+=1;good=1;hh=h;}
	                    if (lost[h]="") and (open=0) then open=h;// Find the first open
	                }
	                if (good=0) and (open!=0){lost_num[open]=1;lost[open]=veh_type[you];}
	                units_lost+=1;
	                veh-=1;obj_ncombat.player_forces-=1;
	                veh_dead[you]=1;// show_message("Veh dead");
	            }
	        }
	    }
    
    
	    if (dreads>0){
	        hostile_shots=shotted;
	        old_hs=shotted;
	        hostile_men=5;
	    }
    
	    if (old_hs>0) and (hostile_men!=5){
	        hostile_shots=old_hs;
	        scr_flavor2(units_lost,"");
	    }
	}



	if (hostile_men=0) and (shotted>0) and (dreads>0) then hostile_men=5;



	if ((hostile_men=1) or (hostile_men=5)) and (men+dreads>0){// show_message("B");
	    var units_lost,going_up,you;
	    units_lost=0;going_up=0;you=1;
    
	    var p1,p2,p3,p4,p5;
	    p1="";p2="";p3="";p4="";p5="";
    
	    var important,u,hh,stahp;u=-1;hh=0;stahp=0;
	    repeat(50){u+=1;if (u<=15) then important[u]="";lost[u]="";lost_num[u]=0;}
    
    
	    repeat(hostile_shots){
	        if (men>0) then you=floor(random(men))+1;// Need a max_men / max_veh    for the amount of them initialized
	        repeat(700){// This gets a different mahreen if it is not valid
	            // if (marine_armour[you]="Dreadnought") or (marine_hp[you]<0){
	            if (marine_hp[you]<0){
	                if (you=1) then going_up=1;
	                if (going_up=0) and (you>0) you-=1;
	                if (going_up=1) then you+=1;
	                if (going_up=1) and (you=950) then going_up=0;
	            }
	        }
	        // if (marine_armour[you]="Dreadnought") or (marine_hp[you]<0) then stahp=1;
        
	        if (stahp=0){
	            var dr,minus;
	            dr=0;minus=0;minus=hostile_damage;
            
	            // minus-=(marine_ac[you]/2);
            
	            // dr=round(-25+(marine_exp[you]*0.1875));dr=dr/100;dr=0.75-dr;
	            dr=0.7-((marine_exp[you]*marine_exp[you])/40000);
	            if (marine_gear[you]="Rosarius") then dr-=0.33;
	            if (marine_gear[you]="Iron Halo") then dr-=0.33;
	            if (marine_mobi[you]="Jump Pack") then dr-=0.1;
	            if (marine_mshield[you]>0) then dr-=0.1;
	            if (marine_fiery[you]>0) then dr-=0.15;
	            if (marine_fshield[you]>0) then dr-=0.08;
	            if (marine_quick[you]>0) then dr-=0.2;// Needs to be only if melee
	            if (marine_dome[you]>0) then dr-=0.15;
	            if (marine_iron[you]>0){
	                if (dr<=0) then marine_hp[you]+=20;
	                if (dr>0) then dr-=(marine_iron[you]/5);
	            }
            
	            if (dr<0.25) then dr=0.25;
	            // if (dr<0.05) then dr=0.05;
            
	            if (minus>0) then minus=round(minus*(dr));
            
	            minus-=marine_ac[you];
	            if (marine_mshield[you]>0) then minus-=8;
	            if (marine_fshield[you]>0) then minus-=6;
            
	            if (minus<0) then minus=0.15;
	            if (minus=0.15) and (hostile_weapon="Fleshborer") then minus=1.5;
	            if (hostile_weapon="Web Spinner"){
	                var chunk,webr;webr=floor(random(100))+1;
	                chunk=max(10,62-(marine_ac[you]*2));
	                minus=0;if (webr<=chunk) then minus=5000;
	                /*
	                if (marine_ac[you]<25) then minus=choose(0,0,0,0,5000);
	                if (marine_ac[you]>=25) then minus=choose(0,0,0,0,0,0,0,0,0,5000);
	                if (marine_ac[you]<=15) then minus=choose(0,0,5000);
	                if (marine_ac[you]=0) then minus=choose(0,5000);*/
	            }
	            marine_hp[you]-=minus;
            
	            if (marine_hp[you]<=0) and (marine_dead[you]!=1){
	                var h,good,open;h=0;good=0;open=0;
	                repeat(30){// Need to find the open slot
	                    h+=1;
                    
	                    if (obj_ncombat.player_forces>6){
	                        if (marine_type[you]=lost[hh]) and (good=0){lost_num[hh]+=1;good=1;}// If one unit is all the same, and get smashed, this should speed up the repeats
	                        if (marine_type[you]=lost[h]) and (good=0){lost_num[h]+=1;good=1;hh=h;}
	                    }
                    
	                    if (lost[h]="") and (open=0) then open=h;// Find the first open
	                }
	                if (good=0) and (open!=0){lost_num[open]=1;lost[open]=marine_type[you];}
	                units_lost+=1;// marine_type[you]="";
                
	                /*if (marine_type[you]="Chapter Master") then command_lost+=1;
	                if (marine_type[you]="Master of Sanctity") then command_lost+=1;
	                if (marine_type[you]="Master of the Apothecarion") then command_lost+=1;
	                if (marine_type[you]="Chief "+string(obj_ini.role[100,17])) then command_lost+=1;
	                if (marine_type[you]="Forge Master") then command_lost+=1;
	                if (marine_type[you]=obj_ini.role[100,17]) then command_lost+=1;
	                if (marine_type[you]=obj_ini.role[100][14]) then command_lost+=1;
	                if (marine_type[you]=obj_ini.role[100][15]) then command_lost+=1;
	                if (marine_type[you]=obj_ini.role[100][16]) then command_lost+=1;
	                if (marine_type[you]=obj_ini.role[100][6]) then command_lost+=1;
	                if (marine_type[you]=obj_ini.role[100][5]) then command_lost+=1;
	                if (marine_type[you]="Codiciery") then command_lost+=1;
	                if (marine_type[you]="Lexicanum") then command_lost+=1;
	                if (marine_type[you]=string(obj_ini.role[100,17])+" Aspirant") then command_lost+=1;
	                if (marine_type[you]=string(obj_ini.role[100][14])+" Aspirant") then command_lost+=1;
	                if (marine_type[you]=string(obj_ini.role[100][15])+" Aspirant") then command_lost+=1;
	                if (marine_type[you]=string(obj_ini.role[100][16])+" Aspirant") then command_lost+=1;
	                if (marine_type[you]="Venerable "+string(obj_ini.role[100][6])) then command_lost+=1;*/
                
	                men-=1;
	                if (marine_type[you]=obj_ini.role[100][6]) or (marine_type[you]="Venerable "+string(obj_ini.role[100][6])) then dreads-=1;
	                obj_ncombat.player_forces-=1;marine_dead[you]=1;
	                if (obj_ncombat.red_thirst=1) and (marine_type[you]!="Death Company") and ((obj_ncombat.player_forces/obj_ncombat.player_max)<0.9) then obj_ncombat.red_thirst=2;
	            }
	        }
	    }
    
	    if (old_hs>0){
	        hostile_shots=old_hs;
	        scr_flavor2(units_lost,"");
	    }
	    /*show_message("Shot by "+string(hostile_unit)+", "+string(dread_shots)+"x "+string(hostile_weapon)+"...
	    "+string(killed_num[1])+"x "+string(killed[1])+"
	    "+string(killed_num[2])+"x "+string(killed[2])+"
	    "+string(killed_num[3])+"x "+string(killed[3])+"
	    "+string(killed_num[4])+"x "+string(killed[4])+"
	    "+string(killed_num[5])+"x "+string(killed[5])+"
	    "+string(killed_num[6])+"x "+string(killed[6]));*/
    
	}


	if (men+veh<=0){
	    var right;right=instance_nearest(1000,y,obj_pnunit);
	    if (right.id=self.id) then with(obj_pnunit){x+=10;}
	    // 
	    x=-5000;
	}

	// 135;
	hostile_men=0;


}
