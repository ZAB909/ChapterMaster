function scr_enemy_ai_c() {


	var rando, contin, i;
	rando=0;contin=0;i=0;


	with(obj_star){if (craftworld=1) or (space_hulk=1){x-=20000;y-=20000;}}



	// Orks spread
	if (p_orks[1]>0) or (p_orks[2]>0) or (p_orks[3]>0) or (p_orks[4]>0) then repeat(4){i+=1;
	    contin=0;rando=floor(random(100))+1;// This part handles the spreading
	    // if (rando<30){
	        contin=floor(random(planets))+1;
	        repeat(30){if (p_type[contin]="Dead") or (contin=i) then contin=floor(random(planets))+1;}

	        if (p_owner[i]!=7) or (p_pdf[i]>0) or (p_guardsmen[i]>0) or (p_traitors[i]>0) or (p_tau[i]>0) or (p_orks[i]<3) or (p_player[i]>0) then contin=500;
        
	        if (contin<100){if (p_orks[i]=3) and (p_orks[contin]<2) and (p_type[contin]!="Dead"){p_orks[contin]=2;contin=500;}}
	        if (contin<100){if (p_orks[i]=4) and (p_orks[contin]<2) and (p_type[contin]!="Dead"){p_orks[contin]=3;contin=500;}}
	        if (contin<100){if (p_orks[i]=5) and (p_orks[contin]<3) and (p_type[contin]!="Dead"){p_orks[i]=4;p_orks[contin]=3;contin=500;}}
	        if (contin<100){if (p_orks[i]=6) and (p_orks[contin]<3) and (p_type[contin]!="Dead"){p_orks[contin]=3;contin=500;}}
	    // }
    
	    contin=0;rando=floor(random(100))+1;// This part handles the ship building
	    if (p_population[i]>0) and (p_pdf[i]=0) and (p_guardsmen[i]=0) and (p_traitors[i]=0) and (p_tau[i]=0) and (p_large[i]=0) then p_population[i]=round(p_population[i]*0.97);
	    if (p_population[i]>0) and (p_pdf[i]=0) and (p_guardsmen[i]=0) and (p_traitors[i]=0) and (p_tau[i]=0) and (p_large[i]=1) then p_population[i]-=0.01;
	    // ^ And extermination
    
    
	    var chick;chick=0;
	    if (p_type[1]!="Dead") then chick+=p_owner[1];
	    if (p_type[2]!="Dead") then chick+=p_owner[2];
	    if (p_type[3]!="Dead") then chick+=p_owner[3];
	    if (p_type[4]!="Dead") then chick+=p_owner[4];
	    if (chick/7)=round(chick/7) and (owner = eFACTION.Ork){    
	        contin=1;
	    }
    
	    if (contin=1){
	        if (planets>=1) and ((p_pdf[1]>0) or (p_guardsmen[1]>0) or (p_traitors[1]>0) or (p_tau[1]>0)) then contin=0;
	        if (planets>=2) and ((p_pdf[2]>0) or (p_guardsmen[2]>0) or (p_traitors[2]>0) or (p_tau[2]>0)) then contin=0;
	        if (planets>=3) and ((p_pdf[3]>0) or (p_guardsmen[3]>0) or (p_traitors[3]>0) or (p_tau[3]>0)) then contin=0;
	        if (planets>=4) and ((p_pdf[4]>0) or (p_guardsmen[4]>0) or (p_traitors[4]>0) or (p_tau[4]>0)) then contin=0;
	    }
    
	    if (contin=1){
	        rando=floor(random(100))+1;
	        if (obj_controller.known[eFACTION.Ork]>0) then rando-=10;// Empire bonus, was 15 before
        
	        // Check for industrial facilities
	        if (p_type[i]!="Dead") and (p_type[i]!="Lava"){// Used to not have Ice either
	            if (p_orks[i]>=4){// Have the proppa facilities and size
	                var fleet;fleet=0;contin=2;
	                if (instance_number(obj_en_fleet)=0) then contin=3;
	                if (instance_number(obj_en_fleet)>0) then contin=2;
                
	                if (instance_exists(obj_p_fleet)){
	                    var ppp;ppp=instance_nearest(x,y,obj_p_fleet);
	                    if (point_distance(x,y,ppp.x,ppp.y)<50) and (ppp.action="") then contin=0;
	                }
	                if (contin=2){
	                    fleet=instance_nearest(x+32,y,obj_en_fleet);
	                    if (fleet.owner != eFACTION.Ork) or (point_distance(x+32,y,fleet.x,fleet.y)>5) or (fleet.action!="") then contin=3;
	                    if (fleet.owner = eFACTION.Ork) and (point_distance(x+32,y,fleet.x,fleet.y)<=5) and (fleet.action="") and (contin!=3){
	                        // Increase ship number for this object?
	                        if (rando<=15){// was 25
	                            rando=choose(1,1,1,1,1,1,1,3,3,3,3);
	                            if (rando=1) then fleet.capital_number+=1;
	                            // if (rando=2) then fleet.frigate_number+=1;
	                            if (rando=3) then fleet.escort_number+=1;
	                        }
                        
	                        if (fleet.image_index>=5){
	                            // eh heh heh
	                            var stue, stue2;stue=0;stue2=0;
	                            var goood;goood=0;
                            
	                            with(obj_star){if (planets=1) and (p_type[1]="Dead"){x-=20000;y-=20000;}}
	                            stue=instance_nearest(fleet.x,fleet.y,obj_star);
	                            with(obj_star){if (planets=1) and (p_type[1]="Dead"){x+=20000;y+=20000;}}
                            
	                            with(obj_temp_inq){instance_destroy();}
	                            with(obj_star){
	                                if (owner != eFACTION.Ork){
	                                    if (p_type[1]!="Dead") and (p_owner[1]!=7) and (goood=0) then goood=1;
	                                    if (p_type[2]!="Dead") and (p_owner[2]!=7) and (goood=0) then goood=1;
	                                    if (p_type[3]!="Dead") and (p_owner[3]!=7) and (goood=0) then goood=1;
	                                    if (p_type[4]!="Dead") and (p_owner[4]!=7) and (goood=0) then goood=1;
	                                    if (goood=1) then instance_create(x,y,obj_temp_inq);
	                                }
	                            }
                            
	                            if (instance_exists(obj_temp_inq)){
	                                var stue3;stue3=instance_nearest(x,y,obj_temp_inq);
	                                stue2=instance_nearest(stue3.x,stue3.y,obj_star);
	                                fleet.action_x=stue2.x;fleet.action_y=stue2.y;fleet.alarm[4]=1;
	                            }
	                            with(obj_temp_inq){instance_destroy();}
                            
	                        }
	                    }
	                }
	                if (contin=3) and (rando<=25){// Create a fleet
	                    // fleet=instance_create
	                    fleet=instance_create(x+32,y,obj_en_fleet);
	                    fleet.owner = eFACTION.Ork;
	                    fleet.sprite_index=spr_fleet_ork;
	                    fleet.image_index=1;
	                    fleet.capital_number=1;
	                    present_fleet[7]+=1;
	                }
	                /*if (fleet!=0){
	                    if (instance_exists(fleet)) then with(fleet){
	                        var ii;ii=0;ii+=capital_number;ii+=round((frigate_number/2));ii+=round((escort_number/4));
	                        if (ii<=1) then ii=1;image_index=ii;
	                    }
	                }*/
	            }
	        }
    
	    }
	}


	// This is the ork landing code
	var boat, kay, temp5, temp6, temp7, boat_dist;
	boat=0;kay=0;temp5=0;temp6=0;temp7=0;boat_dist=999;

	instance_activate_object(obj_en_fleet);
	boat=instance_nearest(x,y,obj_en_fleet);
	if (instance_exists(boat)){boat_dist=point_distance(x,y,boat.x,boat.y);}

	var aler;aler=0;

	if (present_fleet[1]+present_fleet[2]=0) and (present_fleet[7]>0) and (boat.owner = eFACTION.Ork) and (boat.action="") and (planets>0){
	    var landi,t1,l;
	    landi=0;t1=0;l=0;
    
	    repeat(4){l+=1;if (t1=0) and (p_tyranids[l]>0) then t1=l;}
	    if (t1>0) then p_tyranids[t1]-=1;
    
	    if (planets>=1) and (p_type[1]!="Dead") and ((p_guardsmen[1]+p_pdf[1]+p_player[1]+p_traitors[1]+p_tau[1]>0) or ((p_owner[1]!=7) and (p_orks[1]<=0))) then landi=1;
	    if (planets>=2) and (p_type[2]!="Dead") and ((p_guardsmen[2]+p_pdf[2]+p_player[2]+p_traitors[2]+p_tau[2]>0) or ((p_owner[2]!=7) and (p_orks[2]<=0))) then landi=1;
	    if (planets>=3) and (p_type[3]!="Dead") and ((p_guardsmen[3]+p_pdf[3]+p_player[3]+p_traitors[3]+p_tau[3]>0) or ((p_owner[3]!=7) and (p_orks[3]<=0))) then landi=1;
	    if (planets>=4) and (p_type[4]!="Dead") and ((p_guardsmen[4]+p_pdf[4]+p_player[4]+p_traitors[4]+p_tau[4]>0) or ((p_owner[4]!=7) and (p_orks[4]<=0))) then landi=1;
    
    
	    var i;i=5;
    
	    if (landi=1) then repeat(4){i-=1;
	        if (p_type[i]!="Dead") and (p_orks[i]<4) and (i<=planets) and (instance_exists(boat)){
	            p_orks[i]+=max(2,floor(boat.image_index*0.8));
            
	            with(obj_temp2){instance_destroy();}
	            obj_controller.temp[1049]=self.name;
	            with(obj_en_fleet){
	                if (trade_goods="WL7") and (instance_exists(orbiting)){safe=1;
	                    if (orbiting.name=obj_controller.temp[1049]) then instance_create(x,y,obj_temp2);
	                }
	            }
	            if (instance_exists(obj_temp2)){array_push(feature[i], new new_planet_feature(P_features.Warlord7));p_orks[i]=6;}
	            with(obj_temp2){instance_destroy();}
            
	            if (p_orks[i]>6) then p_orks[i]=6;
	            with(boat){instance_destroy();}
	            aler=1;
	        }
	    }
    
	if (aler>0) then scr_alert("green","owner","Ork ships have crashed across the "+string(name)+" system.",x,y);


	}// End landing portion of code



	if (kay>0) and (kay!=50){       // Think this was generating problems
	    with(boat){instance_destroy();}
	}// End landing portion of code










	// traitors below here
	i=0;
	if (p_traitors[1]>0) or (p_traitors[2]>0) or (p_traitors[3]>0) or (p_traitors[4]>0) then repeat(4){i+=1;
    
	    contin=0;rando=floor(random(100))+1;// This part handles the spreading
	    // if (rando<30){
	        contin=floor(random(planets))+1;
	        repeat(30){if (p_type[contin]="Dead") or (contin=i) then contin=floor(random(planets))+1;}

	        if (p_pdf[i]>0) or (p_guardsmen[i]>0) or (p_orks[i]>0) or (p_tau[i]>0) or (p_traitors[i]<2) then contin=500;
        
	        // if (contin<100) then show_message(string(name)+"."+string(i)+" to "+string(contin));
        
	        if (contin<100){if (p_traitors[i]=3) and (p_traitors[contin]<2) and (p_type[contin]!="Dead"){p_traitors[contin]+=1;contin=500;}}
	        if (contin<100){if (p_traitors[i]=4) and (p_traitors[contin]<2) and (p_type[contin]!="Dead"){p_traitors[contin]+=1;contin=500;}}
	        if (contin<100){if (p_traitors[i]=5) and (p_traitors[contin]<3) and (p_type[contin]!="Dead"){p_traitors[contin]+=1;contin=500;}}
	        if (contin<100){if (p_traitors[i]=6) and (p_traitors[contin]<3) and (p_type[contin]!="Dead"){p_traitors[contin]+=1;contin=500;}}
	    // }
    
    
    
    
	    contin=0;rando=floor(random(100))+1;// This part handles the ship building
    
	    if (planets=1) and (p_owner[1]=10) then contin=1;
	    if (planets=2) and (p_owner[1]=10) and (p_owner[2]=10) then contin=1;
	    if (planets=3) and (p_owner[1]=10) and (p_owner[2]=10) and (p_owner[3]=10) then contin=1;
	    if (planets=4) and (p_owner[1]=10) and (p_owner[2]=10) and (p_owner[3]=10) and (p_owner[4]=10) then contin=1;
    
	    if (contin=1){
	        if (planets>=1) and ((p_pdf[1]>0) or (p_guardsmen[1]>0) or (p_orks[1]>0) or (p_tau[1]>0)) then contin=0;
	        if (planets>=2) and ((p_pdf[2]>0) or (p_guardsmen[2]>0) or (p_orks[2]>0) or (p_tau[2]>0)) then contin=0;
	        if (planets>=3) and ((p_pdf[3]>0) or (p_guardsmen[3]>0) or (p_orks[3]>0) or (p_tau[3]>0)) then contin=0;
	        if (planets>=4) and ((p_pdf[4]>0) or (p_guardsmen[4]>0) or (p_orks[4]>0) or (p_tau[4]>0)) then contin=0;
	    }
    
	    if (contin=1){
	        rando=floor(random(100))+1;
	        // Check for industrial facilities
	        if (p_type[i]!="Dead") and (p_type[i]!="Lava"){
	            if (p_traitors[i]>=2) and (p_heresy[i]>=80){// Have the proppa facilities and size
	                var fleet;fleet=0;contin=2;
	                if (instance_number(obj_en_fleet)=0) then contin=3;
	                if (instance_number(obj_en_fleet)>0) then contin=2;
                
	                if (instance_exists(obj_p_fleet)){
	                    var ppp;ppp=instance_nearest(x,y,obj_p_fleet);
	                    if (point_distance(x,y,ppp.x,ppp.y)<50) and (ppp.action="") then contin=0;
	                }
                
	                if (contin=2){
	                    fleet=instance_nearest(x-32,y,obj_en_fleet);
	                    if (fleet.owner != eFACTION.Chaos) or (point_distance(x-32,y,fleet.x,fleet.y)>5) or (fleet.action!="") then contin=3;
	                    if (fleet.owner = eFACTION.Chaos) and (point_distance(x-32,y,fleet.x,fleet.y)<=5) and (fleet.action="") and (contin!=3){
	                        // Increase ship number for this object?
	                        if (rando<=20){// was 25
	                            rando=choose(1,2,2,3,3,3,3);
	                            if (rando=1) then fleet.capital_number+=1;
	                            if (rando=2) then fleet.frigate_number+=1;
	                            if (rando=3) then fleet.escort_number+=1;
	                        }
                        
	                        if (fleet.image_index>=5){
	                            // eh heh heh
	                            var stue, stue2;stue=0;stue2=0;
	                            var goood;goood=0;
                            
	                            with(obj_star){if (planets=1) and (p_type[1]="Dead"){x-=20000;y-=20000;}}
	                            stue=instance_nearest(fleet.x,fleet.y,obj_star);
	                            with(stue){x-=20000;y-=20000;}
                            
	                            repeat(10){
	                                if (goood=0){
	                                    stue2=instance_nearest(fleet.x+choose(random(400),random(400)*-1),fleet.y+choose(random(100),random(100)*-1),obj_star);
	                                    if (stue2.owner != eFACTION.Chaos) then goood=1;
	                                    if (stue2.planets=0) then goood=0;
	                                    if (stue.present_fleet[10]>0) then goood=0;
	                                    if (stue2.planets=1) and (stue2.p_type[1]="Dead") then goood=0;
	                                }
	                            }
	                            fleet.action_x=stue2.x;fleet.action_y=stue2.y;fleet.alarm[4]=1;
	                            instance_activate_object(obj_star);
	                        }
	                    }
	                }
	                if (contin=3) and (rando<=25) and ((obj_controller.chaos_fleets+15)<instance_number(obj_star)){// Create a fleet
	                    // fleet=instance_create
	                    fleet=instance_create(x-32,y,obj_en_fleet);
	                    fleet.owner = eFACTION.Chaos;
	                    fleet.sprite_index=spr_fleet_chaos;
	                    fleet.image_index=1;
	                    fleet.frigate_number=1;
	                    fleet.escort_number=2;
	                    present_fleet[10]+=1;
	                    obj_controller.chaos_fleets+=1;
	                }
	                /*if (fleet!=0){
	                    if (instance_exists(fleet)) then with(fleet){
	                        var ii;ii=0;ii+=capital_number;ii+=round((frigate_number/2));ii+=round((escort_number/4));
	                        if (ii<=1) then ii=1;image_index=ii;
	                    }
	                }*/
	            }
	        }
    
	    }
	}

	// This is the traitors corruption code
	var boat, kay, temp5, temp6, temp7;
	boat=0;kay=0;temp5=0;temp6=0;temp7=0;

	boat=instance_nearest(x-32,y,obj_en_fleet);

	if (present_fleet[10]>0) and (present_fleet[1]+present_fleet[2]=0) and (boat.owner = eFACTION.Chaos) and (boat.action="") and (owner != eFACTION.Chaos) and (planets>0){

	var i;i=0;
	    repeat(5){
	        if (p_type[1]!="Dead") and (p_owner[1]!=10) then kay=1;if (p_type[2]!="Dead") and (p_owner[2]!=10) then kay=2;
	        if (p_type[3]!="Dead") and (p_owner[3]!=10) then kay=3;if (p_type[4]!="Dead") and (p_owner[4]!=10) then kay=4;
                
	        if (p_type[4]="Desert") and (p_owner[4]!=10) then kay=14;if (p_type[3]="Desert") and (p_owner[3]!=10) then kay=3;
	        if (p_type[2]="Desert") and (p_owner[2]!=10) then kay=12;if (p_type[1]="Desert") and (p_owner[1]!=10) then kay=1;
                
	        if (p_type[4]="Temperate") and (p_owner[4]!=10) then kay=4;if (p_type[3]="Temperate") and (p_owner[3]!=10) then kay=3;
	        if (p_type[2]="Temperate") and (p_owner[2]!=10) then kay=2;if (p_type[1]="Temperate") and (p_owner[1]!=10) then kay=1;
                
	        if (p_type[4]="Hive") and (p_owner[4]!=10) then kay=4;if (p_type[3]="Hive") and (p_owner[3]!=10) then kay=3;
	        if (p_type[2]="Hive") and (p_owner[2]!=10) then kay=2;if (p_type[1]="Hive") and (p_owner[1]!=10) then kay=1;
        
	        if (kay>4) then kay=50;
        
	        if (kay>0) and (kay!=50){// Ere we go!    
	            var cor;cor=floor(image_index)+1;
            
	            if (p_type[kay]="Shrine") then cor=round(cor/3);
	            if (p_type[kay]!="Dead"){p_heresy[kay]+=cor;if (p_heresy[kay]>=70) and (p_traitors[kay]<2) then p_traitors[kay]+=1;}
	        }
	        i+=1;
	    }// End repeat
	}// End corruption code


	// This is the CSM landing code
	var boat, kay, temp5, temp6, temp7, boat_dist;
	boat=0;kay=0;temp5=0;temp6=0;temp7=0;boat_dist=999;

	boat=instance_nearest(x-32,y,obj_en_fleet);
	if (instance_exists(boat)){boat_dist=point_distance(x,y,boat.x,boat.y);}
	var aler;aler=0;
	if (present_fleet[10]>0) and (present_fleet[1]+present_fleet[2]=0) and (boat.owner = eFACTION.Chaos) and (boat.action="") and (planets>0) and (boat_dist<=40){

	    var ii,gud;ii=0;gud=0;
	    repeat(4){ii+=1;if (gud=0){if (planets>=ii) and (p_type[ii]!="Dead") and (p_owner[ii]!=10) then gud=ii;}}
    
	    if (gud!=0) and (instance_exists(boat)){
	        if (boat.trade_goods="csm"){
	            if (p_chaos[gud]<4){
	                p_chaos[gud]+=max(1,floor(boat.image_index*0.5));
	                if (p_chaos[gud]>4) then p_chaos[gud]=4;
	            }
	            if (p_traitors[gud]<5){
	                p_traitors[gud]+=max(2,floor(boat.image_index*0.5));
	                if (p_traitors[gud]>5) then p_traitors[gud]=5;
	            }
	        }
	    }
	}// End landing portion of code









	// Tau Here
	i=0;

	if (p_tau[1]>0) or (p_tau[2]>0) or (p_tau[3]>0) or (p_tau[4]>0) then repeat(4){i+=1;
    
	    contin=0;rando=floor(random(100))+1;// This part handles the spreading
	    // if (rando<30){
	        contin=floor(random(planets))+1;
	        repeat(30){if (p_type[contin]="Dead") or (contin=i) then contin=floor(random(planets))+1;}

	        if (p_pdf[i]>0) or (p_guardsmen[i]>0) or (p_orks[i]>0) or (p_traitors[i]>0) or (p_eldar[i]>2) or (p_tau[i]<2) then contin=500;
        
	        // if (contin<100) then show_message(string(name)+"."+string(i)+" to "+string(contin));
        
	        if (contin<100){if (p_tau[i]=3) and (p_tau[contin]<2) and (p_type[contin]!="Dead") and (p_population[contin]>0){p_tau[contin]+=1;contin=500;}}
	        if (contin<100){if (p_tau[i]=4) and (p_tau[contin]<2) and (p_type[contin]!="Dead") and (p_population[contin]>0){p_tau[contin]+=1;contin=500;}}
	        if (contin<100){if (p_tau[i]=5) and (p_tau[contin]<3) and (p_type[contin]!="Dead") and (p_population[contin]>0){p_tau[contin]+=1;contin=500;}}
	        if (contin<100){if (p_tau[i]=6) and (p_tau[contin]<3) and (p_type[contin]!="Dead") and (p_population[contin]>0){p_tau[contin]+=1;contin=500;}}
	    // }
    
    
    
    
	    contin=0;rando=floor(random(100))+1;// This part handles the ship building
    
	    if (planets=1) and (p_owner[1]=8) then contin=1;
	    if (planets=2) and (p_owner[1]=8) and (p_owner[2]=8) then contin=1;
	    if (planets=3) and (p_owner[1]=8) and (p_owner[2]=8) and (p_owner[3]=8) then contin=1;
	    if (planets=4) and (p_owner[1]=8) and (p_owner[2]=8) and (p_owner[3]=8) and (p_owner[4]=8) then contin=1;
    
	    if (contin=1){
	        if (planets>=1) and ((p_orks[1]>0) or (p_traitors[1]>0) or (p_eldar[1]>0)) then contin=0;
	        if (planets>=2) and ((p_orks[2]>0) or (p_traitors[2]>0) or (p_eldar[2]>0)) then contin=0;
	        if (planets>=3) and ((p_orks[3]>0) or (p_traitors[3]>0) or (p_eldar[3]>0)) then contin=0;
	        if (planets>=4) and ((p_orks[4]>0) or (p_traitors[4]>0) or (p_eldar[4]>0)) then contin=0;
	    }
    
	    if (contin=1){
	        rando=floor(random(100))+1;
	        // Check for industrial facilities
	        if (p_type[i]!="Dead") and (p_type[i]!="Lava"){
	            if (p_tau[i]>=2) and (p_influence[i]>=70){// Have the proppa facilities and size
	                var fleet;fleet=0;contin=2;
	                if (instance_number(obj_en_fleet)=0) then contin=3;
	                if (instance_number(obj_en_fleet)>0) then contin=2;
                
	                if (instance_exists(obj_p_fleet)){
	                    var ppp;ppp=instance_nearest(x,y,obj_p_fleet);
	                    if (point_distance(x,y,ppp.x,ppp.y)<50) and (ppp.action="") then contin=0;
	                }
                
	                if (contin=2){
	                    fleet=instance_nearest(x-24,y-24,obj_en_fleet);
	                    if (fleet.owner != eFACTION.Tau) or (point_distance(x-24,y-24,fleet.x,fleet.y)>5) or (fleet.action!="") then contin=3;
	                    if (fleet.owner = eFACTION.Tau) and (point_distance(x-24,y-24,fleet.x,fleet.y)<=5) and (fleet.action="") and (contin!=3){
	                        // Increase ship number for this object?
	                        if (rando<=10) and (fleet.image_index<5){
	                            rando=choose(1,2,2,3,3,3,3);
	                            if (rando=1) then fleet.capital_number+=1;
	                            if (rando=2) then fleet.frigate_number+=1;
	                            if (rando=3) then fleet.escort_number+=1;
	                        }
                        
                        
	                        if (fleet.image_index>=5){
	                            var kawaii, think, xx, yy;
	                            kawaii=0;think=0;xx=0;yy=0;
                            
	                            repeat(50){
	                                if (think=0) and (kawaii=0){
	                                    xx=x+floor(choose(random(300),random(300)*-1));
	                                    yy=y+floor(choose(random(300),random(300)*-1));
	                                    think=instance_nearest(xx,yy,obj_star);
	                                    if (think.owner != eFACTION.Tau) and (think.owner != eFACTION.Eldar) and (think.present_fleet[8]+think.present_fleet[1]+think.present_fleet[2]=0) and (think.planets>0) then kawaii=1;
	                                    if (think.owner = eFACTION.Tau) or (think.present_fleet[8]+think.present_fleet[1]+think.present_fleet[2]>0) or (think.planets=0) then kawaii=0;
	                                    if (think.planets=1) and (think.p_type[1]="Dead") then kawaii=0;
	                                    if (think.present_fleet[8]>0) then kawaii=0;
                                    
	                                    if (kawaii=0) then think=0;
	                                }
	                            }
                            
	                            if (kawaii=1) and (instance_exists(obj_crusade)){// NOPE, stay home and defend
	                                var him,own,dis;
	                                him=instance_nearest(x,y,obj_crusade);
	                                own=him.owner;dis=him.radius;
	                                if (point_distance(x,y,him.x,him.y)<=dis) then kawaii=0;
	                            }
	                            if (kawaii=1){//Go out and take planet
	                                fleet.action_x=think.x;fleet.action_y=think.y;fleet.alarm[4]=1;
	                            }
                            
	                            instance_activate_object(obj_star);
                            
                        
                        
                        
	                        }
                        
                        
                        
                        
	                    }
	                }
	                if (contin=3) and (rando<=25) and (obj_controller.tau_fleets<(obj_controller.tau_stars+1)){// Create a fleet
	                    fleet=instance_create(x-24,y-24,obj_en_fleet);
	                    fleet.owner = eFACTION.Tau;
	                    fleet.sprite_index=spr_fleet_tau;
	                    fleet.image_index=1;
	                    fleet.capital_number=1;
	                    present_fleet[8]+=1;
	                    obj_controller.tau_fleets+=1;
	                }
	                /*if (fleet!=0){
	                    if (instance_exists(fleet)) then with(fleet){
	                        var ii;ii=0;ii+=capital_number;ii+=round((frigate_number/2));ii+=round((escort_number/4));
	                        if (ii<=1) then ii=1;image_index=ii;
	                    }
	                }*/
	            }
	        }
    
	    }
	}



	// Tyranids here
	var i;i=0;
	repeat(4){i+=1;
	    if (p_tyranids[i]>=5) and (planets>=i) and (p_player[i]+p_orks[i]+p_guardsmen[i]+p_pdf[i]+p_chaos[i]=0){
	        var ship;ship=instance_nearest(x,y+32,obj_en_fleet);
	        if (point_distance(x,y+32,ship.x,ship.y)<5) and (ship.owner = eFACTION.Tyranids) and (ship.capital_number>0) and (p_type[i]!="Dead") and (array_length(p_feature[i])!=0){
	            if (planet_feature_bool(p_feature[i], P_features.Reclamation_pools) ==1){
	                p_tyranids[i]=0;
	                if (p_type[i]="Death") or (p_type[i]="Hive") then ship.capital_number+=choose(0,1,1);
	                ship.capital_number+=1;
	                ship.escort_number+=3;
	                ship.image_index=floor((ship.capital_number)+(ship.frigate_number/2)+(ship.escort_number/4));
	                p_type[i]="Dead";
					delete_features(p_feature[i], P_features.Reclamation_pools);// show_message("D");
	                if (planets=1) and (p_type[1]="Dead") then image_alpha=0.33;
	                if (planets=2) and (p_type[1]="Dead") and (p_type[2]="Dead") then image_alpha=0.33;
	                if (planets=3) and (p_type[1]="Dead") and (p_type[2]="Dead") and (p_type[3]="Dead") then image_alpha=0.33;
	                if (planets=4) and (p_type[1]="Dead") and (p_type[2]="Dead") and (p_type[3]="Dead") and (p_type[4]="Dead") then image_alpha=0.33;
                
                
	                // if image_alpha = 0.33 then send the ship somewhere new
                
	            }
	            if (planet_feature_bool(p_feature[i], P_features.Capillary_Towers)==1) and (p_type[i]!="Dead"){p_population[i]=floor(p_population[i]*0.3);}
	            if (planet_feature_bool(p_feature[i], P_features.Capillary_Towers)==1) and (p_type[i]!="Dead"){
	                p_feature[i]=[];
					array_push(p_feature[i], new new_planet_feature(P_features.Capillary_Towers), new new_planet_feature(P_features.Reclamation_pools));
	                p_population[i]=0;// show_message("C");
	            }
	            if (planet_feature_bool(p_feature[i], P_features.Capillary_Towers)==0) and (planet_feature_bool(p_feature[i], P_features.Reclamation_pools)==0) and (p_type[i]!="Dead"){
					array_push(p_feature[i], new new_planet_feature(P_features.Capillary_Towers));// show_message("B");
	            }
	        }
	    }
	}



	with(obj_star){
	    if (x<-10000){x+=20000;y+=20000;}
	    if (x<-10000){x+=20000;y+=20000;}
	    if (x<-10000){x+=20000;y+=20000;}
	}


}
