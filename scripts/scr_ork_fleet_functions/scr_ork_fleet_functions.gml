// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ork_fleet_functions(){

}

function new_ork_fleet(xx,yy){
    fleet=instance_create(xx+32,yy,obj_en_fleet);
    fleet.owner = eFACTION.Ork;
    fleet.sprite_index=spr_fleet_ork;
    fleet.image_index=1;
    fleet.capital_number=1;
    present_fleet[7]+=1;
}

function build_new_ork_ships_to_fleet(star){

    // Increase ship number for this object?
    var rando=irandom(101);
    if (obj_controller.known[eFACTION.Ork]>0) then rando-=10;
    if (rando<=15){// was 25
        rando=choose(1,1,1,1,1,1,1,3,3,3,3);
        if (rando=1) then capital_number+=1;
        // if (rando=2) then fleet.frigate_number+=1;
        if (rando=3) then escort_number+=1;
    }
	
	//if big enough flee bugger off to new star
    if (image_index>=5){
    	instance_deactivate_object(star);
        with(obj_star){
        	if (is_dead_star()){
        		instance_deactivate_object(id);
        	} else {
                if (owner == eFACTION.Ork || array_contains(p_owner, eFACTION.Ork)){
                    instance_deactivate_object(id);
                }            		
        	}
        }
    	var new_wagh_star = instance_nearest(x,y,obj_star);
        if (instance_exists(new_wagh_star)){
            fleet.action_x=new_wagh_star.x;
            action_y=new_wagh_star.y;
            set_fleet_movement();
        }
    
    }
	instance_activate_object(obj_star);
}