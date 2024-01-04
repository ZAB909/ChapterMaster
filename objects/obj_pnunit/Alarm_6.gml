//
// Handles marines dying on battle
//

// Remove from ships
// Remove from the controller
// Remove from any planetary bodies

// show_message("pnunit alarm 6");

var i=0,unit;
repeat(600){i+=1;
    if (marine_dead[i]>0) and (marine_type[i]!="") and (ally[i]=false){
        unit = unit_struct[g];
        man_size = unit.get_unit_size();

        if (obj_ini.wid[marine_co[i]][marine_id[i]]>0) then obj_ncombat.world_size+=man_size;
        if (obj_ini.lid[marine_co[i]][marine_id[i]]>0) then obj_ini.ship_carrying[obj_ini.lid[marine_co[i],marine_id[i]]]-=man_size;
        //
        scr_kill_unit(marine_co[i],marine_id[i]);
    }

    // if (veh_type[i]="Predator") or (veh_type[i]="Land Raider") then show_message(string(veh_type[i])+" ("+string(veh_co[i])+"."+string(veh_id[i])+")#HP: "+string(veh_hp[i])+"#Dead: "+string(veh_dead[i])+"");

    if (veh_dead[i]>0) and (veh_type[i]!="") and (veh_ally[i]=false){
        var man_size=scr_unit_size("",veh_type[i],true);

        /*
        if (veh_type[i]="Rhino") then man_size+=10;
        if (veh_type[i]="Predator") then man_size+=10;
        if (veh_type[i]="Land Raider") then man_size+=20;
        if (veh_type[i]="Bike") then man_size+=2;
        if (veh_type[i]="Land Speeder") then man_size+=6;
        if (veh_type[i]="Whirlwind") then man_size+=10;*/

        if (obj_ini.veh_wid[veh_co[i],veh_id[i]]>0) then obj_ncombat.world_size+=man_size;
        if (obj_ini.veh_lid[veh_co[i],veh_id[i]]>0) then obj_ini.ship_carrying[obj_ini.veh_lid[veh_co[i],veh_id[i]]]-=man_size;

        // show_message(string(veh_type[i])+" ("+string(veh_co[i])+"."+string(veh_id[i])+") dead");


        //
        obj_ini.veh_race[veh_co[i],veh_id[i]]=0;
        obj_ini.veh_loc[veh_co[i],veh_id[i]]="";
        obj_ini.veh_name[veh_co[i],veh_id[i]]="";
        obj_ini.veh_role[veh_co[i],veh_id[i]]="";
        obj_ini.veh_wep1[veh_co[i],veh_id[i]]="";
        obj_ini.veh_wep2[veh_co[i],veh_id[i]]="";
        obj_ini.veh_wep3[veh_co[i],veh_id[i]]="";
        obj_ini.veh_upgrade[veh_co[i],veh_id[i]]="";  
        obj_ini.veh_acc[veh_co[i],veh_id[i]]="";
        obj_ini.veh_hp[veh_co[i],veh_id[i]]=0;
        obj_ini.veh_chaos[veh_co[i],veh_id[i]]=0;
        obj_ini.veh_pilots[veh_co[i],veh_id[i]]=0;
        obj_ini.veh_lid[veh_co[i],veh_id[i]]=0;
        obj_ini.veh_wid[veh_co[i],veh_id[i]]=2;
    }
    if (veh_dead[i]=0) and (veh_type[i]!="") and (veh_ally[i]=false){obj_ini.veh_hp[veh_co[i],veh_id[i]]=veh_hp[i]/veh_hp_multiplier[i];}
}

/* */
/*  */
