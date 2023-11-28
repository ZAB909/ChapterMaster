function scr_bomb_world(star_system, planet_number, bombard_target_faction, bombard_ment_power, target_strength) {

	var pop_before=0,pop_after=0,reduced_bombard_score=0,strength_reduction=0,txt2="",txt3="",txt4="",max_kill,overkill,roll,kill;
	var score_before=star_system.p_population[planet_number];

	var txt1="The heavens rumble and thunder as your ship";
	if (ships_selected>1) then txt1+="s";
	txt1+=" unload";
	if (ships_selected=1) then txt1+="s";
	txt1+= $" annihilation upon {star_system.name} {scr_roman_numerals()[planet_number-1]}.  Even from space the explosions can be seen, clapping across the planet's surface.";

	if (star_system.p_large[planet_number]=0){
		kill=bombard_ment_power*15000000;// Population if normal
	}else if (star_system.p_large[planet_number]=1){
		kill=bombard_ment_power*0.15;// Population if large
	}

	pop_before=star_system.p_population[planet_number];
 
	// Minimum kills
	pop_after=max(0,pop_before-kill);
	if (pop_after<=0) and (pop_before>0) then heres_after=0;



	if (star_system.p_type[planet_number]!="Space Hulk"){
	    var bombard_protection=1;
	    switch(bombard_target_faction){
	    	case 2:
	    		txt2="##The Imperial forces are suitably fortified; ";
	    		break;
	    	case 2.5:
	    		if (star_system.p_owner[planet_number]<=5){
	    			txt2="##The PDF forces are suitably fortified; ";
	    		} else if (star_system.p_owner[planet_number]>5){
	    			txt2="##The renegade forces are moderately fortified;" ;
	    		}
	    		break;
	    	case 3:
	    		txt2="##The Mechanicus forces are suitably fortified; ";
	    		bombard_protection=0;
	    		break;
	    	case 5:
	    		txt2="##The Ecclesiarchy forces are concentrated within their Cathedral; ";
	    		break;
	    	case 6:
	    		txt2="##The Eldar forces are challenging to pin down; ";
	    		bombard_protection=3;
	    		break;
	    	case 7:
	    		txt2="##The Ork forces are well dug in; ";
	    		bombard_protection=2;
	    		break;
	    	case 8:
	    		txt2="##The Tau forces are suitably fortified; ";
	    		break;
	    	case 9:
	    		txt2="##The Tyranid Swarm is a large target; ";
	    		break;
	    	case 10:
	    		if (star_system.p_type[planet_number]="Daemon"){
	    			bombard_protection=3;
	    			txt2="##Reality warps and twists within the planet; ";
	    		} else {
					txt2="##The Chaos forces are well dug in; ";
					bombard_protection=2;
	    		}
	    		bombard_protection=2;
	    		break;
	    	case 13:
	    		txt2="##The Necrons are well dug in; ";
	    		break;	    			    			    			    			    			    				    		    			    		
	    }
    
	    reduced_bombard_score=bombard_ment_power/3;
	    strength_reduction=0;
    
	    var i=reduced_bombard_score;
	    roll=0;
    	
	    if (bombard_protection==0){i=i*4;}
	    else if (bombard_protection==1){i=i*0.9;}
	    else if (bombard_protection==2){i=i*0.75;}
	    else if (bombard_protection==3){i=i*0.5;}
    
	    for(var r=0;r<100;r++){
	    	if (i < 1) then break;
            i--;
            strength_reduction++;
	    }
	    if (i<1) and (i>=0.5){
	        i=i*100;
	        roll=irandom(100)=1;
	        if (roll<=i) then strength_reduction+=1;
	    }
    
	    strength_reduction=round(strength_reduction);
	    txt2+="they suffer";
    
	    if (bombard_target_faction==10) and (star_system.p_type[planet_number]=="Daemon") then strength_reduction=0;
    
	    var rel=0;
	    if (strength_reduction!=0) and (target_strength!=0){
	    	rel=((target_strength-strength_reduction)/target_strength)*100;
		}else if (strength_reduction==0){
			txt2+=" no losses from the bombardment.";
		}

		if (rel>0 && rel<=20){
			txt2+=" minor losses from the bombardment, decreasing "+string(strength_reduction)+" stages.";
		}else if (rel>20 && rel<=40){ 
	    	txt2+=" moderate losses from the bombardment, decreasing "+string(strength_reduction)+" stages.";
	    }else if (rel>40 && rel<=60){ 
	    	txt2+=" heavy losses from the bombardment, decreasing "+string(strength_reduction)+" stages.";
	    }else if (rel>60 && (target_strength-strength_reduction)>0){ 
	    	txt2+=" extreme losses from the bombardment, decreasing "+string(strength_reduction)+" stages.";
	    }else if ((target_strength-strength_reduction)<=0){ 
	    	txt2+=" devastating losses from the bombardment.  They have been wiped clean from the planet.";
	    }
    
	    // 135; ?
	    if (bombard_target_faction>=6){
	    	obj_controller.penitent_turn=0;
	    	obj_controller.penitent_turnly=0;
		}
    
	    if (strength_reduction>0){

	        if (bombard_target_faction=2.5) and (star_system.p_owner[planet_number]=8){
	            var wib="",wob=0;
            
	            txt2="##The renegade forces are moderately fortified; ";
            
	            wob=bombard_ment_power*5000000+choose(floor(random(100000)),floor(random(100000))*-1);
            
	            if (wob>star_system.p_pdf[planet_number]) then wob=star_system.p_pdf[planet_number];
	            rel=(star_system.p_pdf[planet_number]/wob)*100;
	            star_system.p_pdf[planet_number]-=wob;
            
	            if (rel>0) and (rel<=20) then txt2+=" they suffer minor losses from the bombardment, "+string(scr_display_number(wob))+" purged.";
	            if (rel>20) and (rel<=40) then txt2+=" they suffer moderate losses from the bombardment, "+string(scr_display_number(wob))+" purged.";
	            if (rel>40) and (rel<=60) then txt2+=" they suffer heavy losses from the bombardment, "+string(scr_display_number(wob))+" purged.";
	            if (rel>60) and (star_system.p_pdf[planet_number]>0) then txt2+=" they suffer extreme losses from the bombardment, "+string(scr_display_number(wob))+" purged.";
	            if (wob>0) and (star_system.p_pdf[planet_number]=0) then txt2+=" they suffer devastating losses from the bombardment.  They have been wiped clean from the planet.";
	        }
        
        	switch(bombard_target_faction){
        		case 5:
        			star_system.p_sisters[planet_number]-=strength_reduction;
        			break;
        		case 6:
        			star_system.p_eldar[planet_number]-=strength_reduction;
        			break;
        		case 7:
        			star_system.p_orks[planet_number]-=strength_reduction;
        			break;
        		case 8:
        			star_system.p_tau[planet_number]-=strength_reduction;
        			break;
        		case 9:
        			star_system.p_tyranids[planet_number]-=strength_reduction;
        			break;
         		case 10:
        			star_system.p_traitors[planet_number]-=strength_reduction;
        			break;
         		case 13:
        			star_system.p_necrons[planet_number]-=strength_reduction;
        			break;        			       			        			        			        			       			
        	}
	    }
    
	    if (kill>0) then kill=min(star_system.p_population[planet_number],kill);
    
	    txt3="";
	    if (pop_before>0) and (star_system.p_type[planet_number]!="Daemon"){
	        if (star_system.p_large[planet_number]==0){
	        	pop_after=round(max(0,pop_after-kill));
	        	txt3="##It had a civilian population of "+string(scr_display_number(floor(pop_before)))+" and "+string(scr_display_number(floor(kill)))+" die over the duration of the bombardment.";
	    	}else if (star_system.p_large[planet_number]=1){
	    		txt3="##It had a civilian population of "+string(pop_before)+" billion and "+string(kill)+" billion die over the duration of the bombardment.";
	    	}
	    }
    
    
	    // DO EET
	    if (pop_before>0){
	    	star_system.p_population[planet_number]=pop_before-kill;
		}
    
	    var pip=instance_create(0,0,obj_popup);
	    pip.title="Bombard Results";
	    pip.text=txt1+txt2+txt3;
    
    
	    if (pop_after==0 && pop_before>0){
	        if (star_system.p_owner[planet_number]=2) and (obj_controller.faction_status[eFACTION.Imperium]!="War"){
	            if (star_system.p_type[planet_number]="Temperate") or (star_system.p_type[planet_number]="Hive") or (star_system.p_type[planet_number]="Desert"){
	                obj_controller.audiences+=1;obj_controller.audien[obj_controller.audiences]=2;
	                obj_controller.audien_topic[obj_controller.audiences]="bombard_angry";
	            }
	            if (star_system.p_type[planet_number]="Temperate"){ 
	            	obj_controller.disposition[2]-=5;
	            }else if (star_system.p_type[planet_number]="Desert"){ 
	            	obj_controller.disposition[2]-=3;
	            }else if (star_system.p_type[planet_number]="Hive"){ 
	            	obj_controller.disposition[2]-=10;
	            }
	        }else if (star_system.p_owner[planet_number]=3) and (obj_controller.faction_status[eFACTION.Mechanicus]!="War"){
	            obj_controller.audiences+=1;obj_controller.audien[obj_controller.audiences]=3;
	            obj_controller.audien_topic[obj_controller.audiences]="bombard_angry";
	            if (star_system.p_type[planet_number]="Forge"){
	            	obj_controller.disposition[3]-=15;
	        	}else if (star_system.p_type[planet_number]="Ice"){
	        		obj_controller.disposition[3]-=7;
	       		}
	        }
	    }
	    if (bombard_target_faction=8) and (obj_controller.faction_status[eFACTION.Tau]!="War"){
	        obj_controller.audiences+=1;
	        obj_controller.audien[obj_controller.audiences]=8;
	        obj_controller.audien_topic[obj_controller.audiences]=choose("declare_war","bombard_angry");
	        obj_controller.disposition[8]-=15;
	    }
    
    
    
    
    
	}




	if (star_system.p_type[planet_number]="Space Hulk"){
	    var bombard_protection=1;
	    txt1="Torpedoes and Bombardment Cannons rain hell upon the space hulk; ";
    
	    reduced_bombard_score=bombard_ment_power/1.25;// fraction of bombardment score
	    strength_reduction=0;txt3="";
    
	    var rel;rel=0;
    
	    if (reduced_bombard_score!=0) then rel=((star_system.p_fortified[planet_number]-reduced_bombard_score)/star_system.p_fortified[planet_number])*100;
    
	    if (strength_reduction==0) then txt2="it suffers minimal damage from the bombardment.";
	    if (rel>0) and (rel<=20) then txt2="it suffers minor damage from the bombardment, its integrity reduced by "+string(100-rel)+"%";
	    if (rel>20) and (rel<=40) then txt2="it suffers moderate damage from the bombardment, its integrity reduced by "+string(100-rel)+"%";
	    if (rel>40) and (rel<=60) then txt2="it suffers heavy damage from the bombardment, its integrity reduced by "+string(100-rel)+"%";
	    if (rel>60) and ((star_system.p_fortified[planet_number]-reduced_bombard_score)>0) then txt2="it suffers extensive damage from the bombardment, its integrity reduced by "+string(100-rel)+"%";
	    if ((star_system.p_fortified[planet_number]-reduced_bombard_score)<=0) then txt2="it groans and crumbles apart before the onslaught.  It is no more.";
    
	    // DO EET
	    if (reduced_bombard_score>0) then star_system.p_fortified[planet_number]-=reduced_bombard_score;
    
	    if (star_system.p_fortified[planet_number]<=0){
	        with(star_system){instance_destroy();}
	        instance_activate_object(obj_star_select);
	        with(obj_star_select){instance_destroy();}
	        obj_controller.sel_system_x=0;obj_controller.sel_system_y=0;
	        obj_controller.popup=0;obj_controller.cooldown=8;
	    }
    
	    var pip;
	    pip=instance_create(0,0,obj_popup);
	    pip.title="Bombard Results";
	    pip.text=txt1+txt2+txt3;
	}



	sh_target.acted=5;
	with(obj_bomb_select){instance_destroy();}
	instance_destroy();

	// show_message("Pop: "+string(pop_before)+" -> "+string(pop_after)+"#killed: "+string(kill)+"#Heresy: "+string(heres_before)+" -> "+string(heres_after));


}
