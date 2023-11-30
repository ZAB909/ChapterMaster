// Resets vars and also checks if target can be bombarded
ship_names="";
sh_target=0;
p_target=0;
max_ships=0;
ships_selected=0;
target=0;
target_score=0;
targets=0;
all_sel=0;

bomb=0;
bomb_score=0;
bomb_a=0;
bomb_b=0;
bomb_c=0;

for(var i=0; i<31; i++){
    ship[i]="";
    ship_all[i]=0;
    ship_use[i]=0;
    ship_max[i]=0;
    ship_ide[i]=0;
}

menu=0;

attacking=0;
eldar=0;
ork=0;
tau=0;
chaos=0;
tyranids=0;
traitors=0;
imp=0;
pdf=0;
sisters=0;
mechanicus=0;
necrons=0;


with(obj_en_fleet){
    if (owner == eFACTION.Imperium) or (owner == eFACTION.Mechanicus) or (owner  == eFACTION.Inquisition) or (action!="") then instance_deactivate_object(id);
}
instance_create(obj_star_select.target.x,obj_star_select.target.y,obj_temp3);
with(obj_fleet){
    if (point_distance(x,y,obj_temp3.x,obj_temp3.y)>35) then instance_deactivate_object(id);
}

var bib=instance_nearest(obj_temp3.x,obj_temp3.y,obj_en_fleet);
if (instance_exists(bib)){
    if (point_distance(obj_temp3.x,obj_temp3.y,bib.x,bib.y)<=35){
        
        scr_popup("Cannot Bombard","Enemy fleets are preventing bombardment!","","");
        
        with(obj_temp3){instance_destroy();}
        instance_activate_object(obj_en_fleet);
        instance_destroy();
        exit;
    }
    with(obj_temp3){instance_destroy();}
}
instance_activate_object(obj_en_fleet);

alarm[1]=1;
