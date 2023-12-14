function scr_turn_first() {

	// I believe this is ran at the start of the end of the turn.  That would make sense, right?

	identifiable=0;
	unload=0;
	repeat(artifacts){unload+=1;
	    if (obj_ini.artifact_identified[unload]>0){
	        if (obj_ini.artifact_loc[unload]=obj_ini.home_name) then identifiable=1;
	        if (obj_ini.artifact_sid[unload]>=500){
	            if (obj_ini.ship_location[obj_ini.artifact_sid[unload]-500]=obj_ini.home_name) then identifiable=1;
	        }
        
	        if (instance_exists(obj_p_fleet)) and (identifiable=0){
	            with(obj_p_fleet){
	                var i,good;i=0;good=0;
	                repeat(20){i+=1;
	                    if (i<=9){if (capital_num[i]=obj_ini.artifact_sid[other.unload]-500) then good=1;}
	                    if (frigate_num[i]=obj_ini.artifact_sid[other.unload]-500) then good=1;
	                    if (escort_num[i]=obj_ini.artifact_sid[other.unload]-500) then good=1;
	                }
	                if (good=1) and (capital_number>0) then good=2;
	                if (good=2) then obj_controller.identifiable=1;
	            }
	        }
        
	        if (obj_ini.artifact[unload]!=""){
	            if (identifiable=1) then obj_ini.artifact_identified[unload]-=1;
	            if (obj_ini.artifact_identified[unload]=0) then scr_alert("green","artifact","Artifact ("+string(obj_ini.artifact[unload])+") has been identified.",0,0);
	        }
	    }
	    identifiable=0;
	}
	identifiable=0;unload=0;


	var peace_check,host_p,ox,oy,x5,y5,fdir;
	peace_check=0;ox=0;oy=0;x5=0;y5=0;fdir=0;
	if (floor(turn/90)==turn/90) then peace_check=1;
	// peace_check=1;// Testing
	host_p=0;

	if (peace_check>0){
	    with(obj_temp3){instance_destroy();}
		var baddy, total;
		total = 0;
	    with(obj_star){
	        if (owner>5){
				baddy = 0;
				o = 0;
	            repeat(4){
					o+=1;
					if (p_orks[o]+p_tyranids[o]+p_chaos[o]+p_traitors[o]+p_necrons[o]>=3) then baddy+=1;
				}
	            if (baddy>0) {
					total++;
				}
	        }
	    }
	    if (total<=3) then peace_check=2;
    
	    // More Testing
	    // peace_check=2;
    
	    if (peace_check=2){
	        var did_so;did_so=false;
	        if (turn>=150) and (faction_defeated[10]=0) and (known[eFACTION.Chaos]=0) and (faction_gender[10]=2){
	        // if (turn>=100000) and (faction_defeated[10]=0) and (known[eFACTION.Chaos]=0){faction_gender[10]=2;
	            with(obj_turn_end){audiences+=1;audien[audiences]=10;known[eFACTION.Chaos]=2;audien_topic[audiences]="intro";did_so=true;}
	            fdir=terra_direction+choose(-90,90);
				fdir+=floor(random_range(-35,35));
            
	            var len,width,height,t,c,s;
	            width = room_width;height = room_height;
	            t = degtorad(fdir);
				c = abs(cos(t));
				s = abs(sin(t));
	            if (c * height > s * width) {
					len = (width/2) / c;
				} else {
					len = (height/2) / s;
				}
	            ox=width/2+lengthdir_x(len,fdir);
	            oy=height/2+lengthdir_y(len,fdir);
            
	            var nfleet = instance_create(ox,oy,obj_en_fleet);
	            nfleet.owner = eFACTION.Chaos;
				nfleet.sprite_index=spr_fleet_chaos;
	            nfleet.image_index=9;
	            nfleet.home_x=x+lengthdir_x(5000,point_direction(x,y,room_width/2,room_height/2));
	            nfleet.home_y=y+lengthdir_y(5000,point_direction(x,y,room_width/2,room_height/2));
	            nfleet.trade_goods="BLOODBLOODBLOOD";
	            nfleet.capital_number=10;
	            nfleet.frigate_number=20;
	            nfleet.escort_number=40;
				
				var rep, filtered_array, candidate_systems;
				candidate_systems = [];
	            with(obj_star){
					rep=0;
					ya=false;
					//should probably get turned into its own helper if used multiple times
					filtered_array = array_filter(p_owner, function(val, idx) {
						return scr_is_planet_owned_by_allies(self, idx)
					})
					if array_length(filtered_array)
						array_push(candidate_systems, self)
	            }
				
				var skulls = array_reduce(candidate_systems, method({nfleet}, function(prev, curr) {
						if !prev
							return curr
						var prev_dist = point_distance(prev.x, prev.y, nfleet.x, nfleet.y)
						var curr_dist = point_distance(curr.x, curr.y, nfleet.x, nfleet.y)
						
						return (prev_dist > curr_dist) ? curr : prev;
				}),noone)

	            nfleet.action_x=skulls.x;
				nfleet.action_y=skulls.y;
	            nfleet.alarm[4]=1;
            
	            var tix;tix="Chaos Lord "+string(obj_controller.faction_leader[eFACTION.Chaos])+" continues his Black Crusade into Sector "+string(obj_ini.sector_name)+".";
	            scr_alert("purple","lol",string(tix),nfleet.x,nfleet.y);scr_event_log("purple",tix);
	            scr_popup("Black Crusade","A Black Crusade led by the Chaos Lord "+string(obj_controller.faction_leader[eFACTION.Chaos])+" has arrived in "+string(obj_ini.sector_name)+".  His forces have already carved a bloody path through many sectors and yours is next.  "+string(obj_controller.faction_leader[eFACTION.Chaos])+" also seems to be set on killing you.  The Black Crusade's current target is system "+string(skulls.name)+".","","");
	            // title / text / image / speshul
            
	        }
	        if (did_so=false) and (faction_defeated[7]=1){
	            with(obj_turn_end){audiences+=1;audien[audiences]=7;known[eFACTION.Chaos]=2;audien_topic[audiences]="new_warboss";did_so=true;}
            
	            faction_defeated[7]=-1;known[eFACTION.Ork]=0;faction_leader[eFACTION.Ork]=scr_ork_name();
	            faction_title[7]="Warboss";faction_status[eFACTION.Ork]="War";disposition[7]=-40;
            
	            var gold,gnew,starf;gold=faction_gender[7];if (gold=0) then gold=1;gnew=0;
	            repeat(20){if (gnew=0) or (gnew=gold) then gnew=choose(1,2,3,4);}
	            faction_gender[7]=gnew;starf=0;
            
	            var x3,y3,side,fnum;fnum=0;
	            x3=0;y3=0;side=choose("left","right","up","down");
	            if (side="left") then y3=floor(random_range(0,room_height))+1;
	            if (side="right"){y3=floor(random_range(0,room_height))+1;x3=room_width;}
	            if (side="up") then x3=floor(random_range(0,room_width))+1;
	            if (side="down"){x3=floor(random_range(0,room_width))+1;y3=room_height;}
            
				//lots of this can be wrapped into a single with
	            with(obj_star){if (owner = eFACTION.Eldar) then x-=20000;}
	            with(obj_star){if (planets=1) and (p_type[1]="Dead"){x-=20000;y-=20000;}}
	            with(obj_star){if (planets=2) and (p_type[1]="Dead")and (p_type[2]="Dead"){x-=20000;y-=20000;}}
				
	            repeat(8){fnum+=1;
	                var x4,y4,dire;x4=0;y4=0;dire=0;
	                if (fnum=1){
	                    dire=point_direction(x4,y4,room_width/2,room_height/2);
	                    x4=x3+lengthdir_x(60,dire);y4=y3+lengthdir_y(60,dire);
	                }
	                if (fnum>1){
	                    dire=point_direction(x4,y4,room_width/2,room_height/2);
	                    x4=x3+choose(round(random_range(30,50)),round(random_range(-30,-50)));
	                    y4=y3+choose(round(random_range(30,50)),round(random_range(-30,-50)));
	                }
                
	                var nfleet,tplan;nfleet=instance_create(x4,y4,obj_en_fleet);
	                nfleet.owner = eFACTION.Ork;nfleet.sprite_index=spr_fleet_ork;
	                nfleet.capital_number=4;nfleet.frigate_number=10;
	                nfleet.image_index=9;
	                tplan=instance_nearest(nfleet.x,nfleet.y,obj_star);
	                nfleet.action_x=tplan.x;nfleet.action_y=tplan.y;
	                nfleet.alarm[4]=1;
                
	                if (fnum=1){starf=tplan;nfleet.trade_goods="WL7";}
                
	                nfleet.x-=20000;nfleet.y-=20000;
	                tplan.x-=20000;tplan.y-=20000;
	            }
            
	            with(obj_en_fleet){if (x<-14000) and (y<-14000) and (owner = eFACTION.Ork){x+=20000;y+=20000;}}
	            with(obj_star){if (x<-14000) and (y<-14000){x+=20000;y+=20000;}}
	            with(obj_star){if (x<-14000) and (y<-14000){x+=20000;y+=20000;}}
	            with(obj_star){if (x<-14000) and (y<-14000){x+=20000;y+=20000;}}
	            with(obj_star){if (x<-14000) and (y<-14000){x+=20000;y+=20000;}}
	            with(obj_star){if (x<-14000) and (y<-14000){x+=20000;y+=20000;}}
            
	            var tix;tix="Warboss "+string(obj_controller.faction_leader[eFACTION.Ork])+" leads a WAAAGH! into Sector "+string(obj_ini.sector_name)+".";
	            scr_alert("red","lol",string(tix),starf.x,starf.y);scr_event_log("red",tix);
	            scr_popup("WAAAAGH!","A WAAAGH! led by the Warboss "+string(obj_controller.faction_leader[eFACTION.Ork])+" has arrived in "+string(obj_ini.sector_name)+".  With him is a massive Ork fleet.  Numbering in the dozens of battleships, they carry with them countless greenskins.  The forefront of the WAAAGH! is destined for the "+string(starf.name)+" system.","waaagh","");
	        }
	    }
	}


}
