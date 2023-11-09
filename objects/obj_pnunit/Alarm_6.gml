//
// Handles marines dying on battle
//

// Remove from ships
// Remove from the controller
// Remove from any planetary bodies

// show_message("pnunit alarm 6");

var i;i=0;
repeat(600){i+=1;
    if (marine_dead[i]>0) and (marine_type[i]!="") and (ally[i]=false){
        var man_size;man_size=scr_unit_size(marine_armour[i],marine_type[i],true);

        /*if (string_count("Terminator",marine_armour[i])>0) then man_size+=1;
        if (marine_armour[i]="Tartaros") then man_size+=1;
        if (string_count("Dreadnought",marine_armour[i])>0) then man_size+=7;
        // if (marine_mobi[i]="Jump Pack") then man_size+=1;
        if (marine_type[i]="Chapter Master") then man_size+=1;*/


        if (obj_ini.wid[marine_co[i],marine_id[i]]>0) then obj_ncombat.world_size+=man_size;
        if (obj_ini.lid[marine_co[i],marine_id[i]]>0) then obj_ini.ship_carrying[obj_ini.lid[marine_co[i],marine_id[i]]]-=man_size;
        //
        obj_ini.race[marine_co[i],marine_id[i]]=0;obj_ini.loc[marine_co[i],marine_id[i]]="";obj_ini.name[marine_co[i],marine_id[i]]="";
        obj_ini.role[marine_co[i],marine_id[i]]="";obj_ini.wep1[marine_co[i],marine_id[i]]="";obj_ini.lid[marine_co[i],marine_id[i]]=0;
        obj_ini.wid[marine_co[i],marine_id[i]]=2;obj_ini.wep2[marine_co[i],marine_id[i]]="";obj_ini.armour[marine_co[i],marine_id[i]]="";
        obj_ini.gear[marine_co[i],marine_id[i]]="";obj_ini.hp[marine_co[i],marine_id[i]]=100;obj_ini.chaos[marine_co[i],marine_id[i]]=0;
        obj_ini.experience[marine_co[i],marine_id[i]]=0;obj_ini.age[marine_co[i],marine_id[i]]=0;obj_ini.mobi[marine_co[i],marine_id[i]]="";
        obj_ini.mobi[marine_co[i],marine_id[i]]="";obj_ini.spe[marine_co[i],marine_id[i]]="";
    }

    // if (veh_type[i]="Predator") or (veh_type[i]="Land Raider") then show_message(string(veh_type[i])+" ("+string(veh_co[i])+"."+string(veh_id[i])+")#HP: "+string(veh_hp[i])+"#Dead: "+string(veh_dead[i])+"");

    if (veh_dead[i]>0) and (veh_type[i]!="") and (veh_ally[i]=false){
        var man_size;man_size=scr_unit_size("",veh_type[i],true);

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
        obj_ini.veh_race[veh_co[i],veh_id[i]]=0;obj_ini.veh_loc[veh_co[i],veh_id[i]]="";obj_ini.veh_name[veh_co[i],veh_id[i]]="";
        obj_ini.veh_role[veh_co[i],veh_id[i]]="";obj_ini.veh_wep1[veh_co[i],veh_id[i]]="";obj_ini.veh_wep2[veh_co[i],veh_id[i]]="";obj_ini.veh_wep3[veh_co[i],veh_id[i]]="";
        obj_ini.veh_upgrade[veh_co[i],veh_id[i]]="";  obj_ini.veh_acc[veh_co[i],veh_id[i]]="";obj_ini.veh_hp[veh_co[i],veh_id[i]]=0;obj_ini.veh_chaos[veh_co[i],veh_id[i]]=0;
        obj_ini.veh_pilots[veh_co[i],veh_id[i]]=0;obj_ini.veh_lid[veh_co[i],veh_id[i]]=0;obj_ini.veh_wid[veh_co[i],veh_id[i]]=2;
    }
    if (marine_dead[i]=0) and (ally[i]=false){
        if (marine_type[i]!=obj_ini.role[100][6]) and (marine_type[i]!="Venerable "+string(obj_ini.role[100][6])){obj_ini.hp[marine_co[i],marine_id[i]]=marine_hp[i];}
        if (marine_type[i]=obj_ini.role[100][6]) or (marine_type[i]="Venerable "+string(obj_ini.role[100][6])){obj_ini.hp[marine_co[i],marine_id[i]]=marine_hp[i]/2;}
    }
    if (veh_dead[i]=0) and (veh_type[i]!="") and (veh_ally[i]=false){obj_ini.veh_hp[veh_co[i],veh_id[i]]=veh_hp[i]/veh_hp_multiplier[i];}
}

/* */
/*  */
