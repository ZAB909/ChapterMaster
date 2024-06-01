var __b__;
__b__ = action_if_variable(cooldown, 0, 2);
if !__b__
{
{

if (hide=true) then exit;
if (!instance_exists(obj_controller)) then exit;
if (instance_exists(obj_fleet)) then exit;
if (obj_controller.scrollbar_engaged!=0) then exit;
if (cooldown>0) then exit;

if (woopwoopwoop=1){woopwoopwoop=2;exit;}

if (battle_special>0){
    alarm[0]=1;
    cooldown=10;exit;
}

if (type=98){
    obj_controller.cooldown=10;
    if (instance_exists(obj_turn_end)){
        obj_turn_end.current_battle+=1;
        obj_turn_end.alarm[0]=1;
    }
    obj_controller.force_scroll=0;
    instance_destroy();exit;
}




if (option1=="") and (type<5){
    obj_controller.cooldown=10;
    if (instance_exists(obj_turn_end)) and (obj_controller.complex_event==false){if (number!=0) then obj_turn_end.alarm[1]=4;}
    instance_destroy();
}

if (type>4) and (type!=9) and (cooldown<=0){
    var xx,yy;xx=__view_get( e__VW.XView, 0 );yy=__view_get( e__VW.YView, 0 );

    if (mouse_x>=xx+1006) and (mouse_y>=yy+499) and (mouse_x<=xx+1116) and (mouse_y<yy+519){
        obj_controller.cooldown=10;
        instance_destroy();
        exit;
    }
}



if (type=5.1) and (cooldown<=0){
    var xx,yy,before,before2;
    xx=__view_get( e__VW.XView, 0 );yy=__view_get( e__VW.YView, 0 );
    before=target_comp;
    before2=target_role;

    if (mouse_y>=yy+210) and (mouse_y<yy+230){
        if (mouse_x>=xx+1468) and (mouse_x<=xx+1515){target_comp=0;cooldown=8000;}
    }
    if (mouse_y>=yy+230) and (mouse_y<yy+250){
        if (mouse_x>=xx+1030) and (mouse_x<=xx+1120){target_comp=1;cooldown=8000;}
        if (mouse_x>=xx+1140) and (mouse_x<=xx+1230){target_comp=2;cooldown=8000;}
        if (mouse_x>=xx+1250) and (mouse_x<=xx+1340){target_comp=3;cooldown=8000;}
        if (mouse_x>=xx+1360) and (mouse_x<=xx+1450){target_comp=4;cooldown=8000;}
        if (mouse_x>=xx+1470) and (mouse_x<=xx+1560){target_comp=5;cooldown=8000;}
    }
    if (mouse_y>=yy+250) and (mouse_y<yy+270){
        if (mouse_x>=xx+1030) and (mouse_x<=xx+1120){target_comp=6;cooldown=8000;}
        if (mouse_x>=xx+1140) and (mouse_x<=xx+1230){target_comp=7;cooldown=8000;}
        if (mouse_x>=xx+1250) and (mouse_x<=xx+1340){target_comp=8;cooldown=8000;}
        if (mouse_x>=xx+1360) and (mouse_x<=xx+1450){target_comp=9;cooldown=8000;}
        if (mouse_x>=xx+1470) and (mouse_x<=xx+1560){target_comp=10;cooldown=8000;}
    }
}

if (type=5) and (cooldown<=0){
    var xx,yy,before,before2;
    xx=__view_get( e__VW.XView, 0 );yy=__view_get( e__VW.YView, 0 );
    before=target_comp;
    before2=target_role;

    if (unit_role!=obj_ini.role[100,17]) or (obj_controller.command_set[1]!=0){
        if (mouse_y>=yy+210) and (mouse_y<yy+230){
            if (mouse_x>=xx+1468) and (mouse_x<=xx+1515) and (min_exp>=0){
                target_comp=0;
                get_unit_promotion_options();
                cooldown=8000;
            }
        }
    }
}

/* */

var xx,yy,change_tab;
xx=__view_get( e__VW.XView, 0 );
yy=__view_get( e__VW.YView, 0 );
change_tab=0;


if (mouse_x>=xx+1465) and (mouse_y>=yy+499) and (mouse_x<xx+1576) and (mouse_y<yy+518){// Transfering right here

    if (type=5.1){
        if (target_comp>10) then target_comp=0;
        manag=obj_controller.managing;
        if (manag>10) then manag=0;
        company=manag
    }
    if (type=5.1) and (cooldown<=0) and (company!=target_comp) and (target_comp!=-1){
        cooldown=999;obj_controller.cooldown=8000;

        var mahreens=0,w=0,god=0,vehi=0,god2=0;

         for (w=1;w<500;w++){ // Gets the number of marines in the target company
			if (obj_ini.name[target_comp,w]=="" && obj_ini.name[target_comp,w+1]==""){
                mahreens=w; 
                break;
            }
		}

        for (w=1;w<101;w++){// Gets the number of vehicles in the target company
			if (god2=0 and obj_ini.veh_role[target_comp,w]=""){god2=1;vehi=w;break;}
		}

        // The MAHREENS and TARGET/FROM seems to check out
        var unit, move_squad, move_members, moveable, squad;
        for (w=0;w<array_length(obj_controller.display_unit);w++){
            if (obj_controller.man_sel[w]==1){
                if (obj_controller.man[w]=="man"&&is_struct(obj_controller.display_unit[w])){
                    moveable=true;
                    unit = obj_controller.display_unit[w];
                    if (unit.squad != "none"){   // this evaluates if you are tryin to move a whole squad and if so moves teh squad to a new company
                        move_squad = unit.squad;
                        squad = obj_ini.squads[move_squad];
                        move_members = squad.members;
                        for (var mem = 0;mem<array_length(move_members);mem++){//check all members have been selected and are in the same company
                            if (w+mem<array_length(obj_controller.display_unit)){
                                if (!is_struct(obj_controller.display_unit[w+mem])) then continue;
                                if (obj_controller.man_sel[w+mem]!=1 || obj_controller.display_unit[w+mem].squad != move_squad){
                                    moveable = false;
                                    break;
                                }
                            } else{
                                moveable = false;
                                break;                                    
                            }
                        }
                        //move squad
                        if (moveable){
                            for (var mem = 0;mem<array_length(move_members);mem++){
                                var member_unit = fetch_unit(move_members[mem]);
                                scr_move_unit_info(member_unit.company,target_comp,member_unit.marine_number,mahreens, false);
                                obj_ini.TTRPG[target_comp][mahreens].squad = move_squad;
                                squad.members[mem][0] = target_comp;
                                squad.members[mem][1] = mahreens;
                                mahreens++;
                            }
                            w+=mem-2;
                            squad.base_company = target_comp;
                        }
                    } else {moveable=false}
                    //move individual
                    if (!moveable){
                        scr_move_unit_info(unit.company,target_comp,unit.marine_number,mahreens, true);
                        mahreens++;
                    }
                    var check=0;
                }else if(obj_controller.man[w]=="vehicle" && is_array(obj_controller.display_unit[w])){ // This seems to execute the correct number of times
                    var check=0;
                    var veh_data = obj_controller.display_unit[w];
    				// Check if the target company is within the allowed range
                    if (target_comp >= 1) and (target_comp <= 10) {
                        obj_ini.veh_race[target_comp][vehi]=obj_ini.veh_race[veh_data[0]][veh_data[1]];
                        obj_ini.veh_loc[target_comp][vehi]=obj_ini.veh_loc[veh_data[0]][veh_data[1]];
                        obj_ini.veh_role[target_comp][vehi]=obj_ini.veh_role[veh_data[0]][veh_data[1]];
                        obj_ini.veh_wep1[target_comp][vehi]=obj_ini.veh_wep1[veh_data[0]][veh_data[1]];
                        obj_ini.veh_wep2[target_comp][vehi]=obj_ini.veh_wep2[veh_data[0]][veh_data[1]];
                        obj_ini.veh_wep3[target_comp][vehi]=obj_ini.veh_wep3[veh_data[0]][veh_data[1]];
                        obj_ini.veh_upgrade[target_comp][vehi]=obj_ini.veh_upgrade[veh_data[0]][veh_data[1]];
                        obj_ini.veh_acc[target_comp][vehi]=obj_ini.veh_acc[veh_data[0]][veh_data[1]];
                        obj_ini.veh_hp[target_comp][vehi]=obj_ini.veh_hp[veh_data[0]][veh_data[1]];
                        obj_ini.veh_chaos[target_comp][vehi]=obj_ini.veh_chaos[veh_data[0]][veh_data[1]];
                        obj_ini.veh_pilots[target_comp][vehi]=0;
                        obj_ini.veh_lid[target_comp][vehi]=obj_ini.veh_lid[veh_data[0]][veh_data[1]];
                        obj_ini.veh_wid[target_comp][vehi]=obj_ini.veh_wid[veh_data[0]][veh_data[1]];

                        obj_ini.veh_race[veh_data[0]][veh_data[1]]=0;
                        obj_ini.veh_loc[veh_data[0]][veh_data[1]]="";
                        obj_ini.veh_role[veh_data[0]][veh_data[1]]="";
                        obj_ini.veh_wep1[veh_data[0]][veh_data[1]]="";
                        obj_ini.veh_wep2[veh_data[0]][veh_data[1]]="";
                        obj_ini.veh_wep3[veh_data[0]][veh_data[1]]="";
                        obj_ini.veh_upgrade[veh_data[0]][veh_data[1]]="";
                        obj_ini.veh_acc[veh_data[0]][veh_data[1]]="";
                        obj_ini.veh_hp[veh_data[0]][veh_data[1]]=0;
                        obj_ini.veh_chaos[veh_data[0]][veh_data[1]]=0;
                        obj_ini.veh_pilots[veh_data[0]][veh_data[1]]=0;
                        obj_ini.veh_lid[veh_data[0]][veh_data[1]]=0;
                        obj_ini.veh_wid[veh_data[0]][veh_data[1]]=0;

                        vehi++;
                    }

                }
            }
		
        }

        // Check this

        if (obj_controller.managing>0){
            with(obj_controller){scr_management(1);}
        }
            obj_ini.selected_company=company;
            obj_ini.temp_target_company=target_comp;
        with(obj_ini){
            for (var co=0;co<11;co++){
                scr_company_order(co);
                scr_vehicle_order(co);
            }
        }

        with(obj_controller){
            // man_current=0;
            var i=-1;man_size=0;selecting_location="";selecting_types="";selecting_ship=0;
            
            if (obj_controller.managing>0){
                reset_manage_arrays();
                repeat(501){w+=1;
                    
                    sh_ide[w]=0;
                    sh_name[w]="";
                    sh_class[w]="";
                    sh_loc[w]="";
                    sh_hp[w]="";
                    sh_cargo[w]=0;
                    sh_cargo_max[w]="";
                }
                alll=0;
                update_general_manage_view();
            }
        }

        with(obj_managment_panel){instance_destroy();}

        obj_controller.cooldown=10;
        instance_destroy();
    }
}

/* */

var xx,yy,change_tab,do_not_change;
xx=__view_get( e__VW.XView, 0 );
yy=__view_get( e__VW.YView, 0 );
change_tab=0;
do_not_change=false;

if (type=6) and (cooldown<=0){// Actually changing equipment right here
    if (target_comp=1) or (target_comp=2){
        if (mouse_y>=yy+318) and (mouse_y<yy+330) and (mouse_x>=xx+1190) and (mouse_x<xx+1216) and (tab!=1){
            change_tab=1;
            tab=1;
            obj_controller.last_weapons_tab=1;
            cooldown=8000;
        }
        if (mouse_y>=yy+318) and (mouse_y<yy+330) and (mouse_x>=xx+1263) and (mouse_x<xx+1289) and (tab!=2){change_tab=1;tab=2;obj_controller.last_weapons_tab=2;cooldown=8000;}
        if (mouse_y>=yy+318) and (mouse_y<yy+330) and (mouse_x>=xx+1409) and (mouse_x<xx+1435) and (target_comp<3){
            var onceh=0;cooldown=8000;
             if (onceh=0){
                 if (master_crafted=0){
                    master_crafted=1;
                    obj_controller.popup_master_crafted=1;
                    onceh=1;
                    scr_weapons_equip();
                }
                else if (master_crafted=1){
                    master_crafted=0;
                    obj_controller.popup_master_crafted=0;
                    onceh=1;
                    scr_weapons_equip();
                }
             }
        }
    }


    if ((mouse_x>=xx+1296) and (mouse_x<xx+1578)) or (change_tab=1){
        var befi;befi=target_comp;

        if (change_tab=0){
            if (mouse_y>=yy+215) and (mouse_y<yy+235){target_comp=1;cooldown=8000;tab=obj_controller.last_weapons_tab;}
            if (mouse_y>=yy+235) and (mouse_y<yy+255){target_comp=2;cooldown=8000;tab=obj_controller.last_weapons_tab;}
            if (mouse_y>=yy+255) and (mouse_y<yy+275){target_comp=3;cooldown=8000;}
            if (mouse_y>=yy+275) and (mouse_y<yy+295){target_comp=4;cooldown=8000;}
            if (mouse_y>=yy+295) and (mouse_y<yy+315){target_comp=5;cooldown=8000;}
        }

        if ((befi!=target_comp) and (vehicle_equipment!=-1)) or (change_tab=1){
            var i;i=-1;repeat(40){i+=1;item_name[i]="";}

            scr_weapons_equip();

        }



    }

}







if (point_in_rectangle(mouse_x, mouse_y, xx+1465, yy+499,xx+1576,yy+518)){// Promoting right here
    if (type=5) and (cooldown<=0) and (all_good=1) and (target_comp>=0) and (role_name[target_role]!=""){
        cooldown=999;obj_controller.cooldown=8000;

        var mahreens=0;i=-1;

        if (target_comp>10) then target_comp=0;
        manag=obj_controller.managing;
        if (manag>10) then manag=0;
        var company=manag;

        for(i=0;i<498;i++){
            if (obj_ini.name[target_comp][i]=="" and obj_ini.name[target_comp][i+1]=="") {
                mahreens=i;
                break;
            }
        }
        // Gets the number of marines in the target company
        var unit, squad_mover,moveable;
        var role_squad_equivilances = {};//this is the only way to set variables as keys in gml
        variable_struct_set(role_squad_equivilances,obj_ini.role[100][8],"tactical_squad");
        variable_struct_set(role_squad_equivilances,obj_ini.role[100][9],"devastator_squad");
        variable_struct_set(role_squad_equivilances,obj_ini.role[100][10],"assault_squad");
        variable_struct_set(role_squad_equivilances,obj_ini.role[100][12],"scout_squad");
        variable_struct_set(role_squad_equivilances,obj_ini.role[100][3],"sternguard_veteran_squad");
        variable_struct_set(role_squad_equivilances,obj_ini.role[100][4],"terminator_squad");

        for(i=0;i<array_length(obj_controller.display_unit) && mahreens<500;i++){
            if (obj_controller.man[i]=="man") and (obj_controller.man_sel[i]==1) and (obj_controller.ma_exp[i]>=min_exp){
                moveable=true;
                unit = obj_controller.display_unit[i];
                if (unit.squad != "none"){   // this evaluates if you are trying promote a whole squad
                    move_squad = unit.squad;
                    squad = obj_ini.squads[move_squad];
                    squad.update_fulfilment();
                    move_members = squad.members;
                    if (array_length(move_member)==1){
                        unit.squad = "none";
                        array_delete(obj_ini.squads, squad, 1);
                        moveable = false;
                    }                  
                    for (var mem = 0;mem<array_length(move_members);mem++){//check all members have been selected and are in the same company
                        if (i+mem<array_length(obj_controller.display_unit)){
                            if (!is_struct(obj_controller.display_unit[i+mem])) then continue;
                            if (obj_controller.man_sel[i+mem]!=1 || obj_controller.display_unit[i+mem].squad != move_squad){
                                moveable = false;
                                break;
                            }
                        } else{
                            moveable = false;
                            break;                                    
                        }
                    }
                    //move squad
                    if (moveable){
                        var mem_unit;
                        for (var mem = 0;mem<array_length(move_members);mem++){
                            var mem_unit = fetch_unit(move_members[mem]);
                            if (mem_unit.company!=target_comp){
                                scr_move_unit_info(mem_unit.company,target_comp,mem_unit.marine_number,mahreens, false);
                                squad.members[mem][0] = target_comp;
                                squad.members[mem][1] = mahreens;
                            }
                            mem_unit=obj_ini.TTRPG[target_comp][mahreens];
                            mem_unit.squad = move_squad; 
                            if (!mem_unit.IsSpecialist("squad_leaders")){
                                mem_unit.update_role(role_name[target_role]);
                                mem_unit.alter_equipment({
                                    "wep1":req_wep1,
                                    "wep2":req_wep2,
                                    "mobi":req_mobi,
                                    "armour":req_armour,
                                    "gear":req_gear,
                                });                                     
                            }                           
                            mahreens++;
                        }
                        i+=mem-2;
                        if (squad.base_company!=target_comp){
                            squad.base_company = target_comp;
                        }
                        if (struct_exists(role_squad_equivilances,role_name[target_role])){
                            squad.change_type(role_squad_equivilances[$ role_name[target_role]]);
                        }
                    }
                } else {moveable=false}
                //move individual
                if (!moveable){
                    if (unit.company!=target_comp){
                        scr_move_unit_info(unit.company,target_comp,unit.marine_number,mahreens);
                        unit = obj_ini.TTRPG[target_comp][mahreens]; 
                    }
                    unit.update_role(role_name[target_role]);
                    unit.alter_equipment({
                        "wep1":req_wep1,
                        "wep2":req_wep2,
                        "mobi":req_mobi,
                        "armour":req_armour,
                        "gear":req_gear,
                    }); 
                    mahreens++;
                }                                           	
            }// End that [i]

        }// End repeat


        with(obj_controller){scr_management(1);}

        with(obj_ini){
            scr_company_order(obj_popup.manag);
            scr_company_order(obj_popup.target_comp);
        }


        with(obj_controller){
            // man_current=0;
            var man_size=0;selecting_location="";
            selecting_types="";
            selecting_ship=0;
            reset_manage_arrays();
            alll=0;
            update_general_manage_view();
        }

        with(obj_managment_panel){instance_destroy();}

        obj_controller.cooldown=10;
        instance_destroy();
    }
}



/* */

if (mouse_x>=xx+1465) and (mouse_y>=yy+499) and (mouse_x<xx+1577) and (mouse_y<yy+520){// Equipment

    if (type=6) and (cooldown<=0) and (n_good1+n_good2+n_good3+n_good4+n_good5=5){
        cooldown=999;
        obj_controller.cooldown=8;

        if (n_wep1="(None)") then n_wep1="";
        if (n_wep2="(None)") then n_wep2="";
        if (n_armour="(None)") then n_armour="";
        if (n_gear="(None)") then n_gear="";
        if (n_mobi="(None)") then n_mobi="";


        for (var i=0;i<array_length(obj_controller.display_unit);i++){

            var endcount=0;

            if (obj_controller.man[i]!="") and (obj_controller.man_sel[i]) and (vehicle_equipment!=-1){
                var check=0,scout_check=0;
                unit = obj_controller.display_unit[i];
                var standard = master_crafted==1?"master_crafted":"any";
                if (is_struct(unit)){
                    unit.update_armour(n_armour, true, true, standard);
                    unit.update_mobility_item(n_mobi, true, true, standard);
                    unit.update_weapon_one(n_wep1, true, true, standard);
                    unit.update_weapon_two(n_wep2, true, true, standard);
                    unit.update_gear(n_gear, true, true, standard);

                    update_man_manage_array(i);
                    continue;
                } else if (is_array(unit)){

                    // NOPE
                        if (check=0) and (n_armour!=obj_controller.ma_armour[i]) and (n_armour!="Assortment") and (vehicle_equipment!=1) and (vehicle_equipment!=6){ //vehicle wep3
                            if (obj_controller.ma_armour[i]!="") then scr_add_item(obj_controller.ma_armour[i],1);
                            obj_controller.ma_armour[i]="";
                            obj_ini.veh_wep3[unit[0],unit[1]]="";

                            if (n_armour!="(None") and (n_armour!=""){
                                obj_controller.ma_armour[i]=n_armour;
                                obj_ini.veh_wep3[unit[0],unit[1]]=n_armour;
                                if (n_armour!="") then scr_add_item(n_armour,-1);
                            }
                        }
                        check=0;
                        if (n_wep1=obj_controller.ma_wep1[i]) or (n_wep1="Assortment") then check=1;

                        if (check==0){
                            if (n_wep1!=obj_controller.ma_wep1[i])  and (n_wep1!="Assortment") and (vehicle_equipment!=1) and (vehicle_equipment!=6){ // vehicle wep1
                                if (obj_controller.ma_wep1[i]!="") and (obj_controller.ma_wep1[i]!=n_wep1){
                                    scr_add_item(obj_controller.ma_wep1[i],1);
                                    obj_controller.ma_wep1[i]="";
                                    obj_ini.veh_wep1[unit[0],unit[1]]="";
                                }
                                if (n_wep1!=""){
                                    scr_add_item(n_wep1,-1);
                                    obj_controller.ma_wep1[i]=n_wep1;
                                    obj_ini.veh_wep1[unit[0],unit[1]]=n_wep1;
                                }
                            }
                        }
                        // End swap weapon1

                        check=0;

                        if (n_wep2=obj_controller.ma_wep2[i]) or (n_wep2="Assortment") then check=1;

                        if (check==0) and (n_wep2!=obj_controller.ma_wep2[i]) and (n_wep2!="Assortment") and (vehicle_equipment!=1) and (vehicle_equipment!=6){ // vehicle wep2
                            if (obj_controller.ma_wep2[i]!="") and (obj_controller.ma_wep2[i]!=n_wep2){
                                scr_add_item(obj_controller.ma_wep2[i],1);
                                obj_controller.ma_wep2[i]="";
                                obj_ini.veh_wep2[unit[0],unit[1]]="";
                            }
                            if (n_wep2!=""){
                                scr_add_item(n_wep2,-1);
                                obj_controller.ma_wep2[i]=n_wep2;
                                obj_ini.veh_wep2[unit[0],unit[1]]=n_wep2;
                            }
                        }
                        // End swap weapon2

                        check=0;

                        if (check=0) and (n_gear!=obj_controller.ma_gear[i]) and (n_gear!="Assortment") and (vehicle_equipment!=1) and (vehicle_equipment!=6){ //vehicle upgrade item
                            if (obj_controller.ma_gear[i]!="") then scr_add_item(obj_controller.ma_gear[i],1);
                            obj_controller.ma_gear[i]="";
                            obj_ini.veh_upgrade[unit[0],unit[1]]="";
                            if (n_gear!="(None)") and (n_gear!=""){
                                obj_controller.ma_gear[i]=n_gear;
                                obj_ini.veh_upgrade[unit[0],unit[1]]=n_gear;
                            }
                            if (n_gear!="") then scr_add_item(n_gear,-1);
                        }
                        // End gear and upgrade

                        check=0;
                        if (check=0) and (n_mobi!=obj_controller.ma_mobi[i]) and (n_mobi!="Assortment") and (vehicle_equipment!=1) and (vehicle_equipment!=6){ //vehicle accessory item
                            if (obj_controller.ma_mobi[i]!="") then scr_add_item(obj_controller.ma_mobi[i],1);
                            obj_controller.ma_mobi[i]="";
                            obj_ini.veh_acc[unit[0],unit[1]]="";
                            obj_controller.ma_mobi[i]=n_mobi;
                            obj_ini.veh_acc[unit[0],unit[1]]=n_mobi;
                            if (n_mobi!="") then scr_add_item(n_mobi,-1);
                        }
                        // End mobility and accessory

                }

            }// End that [i]

        }// End repeat

        obj_controller.cooldown=10;
        instance_destroy();exit;
    }
}

/* */


// if ((mouse_x>=xx+240) and (mouse_x<=xx+387) and (type!=88)) or (((type=9) or (type=9.1)) and (mouse_x>=xx+240+420) and (mouse_x<xx+387+420)){
if ((type=9) or (type=9.1)) and (mouse_x>=xx+240+420) and (mouse_x<xx+387+420){
    if ((type=9) or (type=9.1)) and (cooldown<=0){
        giveto=0;

        if (mouse_y>=yy+325) and (mouse_y<yy+342){
            obj_controller.cooldown=8000;
            instance_destroy();
            exit;
        }

        inq_hide=0;
        if (type=9){
            if (array_contains(obj_ini.artifact_tags[obj_controller.fest_display], "inq")){
                var i=-1;
                repeat(10){
                    i+=1;
                    if (obj_controller.quest[i]="artifact_loan") then inq_hide=1;
                    if (obj_controller.quest[i]="artifact_return") then inq_hide=2;
                }
            }
        }


        if (mouse_y>=yy+121) and (mouse_y<=yy+149) and (obj_controller.known[eFACTION.Imperium]>1) then giveto=2;
        if (mouse_y>=yy+151) and (mouse_y<=yy+179) and (obj_controller.known[eFACTION.Mechanicus]>1) then giveto=3;
        if (mouse_y>=yy+181) and (mouse_y<=yy+209) and ((obj_controller.known[eFACTION.Inquisition]>1) or (inq_hide=2)) and (inq_hide!=1) then giveto=4;
        if (mouse_y>=yy+211) and (mouse_y<=yy+239) and (obj_controller.known[eFACTION.Ecclesiarchy]>1) then giveto=5;
        if (mouse_y>=yy+241) and (mouse_y<=yy+269) and (obj_controller.known[eFACTION.Eldar]>1) then giveto=6;
        if (mouse_y>=yy+271) and (mouse_y<=yy+299) and (obj_controller.known[eFACTION.Tau]>1) then giveto=8;





        if (giveto>0) and (type=9.1){
            var r1,r2,cn;r2=0;cn=obj_controller;
            r1=floor(random(cn.stc_wargear_un+cn.stc_vehicles_un+cn.stc_ships_un))+1;

            if (r1<cn.stc_wargear_un) and (cn.stc_wargear_un>0) then r2=1;
            if (r1>cn.stc_wargear_un) and (r1<=cn.stc_wargear_un+cn.stc_vehicles_un) and (cn.stc_vehicles_un>0) then r2=2;
            if (r1>cn.stc_wargear_un+cn.stc_vehicles_un) and (r2<=cn.stc_wargear_un+cn.stc_vehicles_un+cn.stc_ships_un) and (cn.stc_ships_un>0) then r2=3;

            if (cn.stc_wargear_un>0) and (cn.stc_vehicles_un+cn.stc_ships_un=0) then r2=1;
            if (cn.stc_vehicles_un>0) and (cn.stc_wargear_un+cn.stc_ships_un=0) then r2=2;
            if (cn.stc_ships_un>0) and (cn.stc_vehicles_un+cn.stc_wargear_un=0) then r2=3;

            cn.stc_un_total-=1;
            if (r2=1) then cn.stc_wargear_un-=1;
            if (r2=2) then cn.stc_vehicles_un-=1;
            if (r2=3) then cn.stc_ships_un-=1;

            // Modify disposition here
            if (giveto = eFACTION.Imperium)
				obj_controller.disposition[giveto]+=3;
            else if (giveto = eFACTION.Mechanicus)
				obj_controller.disposition[giveto]+=choose(5,6,7,8);
            else if (giveto = eFACTION.Inquisition)
				obj_controller.disposition[giveto]+=3;
            else if (giveto = eFACTION.Ecclesiarchy) {
                obj_controller.disposition[giveto]+=3;
                var o;
				o=0;
				repeat(4) {
					o+=1;
					if (obj_ini.adv[o]="Reverent Guardians") {
						obj_controller.disposition[giveto]+=2;
						break;
					}
				}
            }
			
            if (giveto=eFACTION.Eldar)
				obj_controller.disposition[giveto] +=2;
            if (giveto=eFACTION.Tau) {
				obj_controller.disposition[giveto]+=15;
			}// 137 ; chance for mechanicus to get very pissed
            // End disposition
            obj_controller.cooldown=7000;
            obj_controller.menu=20;
            obj_controller.diplomacy=giveto;
            obj_controller.force_goodbye=-1;
            var the;
			the="";
			if (giveto!=eFACTION.Ork) and (giveto!=eFACTION.Chaos) then the="the ";
			
            scr_event_log("",$"STC Fragment gifted to {the}{obj_controller.faction[giveto]}.");

            with(obj_controller ) {
				scr_dialogue("stc_thanks");
			}
            instance_destroy();
			exit;
        }

        if (giveto>0) and (type=9){
            var arti_index = obj_controller.menu_artifact;

            var e=0;
            repeat(50){e+=1;
                if (obj_controller.fest_display=arti_index) then obj_controller.fest_display=0;

                /*if (obj_ini.artifact_tags[obj_controller.menu_artifact]=obj_controller.recent_keyword[e]){
                    obj_controller.recent_keyword[e]="";obj_controller.recent_type[e]="";
                    obj_controller.recent_turn[e]=0;obj_controller.recent_number[e]=0;
                    scr_recent("artifact_gifted",obj_controller.recent_keyword,giveto);
                    scr_recent("","",0);
                }*/
            }




            old_tags=obj_ini.artifact_tags[arti_index];
            obj_ini.artifact[arti_index]="";
            obj_ini.artifact_tags[arti_index]="";
            obj_ini.artifact_identified[arti_index]=0;
            obj_ini.artifact_condition[arti_index]=100;
            obj_ini.artifact_loc[arti_index]="";
            obj_ini.artifact_sid[arti_index]=0;
            var arti = obj_ini.artifact_struct[arti_index];
            arti.unequip_from_unit();
            obj_ini.artifact_struct[arti_index] = new arti_struct(arti_index);
            obj_ini.artifact_equipped[arti_index] = false;

            obj_controller.artifacts-=1;
            cooldown=7000;

            obj_controller.cooldown=10;
            if (obj_controller.menu_artifact>obj_controller.artifacts) then obj_controller.menu_artifact=obj_controller.artifacts;

            obj_controller.menu=20;
            obj_controller.diplomacy=giveto;
            obj_controller.force_goodbye=-1;
            var the="";
            if (giveto!=7) and (giveto!=10) then the="the ";
            scr_event_log("","Artifact gifted to "+string(the)+string(obj_controller.faction[giveto])+".");
            var is_daemon = array_contains(old_tags,"Daemon");
            var is_chaos = array_contains(old_tags,"Chaos");
            if (inq_hide!=2) then with(obj_controller){
                if (!is_daemon) or ((diplomacy!=4) and (diplomacy!=5) and (diplomacy!=2)) then scr_dialogue("artifact_thanks");
                if (is_daemon) and ((diplomacy=4) or (diplomacy=5) or (diplomacy=2)) then scr_dialogue("artifact_daemon");
            }
            if (inq_hide=2) and (obj_controller.diplomacy=4) then with(obj_controller){scr_dialogue("artifact_returned");}

            if (string_count("MINOR",old_tags)=0){
                if (giveto=2) then obj_controller.disposition[2]+=6;
                if (giveto=3) then obj_controller.disposition[3]+=4;
                if (giveto=4) and (inq_hide!=2) then obj_controller.disposition[4]+=4;
                if (giveto=4) and (inq_hide=2) then obj_controller.disposition[4]+=2;
                if (giveto=5) and (!is_daemon){
                    obj_controller.disposition[5]+=4;
                    var o=0
                    if (array_contains(obj_ini.adv, "Reverent Guardians")) then obj_controller.disposition[5]+=2;
                }
                if (giveto=6) then obj_controller.disposition[6]+=3;
                if (giveto=8) then obj_controller.disposition[8]+=4;
            }

            // Need to modify ^^^^ based on if it is chaos or daemonic

            if (giveto=2){
                if (is_daemon){
                    var v,ev;v=0;ev=0;repeat(99){v+=1;if (ev=0) and (obj_controller.event[v]="") then ev=v;}
                    obj_controller.event[ev]="imperium_daemon";obj_controller.event_duration[ev]=1;
                    with(obj_star){
                        if (p_owner[1]=2) then p_heresy[1]+=choose(30,40,50,60);
                        if (p_owner[2]=2) then p_heresy[2]+=choose(30,40,50,60);
                        if (p_owner[3]=2) then p_heresy[3]+=choose(30,40,50,60);
                        if (p_owner[4]=2) then p_heresy[4]+=choose(30,40,50,60);
                    }
                }
                if (is_chaos){
                    with(obj_star){
                        if (p_owner[1]=2) and (p_heresy[1]>0) then p_heresy[1]+=10;
                        if (p_owner[2]=2) and (p_heresy[2]>0) then p_heresy[2]+=10;
                        if (p_owner[3]=2) and (p_heresy[3]>0) then p_heresy[3]+=10;
                        if (p_owner[4]=2) and (p_heresy[4]>0) then p_heresy[4]+=10;
                    }
                }
            }
            if (giveto=8){
                if (is_daemon){
                    with(obj_star){
                        if (p_owner[1]=8) then p_heresy[1]+=40;
                        if (p_owner[2]=8) then p_heresy[2]+=40;
                        if (p_owner[3]=8) then p_heresy[3]+=40;
                        if (p_owner[4]=8) then p_heresy[4]+=40;
                    }
                }
            }
            instance_destroy();exit;
        }

    }
}



xx=__view_get( e__VW.XView, 0 )+951;yy=__view_get( e__VW.YView, 0 )+398;
if (mouse_x>=xx+121) and (mouse_y>=yy+393) and (mouse_x<xx+231) and (mouse_y<yy+414){
    if (type=8) and (cooldown<=0){
        obj_controller.cooldown=8000;
        instance_destroy();exit;
    }
}

if (type=8) and (cooldown<=0){
    var xx,yy,before;
    xx=__view_get( e__VW.XView, 0 )+951;yy=__view_get( e__VW.YView, 0 )+48;
    before=target_comp;

    if (mouse_y>=yy+71) and (mouse_y<yy+87){
        if (mouse_x>=xx+75) and (mouse_x<=xx+125){target_comp=0;cooldown=8000;}
    }
    if (mouse_y>=yy+87) and (mouse_y<yy+103){
        if (mouse_x>=xx+77) and (mouse_x<=xx+125){target_comp=1;cooldown=8000;}
        if (mouse_x>=xx+158) and (mouse_x<=xx+203){target_comp=2;cooldown=8000;}
        if (mouse_x>=xx+275) and (mouse_x<=xx+320){target_comp=3;cooldown=8000;}
        if (mouse_x>=xx+386) and (mouse_x<=xx+430){target_comp=4;cooldown=8000;}
        if (mouse_x>=xx+497) and (mouse_x<=xx+545){target_comp=5;cooldown=8000;}
    }
    if (mouse_y>=yy+103) and (mouse_y<yy+129){
        if (mouse_x>=xx+77) and (mouse_x<=xx+125){target_comp=6;cooldown=8000;}
        if (mouse_x>=xx+158) and (mouse_x<=xx+203){target_comp=7;cooldown=8000;}
        if (mouse_x>=xx+275) and (mouse_x<=xx+320){target_comp=8;cooldown=8000;}
        if (mouse_x>=xx+386) and (mouse_x<=xx+430){target_comp=9;cooldown=8000;}
        if (mouse_x>=xx+497) and (mouse_x<=xx+545){target_comp=10;cooldown=8000;}
    }

    if (mouse_y>=yy+124) and (mouse_y<yy+146) and (target_role<3){
        if (mouse_x>=xx+196) and (mouse_x<xx+291){target_role=1;cooldown=8;}
        if (mouse_x>=xx+424) and (mouse_x<=xx+525){target_role=2;cooldown=8;}
    }

    if (before!=target_comp){units=0;
        with(obj_controller){
            if (obj_popup.target_comp>0) then scr_company_view(obj_popup.target_comp);
            if (obj_popup.target_comp=0) then scr_special_view(0);
        }
        var i;i=-1;
        repeat(array_length(obj_controller.display_unit)){i+=1;
            obj_controller.man_sel[i]=0;
        }i=-1;
    }


    if (cooldown<=0) and (target_comp!=-1){
        var xx,yy,bb;bb="";x2=__view_get( e__VW.XView, 0 )+951;y2=__view_get( e__VW.YView, 0 )+398;
        var top,sel,temp1,temp2,temp3,temp4,temp5;temp1="";temp2="";temp3="";temp4="";temp5="";
        top=obj_controller.man_current;var stop;stop=0;sel=top;

        repeat(min(array_length(obj_controller.display_unit),23)){
            if (mouse_x>=xx+29) and (mouse_y>=yy+150) and (mouse_x<xx+569) and (mouse_y<yy+175.4){
                var onceh;onceh=0;stop=0;
                if (obj_controller.man_sel[sel]=0) and (onceh=0){cooldown=8000;units=1;
                    if (stop=0){
                        onceh=1;
                        obj_controller.man_sel[sel]=1;
                        stop=sel;
                    }
                }
                if (obj_controller.man_sel[sel]=1) and (onceh=0){
                    onceh=1;units=0;obj_controller.man_sel[sel]=0;cooldown=8000;
                }
            }
            yy+=25.4;sel+=1;
        }

        if (stop!=0){var i;i=-1;
            repeat(array_length(obj_controller.display_unit)){i+=1;
                if (i!=stop) then obj_controller.man_sel[i]=0;
            }
        }

    }
}

/* */
}
}
/*  */
