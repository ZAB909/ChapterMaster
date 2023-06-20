function scr_random_event(argument0) {

	// Random find:
	// argument0: owner
	// argument1: planet?
	// argument2: ship_action (if ship)
	// argument3: feature type?
	// argument4: run?

	var rando, rando2, rando3, rando4, rando5, good, faction, evented, force_event, forced_event, run, event_current;
	var xx,yy;
	rando=floor(random(100))+1;
	rando3=floor(random(100))+1;
	rando5=floor(random(100))+1;
	rando4=floor(random(200))+1;
	good="neutral";faction=0;evented=0;
	xx=0;yy=0;forced_event="";force_event=0;
	run=argument0;event_current="";

	// 

	if ((floor(random(100))+1)<=3) or ((test_map=true) and (turn=5)){debugl("RE: Hunt the Fallen");
	    if (string_count("Never Forgive",obj_ini.strin2)>0){
	        with(obj_temp2){instance_destroy();}
	        with(obj_temp5){instance_destroy();}
	        with(obj_p_fleet){
	            if (action!=""){x-=20000;y-=20000;}
	            if (action="") then instance_create(x,y,obj_temp2);
	        }
	        if (instance_number(obj_p_fleet)>0) and (instance_number(obj_temp2)>0){
	            with(obj_temp2){instance_destroy();}
	            with(obj_star){
	                if (owner=2) and (planets>=1){
	                    var him,dee;
	                    him=instance_nearest(x,y,obj_p_fleet);
	                    dee=point_distance(x,y,him.x,him.y);
	                    if (dee<=600) and (dee>40) and (space_hulk=0) and (craftworld=0) then instance_create(x,y,obj_temp5);
	                }
	            }
	            if (instance_number(obj_temp5)=0){
	                with(obj_p_fleet){if (x<-10000){x+=20000;y+=20000;}}
	                with(obj_p_fleet){if (x<-10000){x+=20000;y+=20000;}}
	            }
	            if (instance_number(obj_temp5)>0){
	                var you,you2,temp,temp2,distan;
	                you=instance_nearest(random(room_width),random(room_height),obj_temp5);
	                you2=instance_nearest(you.x,you.y,obj_star);
	                temp=floor(random(you2.planets))+1;
	                if (temp=1) then temp2="I";if (temp=2) then temp2="II";
	                if (temp=3) then temp2="III";if (temp=4) then temp2="IV";
	                distan=12;
                
	                var onceh;onceh=0;
	                if (you2.p_problem[temp,1]="") and (onceh=0) then onceh=1;
	                if (you2.p_problem[temp,2]="") and (onceh=0) then onceh=2;
	                if (you2.p_problem[temp,3]="") and (onceh=0) then onceh=3;
	                if (you2.p_problem[temp,4]="") and (onceh=0) then onceh=4;
	                you2.p_problem[temp,onceh]="fallen";you2.p_timer[temp,onceh]=distan;
                
	                tixt="Sources indicate one of the Fallen may be upon "+string(you2.name)+" "+string(temp2)+".  We have "+string(distan)+" months to send out a strike team and scour the planet.  Any longer and any Fallen that might be there will have escaped.";
	                scr_popup("Hunt the Fallen",tixt,"fallen","");evented=1;
	                scr_event_log("","Sources indicate one of the Fallen may be upon "+string(you2.name)+" "+string(temp2)+".  We have "+string(distan)+" months to investigate.");
	                var bob;bob=instance_create(you2.x+16,you2.y-24,obj_star_event);bob.image_alpha=1;bob.image_speed=1;bob.col="purple";
	                with(obj_temp5){instance_destroy();}evented=1;
	                with(obj_p_fleet){if (x<-10000){x+=20000;y+=20000;}}
	                with(obj_p_fleet){if (x<-10000){x+=20000;y+=20000;}}
	                exit;
	            }
	        }
	    }
	}




	if (obj_controller.turns_ignored[6]<=0) and (obj_controller.faction_gender[6]=2) then rando4-=2;
	if (obj_controller.turns_ignored[6]<=0) and (rando4<=3) and (run=true) and (faction_defeated[6]=0){
	    if (obj_controller.known[6]=2) and (obj_controller.disposition[6]>=-10) and (string_count("Eldar",obj_ini.strin)=0){debugl("RE: Eldar Mission 1");
	        // Need something else here that prevents them from asking missions when they are pissed
        
	        obj_turn_end.audiences+=1;// obj_turn_end.audiences+=1;
	        obj_turn_end.audien[obj_turn_end.audiences]=6;
        
	        // if (obj_controller.known[6]>2) then obj_turn_end.audien_topic[obj_turn_end.audiences]="mission";// Random mission?
	        if (obj_controller.known[6]=2){
	            obj_turn_end.audien_topic[obj_turn_end.audiences]="mission1";
	            obj_controller.known[6]=2.2;
	            scr_quest(0,"300req",6,24);
	        }
        
	        exit;
	    }
	}



	var mush;mush=0;
	if ((last_mission+50)<=turn) and (rando5<=5) and (obj_controller.faction_status[4]!="War") and (known[4]!=0){mush=1;}
	if ((turn-26)<last_mission) or (obj_controller.faction_status[4]="War"){mush=0;}

	if (mush=0){
	    // rando=1;
	    if ((last_event+30)<=turn) then rando=1;// If 30 turns without random event then do one
	    if (rando>5) and (run=true) then exit;// Frequency of events
	    if ((turn-15)<last_event) and (run=true) then exit;// Minimum interval between

	    // Determines what sort of event it is
	    var d,shit;d=0;shit=0;
	    repeat(4){d+=1;if (obj_ini.dis[d]="Shitty Luck") then shit=1;}
    
	    if (shit=0){
	        if (rando3<=45) then good="good";
	        if (rando3>45) and (rando3<55) then good="neutral";
	        if (rando3>=55) then good="bad";
	    }
	    if (shit=1){
	        if (rando3<=30) then good="good";
	        if (rando3>30) and (rando3<45) then good="neutral";
	        if (rando3>=45) then good="bad";
	    }
	}





	var missi,missi_bad,missi_shares,missi_min,missi_max,m,mbad,shares,fraction,thatone;mbad="";
	m=-1;shares=0;thatone=0;

	repeat(100){m+=1;missi[m]="";missi_bad[m]="";missi_shares[m]=0;missi_min[m]=0;missi_max[m]=0;}
	m=0;


	m+=1;missi[m]="space_hulk";missi_bad[m]="good";missi_shares[m]=1;
	m+=1;missi[m]="promotion";missi_bad[m]="good";missi_shares[m]=1;
	m+=1;missi[m]="strange_building";missi_bad[m]="good";missi_shares[m]=1;
	m+=1;missi[m]="sororitas";missi_bad[m]="good";missi_shares[m]=1;
	m+=1;missi[m]="rogue_trader";missi_bad[m]="good";missi_shares[m]=1;
	m+=1;missi[m]="inquisition_mission";missi_bad[m]="good";missi_shares[m]=1;
	m+=1;missi[m]="inquisition_planet";missi_bad[m]="good";missi_shares[m]=2;
	m+=1;missi[m]="mechanicus_mission";missi_bad[m]="good";missi_shares[m]=1;
	if (obj_ini.adv[1]="Tech-Brothers") or (obj_ini.adv[2]="Tech-Brothers") or (obj_ini.adv[3]="Tech-Brothers") or (obj_ini.adv[4]="Tech-Brothers") then missi_shares[m]=3;

	m+=1;missi[m]="strange_behavior";missi_bad[m]="neutral";missi_shares[m]=1;
	m+=1;missi[m]="fleet_delay";missi_bad[m]="neutral";missi_shares[m]=1;
	m+=1;missi[m]="harlequins";missi_bad[m]="neutral";missi_shares[m]=1;
	m+=1;missi[m]="succession_war";missi_bad[m]="neutral";missi_shares[m]=1;
	m+=1;missi[m]="random_fun";missi_bad[m]="neutral";missi_shares[m]=1;

	m+=1;missi[m]="warp_storms";missi_bad[m]="bad";missi_shares[m]=3;
	m+=1;missi[m]="enemy_forces";missi_bad[m]="bad";missi_shares[m]=1;
	m+=1;missi[m]="crusade";missi_bad[m]="bad";missi_shares[m]=1;
	m+=1;missi[m]="enemy";missi_bad[m]="bad";missi_shares[m]=1;if (obj_ini.adv[1]="Scavengers") or (obj_ini.adv[2]="Scavengers") or (obj_ini.adv[3]="Scavengers") or (obj_ini.adv[4]="Scavengers") then missi_shares[m]=3;
	m+=1;missi[m]="mutation";missi_bad[m]="bad";missi_shares[m]=1;
	m+=1;missi[m]="ship_lost";missi_bad[m]="bad";missi_shares[m]=1;
	m+=1;missi[m]="chaos_invasion";missi_bad[m]="bad";missi_shares[m]=1;
	m+=1;missi[m]="necron_awaken";missi_bad[m]="bad";missi_shares[m]=1;

	m=0;repeat(80){m+=1;shares+=missi_shares[m];}
	fraction=1000/shares;// Something like 20 right now; = 50

	m=0;repeat(80){m+=1;
	    if (m=1){missi_min[m]=0;missi_max[m]=missi_shares[m]*fraction;}
	    if (m>1){missi_min[m]=missi_max[m-1];missi_max[m]=missi_min[m]+(missi_shares[m]*fraction);}
	}


	repeat(80){// Repeats through all the fractions until a mission is found that matches the criteria
	    if (mbad!=good){
	        rando2=floor(random(1000))+1;
	        var g;g=0;mbad="";
	        repeat(80){
	            if (mbad=""){g+=1;
	                if (rando2>missi_min[g]) and (rando2<=missi_max[g]) then mbad=missi_bad[g];
	            }
	        }
	    }
	}
	if (random_event_next!=""){mush=0;var i;i=0;repeat(30){i+=1;if (missi[i]=random_event_next){g=i;giid=missi_bad[g];}}}


	thatone=missi[g];
	if (run=false){random_event_next=thatone;exit;}
	if (mush=1) then thatone="inquisition_mission";
	// show_message("Good: "+string(good));
	// show_message("Mission Found: "+string(missi[g]));



	if (thatone="strange_behavior") and (run=true){debugl("RE: Strange Behavior");
	    var mon, com, it;mon=scr_random_marine("",0);com=0;it=0;it=floor(mon);com=(mon-it)*100;
	    if (com<11){
	        var roll,tixs;roll="";tixs="";roll=obj_ini.role[com,it];
	        // if (roll=obj_ini.role[100,12]) or (roll=obj_ini.role[100,8]) or (roll=obj_ini.role[100,10]) then tixs=string(roll)+" Marine "+string(obj_ini.name[com,it]);
	        // if (roll!=obj_ini.role[100,12]) and (roll!=obj_ini.role[100,8]) and (roll!=obj_ini.role[100,10]) then 
	        tixs=string(roll)+" "+string(obj_ini.name[com,it]);
	        if (com=0) then tixs+=" is behaving strangely.";
	        if (com=1) then tixs+=" (1st co.) is behaving strangely.";
	        if (com=2) then tixs+=" (2nd co.) is behaving strangely.";
	        if (com=3) then tixs+=" (3rd co.) is behaving strangely.";
	        if (com>=4) then tixs+=" ("+string(floor(com))+"th co.) is behaving strangely.";        
	        scr_alert("color","lol",tixs,0,0);evented=1;
	    }
	}
	/*
	Genestealers?
	Catachan Brainleaf?
	Mysteriously Acquired Crazy Syndrome (a Rogue Trader random table event of similar nature)?
	Chaos corruption?
	The Emperor's divine guidance?
	*/
    

	if (thatone="space_hulk") and (run=true){// show_message("Event: Space Hulk appeared on edge of the (system) system");
	    var own,plant,x3,y3,god,star;debugl("RE: Space Hulk");
	    own=choose(1,1,2);plant=0;god=0;
	    with(obj_star){if (p_type[1]="Space Hulk") then instance_create(x,y,obj_temp4);}
	    if (instance_exists(obj_temp4)){with(obj_temp4){instance_destroy();}exit;}
	    scr_random_find(own,true,"","");
    
	    if (own=1) and (instance_number(obj_temp5)=0) and (instance_exists(obj_p_fleet)){
	        with(obj_p_fleet){if (action="") then instance_create(instance_nearest(x,y,obj_star).x,instance_nearest(x,y,obj_star).y,obj_temp5);}
	    }
	    if (instance_exists(obj_temp5)){
	        plant=instance_nearest(obj_temp5.x,obj_temp5.y,obj_star);
	        repeat(100){
	            if (god=0){
	                x3=plant.x+floor(random_range(-60,60));y3=plant.y+floor(random_range(-80,80));if (y3<40) then y3=40;
	                if (point_distance(x3,y3,instance_nearest(x3,y3,obj_star).x,instance_nearest(x3,y3,obj_star).y)>=70){
	                    god=1;
	                }
	            }
	        }
	        if (god=1){
	            star=instance_create(x3,y3,obj_star);
	            star.space_hulk=1;
	            star.p_type[1]="Space Hulk";
	            star.name=scr_hulk_name();
	            if (own=1) then scr_alert("red","space_hulk","The Space Hulk "+string(star.name)+" appears near the "+string(plant.name)+" system.",x3,y3);
	            if (own=2) then scr_alert("green","space_hulk","The Space Hulk "+string(star.name)+" appears near the "+string(plant.name)+" system.",x3,y3);
	            scr_event_log("","The Space Hulk "+string(star.name)+" appears near the "+string(plant.name)+" system.");
	            evented=1;
	        }
	    }
	}
    

	if (thatone="promotion") and (run=true){debugl("RE: Promotion");
	    var mon, com, it;mon=scr_random_marine(choose(obj_ini.role[100,8],obj_ini.role[100,12],obj_ini.role[100,9],obj_ini.role[100,10]),0);com=0;it=0;
	    it=floor(mon);com=ceil((mon-it)*100);
	    if (com<11){
	        var roll,tixs;roll="";tixs="";roll=obj_ini.role[com,it];
	        // if (roll="Scout") or (roll="Tactical") or (roll="Assault") then tixs=string(roll)+" Marine "+string(obj_ini.name[com,it]);
	        // if (roll!="Scout") and (roll!="Tactical") and (roll!="Assault") then 
	        tixs=string(roll)+" "+string(obj_ini.name[com,it]);
	        if (com=1) then tixs+=" (1st co.) has distinguished himself.##He is up for review to be promoted.";
	        if (com=2) then tixs+=" (2nd co.) has distinguished himself.##He is up for review to be promoted.";
	        if (com=3) then tixs+=" (3rd co.) has distinguished himself.##He is up for review to be promoted.";
	        if (com>3) then tixs+=" ("+string(com)+"th co.) has distinguished himself.##He is up for review to be promoted.";        
	        if (com!=10) then obj_ini.experience[com,it]+=10;
	        if (com=10) then obj_ini.experience[com,it]=max(20,obj_ini.experience[com,it]+10);
        
	        if (string_length(tixs)>10) then scr_popup("Promotions!",tixs,"distinguished","");evented=1;
	    }
	}
    
    

	if (thatone="strange_building") and (run=true){debugl("RE: Fey Mood");
	    var mon, com, it;mon=scr_random_marine(obj_ini.role[100,16],0);com=0;it=0;it=floor(mon);com=(mon-it)*100;
	    var roll,tixs;roll="";tixs="";roll=obj_ini.role[com,it];
	    if (com<11){
	        tixs=string(obj_ini.role[100,16])+" "+string(obj_ini.name[com,it]);
	        tixs+=" is taken by a strange mood and starts building!";  
	        scr_popup("Can He Build It?!?",tixs,"tech_build","");evented=1;
        
	        var it1,it2,hurr;
	        it1=floor(random(100))+1;
	        it2="";hurr=0;
        
	        if (string_count("Shit",obj_ini.strin2)>0) then it1+=20;
	        if (string_count("Tech-Heresy",obj_ini.strin2)>0) then it1+=20;
	        if (string_count("Crafter",obj_ini.strin)>0){
	            if (it1>80) then it1-=10;if (it1<60) then it1+=10;
	        }
        
	        if (it1<=50){it2=choose("Icon","Icon","Statue");obj_ini.experience[com,it]+=choose(1,2);}
	        if (it1>50) and (it1<=60) then it2=choose("Bike","Rhino");
	        if (it1>60) and (it1<=80) then it2="Artifact";
	        if (it1>80){it2=choose("baby","robot","demon","fusion");hurr=1;}
        
	        var v,ev;v=0;ev=0;
	        repeat(99){v+=1;if (ev=0) and (event[v]="") then ev=v;}
	        event[ev]="strange_building|"+string(obj_ini.name[com,it])+"|"+string(com)+"|"+string(it)+"|"+string(it2)+"|";
	        event_duration[ev]=1;
	        v=0;ev=0;
        
	        if (obj_ini.wid[com,it]>0) and (hurr>0){
	            obj_controller.temp[100]=obj_ini.loc[com,it];
	            obj_controller.temp[101]=obj_ini.wid[com,it];
	            with(obj_star){
	                if (name=obj_controller.temp[100]){
	                    p_hurssy[1]+=6;p_hurssy_time[1]=2;p_hurssy[2]+=6;p_hurssy_time[2]=2;
	                    p_hurssy[3]+=6;p_hurssy_time[3]=2;p_hurssy[4]+=6;p_hurssy_time[4]=2;
	                }
	            }
	        }
	        if (obj_ini.wid[com,it]=0) and (hurr>0){
	            obj_controller.temp[101]=obj_ini.lid[com,it];
            
	            with(obj_p_fleet){var u;
	                u=0;repeat(6){u+=1;if (capital_num[u]=obj_controller.temp[101]){hurssy+=6;hurssy_time=2;}}
	                u=0;repeat(10){u+=1;if (frigate_num[u]=obj_controller.temp[101]){hurssy+=6;hurssy_time=2;}}
	                u=0;repeat(20){u+=1;if (escort_num[u]=obj_controller.temp[101]){hurssy+=6;hurssy_time=2;}}
	            }
	        }
        
	    }
	}
    

	if (thatone="sororitas") and (run=true){debugl("RE: Sororitas Company");
	    var own,him,plan;
	    own=choose(1,2);scr_random_find(own,true,"","");
	    if (own=1) and (instance_number(obj_temp5)=0) and (instance_exists(obj_p_fleet)){
	        with(obj_p_fleet){if (action="") then instance_create(instance_nearest(x,y,obj_star).x,instance_nearest(x,y,obj_star).y,obj_temp5);}
	    }
	    if (instance_exists(obj_temp5)){
	        him=instance_nearest(obj_temp5.x,obj_temp5.y,obj_star);evented=1;
	        plan=floor(random(him.planets))+1;
	        repeat(5){if (him.p_type[plan]="Dead") then plan=floor(random(him.planets))+1;}
	        if (him.p_type[plan]!="Dead"){
	            him.p_sisters[plan]+=1;
	            if (own!=1) and (him.p_player[plan]<=0) and (him.present_fleet[1]=0) then scr_alert("green","sororitas","Sororitas place a company of sisters on "+string(him.name)+" "+string(plan)+".",him.x,him.y);
	            if (own=1) or (him.p_player[plan]>0) or (him.present_fleet[1]>0){
	                scr_popup("Sororitas","The Ecclesiarchy have placed a company of sisters on "+string(him.name)+" "+string(plan)+".","sororitas","");
	                if (known[5]=0) then known[5]=1;evented=1;
	            }
	        }
	        with(obj_temp5){instance_destroy();}
	    }
	}
    
    
    
	if (thatone="inquisition_mission") and (run=true) and (known[4]!=0) and (obj_controller.disposition[4]>=0) and (obj_controller.faction_status[4]!="War"){
	    with(obj_temp5){instance_destroy();}last_mission=turn;
	    var mishons, d, mishon, you, you2, temp1, temp2, temp3;debugl("RE: Inquisition Mission");
	    mishons[0]="";mishons[1]="purge";mishons[2]="inquisitor";mishons[3]="spyrer";mishons[4]="artifact";d=4;
	    mishons[5]="";mishons[6]="";mishons[7]="";mishons[8]="";mishons[9]="";mishons[10]="";
    
	    with(obj_star){var f,f2;f=0;f2=0;
	        repeat(4){f+=1;if (string_count("Necron Tomb|",p_feature[f])>0) and (string_count("Awake",p_feature[f])=0) and (f2=0) then f2=f;}
	        if (f2>0) then instance_create(x,y,obj_temp5);
	    }
	    if (instance_exists(obj_temp5)){d+=1;mishons[d]="tomb_world";with(obj_temp5){instance_destroy();}}
    
	    if (string_count("Tyr",obj_controller.useful_info)=0){
	    with(obj_star){if (p_tyranids[1]>4) or (p_tyranids[2]>4) or (p_tyranids[3]>4) or (p_tyranids[4]>4) then instance_create(x,y,obj_temp5);}
	    if (instance_exists(obj_temp5)){d+=1;mishons[d]="tyranid_organism";with(obj_temp5){instance_destroy();}}}
    
	    /*if (string_count("Tau",obj_controller.useful_info)=0){
	    with(obj_star){if (p_tau[1]>=4) or (p_tau[2]>=4) or (p_tau[3]>=4) or (p_tau[4]>=4) then instance_create(x,y,obj_temp5);}
	    if (instance_exists(obj_temp5)){d+=1;mishons[d]="ethereal";with(obj_temp5){instance_destroy();}}}*/
    
	    mishon=floor(random(d))+1;
	    /*if (global.debug=1){
	        if (mishons[5]="tomb_world") then mishon=5;
	        if (mishons[6]="tomb_world") then mishon=6;
	        if (mishons[7]="tomb_world") then mishon=7;
	    }*/
    
	    if (mishons[mishon]="purge"){debugl("RE: Purge");
	        temp1=choose(1,1,1,2,2,3);
	        if (temp1!=3){with(obj_star){
	                if (owner!=8){
	                    var onceh;onceh=0;
	                    if ((p_type[1]="Desert") or (p_type[1]="Temperate") or (p_type[1]="Hive")) and (p_owner[1]<=5) and (onceh=0){instance_create(x,y,obj_temp5);onceh=1;}
	                    if ((p_type[2]="Desert") or (p_type[2]="Temperate") or (p_type[2]="Hive")) and (p_owner[2]<=5) and (onceh=0){instance_create(x,y,obj_temp5);onceh=1;}
	                    if ((p_type[3]="Desert") or (p_type[3]="Temperate") or (p_type[3]="Hive")) and (p_owner[3]<=5) and (onceh=0){instance_create(x,y,obj_temp5);onceh=1;}
	                    if ((p_type[4]="Desert") or (p_type[4]="Temperate") or (p_type[4]="Hive")) and (p_owner[4]<=5) and (onceh=0){instance_create(x,y,obj_temp5);onceh=1;}
	                }
	        }}
	        if (temp1=3){with(obj_star){if (p_type[1]="Hive") or (p_type[2]="Hive") or (p_type[3]="Hive") or (p_type[4]="Hive") then instance_create(x,y,obj_temp5);}}
	        you=instance_nearest(random(room_width),random(room_height),obj_temp5);you2=instance_nearest(you.x,you.y,obj_star);
	        var god;god=0;
	        if (temp1!=3){
	            if ((you2.p_type[1]="Desert") or (you2.p_type[1]="Temperate") or (you2.p_type[1]="Hive")) and (god=0){god=1;}
	            if ((you2.p_type[2]="Desert") or (you2.p_type[2]="Temperate") or (you2.p_type[2]="Hive")) and (god=0){god=2;}
	            if ((you2.p_type[3]="Desert") or (you2.p_type[3]="Temperate") or (you2.p_type[3]="Hive")) and (god=0){god=3;}
	            if ((you2.p_type[4]="Desert") or (you2.p_type[4]="Temperate") or (you2.p_type[4]="Hive")) and (god=0){god=4;}
	        }
	        if (temp1=3){
	            if (you2.p_type[1]="Hive") and (god=0){god=1;}if (you2.p_type[2]="Hive") and (god=0){god=2;}
	            if (you2.p_type[3]="Hive") and (god=0){god=3;}if (you2.p_type[4]="Hive") and (god=0){god=4;}
	        }
	        var tixt, tixt2, flit, eta;tixt="The Inquisition is trusting you with a special mission.";
	        with(obj_p_fleet){if (capital_number+frigate_number=0){x-=20000;y-=20000;}}
	        flit=instance_nearest(you2.x,you2.y,obj_p_fleet);
	        eta=round(point_distance(flit.x,flit.y,you2.x,you2.y)/48)+2;
	        eta=max(eta,12);instance_activate_object(obj_p_fleet);
	        if (god=1) then tixt2=string(you2.name)+" I";if (god=2) then tixt2=string(you2.name)+" II";
	        if (god=3) then tixt2=string(you2.name)+" III";if (god=4) then tixt2=string(you2.name)+" IV";
	        if (temp1=1) then tixt+="  A number of high-ranking nobility on the planet "+string(tixt2)+" are being difficult and harboring heretical thoughts.  They are to be selectively purged within "+string(eta)+" months.  Can your chapter handle this mission?";
	        if (temp1=2) then tixt+="  A powerful crimelord on the planet "+string(tixt2)+" is gaining an unacceptable amount of power and disrupting daily operations.  They are to be selectively purged within "+string(eta)+" months.  Can your chapter handle this mission?";
	        if (temp1=3) then tixt+="  The mutants of hive world "+string(tixt2)+" are growing in numbers and ferocity, rising sporadically from the underhive.  They are to be cleansed by promethium within "+string(eta)+" months.  Can your chapter handle this mission?";
	        if (temp1!=3) then scr_popup("Inquisition Mission",tixt,"inquisition","purge|"+string(you2.name)+"|"+string(god)+"|"+string(real(eta+1))+"|");evented=1;
	        if (temp1=3) then scr_popup("Inquisition Mission",tixt,"inquisition","cleanse|"+string(you2.name)+"|"+string(god)+"|"+string(real(eta+1))+"|");evented=1;
	    }
    
	    if (mishons[mishon]="inquisitor"){debugl("RE: Inquisitor Hunt");
	        var gen;gen=choose(1,1,2);
        
	        with(obj_temp6){instance_destroy();}
	        with(obj_star){if ((p_owner[1]=1) or (p_owner[2]=1) or (p_owner[3]=1) or (p_owner[4]=1)) then instance_create(x,y,obj_temp5);}
	        with(obj_p_fleet){if (escort_number>1) or (frigate_number+capital_number>0) then instance_create(x,y,obj_temp5);}
        
	        repeat(10){
	            if (!instance_exists(obj_temp6)){
	                with(obj_star){
	                    if (owner!=7) and (owner!=10) and (owner!=9) and ((owner!=6) or (obj_controller.known[6]>0)) and (x>0){
	                        if (x>50) and (x<room_width-100) and (y>50) and (y<room_height-50){
	                            var x8,y8;
	                            x8=random(room_width);y8=random(room_height)
	                            var nears;nears=instance_nearest(x8,y8,obj_temp5);
	                            if (point_distance(x8,y8,nears.x,nears.y)<=300) and (point_distance(x8,y8,nears.x,nears.y)>=100) then instance_create(x,y,obj_temp6);
	                            if (point_distance(x8,y8,nears.x,nears.y)>300) or (point_distance(x8,y8,nears.x,nears.y)<100){
	                                with(nears){x-=20000;y-=20000;}
	                                x-=20000;y-=20000;
	                            }
	                        }
	                    }
	                }
	            }
	        }
        
	        with(obj_star){if (x<-10000){x+=20000;y+=20000;}};
	        with(obj_star){if (x<-10000){x+=20000;y+=20000;}};
	        with(obj_star){if (x<-10000){x+=20000;y+=20000;}};
	        with(obj_temp5){if (x<-10000){x+=20000;y+=20000;}};
	        with(obj_temp5){if (x<-10000){x+=20000;y+=20000;}};
        
	        var deth,tixt;deth=scr_imperial_name(gen);
	        var you,you2,temp,temp2,distan;
	        you=instance_nearest(random(room_width),random(room_height),obj_temp6);
	        you2=instance_nearest(you.x,you.y,obj_star);
	        with(obj_temp6){instance_destroy();}with(obj_temp5){instance_destroy();}
	        with(obj_p_fleet){if (escort_number>1) or (frigate_number+capital_number>0) then instance_create(x,y,obj_temp5);}
	        temp=instance_nearest(you2.x,you2.y,obj_temp5);
	        distan=round(point_distance(you2.x,you2.y,temp.x,temp.y)/48)+choose(2,3,4,5);
	        distan=max(distan,8);
	        with(obj_temp6){instance_destroy();}with(obj_temp5){instance_destroy();}
	        tixt="The Inquisition is trusting you with a special mission.  A radical inquisitor named "+string(deth)+" will be visiting the "+string(you2.name)+" system in "+string(distan)+" month's time.  They are highly suspect of heresy, and as such, are to be put down.  Can your chapter handle this mission?";
	        scr_popup("Inquisition Mission",tixt,"inquisition","inquisitor|"+string(you2.name)+"|"+string(gen)+"|"+string(real(distan))+"|");evented=1;
        
	        with(obj_star){if (x<-10000){x+=20000;y+=20000;}};
	        with(obj_star){if (x<-10000){x+=20000;y+=20000;}};
	        with(obj_star){if (x<-10000){x+=20000;y+=20000;}};
	    }
    
	    if (mishons[mishon]="spyrer"){debugl("RE: Spyrer");
	        with(obj_star){if (p_type[1]="Hive") or (p_type[2]="Hive") or (p_type[3]="Hive") or (p_type[4]="Hive") then instance_create(x,y,obj_temp5);}
	        if (instance_exists(obj_temp5)){
	            var you,you2,flit,plan,eta;plan=0;eta=0;
	            you=instance_nearest(random(room_width),random(room_height),obj_temp5);
	            you2=instance_nearest(you.x,you.y,obj_star);
	            if (you2.p_type[1]="Hive") and (plan=0){plan=1;}if (you2.p_type[2]="Hive") and (plan=0){plan=2;}
	            if (you2.p_type[3]="Hive") and (plan=0){plan=3;}if (you2.p_type[4]="Hive") and (plan=0){plan=4;}
	            flit=instance_nearest(you2.x,you2.y,obj_p_fleet);
	            // distan=round(point_distance(you2.x,you2.y,flit.x,flit.y)/48)+choose(3,4,5);
	            // distan=max(distan,10);
            
	            distan=scr_mission_eta(you2.x,you2.y,2);
            
	            with(obj_temp5){instance_destroy();}
	            tixt="The Inquisition is trusting you with a special mission.  An experienced Spyrer on hive world ";
	            if (plan=1) then tixt+=string(you2.name)+" I";if (plan=2) then tixt+=string(you2.name)+" II";
	            if (plan=3) then tixt+=string(you2.name)+" III";if (plan=4) then tixt+=string(you2.name)+" IV";
	            tixt+=" has began to hunt indiscriminately, and proven impossible to take down by conventional means.  If they are not put down within "+string(distan)+" month's time panic is likely.  Can your chapter handle this mission?";
	            scr_popup("Inquisition Mission",tixt,"inquisition","spyrer|"+string(you2.name)+"|"+string(plan)+"|"+string((distan+1))+"|");evented=1;
	        }
	    }
    
	    if (mishons[mishon]="artifact"){var tixt;debugl("RE: Artifact Hold");
	        tixt="The Inquisition is trusting you with a special mission.  A local Inquisitor has a powerful artifact.  You are to keep it safe, and NOT use it, until the artifact may be safely retrieved.  Can your chapter handle this mission?";
	        scr_popup("Inquisition Mission",tixt,"inquisition","artifact|bop|0|"+string((floor(random(20))+4))+"|");evented=1;
	    }
    
	    if (mishons[mishon]="tomb_world"){debugl("RE: Tomb Bombing");
	        with(obj_star){
	            if (string_count("Necron Tomb|",p_feature[1])>0) and (string_count("Awake",p_feature[1])=0) then instance_create(x,y,obj_temp5);
	            if (string_count("Necron Tomb|",p_feature[2])>0) and (string_count("Awake",p_feature[2])=0) then instance_create(x,y,obj_temp5);
	            if (string_count("Necron Tomb|",p_feature[3])>0) and (string_count("Awake",p_feature[3])=0) then instance_create(x,y,obj_temp5);
	            if (string_count("Necron Tomb|",p_feature[4])>0) and (string_count("Awake",p_feature[4])=0) then instance_create(x,y,obj_temp5);
	        }
	        if (instance_exists(obj_temp5)){
	            var you,you2,flit,plan,eta;plan=0;eta=0;
	            you=instance_nearest(random(room_width),random(room_height),obj_temp5);
	            you2=instance_nearest(you.x,you.y,obj_star);
	            if (string_count("Necron Tomb|",you2.p_feature[1])>0) and (string_count("Awake",you2.p_feature[1])=0) and (plan=0){plan=1;}
	            if (string_count("Necron Tomb|",you2.p_feature[2])>0) and (string_count("Awake",you2.p_feature[2])=0) and (plan=0){plan=2;}
	            if (string_count("Necron Tomb|",you2.p_feature[3])>0) and (string_count("Awake",you2.p_feature[3])=0) and (plan=0){plan=3;}
	            if (string_count("Necron Tomb|",you2.p_feature[4])>0) and (string_count("Awake",you2.p_feature[4])=0) and (plan=0){plan=4;}
	            flit=instance_nearest(you2.x,you2.y,obj_p_fleet);
	            // distan=round(point_distance(you2.x,you2.y,flit.x,flit.y)/48)+3;
	            // distan=max(distan,7);
            
	            distan=scr_mission_eta(you2.x,you2.y,3);
            
	            with(obj_temp5){instance_destroy();}
	            tixt="The Inquisition is trusting you with a special mission.  They have reason to suspect the Necron Tomb on planet ";
	            if (plan=1) then tixt+=string(you2.name)+" I";if (plan=2) then tixt+=string(you2.name)+" II";
	            if (plan=3) then tixt+=string(you2.name)+" III";if (plan=4) then tixt+=string(you2.name)+" IV";
	            tixt+=" may become active.  You are to send a small group of marines to plant a bomb deep inside, within "+string(distan)+" months.  Can your chapter handle this mission?";
	            scr_popup("Inquisition Mission",tixt,"inquisition","necron|"+string(you2.name)+"|"+string(plan)+"|"+string((distan+1))+"|");evented=1;
	        }
	    }
    
	    if (mishons[mishon]="tyranid_organism"){debugl("RE: Gaunt Capture");
	        with(obj_star){
	            if (p_tyranids[1]>4) or (p_tyranids[2]>4) or (p_tyranids[3]>4) or (p_tyranids[4]>4) then instance_create(x,y,obj_temp5);
	        }
	        if (instance_exists(obj_temp5)){
	            var you,you2,flit,plan,eta;plan=0;eta=0;
	            you=instance_nearest(random(room_width),random(room_height),obj_temp5);
	            you2=instance_nearest(you.x,you.y,obj_star);
	            if (you2.p_tyranids[1]>4) and (plan=0){plan=1;}
	            if (you2.p_tyranids[2]>4) and (plan=0){plan=2;}
	            if (you2.p_tyranids[3]>4) and (plan=0){plan=3;}
	            if (you2.p_tyranids[4]>4) and (plan=0){plan=4;}
	            if (plan>0){
	                flit=instance_nearest(you2.x,you2.y,obj_p_fleet);
	                distan=round(point_distance(you2.x,you2.y,flit.x,flit.y)/48)+2;
	                distan=max(distan,6);
	                tixt="An Inquisitor is trusting you with a special mission.  The planet ";
	                if (plan=1) then tixt+=string(you2.name)+" I";if (plan=2) then tixt+=string(you2.name)+" II";
	                if (plan=3) then tixt+=string(you2.name)+" III";if (plan=4) then tixt+=string(you2.name)+" IV";
	                tixt+=" is ripe with Tyranid organisms.  They require that you capture one of the Gaunt species for research purposes.  Can your chapter handle this mission?";
	                scr_popup("Inquisition Mission",tixt,"inquisition","tyranid_org|"+string(you2.name)+"|"+string(plan)+"|"+string((999))+"|");evented=1;
	            }
	            with(obj_temp5){instance_destroy();}
	        }
	    }
    
	    if (mishons[mishon]="ethereal"){debugl("RE: Ethereal Capture");
	        with(obj_star){
	            if (p_owner[1]=8) and (p_tau[1]>=4) then instance_create(x,y,obj_temp5);
	            if (p_owner[2]=8) and (p_tau[2]>=4) then instance_create(x,y,obj_temp5);
	            if (p_owner[3]=8) and (p_tau[3]>=4) then instance_create(x,y,obj_temp5);
	            if (p_owner[4]=8) and (p_tau[4]>=4) then instance_create(x,y,obj_temp5);
	        }
	        if (instance_exists(obj_temp5)){
	            var you,you2,flit,plan,eta;plan=0;eta=0;
	            tixt="An Inquisitor is trusting you with a special mission.  They require that you capture a Tau Ethereal for research purposes.  You have 20 months to locate and capture one.  Can your chapter handle this mission?";
	            scr_popup("Inquisition Mission",tixt,"inquisition","ethereal|bop|0|20|");evented=1;
	        }
	        with(obj_temp5){instance_destroy();}
	    }
    
	    with(obj_star){if (x<-10000){x+=20000;y+=20000;}}
	    with(obj_star){if (x<-10000){x+=20000;y+=20000;}}
	    with(obj_star){if (x<-10000){x+=20000;y+=20000;}}
	    instance_activate_object(obj_star);
	}


	if (thatone="mechanicus_mission") and (run=true) and (known[3]!=0) and (obj_controller.disposition[3]>=50) and (obj_controller.faction_status[3]!="War"){
	    with(obj_temp5){instance_destroy();}
	    var mishons, d, mishon, you, you2, temp1, temp2, temp3;debugl("RE: Mechanicus Mission");
	    d=-1;repeat(11){d+=1;mishons[d]="";}d=0;
	    // mishons[1]="land_raider";mishons[2]="bionics";
    
	    // show_message("A");
    
	    with(obj_star){var eh;eh=0;repeat(4){eh+=1;if (p_owner[eh]=3) and (p_type[eh]="Forge") then instance_create(x,y,obj_temp5);}}
	    if (instance_exists(obj_temp5)){
	        if (scr_role_count(obj_ini.role[100,16],"")>=6){d+=1;mishons[d]="land_raider";}
	        d+=1;mishons[d]="bionics";with(obj_temp5){instance_destroy();}
	    }
    
	    with(obj_star){
	        if (string_count("Necron Tomb|",p_feature[1])>0) and (string_count("Awake",p_feature[1])=0) and (p_owner[1]<=5) then instance_create(x,y,obj_temp5);
	        if (string_count("Necron Tomb|",p_feature[2])>0) and (string_count("Awake",p_feature[2])=0) and (p_owner[2]<=5) then instance_create(x,y,obj_temp5);
	        if (string_count("Necron Tomb|",p_feature[3])>0) and (string_count("Awake",p_feature[3])=0) and (p_owner[3]<=5) then instance_create(x,y,obj_temp5);
	        if (string_count("Necron Tomb|",p_feature[4])>0) and (string_count("Awake",p_feature[4])=0) and (p_owner[4]<=5) then instance_create(x,y,obj_temp5);
	    }
	    if (instance_exists(obj_temp5)){d+=1;mishons[d]="necron_study";with(obj_temp5){instance_destroy();}}
    
	    if (obj_controller.disposition[3]>=70){d+=1;mishons[d]="mars_spelunk";with(obj_temp5){instance_destroy();}}
    
    
	    if (d>0) then mishon=floor(random(d))+1;
    
	    if (mishons[mishon]="land_raider") or (mishons[mishon]="bionics") or (mishons[mishon]="mars_spelunk"){// show_message("B");
	        // debugl("RE: Land Raider Study");
	        with(obj_temp5){instance_destroy();}
	        with(obj_temp6){instance_destroy();}
	        with(obj_temp7){instance_destroy();}
        
	        with(obj_star){var eh;eh=0;repeat(4){eh+=1;if (p_owner[eh]=3) and (p_type[eh]="Forge") then instance_create(x,y,obj_temp5);}}
        
	        if (obj_ini.fleet_type=1){// show_message("C");
	            with(obj_star){var eh;eh=0;
	                repeat(4){eh+=1;
	                    if (p_owner[eh]=1) and (string_count("Monast",p_feature[eh])=0) then instance_create(x,y,obj_temp6);
	                    if (p_owner[eh]=1) and (string_count("Monast",p_feature[eh])>0) then instance_create(x,y,obj_temp7);
	                }
	            }
	        }
	        if (obj_ini.fleet_type!=1){// show_message("C");
	            with(obj_p_fleet){
	                if (escort_number+frigate_number>0) then instance_create(x,y,obj_temp6);
	                if (capital_number>0) then instance_create(x,y,obj_temp7);
	            }
	        }
	        if (instance_number(obj_temp6)+instance_number(obj_temp7)>0){// show_message("D");
	            if (instance_exists(obj_temp7)) then you=instance_nearest(random(room_width),random(room_height),obj_temp7);
	            if (!instance_exists(obj_temp7)) then you=instance_nearest(random(room_width),random(room_height),obj_temp6);
	            temp1=instance_nearest(you.x,you.y,obj_temp5);temp2=instance_nearest(temp1.x,temp1.y,obj_star);
	            if (instance_exists(temp2)) then you2=temp2;
	        }
        
	        if (mishons[mishon]="land_raider") and (instance_exists(you2)){// show_message("E1");
	            tixt="The Adeptus Mechanicus are trusting you with a special mission.  They wish for you to bring a Land Raider and six "+string(obj_ini.role[100,16])+" to a Forge World for testing and training, for a duration of 24 months.  You have four years to complete this.  Can your chapter handle this mission?";
	            scr_popup("Mechanicus Mission",tixt,"mechanicus","mech_raider!0!|"+string(you2.name)+"|");evented=1;
	        }
	        if (mishons[mishon]="bionics") and (instance_exists(you2)){// show_message("E2");
	            tixt="The Adeptus Mechanicus are trusting you with a special mission.  They desire a squad of Astartes with bionics to stay upon a Forge World for testing, for a duration of 24 months.  You have four years to complete this.  Can your chapter handle this mission?";
	            scr_popup("Mechanicus Mission",tixt,"mechanicus","mech_bionics!0!|"+string(you2.name)+"|");evented=1;
	        }
	        if (mishons[mishon]="mars_spelunk") and (instance_exists(you2)){// show_message("E3");
	            tixt="The local Adeptus Mechanicus are preparing to embark on a voyage to Mars, to delve into the catacombs in search of lost technology.  Due to your close relations they have made the offer to take some of your "+string(obj_ini.role[100,16])+"s with them.  Can your chapter handle this mission?";
	            scr_popup("Mechanicus Mission",tixt,"mechanicus","mech_mars|"+string(you2.name)+"|");evented=1;
	        }
	    }
    
	    if (mishons[mishon]="necron_study"){debugl("RE: Necron Tomb Study");
	        with(obj_temp5){instance_destroy();}
	        with(obj_temp6){instance_destroy();}
	        with(obj_temp7){instance_destroy();}
	        with(obj_star){
	            if (string_count("Necron Tomb|",p_feature[1])>0) and (string_count("Awake",p_feature[1])=0) and (p_owner[1]<=5) then instance_create(x,y,obj_temp5);
	            if (string_count("Necron Tomb|",p_feature[2])>0) and (string_count("Awake",p_feature[2])=0) and (p_owner[2]<=5) then instance_create(x,y,obj_temp5);
	            if (string_count("Necron Tomb|",p_feature[3])>0) and (string_count("Awake",p_feature[3])=0) and (p_owner[3]<=5) then instance_create(x,y,obj_temp5);
	            if (string_count("Necron Tomb|",p_feature[4])>0) and (string_count("Awake",p_feature[4])=0) and (p_owner[4]<=5) then instance_create(x,y,obj_temp5);
	        }
	        if (obj_ini.fleet_type=1){// show_message("C");
	            with(obj_star){var eh;eh=0;
	                repeat(4){eh+=1;
	                    if (p_owner[eh]=1) and (string_count("Monast",p_feature[eh])=0) then instance_create(x,y,obj_temp6);
	                    if (p_owner[eh]=1) and (string_count("Monast",p_feature[eh])>0) then instance_create(x,y,obj_temp7);
	                }
	            }
	        }
	        if (obj_ini.fleet_type!=1){// show_message("C");
	            with(obj_p_fleet){
	                if (escort_number+frigate_number>0) then instance_create(x,y,obj_temp6);
	                if (capital_number>0) then instance_create(x,y,obj_temp7);
	            }
	        }
	        if (instance_number(obj_temp6)+instance_number(obj_temp7)>0){// show_message("D");
	            if (instance_exists(obj_temp7)) then you=instance_nearest(random(room_width),random(room_height),obj_temp7);
	            if (!instance_exists(obj_temp7)) then you=instance_nearest(random(room_width),random(room_height),obj_temp6);
	            temp1=instance_nearest(you.x,you.y,obj_temp5);temp2=instance_nearest(temp1.x,temp1.y,obj_star);
	            if (instance_exists(temp2)) then you2=temp2;
	        }
	        if (instance_exists(you2)){
	            tixt="Mechanicus Techpriests have established a research site on a Necron Tomb World.  They are requesting some of your forces to provide security for the research team until the tests may be completed.  Further information is on a need-to-know basis.  Can your chapter handle this mission?";
	            scr_popup("Mechanicus Mission",tixt,"mechanicus","mech_tomb|"+string(you2.name)+"|");evented=1;
	        }
	    }
    
	    with(obj_temp5){instance_destroy();}
	    with(obj_temp6){instance_destroy();}
	    with(obj_temp7){instance_destroy();}
	}












    
    
	if (thatone="inquisition_planet") and (run=true) and (known[4]!=0) and (obj_controller.faction_status[4]!="War"){debugl("RE: Investigate Planet");
	    var you,you2,plan,tixt;tixt="";
	    with(obj_temp5){instance_destroy();}with(obj_temp6){instance_destroy();}
	    with(obj_star){if (owner!=1) and (craftworld=0) and (space_hulk=0) and (planets>0) and (p_player[1]+p_player[2]+p_player[3]+p_player[4]=0) then instance_create(x,y,obj_temp5);}
	    with(obj_p_fleet){instance_create(x,y,obj_temp6);}
	    with(obj_temp5){
	        var yu;yu=instance_nearest(x,y,obj_temp6);
	        repeat(5){yu=instance_nearest(x,y,obj_temp6);if (point_distance(x,y,yu.x,yu.y)<160) then instance_destroy();}
	    }
	    if (instance_exists(obj_temp5)){
	        you=instance_nearest(random(room_width),random(room_height),obj_temp5);
	        you2=instance_nearest(you.x,you.y,obj_star);
	        plan=floor(random(you2.planets))+1;

	        if (string_count("????|",you2.p_feature[plan])=0){
	            if (string_count("????|",you2.p_feature[plan-1])=1) and (plan>=2) then plan-=1;
	            if (string_count("????|",you2.p_feature[plan+1])=1) and (you2.planets>=plan+1) and (plan<4) then plan+=1;
	        }
        
	        tixt="The Inquisition wishes for you to investigate "+string(you2.name)+" "+scr_roman(plan)+".";
	        tixt+="  Boots are expected to be planted on its surface over the course of your investigation.";
	        var eta,flit;eta=0;
	        with(obj_p_fleet){if (action!="") and (action_eta>2){x-=20000;y-=20000;}}
	        if (instance_exists(obj_p_fleet)){
	            flit=instance_nearest(you2.x,you2.y,obj_p_fleet);
	            eta=max(8,round(point_distance(flit.x,flit.y,you2.x,you2.y)/48)+2);
	        }
	        if (eta!=0) then tixt+="  You have "+string(eta)+" months to complete this task.";
	        scr_popup("Inquisition Recon",tixt,"inquisition","recon|"+string(you2.name)+"|"+string(plan)+"|"+string(real(eta+1))+"|");
	        evented=1;
	    }
	    with(obj_temp5){instance_destroy();}with(obj_temp6){instance_destroy();}
	    with(obj_p_fleet){if (x<-10000){x+=20000;y+=20000;}}
	}
    

	if (thatone="rogue_trader") and (run=true){debugl("RE: Rogue Trader");
	    with(obj_temp5){instance_destroy();}
	    if (obj_ini.fleet_type=1){with(obj_star){if (p_owner[1]=1) or (p_owner[2]=1) or (p_owner[3]=1) or (p_owner[4]=1) then instance_create(x,y,obj_temp5);}}
	    if (obj_ini.fleet_type!=1){with(obj_p_fleet){if (action="") and (capital_number>0) then instance_create(x-24,y+24,obj_temp5);}}
	    if (instance_exists(obj_temp5)){
	        var tixt,final,final2;
	        tixt="A Rogue Trader fleet has arrived in the ";
	        final=instance_nearest(random(room_width),random(room_height),obj_temp5);
	        final2=instance_nearest(final.x,final.y,obj_star);
	        tixt+=final2.name;tixt+=" system to trade.  ";
	        if (obj_ini.fleet_type=1) then tixt+="Wargear is slightly cheaper for the duration of their visit.";
	        if (obj_ini.fleet_type!=1) then tixt+="Present Battle Barges will have access to cheaper wargear for the duration of their visit.";
	        scr_popup("Rogue Trader",tixt,"rogue_trader","");final2.trader+=choose(3,4,5);
	        var bob;bob=instance_create(final2.x+16,final2.y-24,obj_star_event);bob.image_alpha=1;bob.image_speed=1;
	        with(obj_temp5){instance_destroy();}
	        evented=1;
	    }
	}





	if (thatone="fleet_delay") and (run=true){debugl("RE: Fleet Delay");
	    with(obj_temp5){instance_destroy();}
	    with(obj_p_fleet){if (action!=""){x-=20000;y-=20000;}}
    
	    var that;that=instance_nearest(random(room_width),random(room_height),obj_p_fleet);
    
	    if (that.action="move"){
	        // scr_random_find(1,false,"move","");
	            var targ,tixt,delay;targ=0;that=0;delay=0;
	            if (instance_exists(that)){
	                delay=choose(1,2,2,3);that.action_eta+=delay;tixt="Eldar pirates have attacked your fleet destined for ";
	                var bob;xx=that.action_x;yy=that.action_y;bob=instance_nearest(xx,yy,obj_star);
	                tixt+=string(bob.name)+".  Damage was minimal but the voyage has been delayed by "+string(delay)+" months.";
	                scr_popup("Fleet Attacked",tixt,"","");evented=1;
	                bob=instance_create(obj_temp5.x+16,obj_temp5.y-24,obj_star_event);bob.image_alpha=1;bob.image_speed=1;
	        }
	    }
	    with(obj_temp5){instance_destroy();}
	    instance_activate_object(obj_p_fleet);
	}
    
	if (thatone="harlequins") and (run=true){debugl("RE: Harlequins");
	    with(obj_temp5){instance_destroy();}
	    var onceh,that,that2,planet,tixt;onceh=0;planet=0;tixt="";
	    with(obj_star){if (owner<=5) and (planets>0) then instance_create(x,y,obj_temp5);}
	    that=instance_nearest(random(room_width),random(room_height),obj_temp5);
	    that2=instance_nearest(that.x,that.y,obj_star);
	    planet=floor(random(that2.planets))+1;
	    if (that2.p_problem[planet,1]="") and (onceh=0){onceh=1;that2.p_problem[planet,1]="harlequins";that2.p_timer[planet,1]=choose(2,3,4,5);}
	    if (that2.p_problem[planet,2]="") and (onceh=0){onceh=1;that2.p_problem[planet,2]="harlequins";that2.p_timer[planet,2]=choose(2,3,4,5);}
	    if (that2.p_problem[planet,3]="") and (onceh=0){onceh=1;that2.p_problem[planet,3]="harlequins";that2.p_timer[planet,3]=choose(2,3,4,5);}
	    if (that2.p_problem[planet,4]="") and (onceh=0){onceh=1;that2.p_problem[planet,4]="harlequins";that2.p_timer[planet,4]=choose(2,3,4,5);}
	    with(obj_temp5){instance_destroy();}
	    tixt="Eldar Harlequins have been seen on planet "+string(that2.name);
	    if (planet=1) then tixt+=" I.";if (planet=2) then tixt+=" II.";if (planet=3) then tixt+=" III.";if (planet=4) then tixt+=" IV.";
	    tixt+="  Their purposes are unknown.";
	    scr_popup("Harlequin Troupe",tixt,"harlequin","");
	    bob=instance_create(that2.x+16,that2.y-24,obj_star_event);bob.image_alpha=1;bob.image_speed=1;bob.col="green";
	}
    
	if (thatone="succession_war") and (run=true){debugl("RE: Succession War");
	    with(obj_temp5){instance_destroy();}
	    with(obj_star){
	        if (owner=2) and (planets>0){
	            var ok;ok[0]=0;
	            ok[1]=0;if (p_type[1]!="Dead") and (p_type[1]!="Lava") and (p_type[1]!="Ice") then ok[1]=1;
	            ok[2]=0;if (p_type[2]!="Dead") and (p_type[2]!="Lava") and (p_type[2]!="Ice") then ok[2]=1;
	            ok[3]=0;if (p_type[3]!="Dead") and (p_type[3]!="Lava") and (p_type[3]!="Ice") then ok[3]=1;
	            ok[4]=0;if (p_type[4]!="Dead") and (p_type[4]!="Lava") and (p_type[4]!="Ice") then ok[4]=1;
	            if (ok[1]+ok[2]+ok[3]+ok[4]>0) then instance_create(x,y,obj_temp5);
	        }
	    }
	    if (instance_exists(obj_temp5)){
	        var targ,targ2,tixt;targ=0;targ2=0;
	        var k,yep;k=0;yep=0;
	        targ=instance_nearest(random(room_width),random(room_height),obj_temp5);targ2=instance_nearest(targ.x,targ.y,obj_star);
        
	        if (instance_exists(targ2)){
	            repeat(10){
	                if (yep=0){k=floor(random(targ2.planets))+1;}
	                if (targ2.p_feature[k]="") and (yep=0) and (targ2.p_type[k]!="Dead") and (targ2.p_type[k]!="Lava") and (targ2.p_type[k]!="Ice"){yep=k;}
	            }
	            if (yep>0){
	                targ2.p_feature[k]="War of Succession|";
	                tixt=string(targ2.name);
	                if (yep=1) then tixt+=" I";if (yep=2) then tixt+=" II";if (yep=3) then tixt+=" III";if (yep=4) then tixt+=" IV";
	                var om;om=0;
	                if (targ2.p_problem[yep,4]="") then om=4;if (targ2.p_problem[yep,3]="") then om=3;
	                if (targ2.p_problem[yep,2]="") then om=2;if (targ2.p_problem[yep,1]="") then om=1;
	                targ2.p_problem[yep,om]="succession";targ2.dispo[yep,om]=-5000;targ2.p_timer[yep,om]=floor(random(6))+4;
                
	                scr_popup("War of Succession","The planetary governor of "+string(tixt)+" has died.  Several subordinates and other parties each claim to be the true heir and successor- war has erupted across the planet as a result.  Heresy thrives in chaos.","succession","");evented=1;
	                bob=instance_create(targ2.x+16,targ2.y-24,obj_star_event);bob.image_alpha=1;bob.image_speed=1;bob.col="red";
	                scr_event_log("red","War of Succession on "+string(tixt));
                
	                evented=1;
	            }
	        }
	        with(obj_temp5){instance_destroy();}
	    }
	}
    
	if (thatone="random_fun") and (run=true){debugl("RE: Random");
	    var a,b,stri;
	    a=floor(random(5))+1;
	    b=floor(random(12))+1;
	    if (a=1) then stri="Alien contamination in ";
	    if (a=2) then stri="Servitors misbehaving at ";
	    if (a=3) then stri="Nonhuman presence detected at ";
	    if (a=4) then stri="Critical malfunction in ";
	    if (a=5) then stri="Abnormal warp flux in ";
	    if (b=1) then stri+="the Fortress Monastery.";
	    if (b=2) then stri+="Outpost (Name).";
	    if (b=3) then stri+="Fleet (Name).";
	    if (b=4) then stri+="the Refectory.";
	    if (b=5) then stri+="the Armamentarium.";
	    if (b=6) then stri+="the Librarium.";
	    if (b=7) then stri+="the Apothecarium.";
	    if (b=8) then stri+="the Command sanctum.";
	    if (b=9) then stri+="the Xenos Bestiarium.";
	    if (b=10) then stri+="the Hall of Trophies.";
	    if (b=11) then stri+="the Chapter Crypt.";
	    if (b=12) then stri+="the Chapter Garage.";
	    scr_alert("color","lol",stri,0,0);evented=1;
	}


	if (thatone="warp_storms") and (run=true){debugl("RE: Warp Storm");
	    var own,time,him;own=choose(1,1,2,0,0);time=floor(random_range(6,24))+1;
	    if (string_count("Shitty",obj_ini.strin2)=1) then own=1;
	    scr_random_find(own,true,"","");
	    if (own=1) and (instance_number(obj_temp5)=0) and (instance_exists(obj_p_fleet)){
	        with(obj_p_fleet){if (action="") then instance_create(instance_nearest(x,y,obj_star).x,instance_nearest(x,y,obj_star).y,obj_temp5);}
	    }
	    if (instance_exists(obj_temp5)){
	        him=instance_nearest(obj_temp5.x,obj_temp5.y,obj_star);evented=1;
	        him.storm+=time;
	        if (own!=1) then scr_alert("green","warp","Warp Storms rage across the "+string(him.name)+" system.",him.x,him.y);
	        if (own=1) then scr_alert("red","warp","Warp Storms rage across the "+string(him.name)+" system.",him.x,him.y);
	        with(obj_temp5){instance_destroy();}
	    }
	}
    
    
	if (thatone="enemy_forces") and (run=true){var own,him,enem,enem_txt,plan;own=choose(1,1,2,2,3);enem=choose(9,7,10,8,13);debugl("RE: Enemy Forces");
	    if (enem=8) then enem_txt="Tau";if (enem=7) then enem_txt="Orks";if (enem=9) then enem_txt="Tyranids";
	    if (enem=10) then enem_txt="Heretics";if (enem=13) then enem_txt="Necron";
	    if (string_count("Shitty",obj_ini.strin2)=1) then own=1;
	    if (own=1) and (obj_ini.fleet_type!=1) then own=2;
	    scr_random_find(own,true,"","");
	    if (instance_exists(obj_temp5)){
	        him=instance_nearest(obj_temp5.x,obj_temp5.y,obj_star);evented=1;
	        plan=floor(random(him.planets))+1;
	        repeat(5){if (him.p_type[plan]="Dead") then plan=floor(random(him.planets))+1;if (plan>4) then plan=1;}
	        scr_alert("red","enemy",string(enem_txt)+" forces suddenly appear at "+string(him.name)+" "+string(plan)+"!",him.x,him.y);
	        if (enem=7) then him.p_orks[plan]=4;if (enem=8) then him.p_tau[plan]=4;if (enem=9) then him.p_tyranids[plan]=5;
	        if (enem=10) then him.p_heretics[plan]=4;if (enem=13) then him.p_necrons[plan]=4;
	        with(obj_temp5){instance_destroy();}
	    }
	}
    

	if (thatone="crusade") and (run=true) and (obj_controller.faction_status[2]!="War"){debugl("RE: Crusade");
	    scr_random_find(2,true,"","");
	    if (instance_exists(obj_temp5)){
	        var plant,onceh;onceh=0;plant=instance_nearest(obj_temp5.x,obj_temp5.y,obj_star);
        
	        if (plant.p_problem[1,1]="") and (onceh=0){plant.p_problem[1,1]="great_crusade";plant.p_timer[1,1]=24;onceh=1;}
	        if (plant.p_problem[1,2]="") and (onceh=0){plant.p_problem[1,2]="great_crusade";plant.p_timer[1,2]=24;onceh=1;}
	        if (plant.p_problem[1,3]="") and (onceh=0){plant.p_problem[1,3]="great_crusade";plant.p_timer[1,3]=24;onceh=1;}
	        if (plant.p_problem[1,4]="") and (onceh=0){plant.p_problem[1,4]="great_crusade";plant.p_timer[1,4]=24;onceh=1;}
	        if (plant.p_problem[2,1]="") and (onceh=0){plant.p_problem[2,1]="great_crusade";plant.p_timer[2,1]=24;onceh=1;}
	        if (plant.p_problem[2,2]="") and (onceh=0){plant.p_problem[2,2]="great_crusade";plant.p_timer[2,2]=24;onceh=1;}
        
	        scr_popup("Crusade","Fellow Astartes legions are preparing to embark on a Crusade to a nearby sector.  Your forces are expected at "+string(plant.name)+"; 24 turns from now your ships there shall begin their journey.","crusade","");
	        bob=instance_create(obj_temp5.x+16,obj_temp5.y-24,obj_star_event);bob.image_alpha=1;bob.image_speed=1;
	        scr_event_log("","A Crusade is called; our forces are expected at "+string(plant.name)+" in 24 months.");
	        evented=1;with(obj_temp5){instance_destroy();}
	    }
	}
    
    
	if (thatone="enemy") and (run=true){debugl("RE: Enemy");
	    var who,ev,v,tixt;who=choose(2,3,4,5);v=0;ev=0;tixt="You have made an enemy within the ";
	    repeat(99){v+=1;if (ev=0) and (event[v]="") then ev=v;if (known[who]<2) then who=choose(2,3,4,5);}
	    if (who=5) and (known[5]<2) then who=4;if (who=4) and (known[4]<2) then who=3;if (who=3) and (known[3]<2) then who=choose(2,3);   
	    var fucko;fucko="An enemy has been made within the ";
	    if (who=2){event[ev]="enemy_imperium";tixt+="Imperium";fucko+="Imperium";}
	    if (who=3){event[ev]="enemy_mechanicus";tixt+="Mechanicus";fucko+="Mechanicus";}
	    if (who=4){event[ev]="enemy_inquisition";tixt+="Inquisition";fucko+="Inquisition";}
	    if (who=5){event[ev]="enemy_ecclesiarchy";tixt+="Ecclesiarchy";fucko+="Ecclesiarchy";}
	    event_duration[ev]=floor(random_range(12,96))+1;disposition[who]-=20;
	    tixt+="; relations with them will be soured for the forseable future.";
	    scr_popup("Diplomatic Incident",tixt,"angry","");evented=1;
	    scr_event_log("red",string(fucko));
	}
    
    
	if (thatone="mutation") and (gene_seed>=5) and (run=true){debugl("RE: Gene-Seed Mutation");
	    var tixt;tixt="The Chapter's gene-seed has mutated!  Apothecaries are scrambling to control the damage and prevent further contamination.  What is thy will?";
	    scr_popup("Gene-Seed Mutated!",tixt,"gene_bad","");evented=1;
	    scr_event_log("red","The Chapter Gene-Seed has mutated.");
	}


	if (thatone="ship_lost") and (run=true){debugl("RE: Ship Lost");// show_message("Event: (ship) has been lost in the warp");
	    with(obj_temp5){instance_destroy();}
	    if (instance_exists(obj_p_fleet)){
	        with(obj_p_fleet){if (action="move") then instance_create(x,y,obj_temp5);}
	        if (instance_exists(obj_temp5)){
	            var targ,targ2,tixt, delay;targ=0;targ2=0;delay=0;
	            targ=instance_nearest(xx,yy,obj_temp5);targ2=instance_nearest(targ.x,targ.y,obj_p_fleet);
	            if (instance_exists(targ2)){
	                var total,the_ran,the_one,typ,mines,shippy;typ="";mines=0;shippy=0;
	                total=targ2.capital_number+targ2.frigate_number+targ2.escort_number;
	                the_ran=floor(random(total))+1;
	                if (the_ran<=targ2.capital_number){the_one=the_ran;typ="capital";}
	                if (the_ran>targ2.capital_number) and (the_ran<=targ2.capital_number+targ2.frigate_number) and (targ2.frigate_number>0){the_one=the_ran-targ2.capital_number;typ="frigate";}
	                if (the_ran>targ2.frigate_number+targ2.capital_number) and (targ2.escort_number>0){the_one=the_ran-targ2.capital_number-targ2.frigate_number;typ="escort";}
	                tixt="The ";
	                if (typ="capital"){tixt+="Battle Barge '"+string(targ2.capital[the_one])+"'";shippy=targ2.capital_num[the_one];}
	                if (typ="frigate"){tixt+="Strike Cruiser '"+string(targ2.frigate[the_one])+"'";shippy=targ2.frigate_num[the_one];}
	                if (typ="escort"){tixt+="Escort Frigate '"+string(targ2.escort[the_one])+"'";shippy=targ2.escort_num[the_one];}
	                var com, i, count;count=0;i=0;com=0;
	                repeat(11){i=0;repeat(300){i+=1;if (obj_ini.name[com,i]!="") and (obj_ini.lid[com,i]=shippy) then count+=1;}com+=1;}
	                tixt+=" has been lost to the miasma of the warp."
                
	                scr_event_log("red",string(tixt));
                
	                if (count>0) then tixt+="  "+string(count)+" Battle Brothers were onboard.";
                
                
                
	                var lol,snum;snum=0;lol=instance_create(-500,-500,obj_p_fleet);obj_p_fleet.owner=1;
	                if (typ="capital"){
	                    lol.capital_number=1;lol.capital[1]=targ2.capital[the_one];lol.capital_num[1]=targ2.capital_num[the_one];
	                    targ2.capital[the_one]="";targ2.capital_num[the_one]=0;targ2.capital_number-=1;
	                    obj_ini.ship_location[lol.capital_num[1]]="Lost";
	                    snum=lol.capital_num[1];lol.action="lost";
	                    // obj_ini.ship_location[lol.capital_num[1]]="Warp";
	                }
	                if (typ="frigate"){
	                    lol.frigate_number=1;lol.frigate[1]=targ2.frigate[the_one];lol.frigate_num[1]=targ2.frigate_num[the_one];
	                    targ2.frigate[the_one]="";targ2.frigate_num[the_one]=0;targ2.frigate_number-=1;
	                    obj_ini.ship_location[lol.frigate_num[1]]="Lost";
	                    snum=lol.frigate_num[1];lol.action="lost";
	                    // obj_ini.ship_location[lol.frigate_num[1]]="Warp";
	                }
	                if (typ="escort"){
	                    lol.escort_number=1;lol.escort[1]=targ2.escort[the_one];lol.escort_num[1]=targ2.escort_num[the_one];
	                    targ2.escort[the_one]="";targ2.escort_num[the_one]=0;targ2.escort_number-=1;
	                    obj_ini.ship_location[lol.escort_num[1]]="Lost";
	                    snum=lol.escort_num[1];lol.action="lost";
	                    // obj_ini.ship_location[lol.escort_num[1]]="Warp";
	                }
	                var w;w=0;repeat(20){w=0;
	                    repeat(8){
	                    w+=1;if (targ2.capital[w]="") and (targ2.capital[w+1]!=""){
	                        targ2.capital[w]=targ2.capital[w+1];targ2.capital_num[w]=targ2.capital_num[w+1];
	                        targ2.capital[w+1]="";targ2.capital_num[w+1]=0;}}
	                    w=0;repeat(30){
	                        w+=1;if (targ2.frigate[w]="") and (targ2.frigate[w+1]!=""){
	                        targ2.frigate[w]=targ2.frigate[w+1];targ2.frigate_num[w]=targ2.frigate_num[w+1];
	                        targ2.frigate[w+1]="";targ2.frigate_num[w+1]=0;}}
	                    w=0;repeat(50){
	                        w+=1;if (targ2.escort[w]="") and (targ2.escort[w+1]!=""){
	                        targ2.escort[w]=targ2.escort[w+1];targ2.escort_num[w]=targ2.escort_num[w+1];
	                        targ2.escort[w+1]="";targ2.escort_num[w+1]=0;}}
	                }
	                scr_popup("Ship Lost",tixt,"lost_warp","");evented=1;
                
	                var cah,iii;cah=0;iii=0;
	                repeat(11){iii=0;
	                    repeat(300){iii+=1;
	                        if (obj_ini.lid[cah,iii]=snum) then obj_ini.loc[cah,iii]="Lost";
	                        if (iii<=100){if (obj_ini.veh_lid[cah,iii]=snum) then obj_ini.veh_loc[cah,iii]="Lost";}
                        
	                    }
	                    cah+=1;
	                }
                
	                lol.action="lost";
	                lol.alarm[1]=2;
                
	                if (targ2.capital_number+targ2.frigate_number+targ2.escort_number=0) then with(targ2){instance_destroy();}
	            }
	            with(obj_temp5){instance_destroy();}
	        }
	    }
	}
    
	if (thatone="chaos_invasion") and (run=true){
	    debugl("RE: Chaos Invasion");
    
	    var o,yep,yep2,woop;o=0;yep=true;yep2=false;woop=0;
	    repeat(4){o+=1;if (obj_ini.dis[o]="Psyker Intolerant") then yep=false;}
	    woop=scr_role_count("Chief "+string(obj_ini.role[100,17]),"");
	    var q,q2;q=0;q2=0;
	    repeat(90){
	        if (q2=0){q+=1;
	            if (obj_ini.role[0,q]="Chapter Master"){q2=q;
	                if (string_count("0",obj_ini.spe[0,q2])>0) then yep2=true;
	            }
	        }
	    }
    
	    if (yep!=false) and (woop>0) then scr_popup("The Maw of the Warp Yawns Wide","Chief "+string(obj_ini.role[100,17])+" "+string(obj_ini.name[0,5])+" reports that the barrier between the realm of man and the Immaterium feels thin and tested.","warp","");
	    if ((yep=false) or (woop=0)) and (yep2=true) then scr_popup("The Maw of the Warp Yawns Wide","The barrier between the realm of man and the Immaterium feels thin and tested to you.  Dark forces are afoot.","warp","");
    
	    var who,ev,v;v=0;ev=0;repeat(99){v+=1;if (ev=0) and (event[v]="") then ev=v;}
	    event[ev]="chaos_invasion";event_duration[ev]=1;evented=1;
	}
    
	if (thatone="necron_awaken") and (run=true) and (known[4]!=0){debugl("RE: Necron Tomb Awakens");
	    with(obj_temp5){instance_destroy();}
	    with(obj_star){
	        if (string_count("Necron Tomb|",p_feature[1])>0) or (string_count("Necron Tomb|",p_feature[2])>0) 
	        or (string_count("Necron Tomb|",p_feature[3])>0) or (string_count("Necron Tomb|",p_feature[4])>0) then instance_create(x,y,obj_temp5);
	    }
	    if (instance_number(obj_temp5)>0){
	        var you,you2,plan;
	        you=instance_nearest(random(room_width),random(room_height),obj_temp5);
	        you2=instance_nearest(you.x,you.y,obj_star);plan=0;
	        if (string_count("Necron Tomb|",you2.p_feature[1])>0) and (plan=0) then plan=1;
	        if (string_count("Necron Tomb|",you2.p_feature[2])>0) and (plan=0) then plan=2;
	        if (string_count("Necron Tomb|",you2.p_feature[3])>0) and (plan=0) then plan=3;
	        if (string_count("Necron Tomb|",you2.p_feature[4])>0) and (plan=0) then plan=4;
	        you2.p_feature[plan]=string_replace(you2.p_feature[plan],"Necron Tomb|","Awakened Necron Tomb|");
	        tixt=string(you2.name);
	        if (plan=1) then tixt+=" I";if (plan=2) then tixt+=" II";if (plan=3) then tixt+=" III";if (plan=4) then tixt+=" IV";
	        var om;om=0;
	        scr_event_log("red","The Necron Tomb on "+string(tixt)+" has surged into activity.");
	        scr_popup("Necron Awakening","The Necron Tomb on "+string(tixt)+" has surged into activity.  Rank upon rank of the abominations are pouring out from their tunnels.","necron_tomb","");evented=1;
	        bob=instance_create(you2.x+16,you2.y-24,obj_star_event);bob.image_alpha=1;bob.image_speed=1;bob.col="red";
	        you2.p_pdf[plan]=0;you2.p_necrons[plan]=6;evented=1;
	        if (you2.p_guardsmen[plan]<2000000) then you2.p_guardsmen[plan]=0;
	        if (you2.p_guardsmen[plan]>=2000000) then you2.p_guardsmen[plan]=round(you2.p_guardsmen[plan])/2;
	    }
	    with(obj_temp5){instance_destroy();}
	}


	if (evented=1) and (mush=0){
	    last_event=turn;with(obj_temp5){instance_destroy();}
	    if (random_event_next!="") then random_event_next="";
	}
	if (evented=1) and (mush=1){
	    with(obj_temp5){instance_destroy();}
	    last_mission=turn;
	}


	instance_activate_object(obj_p_fleet);
	with(obj_p_fleet){if (x<-10000){x+=20000;y+=20000;}}
	with(obj_en_fleet){if (x<-10000){x+=20000;y+=20000;}}
	with(obj_star){if (x<-10000){x+=20000;y+=20000;}}


}
