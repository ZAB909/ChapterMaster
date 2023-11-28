
// Checks if the planet has industrial facilities to create an ork fleet
var rando=0,contin=0;

for(var i=1; i<=4; i++){
    // Check for industrial facilities
    // Used to not have Ice either
    if(!array_contains(["dead", "lava", "ice"], p_type[i])){
        // Have the proppa facilities and size
        if (p_orks[i]>=4){
            var fleet=0;
            contin=2;
            if (instance_number(obj_en_fleet)==0) then contin=3;
            if (instance_number(obj_en_fleet)>0) then contin=2;
            
            if (instance_exists(obj_p_fleet)){
                var nearestPlayerFleet=instance_nearest(x,y,obj_p_fleet);
                if (point_distance(x,y,nearestPlayerFleet.x,nearestPlayerFleet.y)<50) and (nearestPlayerFleet.action=="") then contin=0;
            }
            if (contin==2){
                fleet=instance_nearest(x+32,y,obj_en_fleet);
                if (fleet.owner != eFACTION.Ork) or (point_distance(x+32,y,fleet.x,fleet.y)>5) or (fleet.action!="") then contin=3;
                if (fleet.owner == eFACTION.Ork) and (point_distance(x+32,y,fleet.x,fleet.y)<=5) and (fleet.action=="") and (contin!=3){
                    rando=choose(1,1,1,1,1,2,2,2,2);
                    switch (rando) {
                        case 1:
                            fleet.capital_number += 1;
                            break;
                        case 2:
                            fleet.escort_number += 1;
                            break;
                    }
                    
                    if (fleet.image_index>=5){
                        var nearestStar=0,targetStar=0;
                        var locationOk=false;
                        
                        with(obj_star){
                            if (planets==1) and (p_type[1]=="Dead") then instance_deactivate_object(instance_id_get( 0 ));
                        }
                        nearestStar=instance_nearest(fleet.x,fleet.y,obj_star);
                        instance_deactivate_object(nearestStar);
                        for(var j=0; j<10; j++){
                            if (!locationOk){
                                targetStar=instance_nearest(fleet.x+choose(random(400),random(400)*-1),fleet.y+choose(random(100),random(100)*-1),obj_star);
                                if (targetStar.owner != eFACTION.Ork) then locationOk=true;
                                // New code testing
                                if (nearestStar.owner == eFACTION.Ork) and (instance_exists(nearestStar)){
                                    if (nearestStar.present_fleet[7]>0){
                                        var fli=instance_nearest(nearestStar.x,nearestStar.y,obj_en_fleet);
                                        if (fli.action=="") and (owner != eFACTION.Ork) and (point_distance(nearestStar.x,nearestStar.y,fli.x,fli.y)<60) then locationOk=true;
                                        if (fli.action=="") and (owner != eFACTION.Ork) and (point_distance(nearestStar.x,nearestStar.y,fli.x,fli.y)<60) then locationOk=true;
                                    }
                                }// End new code testing
                                
                                if (targetStar.planets==0) then locationOk=false;
                                if (targetStar.planets==1) and (targetStar.p_type[1]=="Dead") then locationOk=false;
                            }
                        }
                        fleet.action_x=targetStar.x;
                        fleet.action_y=targetStar.y;
                        fleet.alarm[4]=1;// present_fleets-=1;
                        instance_activate_object(obj_star);
                    }
                }
            }
            if (contin==3) and (rando<=25){// Create a fleet
                // fleet=instance_create
                fleet=instance_create(x+32,y,obj_en_fleet);
                fleet.owner = eFACTION.Ork;
                fleet.sprite_index=spr_fleet_ork;
                fleet.image_index=1;
                fleet.capital_number=2;
                // present_fleets+=1;
            }
        }
    }
}
