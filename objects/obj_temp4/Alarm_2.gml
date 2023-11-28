
scr_return_ship(loc,self,num);

var man_size,ship_id,comp,plan,i;
i=0;ship_id=0;man_size=0;comp=0;plan=0;
repeat(30){i+=1;if (obj_ini.ship[i]=loc) then ship_id=i;}i=0;
plan=instance_nearest(x,y,obj_star);
scr_add_artifact("random","random",4,loc,ship_id+500);

var i,last_artifact;
i=0;last_artifact=0;
repeat(100){if (last_artifact=0){i+=1;if (obj_ini.artifact[i]="") then last_artifact=i-1;}}

var pop;
pop=instance_create(0,0,obj_popup);
pop.image="artifact_recovered";
pop.title="Artifact Recovered!";
pop.text="The Artifact has been safely stowed away upon "+string(loc)+".  It appears to be a "+string(obj_ini.artifact[last_artifact])+" but should be brought home and identified posthaste.";
with(obj_star_select){instance_destroy();}
with(obj_fleet_select){instance_destroy();}
 delete_features(plan.p_feature[num], P_features.Artifact);
scr_event_log("","Artifact recovered.");

i=0;
if (string_count("Daemonic",obj_ini.artifact_tags[last_artifact-1])=1) then repeat(140){
    i+=1;
    if (man_sel[i]=1){
        if (obj_controller.man[i]="man"){obj_ini.chaos[comp][i]+=choose(0,2,4,6,8);}
        if (obj_controller.man[i]="vehicle"){obj_ini.veh_chaos[comp][i]+=choose(0,2,4,6,8);}
    }
}

obj_controller.trading_artifact=0;
var h;h=0;repeat(4){h+=1;obj_controller.diplo_option[h]="";obj_controller.diplo_goto[h]="";}
instance_destroy();

