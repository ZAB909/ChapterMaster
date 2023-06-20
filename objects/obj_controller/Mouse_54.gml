
if (global.cheat_debug=true) and (instance_number(obj_turn_end)=0) and (instance_number(obj_ncombat)=0) and (instance_number(obj_fleet)=0){
    if (menu=0) and (instance_number(obj_star_select)=0) and (popup=0) and (instance_number(obj_fleet_select)=0) and (instance_number(obj_popup)=0){
        var pop;pop=instance_create(mouse_x,mouse_y,obj_popup);
        pop.image="debug_banshee";
        pop.title="DEBUG";
        pop.planet=1;
        
        pop.text="What would you like to do?";
        pop.option1="Enemy invasion";
        pop.option2="Spawn Fleet";
        pop.option3="Delete Fleet";
    }
}

