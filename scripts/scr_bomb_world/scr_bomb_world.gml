function scr_bomb_world(argument0, argument1, argument2, argument3, argument4) {

	// argument0 = object
	// argument1 = planet
	// argument2 = faction ID
	// argument3 = bombardment score
	// argument4 = score before

	var pop_before,pop_after,sci1,sci2,txt1,txt2,txt3,txt4,max_kill,overkill,score_before,roll,kill;
	score_before=argument0.p_population[argument1];

	txt1="The heavens rumble and thunder as your ship";
	if (ships_selected>1) then txt1+="s";
	txt1+=" unload";
	if (ships_selected=1) then txt1+="s";
	txt1+=" annihilation upon "+string(argument0.name)+" "+string(argument1)+".  Even from space the explosions can be seen, clapping across the planet's surface.";

	if (argument0.p_large[argument1]=0) then kill=argument3*15000000;// Population if normal
	if (argument0.p_large[argument1]=1) then kill=argument3*0.15;// Population if large

	pop_before=argument0.p_population[argument1];
 
	// Minimum kills
	pop_after=max(0,pop_before-kill);
	if (pop_after<=0) and (pop_before>0) then heres_after=0;



	if (argument0.p_type[argument1]!="Space Hulk"){
	    var tip;tip=1;
	    if (argument2=2) then txt2="##The Imperial forces are suitably fortified; ";
	    if (argument2=2.5) and (argument0.p_owner[argument1]<=5) then txt2="##The PDF forces are suitably fortified; ";
	    if (argument2=2.5) and (argument0.p_owner[argument1]>5) then txt2="##The renegade forces are moderately fortified; ";
    
	    if (argument2=3) then txt2="##The Mechanicus forces are suitably fortified; ";
	    if (argument2=5) then txt2="##The Ecclesiarchy forces are concentrated within their Cathedral; ";
	    if (argument2=6) then txt2="##The Eldar forces are challenging to pin down; ";
	    if (argument2=7) then txt2="##The Ork forces are well dug in; ";
	    if (argument2=8) then txt2="##The Tau forces are suitably fortified; ";
	    if (argument2=9) then txt2="##The Tyranid Swarm is a large target; ";
	    if (argument2=10) then txt2="##The Chaos forces are well dug in; ";
	    if (argument2=13) then txt2="##The Necrons are well dug in; ";
    
	    if (argument2=3) then tip=0;
	    if (argument2=7) or (argument2=10) then tip=2;
	    if (argument2=6)or (tip=13) then tip=3;
	    if (argument2=10) and (argument0.p_type[argument1]="Daemon"){
	        tip=3;txt2="##Reality warps and twists within the planet; ";
	    }
	    // Tip : level of fortifieds
    
	    sci1=argument3/3;// fraction of bombardment score
	    sci2=0;
    
	    var i;i=sci1;
	    roll=0;
    
	    if (tip=0) then i=i*4;
	    if (tip=1) then i=i*0.9;
	    if (tip=2) then i=i*0.75;
	    if (tip=3) then i=i*0.5;
    
	    repeat(100){
	        if (i>=1){
	            i-=1;sci2+=1;
	        }
	    }
	    if (i<1) and (i>=0.5){
	        i=i*100;
	        roll=floor(random(100))=1;
	        if (roll<=i) then sci2+=1;
	    }
    
	    sci2=round(sci2);
	    txt2+="they suffer";
    
	    if (argument2=10) and (argument0.p_type[argument1]="Daemon") then sci2=0;
    
	    var rel;rel=0;
	    if (sci2!=0) and (argument4!=0){rel=((argument4-sci2)/argument4)*100;}
	    if (sci2=0) then txt2+=" no losses from the bombardment.";
	    if (rel>0) and (rel<=20) then txt2+=" minor losses from the bombardment, decreasing "+string(sci2)+" stages.";
	    if (rel>20) and (rel<=40) then txt2+=" moderate losses from the bombardment, decreasing "+string(sci2)+" stages.";
	    if (rel>40) and (rel<=60) then txt2+=" heavy losses from the bombardment, decreasing "+string(sci2)+" stages.";
	    if (rel>60) and ((argument4-sci2)>0) then txt2+=" extreme losses from the bombardment, decreasing "+string(sci2)+" stages.";
	    if ((argument4-sci2)<=0) then txt2+=" devastating losses from the bombardment.  They have been wiped clean from the planet.";
    
	    // 135; ?
	    if (argument2>=6){obj_controller.penitent_turn=0;obj_controller.penitent_turnly=0;}
    
	    if (sci2>0){
	        // if (argument2=2){argument0.p_guardsmen[argument1]-=sci2;argument0.p_pdf[argument1]-=sci2;}
	        // 3 is mechanicus
        
	        // if (argument2=2){
	            /*var wib,wob,wob2;
	            wib="";wob=0;wob2=0;
            
	            wob=string_pos(";",txt2);
	            wob2=string_length(txt2)-(string_length(txt2)-wob);
	            txt2=string_delete(txt2,wob,wob2);
            
	            wob=argument3*3000000+choose(floor(random(100000)),floor(random(100000))*-1);
	            if (wob>argument0.p_guardsmen[argument1]) then wob=argument0.p_guardsmen[argument1];
            
	            argument0.p_guardsmen[argument1]-=argument3*3000000;*/
	        // }
	        // if (argument2=2.5) and (argument0.p_owner[argument1]<=5){}
        
	        if (argument2=2.5) and (argument0.p_owner[argument1]=8){
	            var wib,wob;
	            wib="";wob=0;
            
	            txt2="##The renegade forces are moderately fortified; ";
            
	            wob=argument3*5000000+choose(floor(random(100000)),floor(random(100000))*-1);
            
	            if (wob>argument0.p_pdf[argument1]) then wob=argument0.p_pdf[argument1];
	            rel=(argument0.p_pdf[argument1]/wob)*100;
	            argument0.p_pdf[argument1]-=wob;
            
	            if (rel>0) and (rel<=20) then txt2+=" they suffer minor losses from the bombardment, "+string(scr_display_number(wob))+" purged.";
	            if (rel>20) and (rel<=40) then txt2+=" they suffer moderate losses from the bombardment, "+string(scr_display_number(wob))+" purged.";
	            if (rel>40) and (rel<=60) then txt2+=" they suffer heavy losses from the bombardment, "+string(scr_display_number(wob))+" purged.";
	            if (rel>60) and (argument0.p_pdf[argument1]>0) then txt2+=" they suffer extreme losses from the bombardment, "+string(scr_display_number(wob))+" purged.";
	            if (wob>0) and (argument0.p_pdf[argument1]=0) then txt2+=" they suffer devastating losses from the bombardment.  They have been wiped clean from the planet.";
	        }
        
        
	        if (argument2=5) then argument0.p_sisters[argument1]-=sci2;
	        if (argument2=6) then argument0.p_eldar[argument1]-=sci2;
	        if (argument2=7) then argument0.p_orks[argument1]-=sci2;
	        if (argument2=8) then argument0.p_tau[argument1]-=sci2;
	        if (argument2=9) then argument0.p_tyranids[argument1]-=sci2;
	        if (argument2=10) then argument0.p_traitors[argument1]-=sci2;
	        if (argument2=13) then argument0.p_necrons[argument1]-=sci2;
	    }
    
	    if (kill>0) then kill=min(argument0.p_population[argument1],kill);
    
	    txt3="";
	    if (pop_before>0) and (argument0.p_type[argument1]!="Daemon"){
	        if (argument0.p_large[argument1]=0) then pop_after=round(max(0,pop_after-kill));    
	        if (argument0.p_large[argument1]=0) then txt3="##It had a civilian population of "+string(scr_display_number(floor(pop_before)))+" and "+string(scr_display_number(floor(kill)))+" die over the duration of the bombardment.";
	        if (argument0.p_large[argument1]=1) then txt3="##It had a civilian population of "+string(pop_before)+" billion and "+string(kill)+" billion die over the duration of the bombardment.";
	    }
    
    
	    // DO EET
	    if (pop_before>0){argument0.p_population[argument1]=pop_before-kill;}
    
	    var pip;
	    pip=instance_create(0,0,obj_popup);
	    pip.title="Bombard Results";
	    pip.text=txt1+txt2+txt3;
    
    
    
	    if (pop_after=0){
	        if (argument0.p_owner[argument1]=2) and (obj_controller.faction_status[2]!="War"){
	            if (argument0.p_type[argument1]="Temperate") or (argument0.p_type[argument1]="Hive") or (argument0.p_type[argument1]="Desert"){
	                obj_controller.audiences+=1;obj_controller.audien[obj_controller.audiences]=2;
	                obj_controller.audien_topic[obj_controller.audiences]="bombard_angry";
	            }
	            if (argument0.p_type[argument1]="Temperate") then obj_controller.disposition[2]-=5;
	            if (argument0.p_type[argument1]="Desert") then obj_controller.disposition[2]-=3;
	            if (argument0.p_type[argument1]="Hive") then obj_controller.disposition[2]-=10;
	        }
	        if (argument0.p_owner[argument1]=3) and (obj_controller.faction_status[3]!="War"){
	            obj_controller.audiences+=1;obj_controller.audien[obj_controller.audiences]=3;
	            obj_controller.audien_topic[obj_controller.audiences]="bombard_angry";
	            if (argument0.p_type[argument1]="Forge") then obj_controller.disposition[3]-=15;
	            if (argument0.p_type[argument1]="Ice") then obj_controller.disposition[3]-=7;
	        }
	    }
	    if (argument2=8) and (obj_controller.faction_status[8]!="War"){
	        obj_controller.audiences+=1;obj_controller.audien[obj_controller.audiences]=8;
	        obj_controller.audien_topic[obj_controller.audiences]=choose("declare_war","bombard_angry");
	        obj_controller.disposition[8]-=15;
	    }
    
    
    
    
    
	}




	if (argument0.p_type[argument1]="Space Hulk"){
	    var tip;tip=1;
	    txt1="Torpedoes and Bombardment Cannons rain hell upon the space hulk; ";
    
	    sci1=argument3/1.25;// fraction of bombardment score
	    sci2=0;txt3="";
    
	    var rel;rel=0;
    
	    if (sci1!=0) then rel=((argument0.p_fortified[argument1]-sci1)/argument0.p_fortified[argument1])*100;
    
	    if (sci2=0) then txt2="it suffers minimal damage from the bombardment.";
	    if (rel>0) and (rel<=20) then txt2="it suffers minor damage from the bombardment, its integrity reduced by "+string(100-rel)+"%";
	    if (rel>20) and (rel<=40) then txt2="it suffers moderate damage from the bombardment, its integrity reduced by "+string(100-rel)+"%";
	    if (rel>40) and (rel<=60) then txt2="it suffers heavy damage from the bombardment, its integrity reduced by "+string(100-rel)+"%";
	    if (rel>60) and ((argument0.p_fortified[argument1]-sci1)>0) then txt2="it suffers extensive damage from the bombardment, its integrity reduced by "+string(100-rel)+"%";
	    if ((argument0.p_fortified[argument1]-sci1)<=0) then txt2="it groans and crumbles apart before the onslaught.  It is no more.";
    
	    // DO EET
	    if (sci1>0) then argument0.p_fortified[argument1]-=sci1;
    
	    if (argument0.p_fortified[argument1]<=0){
	        with(argument0){instance_destroy();}
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
