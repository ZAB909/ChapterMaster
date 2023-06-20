
// excommunicatus traitorus

instance_activate_object(obj_star);


var witch;
witch=obj_controller;
if (instance_exists(obj_turn_end)) then witch=obj_turn_end;
witch.audiences+=1;witch.audien[witch.audiences]=4;
witch.audien_topic[witch.audiences]="declare_war";if (gene_xeno>99995) then witch.audien_topic[witch.audiences]="gene_xeno";
obj_controller.disposition[4]-=50;obj_controller.faction_status[4]="War";
obj_controller.turns_ignored[4]=9999;if (known[4]>0) then known[4]=4;

witch.audiences+=1;witch.audien[witch.audiences]=2;
witch.audien_topic[witch.audiences]="declare_war";obj_controller.disposition[2]-=40;
obj_controller.faction_status[2]="War";obj_controller.turns_ignored[2]=9999;if (known[2]>0) then known[2]=2;

obj_controller.faction_status[3]="War";obj_controller.turns_ignored[3]=9999;obj_controller.disposition[3]-=30;if (known[3]>0) then known[3]=2;

if (known[5]>0){
    witch.audiences+=1;witch.audien[witch.audiences]=5;
    witch.audien_topic[witch.audiences]="declare_war";known[5]=2;
}
obj_controller.faction_status[5]="War";obj_controller.turns_ignored[5]=9999;obj_controller.disposition[5]-=40;

if (obj_controller.faction_gender[10]=1) and (obj_controller.known[10]=0) and (obj_controller.faction_defeated[10]=0){
    witch.audiences+=1;witch.audien[witch.audiences]=10;
    witch.audien_topic[witch.audiences]="intro";
}


with(obj_star){
    if (p_owner[1]=1) or (p_owner[2]=1) or (p_owner[3]=1) or (p_owner[4]=1){
        var heh;heh=instance_create(x,y,obj_crusade);
        heh.radius=64;heh.duration=9999;heh.show=false;heh.placing=false;heh.alarm[1]=-1;
        if (p_owner[1]=1){p_pdf[1]+=p_guardsmen[1];p_guardsmen[1]=0;}
        if (p_owner[2]=1){p_pdf[2]+=p_guardsmen[2];p_guardsmen[2]=0;}
        if (p_owner[3]=1){p_pdf[3]+=p_guardsmen[3];p_guardsmen[3]=0;}
        if (p_owner[4]=1){p_pdf[4]+=p_guardsmen[4];p_guardsmen[4]=0;}
    }
}

if (instance_exists(obj_fleet)) then instance_deactivate_object(obj_star);

