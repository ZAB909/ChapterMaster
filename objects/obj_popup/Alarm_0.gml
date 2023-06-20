if (battle_special=3.1){
    var that;
    
    
    // show_message(string(obj_popup.loc)+": planet name, "+string(loc)+", "+string(planet));
    
    
    with(obj_star){if (name!=obj_popup.loc) then instance_deactivate_object(id);}
    that=instance_nearest(room_width/2,room_height/2,obj_star);
    instance_activate_all();
    
    instance_create(0,0,obj_ncombat);
    obj_ncombat.enemy=3;
    obj_ncombat.battle_object=that;
    obj_ncombat.battle_loc=loc;
    obj_ncombat.battle_id=planet;
    obj_ncombat.fortified=5;
    obj_ncombat.battle_special="mech_stc";
    obj_ncombat.threat=4;
    obj_ncombat.formation_set=3;
    
    instance_deactivate_all(true);
    instance_activate_object(obj_ini);
    instance_activate_object(obj_controller);
    instance_activate_object(obj_ncombat);
    
    scr_battle_roster(loc,planet,true);
}
instance_destroy();exit;

