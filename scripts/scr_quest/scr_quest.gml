function scr_quest(argument0, argument1, argument2, argument3) {

	// argument0: 0/1/2/3/4       create/fail/accomplish/clear/check
	// argument1: quest name
	// argument2: faction
	// argument3: duration before end



	var quick_trade;
	quick_trade=0;

	if (argument0=0){// Create
	    var first_quest,i;
	    first_quest=0;i=0;
    
	    repeat(30){if (first_quest=0){i+=1;if (obj_controller.quest[i]="") then first_quest=i;}}

	    obj_controller.quest[i]=argument1;
	    obj_controller.quest_faction[i]=argument2;
	    obj_controller.quest_end[i]=obj_controller.turn+argument3;
	}


	if (argument0>0){// 1 = Fail, 2 = Accomplish, 3 = Clear
	    var que,i;
	    que=0;i=0;
    
	    repeat(10){if (que=0){i+=1;if (obj_controller.quest[i]=argument1) then que=i;}}
    
	    if (argument1="300req") and (argument0=1){
	        // obj_controller.disposition[6]-=2;// Player going 'maybe' and then waiting out the quest duration
	        scr_audience(6,"mission1_failed",-2,"",0,0);
	        scr_event_log("red","Eldar Mission Failed: Several years have passed since offering to assist the Eldar with resources.");
	    }
	    if (argument1="artifact_return") and (argument0=1){// Inq are now pissed
	        obj_controller.alarm[8]=1;
	    }
	    if (argument1="artifact_loan") and (argument0=1){// Inq want the artifact back
	        var that;that=0;        
	        i=0;repeat(30){i+=1;if (that=0) and (obj_ini.artifact[i]!=""){if (string_count("inq",obj_ini.artifact_tags[i])>0) then that=i;}}
	        if (that=0){
	            scr_popup("Inquisition Artifact","The Inquisition has asked for the return of the Artifact left in your care.  Despite your Marine's best efforts they were unable to waylay the Inquisition, who are now furious.  They demand the Artifact's immediate return.","inquisition","");
	            scr_event_log("red","Inquisition Mission: The Inquisition Artifact entrusted to your Chapter is not retrievable.");
	            disposition[4]-=10;obj_controller.qsfx=1;
	        }
	        if (that>0){
	            obj_ini.artifact[that]="";obj_ini.artifact_tags[that]="";obj_ini.artifact_identified[that]=0;
	            obj_ini.artifact_condition[that]=0;obj_ini.artifact_loc[that]="";obj_ini.artifact_sid[that]=0;
	            obj_controller.artifacts-=1;
	            i=that;
	            repeat(10){
	                obj_ini.artifact[i]=obj_ini.artifact[i+1];obj_ini.artifact_tags[i]=obj_ini.artifact_tags[i+1];
	                obj_ini.artifact_identified[i]=obj_ini.artifact_identified[i+1];
	                obj_ini.artifact_condition[i]=obj_ini.artifact_condition[i+1];
	                obj_ini.artifact_loc[i]=obj_ini.artifact_loc[i+1];obj_ini.artifact_sid[i]=obj_ini.artifact_sid[i+1];
	                i+=1;
	            }
	            if (obj_controller.demanding=0) then obj_controller.disposition[4]+=1;
	            if (obj_controller.demanding=1) then obj_controller.disposition[4]+=choose(0,0,1);
	            scr_popup("Inquisition Mission Completed","The Inquisition has asked for the return of the Artifact, and your Chapter was able to hand it over without complications.  The mission has been accomplished.","inquisition","");
	            scr_event_log("","Inquisition Mission Completed: The entrusted Artifact has been returned to the Inquisition.");
	        }
	    }
    
    
	    if (argument1="300req") and (argument0=2){
	        if (trading=0) then quick_trade=6;
	        obj_controller.known[eFACTION.Eldar]+=1;obj_controller.disposition[6]+=10;
	    }
    
    
	    if (argument0=4){
	        var first_quest,i;
	        first_quest=0;i=0;
        
	        repeat(30){if (first_quest=0){i+=1;if (obj_controller.quest[i]=argument1) then first_quest=i;}}
    
	        if (first_quest!=0) then return(first_quest);
	        exit;
	    }
    
    
	    obj_controller.quest[que]="";obj_controller.quest_faction[que]=0;obj_controller.quest_end[que]=0;
	}




	if (quick_trade!=0){
	    if (obj_ini.fleet_type=1) then with(obj_star){
	            if (owner  = eFACTION.Player) and ((p_owner[1]=1) or (p_owner[2]=1)) then instance_create(x,y,obj_temp2);
	        }
	        if (obj_ini.fleet_type!=1) then with(obj_p_fleet){// Get fleet star system
	            if (capital_number>0) and (action="") then instance_create(instance_nearest(x,y,obj_star).x,instance_nearest(x,y,obj_star).y,obj_temp2);
	            if (frigate_number>0) and (action="") then instance_create(instance_nearest(x,y,obj_star).x,instance_nearest(x,y,obj_star).y,obj_temp4);
	        }
        
	        with(obj_star){// Get origin star system for enemy fleet
	            if (owner=quick_trade) and ((p_owner[1]=quick_trade) or (p_owner[2]=quick_trade) 
	            or (p_owner[3]=quick_trade) or (p_owner[4]=quick_trade)) then instance_create(x,y,obj_temp3);
	        }
        
	        var targ, flit, goods, i,chasing;goods="";chasing=0;// Set target
	        if (instance_exists(obj_temp2)) then targ=instance_nearest(obj_temp2.x,obj_temp2.y,obj_temp3);
	        if (!instance_exists(obj_temp2)) and (instance_exists(obj_temp4)) then targ=instance_nearest(obj_temp4.x,obj_temp4.y,obj_temp3);
        
	        // If player fleet is flying about then get their target for new target
	        if (!instance_exists(obj_temp2)) and (!instance_exists(obj_temp4)) and (instance_exists(obj_p_fleet)){chasing=1;
	            with(obj_p_fleet){var pop;
	                if (capital_number>0) and (action!=""){pop=instance_create(action_x,action_y,obj_temp2);pop.action_eta=action_eta;}
	                if (frigate_number>0) and (action!=""){pop=instance_create(action_x,action_y,obj_temp4);pop.action_eta=action_eta;}
	            }
	        }
	        if (instance_exists(obj_temp2)) then targ=instance_nearest(obj_temp2.x,obj_temp2.y,obj_temp3);
	        if (!instance_exists(obj_temp2)) and (instance_exists(obj_temp4)) then targ=instance_nearest(obj_temp4.x,obj_temp4.y,obj_temp3);
        
	        flit=instance_create(targ.x-0,targ.y-32,obj_en_fleet);
	        flit.owner=quick_trade;
        
	        if (quick_trade=2) then flit.sprite_index=spr_fleet_imperial;
	        if (quick_trade=3) then flit.sprite_index=spr_fleet_mechanicus;
	        if (quick_trade=6){
	            flit.action_spd=6400;
	            flit.action_eta=1;
	            flit.sprite_index=spr_fleet_eldar;
	        }
	        if (quick_trade=8) then flit.sprite_index=spr_fleet_tau;
        
	        flit.image_index=0;
	        flit.capital_number=1;
	        flit.trade_goods="none";
        
	        if (instance_exists(obj_temp2)){flit.action_x=obj_temp2.x;flit.action_y=obj_temp2.y;flit.target=instance_nearest(flit.action_x,flit.action_y,obj_p_fleet);}
	        if (!instance_exists(obj_temp2)) and (instance_exists(obj_temp4)){flit.action_x=obj_temp4.x;flit.action_y=obj_temp4.y;flit.target=instance_nearest(flit.action_x,flit.action_y,obj_p_fleet);}
        
	        flit.alarm[4]=1;
        
	        with(obj_temp2){instance_destroy();}
	        with(obj_temp3){instance_destroy();}
	        with(obj_temp4){instance_destroy();}
	}


}
