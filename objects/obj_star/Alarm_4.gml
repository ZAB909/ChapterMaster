
var rando,i,contin;
rando=0;i=0;contin=0;


repeat(4){
    i+=1;
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
                if (fleet.owner!=7) or (point_distance(x+32,y,fleet.x,fleet.y)>5) or (fleet.action!="") then contin=3;
                if (fleet.owner=7) and (point_distance(x+32,y,fleet.x,fleet.y)<=5) and (fleet.action="") and (contin!=3){
                    rando=choose(1,1,1,1,1,3,3,3,3);
                    if (rando=1) then fleet.capital_number+=1;
                    // if (rando=2) then fleet.frigate_number+=1;
                    if (rando=3) then fleet.escort_number+=1;
                    
                    if (fleet.image_index>=5){
                        // eh heh heh
                        var stue, stue2;stue=0;stue2=0;
                        var goood;goood=0;
                        
                        with(obj_star){if (planets=1) and (p_type[1]="Dead") then instance_deactivate_object(instance_id_get( 0 ));}
                        stue=instance_nearest(fleet.x,fleet.y,obj_star);
                        instance_deactivate_object(stue);
                        repeat(10){
                            if (goood=0){
                                stue2=instance_nearest(fleet.x+choose(random(400),random(400)*-1),fleet.y+choose(random(100),random(100)*-1),obj_star);
                                if (stue2.owner!=7) then goood=1;
                                
                                
                                if (stue.owner=7) and (instance_exists(stue)){// New code testing
                                    if (stue.present_fleet[7]>0){
                                        var fli;fli=instance_nearest(stue.x,stue.y,obj_en_fleet);
                                        if (fli.action="") and (owner!=7) and (point_distance(stue.x,stue.y,fli.x,fli.y)<60) then goood=1;
                                        var fli;fli=instance_nearest(stue.x,stue.y,obj_p_fleet);
                                        if (fli.action="") and (owner!=7) and (point_distance(stue.x,stue.y,fli.x,fli.y)<60) then goood=1;
                                    }
                                }// End new code testing
                                
                                
                                if (stue2.planets=0) then goood=0;
                                if (stue2.planets=1) and (stue2.p_type[1]="Dead") then goood=0;
                            }
                        }
                        fleet.action_x=stue2.x;fleet.action_y=stue2.y;fleet.alarm[4]=1;// present_fleets-=1;
                        instance_activate_object(obj_star);
                        
                        
                    }
                }
            }
            if (contin=3) and (rando<=25){// Create a fleet
                // fleet=instance_create
                fleet=instance_create(x+32,y,obj_en_fleet);
                fleet.owner=7;
                fleet.sprite_index=spr_fleet_ork;
                fleet.image_index=1;
                fleet.capital_number=2;
                // present_fleets+=1;
            }
        }
    }
}

