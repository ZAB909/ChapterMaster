function scr_mission_reward(argument0, argument1, argument2) {

	// argument0: mission designation
	// argument1: target star system
	// argument2: planet number

	// "mech_bionics",id,i
	// "mech_raider",id,i

	var cleanup,i;cleanup=0;i=-1;
	repeat(11){i+=1;cleanup[i]=0;}




	if (argument0="mars_spelunk"){
	    var roll1,roll2,techs_lost,techs_alive,found_stc,found_artifact,found_requisition;
	    var com,i,onceh;onceh=0;com=-1;i=0;
	    roll1=floor(random(100))+1;// For the first STC
	    found_stc=0;found_artifact=0;found_requisition=0;techs_lost=0;techs_alive=0;

	    repeat(11){com+=1;i=0;
	        repeat(300){i+=1;
	            if (obj_ini.role[com][i]=obj_ini.role[100][16]) and (obj_ini.loc[com][i]="Mechanicus Vessel"){
	                roll2=floor(random(100))+1;
	                if (obj_ini.dis[1]="Shitty Luck") or (obj_ini.dis[2]="Shitty Luck") or (obj_ini.dis[3]="Shitty Luck") or (obj_ini.dis[4]="Shitty Luck") then roll2-=10;

	                if (roll2<=50){obj_controller.command-=1;techs_lost+=1;
	                    obj_ini.race[com][i]=0;obj_ini.loc[com][i]="";obj_ini.name[com][i]="";
	                    obj_ini.role[com][i]="";obj_ini.lid[com][i]=0;obj_ini.wid[com][i]=0;
	                    cleanup[com]=1;
	                }
	                if (roll2>50){
	                    argument1.p_player[argument2]+=scr_unit_size(obj_ini.armour[com][i],obj_ini.role[com][i],true);
	                    obj_ini.loc[com][i]=argument1.name;obj_ini.wid[com][i]=argument2;techs_alive+=1;
	                    repeat(3){obj_ini.experience[com][i]+=choose(1,2,3,4,5,6);}
	                    if (roll2<80) then found_requisition+=floor(random_range(5,40))+1;
	                }
	                if (roll2>=80) and (roll2<88) then found_requisition+=100;
	                if (roll2>=88) and (roll2<96){
	                    if (obj_ini.fleet_type=1) then scr_add_artifact("random","",4,obj_ini.home_name,2);
	                    if (obj_ini.fleet_type!=1) then scr_add_artifact("random","",4,obj_ini.ship[1],501);
	                    found_artifact+=1;
	                }
	                if (roll2>=96){
	                    scr_add_stc_fragment();// STC here
	                    found_stc+=1;
	                }
	            }
	        }
	    }

	    obj_controller.requisition+=found_requisition;
	    if (techs_alive+techs_lost>=2) and (techs_alive>0){
	        if (roll1>=(40+(techs_alive+techs_lost)*5)){
	            scr_add_stc_fragment();// STC here
	            found_stc+=1;
	        }
	    }

	    var tixt;tixt="The journey into the Mars Catacombs was a success.  Your "+string(techs_alive)+" remaining "+string(obj_ini.role[100][16])+"s were useful to the Mechanicus force and return with a bounty.  They await retrieval at "+string(argument1.name)+" "+scr_roman(argument2)+".#";
	    tixt+="#"+string(found_requisition)+" Requisition from salvage";
	    if (found_artifact!=1) then tixt+="#"+string(found_artifact)+" Unidentified Artifacts recovered";
	    if (found_artifact=1) then tixt+="#"+string(found_artifact)+" Unidentified Artifact recovered";
	    if (found_stc!=1) then tixt+="#"+string(found_stc)+" STC Fragments recovered";
	    if (found_stc=1) then tixt+="#"+string(found_stc)+" STC Fragment recovered";

	    scr_popup("Mechanicus Mission Completed",tixt,"mechanicus","");
	    tixt="Mechanicus Mission Completed: "+string(techs_alive)+"/"+string(techs_alive+techs_lost)+" of your "+string(obj_ini.role[100][16])+"s return with ";
	    tixt+=string(found_requisition)+" Requisition, ";
	    if (found_artifact!=1) then tixt+=string(found_artifact)+" Unidentified Artifacts, ";
	    if (found_artifact=1) then tixt+=string(found_artifact)+" Unidentified Artifact, ";
	    if (found_stc!=1) then tixt+=" and "+string(found_stc)+" STC Fragments.";
	    if (found_stc=1) then tixt+=" and "+string(found_stc)+" STC Fragment.";

	    // scr_alert("green","mission",tixt,argument1.x,argument1.y,);
	    scr_event_log("green",tixt);

	    /*if (found_artifact=1) then scr_event_log("","Artifact recovered from Mars Catacombs.");
	    if (found_artifact>1) then scr_event_log("",string(found_artifact)+" Artifacts recovered from Mars Catacombs.");
	    if (found_stc=1) then scr_event_log("","STC Fragment recovered from Mars Catacombs.");
	    if (found_stc>1) then scr_event_log("",string(found_artifact)+" STC Fragments recovered from Mars Catacombs.");*/

	    i=-1;repeat(11){i+=1;if (cleanup[i]=1){obj_controller.temp[3000]=real(i);with(obj_ini){scr_vehicle_order(obj_controller.temp[3000]);}}}
	}





	if (argument0="mech_raider"){
	    var roll1,result;
	    roll1=floor(random(100))+1;result="";
	    if (obj_ini.dis[1]="Shitty Luck") or (obj_ini.dis[2]="Shitty Luck") or (obj_ini.dis[3]="Shitty Luck") or (obj_ini.dis[4]="Shitty Luck") then roll1+=20;

	    if (roll1<=33) then result="New";
	    if (roll1>33) and (roll1<=66) then result="Land Raider";
	    if (roll1>66) then result="Requisition";

	    if (result="New"){
	        scr_popup("Mechanicus Mission Completed","Your "+string(obj_ini.role[100][16])+" have worked with the Adeptus Mechanicus in a satisfactory manor.  The testing and training went well, but your Land Raider was ultimately lost.  300 Requisition has been given to your Chapter and relations are better than before.","mechanicus","");
	        obj_controller.requisition+=300;obj_controller.disposition[3]+=2;
	        var com,i,onceh;onceh=0;com=-1;i=0;
	        repeat(11){
	            if (onceh=0){com+=1;i=0;
	                repeat(100){i+=1;
	                    if (obj_ini.veh_role[com][i]="Land Raider") and (obj_ini.veh_loc[com][i]=argument1.name) and (obj_ini.veh_wid[com][i]=argument2){
	                        onceh=1;
	                        obj_ini.veh_race[com][i]=0;obj_ini.veh_loc[com][i]="";obj_ini.veh_name[com][i]="";obj_ini.veh_role[com][i]="";
	                        obj_ini.veh_lid[com][i]=0;obj_ini.veh_wid[com][i]=0;obj_ini.veh_wep1[com][i]="";obj_ini.veh_wep2[com][i]="";obj_ini.veh_wep3[com][i]="";
	                        obj_ini.veh_upgrade[com][i]="";obj_ini.veh_acc[com][i]="";obj_ini.veh_hp[com][i]=0;obj_ini.veh_chaos[com][i]=0;
	                        obj_ini.veh_uid[com][i]=0;cleanup[com]=1;
	                        argument1.p_player[argument2]-=20;
	                    }
	                }
	            }
	        }
	    }
	    if (result="Land Raider"){
	        scr_popup("Mechanicus Mission Completed","Your "+string(obj_ini.role[100][16])+" have worked with the Adeptus Mechanicus in a satisfactory manor.  The testing and training went well, but your Land Raider was ultimately lost.  A new Land Raider has been provided in return.","mechanicus","");
	        var com,i,onceh;onceh=0;com=-1;i=0;obj_controller.disposition[3]+=1;
	        repeat(11){
	            if (onceh=0){com+=1;i=0;
	                repeat(100){i+=1;
	                    if (obj_ini.veh_role[com][i]="Land Raider") and (obj_ini.veh_loc[com][i]=argument1.name) and (obj_ini.veh_wid[com][i]=argument2){
	                        onceh=1;obj_ini.veh_hp[com][i]=100;
	                    }
	                }
	            }
	        }
	    }
	    if (result="Requisition"){
	        scr_popup("Mechanicus Mission Completed","Your "+string(obj_ini.role[100][16])+" have worked with the Adeptus Mechanicus in a satisfactory manor.  The testing and training went well, but your Land Raider was ultimately lost.  600 Requisition has been given to your Chapter as compensation.","mechanicus","");
	        obj_controller.requisition+=600;obj_controller.disposition[3]+=1;
	    }

	    i=-1;repeat(11){i+=1;if (cleanup[i]=1){obj_controller.temp[3000]=real(i);with(obj_ini){scr_vehicle_order(obj_controller.temp[3000]);}}}
	}

	i=-1;repeat(11){i+=1;cleanup[i]=0;}

	if (argument0="mech_bionics"){
	    var roll1,result;
	    roll1=floor(random(100))+1;result="";
	    if (obj_ini.dis[1]="Shitty Luck") or (obj_ini.dis[2]="Shitty Luck") or (obj_ini.dis[3]="Shitty Luck") or (obj_ini.dis[4]="Shitty Luck") then roll1+=20;

	    if (roll1<=33) then result="Requisition";
	    if (roll1>33) and (roll1<=66) then result="Bionics";
	    if (roll1>66) then result="Marines Lost";

	    if (result="Marines Lost"){
	        scr_popup("Mechanicus Mission Completed","The Adeptus Mechanicus have finished experimenting on your marines- unfortunantly none of them have survived.  150 Requisition has provided as weregild for each Astartes lost.","mechanicus","");
	        obj_controller.disposition[3]+=2;var com,i,onceh;onceh=0;com=-1;i=0;
	        repeat(11){
	            if (onceh<10){com+=1;i=0;
	                repeat(300){i+=1;
	                    if (obj_ini.race[com][i]=1) and (obj_ini.loc[com][i]=argument1.name) and (obj_ini.wid[com][i]=argument2){onceh+=1;
	                        obj_controller.requisition+=150;

	                        argument1.p_player[argument2]-=scr_unit_size(obj_ini.armour[com][i],obj_ini.role[com][i],true);
	                        if (is_specialist(obj_ini.role[com][i])=true) then obj_controller.command-=1;
	                        else obj_controller.marines-=1;

	                        if (obj_ini.role[com][i]="Chapter Master"){obj_controller.alarm[7]=10;global.defeat=3;}

	                        obj_ini.race[com][i]=0;obj_ini.loc[com][i]="";obj_ini.name[com][i]="";
	                        obj_ini.role[com][i]="";obj_ini.lid[com][i]=0;obj_ini.wid[com][i]=0;

	                        if (obj_ini.wep1[com][i]!="") then scr_add_item(obj_ini.wep1[com][i],1);
	                        if (obj_ini.wep2[com][i]!="") then scr_add_item(obj_ini.wep2[com][i],1);
	                        if (obj_ini.armour[com][i]!="") then scr_add_item(obj_ini.armour[com][i],1);
	                        if (obj_ini.gear[com][i]!="") then scr_add_item(obj_ini.gear[com][i],1);
	                        if (obj_ini.mobi[com][i]!="") then scr_add_item(obj_ini.mobi[com][i],1);

	                        cleanup[com]=1;
	                    }
	                }
	            }
	        }
	    }
	    if (result="Bionics"){
	        scr_popup("Mechanicus Mission Completed","The Adeptus Mechanicus have finished experimenting on your marines.  All of your astartes have survived, though they refuse to speak of the experience.  A large amount of additional Bionics have been provided by the Mechanicus as a reward.","mechanicus","");
	        obj_controller.disposition[3]+=1;var com,i,onceh;onceh=0;com=-1;i=0;
	        scr_add_item("Bionics",floor(random_range(40,100))+1);
	        repeat(11){
	            if (onceh<10){com+=1;i=0;
	                repeat(300){i+=1;
	                    if (obj_ini.race[com][i]=1) and (obj_ini.loc[com][i]=argument1.name) and (obj_ini.wid[com][i]=argument2){onceh+=1;
	                        obj_ini.hp[com][i]=floor(random_range(2,80))+1;
	                        obj_ini.bio[com][i]=min(obj_ini.bio[com][i]+choose(2,3,4),10);
	                    }
	                }
	            }
	        }
	    }
	    if (result="Requisition"){
	        scr_popup("Mechanicus Mission Completed","The Adeptus Mechanicus have finished experimenting on your marines.  All of your astartes have survived, though they refuse to speak of the experience.  200 Requisition has been provided by the Mechanicus as a reward.","mechanicus","");
	        obj_controller.disposition[3]+=1;obj_controller.requisition+=200;
	        var com,i,onceh;onceh=0;com=-1;i=0;
	        repeat(11){
	            if (onceh<10){com+=1;i=0;
	                repeat(300){i+=1;
	                    if (obj_ini.race[com][i]=1) and (obj_ini.loc[com][i]=argument1.name) and (obj_ini.wid[com][i]=argument2){onceh+=1;
	                        obj_ini.hp[com][i]=floor(random_range(2,80))+1;
	                        obj_ini.bio[com][i]=min(obj_ini.bio[com][i]+choose(2,3,4),10);
	                    }
	                }
	            }
	        }
	    }

	    i=-1;repeat(11){i+=1;if (cleanup[i]=1){obj_controller.temp[3000]=real(i);with(obj_ini){scr_company_order(obj_controller.temp[3000]);}}}
	}


}
