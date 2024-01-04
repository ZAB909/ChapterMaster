 
if (defenses=1){
    var i=0;

    i+=1;
    wep[i]="Heavy Bolter Emplacement";
    wep_num[i]=round(obj_ncombat.player_defenses/2);
    range[i]=99;
    att[i]=160*wep_num[i];
    apa[i]=0;ammo[i]=-1;splash[i]=1;

    i+=1;
    wep[i]="Missile Launcher Emplacement";
    wep_num[i]=round(obj_ncombat.player_defenses/2);
    range[i]=99;
    att[i]=200*wep_num[i];
    apa[i]=120*wep_num[i];
    ammo[i]=-1;
    splash[i]=1;

    i+=1;wep[i]="Missile Silo";
    wep_num[i]=min(30,obj_ncombat.player_silos);
    range[i]=99;
    att[i]=350*wep_num[i];
    apa[i]=200*wep_num[i];
    ammo[i]=-1;
	splash[i]=1;

    var rightest=instance_nearest(2000,240,obj_pnunit);
    if (rightest.id=self.id) then instance_destroy();
}
if (defenses=1) then exit;


var i,g=0;men=0;veh=0;dreads=0;
for (i=1;i<=20;i++){
    // dudes[i]="";
    dudes_num[i]=0;
    // dudes_vehicle[i]=0;
    att[i]=0;
    apa[i]=0;
    wep_num[i]=0;
    wep_rnum[i]=0;
    // if (wep_owner[i]!="") and (wep_num[i]>1) then wep_owner[i]="assorted";// What if they are using two ranged weapons?  Hmmmmm?
}

i=0;
for (i=1;i<=60;i++){
    lost[i]="";
    lost_num[i]=0;
}

var dreaded=false, unit;
add_data_to_stack = function(stack_index, weapon, unit_damage=false){
    if (!unit_damage==false){
        att[stack_index]+=unit_damage;
    }
    apa[stack_index]=weapon.arp;
    range[stack_index]=weapon.range;
    wep_num[stack_index]++;
    splash[stack_index]=weapon.spli;;
    wep[stack_index]=weapon.name;
    if (obj_ncombat.started=0) then ammo[stack_index]=weapon.ammo;


    if (array_length(weapon.second_profiles)>0){//for adding in intergrated weaponry
        var secondary_profile;
        for (var p=0;p<array_length(weapon.second_profiles);p++){

            secondary_profile = gear_weapon_data("weapon",weapon.second_profiles[p],"all")
            if (!is_struct(secondary_profile))then continue;
            for (var wep_stack=1;wep_stack<array_length(wep);wep_stack++){
                if (wep[wep_stack]==""||wep[wep_stack]==weapon.name){
                    add_data_to_stack(wep_stack,secondary_profile)
                }
            }    
        }
    }
}
var mobi_item;
for (g=1;g<array_length(marine_type);g++){
    unit = unit_struct[g];
    if (marine_casting[g]>=0) then marine_casting[g]=0;
    if (marine_casting[g]<0) then marine_casting[g]+=1;//timer for libs to be able to cast

    if ((marine_id[g]>0) or (ally[g]=true)) and (unit.hp()>0) then marine_dead[g]=0;
    if ((marine_id[g]>0) or (ally[g]=true)) and (unit.hp()>0) and (marine_dead[g]!=1){
        var head_role=unit.IsSpecialist("heads");
        if (unit.hp()>0) then men+=1;

        if (unit.armour()=="Dreadnought"){
            dreads+=1;
            dreaded=true;
        }
        //if (marine_mobi[g]="Bike") then scr_special_weapon("Twin Linked Bolters",g,true);


        if (marine_mobi[g]!="Bike") and (marine_mobi[g]!=""){
           mobi_item=unit.get_mobility_data();
           if (is_struct(mobi_item)){
            if( mobi_item.has_tag("jump")){
                for (var stack_index=1;stack_index<array_length(wep);stack_index++){
                    if (wep[stack_index]==""||(wep[stack_index]=="hammer_of_wrath" && !head_role)){
                        add_data_to_stack(stack_index,unit.hammer_of_wrath());
                        if (head_role){
                            wep_title[stack_index]=unit.role();
                            wep_solo[stack_index]=unit.name();
                        }
                        break;
                    }
                }                
            }
           }
        }

        if (unit.IsSpecialist("libs",true)||(unit.role()=="Chapter Master"&&obj_ncombat.chapter_master_psyker=1)){
            var cast_dice=irandom(99)+1;
            if (array_contains(obj_ini.dis,"Warp Touched")) then cast_dice-=5;

            cast_dice-=(unit.psionic+(unit.experience()/60))

            if (cast_dice<=50) then marine_casting[g]=1;

            if (marine_type[g]="Chapter Master") and (obj_ncombat.chapter_master_psyker=1){
                if (cast_dice<=66) then marine_casting[g]=1;
                if (obj_ncombat.big_boom>0) and (obj_ncombat.kamehameha=true) then marine_casting[g]=1;
            }
        }

        var j=0,good=0,open=0;// Counts the number and types of marines within this object
        for (j=1;j<=40;j++){
            if (dudes[j]=="") and (open==0){
                open=j;// Determine if vehicle here

                //if (dudes[j]="Venerable "+string(obj_ini.role[100][6])) then dudes_vehicle[j]=1;
                //if (dudes[j]=obj_ini.role[100][6]) then dudes_vehicle[j]=1;
            }
            if (marine_type[g]==dudes[j]){
                good=1;
                dudes_num[j]+=1;
            }
            if (good=0) and (open!=0){
                dudes[open]=marine_type[g];
                dudes_num[open]=1;
            }
        }
        if (marine_casting[g]!=1){
            var weapon_stack_index=0;
            var primary_ranged = unit.ranged_damage_data[3];//collect unit ranged data
            for (weapon_stack_index=1;weapon_stack_index<array_length(wep);weapon_stack_index++){
                if (wep[weapon_stack_index]==""||(wep[weapon_stack_index]==primary_ranged.name && !head_role)){
                    add_data_to_stack(weapon_stack_index,primary_ranged,unit.ranged_damage_data[0]);
                    if (head_role){
                        wep_title[weapon_stack_index]=unit.role();
                        wep_solo[weapon_stack_index]=unit.name();
                    }
                    break;
                }
            }
            var primary_melee = unit.melee_damage_data[3];//collect unit melee data
            for (weapon_stack_index=1;weapon_stack_index<array_length(wep);weapon_stack_index++){
                if (wep[weapon_stack_index]==""||(wep[weapon_stack_index]==primary_melee.name && !head_role)){
                    add_data_to_stack(weapon_stack_index,primary_melee,unit.melee_damage_data[0]);
                    if (head_role){
                        wep_title[weapon_stack_index]=unit.role();
                        wep_solo[weapon_stack_index]=unit.name();
                    }
                    break;
                }
            }     
        }
    }

    if (veh_id[g]>0) and (veh_hp[g]>0) and (veh_dead[g]!=1){
        if (veh_id[g]>0) and (veh_hp[g]>0) then veh_dead[g]=0;
        if (veh_hp[g]>0) then veh+=1;

        var j,good,open;j=0;good=0;open=0;// Counts the number and types of marines within this object
        if (veh_dead[g]!=1) then repeat(40){j+=1;
            if (dudes[j]="") and (open=0){
                open=j;
            }
            if (veh_type[g]=dudes[j]){
                good=1;
                dudes_num[j]+=1;
                dudes_vehicle[j]=1;
            }
            if (good=0) and (open!=0){
                dudes[open]=veh_type[g];
                dudes_num[open]=1;
                dudes_vehicle[open]=1;
            }
        }

        var j=0,good=0,open=0, weapon, vehicle_weapon_set;
        if (veh_dead[g]!=1){
            vehicle_weapon_set = [veh_wep1[g],veh_wep2[g],veh_wep3[g]]
            for (wep_slot=0;wep_slot<3;wep_slot++){
                var weapon_check = vehicle_weapon_set[wep_slot];
                if (weapon_check!=""){
                    weapon=gear_weapon_data("weapon",weapon_check,"all", false, "standard");
                    if (is_struct(weapon)){
                        for (j=1;j<=40;j++){
                            if (wep[j]==""||wep[j]==weapon.name){
                                add_data_to_stack(open,weapon)
                                break;                             
                            }
                        }
                    }
                }
            }
        }
    }
}


// Right here should be retreat- if important units are exposed they should try to hop left




if (dudes_num[1]=0) and (obj_ncombat.started=0){
    instance_destroy();
    exit;
}


if (men+veh=1) and (obj_ncombat.player_forces=1){
    if (men=1) and (veh=0){
        var i=0,h=0;
        repeat(500){
            unit = unit_struct[g];
            if (h=0){
                i+=1;
                if (unit.hp()>0) and (marine_dead[i]=0){
                    h=unit.hp();
                    obj_ncombat.display_p1=h;
                    obj_ncombat.display_p1n=string(marine_type[i])+" "+string(obj_ini.name[marine_co[i],marine_id[i]]);
                }
            }
        }
    }
}

/* */
/*  */
