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




if (option1="") and (type<5){
    obj_controller.cooldown=10;
    if (instance_exists(obj_turn_end)) and (obj_controller.complex_event=false){if (number!=0) then obj_turn_end.alarm[1]=4;}
    instance_destroy();exit;
}

if (type>4) and (type!=9) and (cooldown<=0){
    var xx,yy;xx=__view_get( e__VW.XView, 0 );yy=__view_get( e__VW.YView, 0 );

    if (mouse_x>=xx+1006) and (mouse_y>=yy+499) and (mouse_x<=xx+1116) and (mouse_y<yy+519){
        obj_controller.cooldown=10;
        instance_destroy();exit;
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
            if (mouse_x>=xx+1468) and (mouse_x<=xx+1515) and (min_exp>=0){target_comp=0;cooldown=8000;}
        }
        if (mouse_y>=yy+230) and (mouse_y<yy+250) and (unit_role!="Lexicanum") and (unit_role!="Codiciery"){
            if (mouse_x>=xx+1030) and (mouse_x<=xx+1120) and (min_exp>=80){target_comp=1;cooldown=8000;}
            if (mouse_x>=xx+1140) and (mouse_x<=xx+1230) and (min_exp>=70){target_comp=2;cooldown=8000;}
            if (mouse_x>=xx+1250) and (mouse_x<=xx+1340) and (min_exp>=60){target_comp=3;cooldown=8000;}
            if (mouse_x>=xx+1360) and (mouse_x<=xx+1450) and (min_exp>=50){target_comp=4;cooldown=8000;}
            if (mouse_x>=xx+1470) and (mouse_x<=xx+1560) and (min_exp>=40){target_comp=5;cooldown=8000;}
        }
        if (mouse_y>=yy+250) and (mouse_y<yy+270) and (unit_role!="Lexicanum") and (unit_role!="Codiciery"){
            if (mouse_x>=xx+1030) and (mouse_x<=xx+1120) and (min_exp>=35){target_comp=6;cooldown=8000;}
            if (mouse_x>=xx+1140) and (mouse_x<=xx+1230) and (min_exp>=30){target_comp=7;cooldown=8000;}
            if (mouse_x>=xx+1250) and (mouse_x<=xx+1340) and (min_exp>=25){target_comp=8;cooldown=8000;}
            if (mouse_x>=xx+1360) and (mouse_x<=xx+1450) and (min_exp>=20){target_comp=9;cooldown=8000;}
            if (mouse_x>=xx+1470) and (mouse_x<=xx+1560) and (min_exp>=0){target_comp=10;cooldown=8000;}
        }
    }

    if (mouse_y>=yy+310) and (mouse_y<yy+330) and (type=5){
        if (mouse_x>=xx+1030) and (mouse_x<xx+1180) and (min_exp>=role_exp[1]) and (role_name[1]!=""){target_role=1;cooldown=8;}
        if (mouse_x>=xx+1200) and (mouse_x<xx+1350) and (min_exp>=role_exp[2]) and (role_name[2]!=""){target_role=2;cooldown=8;}
        if (mouse_x>=xx+1370) and (mouse_x<xx+1520) and (min_exp>=role_exp[3]) and (role_name[3]!=""){target_role=3;cooldown=8;}
    }
    if (mouse_y>=yy+330) and (mouse_y<yy+350) and (type=5){
        if (mouse_x>=xx+1030) and (mouse_x<xx+1180) and (min_exp>=role_exp[4]) and (role_name[4]!=""){target_role=4;cooldown=8;}
        if (mouse_x>=xx+1200) and (mouse_x<xx+1350) and (min_exp>=role_exp[5]) and (role_name[5]!=""){target_role=5;cooldown=8;}
        if (mouse_x>=xx+1370) and (mouse_x<xx+1520) and (min_exp>=role_exp[6]) and (role_name[6]!=""){target_role=6;cooldown=8;}
    }


    if (before!=target_comp) and (type=5){
        var i,cap,bear,spec,champ;i=0;cap=0;bear=0;spec=0;champ=0;

        var i;i=-1;
        repeat(10){i+=1;role_name[i]="";role_exp[i]=0;}
        req_armour="";req_armour_num=0;
        req_gear="";req_gear_num=0;
        req_mobi="";req_mobi_num=0;
        req_wep1="";req_wep1_num=0;
        req_wep2="";req_wep2_num=0;

        if (unit_role=obj_ini.role[100][16]){role_name[1]=obj_ini.role[100][16];role_exp[1]=5;spec=1;}
        if (unit_role=obj_ini.role[100][15]){role_name[1]=obj_ini.role[100][15];role_exp[1]=5;spec=1;}
        if (unit_role=obj_ini.role[100][6]){role_name[1]="Venerable "+string(obj_ini.role[100][6]);role_exp[1]=400;spec=0;}


        if (unit_role=obj_ini.role[100][14]) and (global.chapter_name!="Space Wolves") and (global.chapter_name!="Iron Hands"){role_name[1]=obj_ini.role[100][14];role_exp[1]=5;spec=1;}
        if (unit_role="Lexicanum") and (target_comp=0){
            role_name[1]=obj_ini.role[100,17];role_exp[1]=125;spec=1;
            role_name[2]="Codiciery";role_exp[2]=80;
        }
        if (unit_role="Codiciery") and (target_comp=0){
            role_name[1]=obj_ini.role[100,17];role_exp[1]=125;spec=1;
        }

        // honour guard xp requirement
        if ((target_comp=0) or (target_comp>10)) and (spec=0){
            i=0;cap=0;bear=0;champ=0;
            i+=1;role_name[i]=obj_ini.role[100][2];role_exp[i]=200;
        }
       // this area does the required exp for roles per company
        if (target_comp=1) and (spec=0){
            i=0;cap=0;bear=0;champ=0;
            if (units=1){cap=scr_role_count(obj_ini.role[100][5],"1");if (cap=0){i+=1;role_name[i]=obj_ini.role[100][5];role_exp[i]=210;}}
            if (units=1){bear=scr_role_count("Standard Bearer","1");if (bear=0){i+=1;role_name[i]="Standard Bearer";role_exp[i]=95;}}
            if (units=1){champ=scr_role_count(obj_ini.role[100][7],"1");if (champ=0){i+=1;role_name[i]=obj_ini.role[100][7];role_exp[i]=180;}}
            i+=1;role_name[i]="Terminator";role_exp[i]=180;
            i+=1;role_name[i]=obj_ini.role[100][3];role_exp[i]=150;
            if (units=1){i+=1;role_name[i]=obj_ini.role[100][6];role_exp[i]=150;}
        }

        if (target_comp=2) and (spec=0){
            i=0;cap=0;bear=0;champ=0;
            if (units=1){cap=scr_role_count(obj_ini.role[100][5],"2");if (cap=0){i+=1;role_name[i]=obj_ini.role[100][5];role_exp[i]=200;}}
            if (units=1){bear=scr_role_count("Standard Bearer","2");if (bear=0){i+=1;role_name[i]="Standard Bearer";role_exp[i]=75;}}
            if (units=1){champ=scr_role_count(obj_ini.role[100][7],"2");if (champ=0){i+=1;role_name[i]=obj_ini.role[100][7];role_exp[i]=170;}}
            i+=1;role_name[i]=obj_ini.role[100][8];role_exp[i]=120;
            i+=1;role_name[i]=obj_ini.role[100][10];role_exp[i]=120;
            i+=1;role_name[i]=obj_ini.role[100][9];role_exp[i]=120;
            if (units=1){i+=1;role_name[i]=obj_ini.role[100][6];role_exp[i]=120;}
        }

        if (target_comp=3) and (spec=0){
            i=0;cap=0;bear=0;champ=0;
            if (units=1){cap=scr_role_count(obj_ini.role[100][5],"3");if (cap=0){i+=1;role_name[i]=obj_ini.role[100][5];role_exp[i]=190;}}
            if (units=1){bear=scr_role_count("Standard Bearer","3");if (bear=0){i+=1;role_name[i]="Standard Bearer";role_exp[i]=65;}}
            if (units=1){champ=scr_role_count(obj_ini.role[100][7],"3");if (champ=0){i+=1;role_name[i]=obj_ini.role[100][7];role_exp[i]=160;}}
            i+=1;role_name[i]=obj_ini.role[100][8];role_exp[i]=110;
            i+=1;role_name[i]=obj_ini.role[100][10];role_exp[i]=110;
            i+=1;role_name[i]=obj_ini.role[100][9];role_exp[i]=110;
            if (units=1){i+=1;role_name[i]=obj_ini.role[100][6];role_exp[i]=110;}
        }
      
        if (target_comp=4) and (spec=0){
            i=0;cap=0;bear=0;champ=0;
            if (units=1){cap=scr_role_count(obj_ini.role[100][5],"4");if (cap=0){i+=1;role_name[i]=obj_ini.role[100][5];role_exp[i]=170;}}
            if (units=1){bear=scr_role_count("Standard Bearer","4");if (bear=0){i+=1;role_name[i]="Standard Bearer";role_exp[i]=55;}}
            if (units=1){champ=scr_role_count(obj_ini.role[100][7],"4");if (champ=0){i+=1;role_name[i]=obj_ini.role[100][7];role_exp[i]=140;}}
            i+=1;role_name[i]=obj_ini.role[100][8];role_exp[i]=100;
            i+=1;role_name[i]=obj_ini.role[100][10];role_exp[i]=100;
            i+=1;role_name[i]=obj_ini.role[100][9];role_exp[i]=100;
            if (units=1){i+=1;role_name[i]=obj_ini.role[100][6];role_exp[i]=50;}
        }

        if (target_comp=5) and (spec=0){
            i=0;cap=0;bear=0;champ=0;
            if (units=1){cap=scr_role_count(obj_ini.role[100][5],"5");if (cap=0){i+=1;role_name[i]=obj_ini.role[100][5];role_exp[i]=160;}}
            if (units=1){bear=scr_role_count("Standard Bearer","5");if (bear=0){i+=1;role_name[i]="Standard Bearer";role_exp[i]=45;}
            if (units=1){champ=scr_role_count(obj_ini.role[100][7],"5");if (champ=0){i+=1;role_name[i]=obj_ini.role[100][7];role_exp[i]=130;}}}
            i+=1;role_name[i]=obj_ini.role[100][8];role_exp[i]=80;
            i+=1;role_name[i]=obj_ini.role[100][10];role_exp[i]=80;
            i+=1;role_name[i]=obj_ini.role[100][9];role_exp[i]=80;
            if (units=1){i+=1;role_name[i]=obj_ini.role[100][6];role_exp[i]=80;}
        }

        if (target_comp=6) and (spec=0){
            i=0;cap=0;bear=0;champ=0;
            if (units=1){cap=scr_role_count(obj_ini.role[100][5],"6");if (cap=0){i+=1;role_name[i]=obj_ini.role[100][5];role_exp[i]=120;}}
            if (units=1){bear=scr_role_count("Standard Bearer","6");if (bear=0){i+=1;role_name[i]="Standard Bearer";role_exp[i]=40;}}
            if (units=1){champ=scr_role_count(obj_ini.role[100][7],"6");if (champ=0){i+=1;role_name[i]=obj_ini.role[100][7];role_exp[i]=100;}}
            i+=1;role_name[i]=obj_ini.role[100][8];role_exp[i]=70;
            if (units=1){i+=1;role_name[i]=obj_ini.role[100][6];role_exp[i]=70;}
        }

        if (target_comp=7) and (spec=0){
            i=0;cap=0;bear=0;champ=0;
            if (units=1){cap=scr_role_count(obj_ini.role[100][5],"7");if (cap=0){i+=1;role_name[i]=obj_ini.role[100][5];role_exp[i]=120;}}
            if (units=1){bear=scr_role_count("Standard Bearer","7");if (bear=0){i+=1;role_name[i]="Standard Bearer";role_exp[i]=35;}}
            if (units=1){champ=scr_role_count(obj_ini.role[100][7],"7");if (champ=0){i+=1;role_name[i]=obj_ini.role[100][7];role_exp[i]=100;}}
            i+=1;role_name[i]=obj_ini.role[100][8];role_exp[i]=60;
            if (units=1){i+=1;role_name[i]=obj_ini.role[100][6];role_exp[i]=60;}
        }

        if (target_comp=8) and (spec=0){
            i=0;cap=0;bear=0;champ=0;
            if (units=1){cap=scr_role_count(obj_ini.role[100][5],"8");if (cap=0){i+=1;role_name[i]=obj_ini.role[100][5];role_exp[i]=120;}}
            if (units=1){bear=scr_role_count("Standard Bearer","8");if (bear=0){i+=1;role_name[i]="Standard Bearer";role_exp[i]=30;}}
            if (units=1){champ=scr_role_count(obj_ini.role[100][7],"8");if (champ=0){i+=1;role_name[i]=obj_ini.role[100][7];role_exp[i]=100;}}
            i+=1;role_name[i]=obj_ini.role[100][10];role_exp[i]=50;
            if (units=1){i+=1;role_name[i]=obj_ini.role[100][6];role_exp[i]=50;}
        }

        if (target_comp=9) and (spec=0){
            i=0;cap=0;bear=0;champ=0;
            if (units=1){cap=scr_role_count(obj_ini.role[100][5],"9");if (cap=0){i+=1;role_name[i]=obj_ini.role[100][5];role_exp[i]=120;}}
            if (units=1){bear=scr_role_count("Standard Bearer","9");if (bear=0){i+=1;role_name[i]="Standard Bearer";role_exp[i]=25;}
            if (units=1){champ=scr_role_count(obj_ini.role[100][7],"9");if (champ=0){i+=1;role_name[i]=obj_ini.role[100][7];role_exp[i]=100;}}}
            i+=1;role_name[i]=obj_ini.role[100][9];role_exp[i]=40;
            if (units=1){i+=1;role_name[i]=obj_ini.role[100][6];role_exp[i]=40;}
        }

        if (target_comp=10) and (spec=0){
            i=0;cap=0;bear=0;champ=0;
            if (units=1){cap=scr_role_count(obj_ini.role[100][5],"10");if (cap=0){i+=1;role_name[i]=obj_ini.role[100][5];role_exp[i]=120;}}
            if (units=1){bear=scr_role_count("Standard Bearer","10");if (bear=0){i+=1;role_name[i]="Standard Bearer";role_exp[i]=25;}}
            if (units=1){champ=scr_role_count(obj_ini.role[100][7],"10");if (champ=0){i+=1;role_name[i]=obj_ini.role[100][7];role_exp[i]=100;}}
            i+=1;role_name[i]=obj_ini.role[100][12];role_exp[i]=0;
        }



        var huj;huj=1;
        if (unit_role=obj_ini.role[100][5]){
            huj-=scr_role_count(obj_ini.role[100][5],string(target_comp));
            huj-=scr_role_count("Company Champion",string(target_comp));
        }
        if (huj=1) and (target_comp!=0){i+=1;role_name[i]="DoNotChange";}

        target_role=0;all_good=0;


        if (obj_controller.command_set[2]=1){var w;w=0;
            repeat(10){w+=1;if (role_name[w]!="") and (role_exp[w]>5) then role_exp[w]=5;}
        }

        /* More elaborate checking here; the EXP should be the minimum for that company.
        If any of the units are captain, dread, special, etc. then it should be greyed out.*/

    }



    if (before2!=target_role) and (type=5){
        var i,rall;i=0;rall="";all_good=0;

        req_armour="";req_armour_num=0;have_armour_num=0;
        req_gear="";req_gear_num=0;have_gear_num=0;
        req_mobi="";req_mobi_num=0;have_mobi_num=0;
        req_wep1="";req_wep1_num=0;have_wep1_num=0;
        req_wep2="";req_wep2_num=0;have_wep2_num=0;

        rall=role_name[target_role];

        if (rall=obj_ini.role[100][14]) and (global.chapter_name!="Space Wolves") and (global.chapter_name!="Iron Hands"){req_armour="";req_armour_num=0;req_wep1="";req_wep1_num=0;req_wep2="";req_wep2_num=0;req_mobi="";req_mobi_num=0;}
        if (rall=obj_ini.role[100][15]){req_armour="";req_armour_num=0;req_wep1="";req_wep1_num=0;req_wep2="";req_wep2_num=0;req_mobi="";req_mobi_num=0;}

        if (rall=obj_ini.role[100,17]){req_armour="";req_armour_num=0;req_wep1=obj_ini.wep1[100,17];req_wep1_num=units;req_wep2=obj_ini.wep2[100,17];req_wep2_num=units;req_gear=obj_ini.gear[100,17];req_gear_num=units;}
        if (rall="Codiciery"){req_armour="";req_armour_num=0;req_wep1="";req_wep1_num=0;req_wep2="";req_wep2_num=0;req_mobi="";req_mobi_num=0;req_gear=obj_ini.gear[100,17];req_gear_num=units;}
        if (rall="Lexicanum"){req_armour="";req_armour_num=0;req_wep1="";req_wep1_num=0;req_wep2="";req_wep2_num=0;req_mobi="";req_mobi_num=0;}

        if (rall=obj_ini.role[100][5]){req_armour=obj_ini.armour[100,5];req_armour_num=units;req_wep1="Chainsword";req_wep1_num=units;req_wep2="Bolt Pistol";req_wep2_num=units;}
        if (rall="Standard Bearer"){req_armour="Power Armour";req_armour_num=units;req_wep2="Company Standard";req_wep2_num=units;}
        if (rall=obj_ini.role[100][3]){req_armour=obj_ini.armour[100,3];req_armour_num=units;req_wep1=obj_ini.wep1[100,3];req_wep1_num=units;req_wep2=obj_ini.wep2[100,3];req_wep2_num=units;}
        if (rall=obj_ini.role[100][4]){req_armour=obj_ini.armour[100,4];req_armour_num=units;req_wep1=obj_ini.wep1[100,4];req_wep1_num=units;req_wep2=obj_ini.wep2[100,4];req_wep2_num=units;}
        if (rall=obj_ini.role[100][8]){req_armour=obj_ini.armour[100,8];req_armour_num=units;req_wep1=obj_ini.wep1[100,8];req_wep1_num=units;req_wep2=obj_ini.wep2[100,8];req_wep2_num=units;}
        if (rall=obj_ini.role[100][9]){req_armour=obj_ini.armour[100,9];req_armour_num=units;req_wep1=obj_ini.wep1[100,9];req_wep1_num=units;req_wep2=obj_ini.wep2[100,9];req_wep2_num=units;}
        if (rall=obj_ini.role[100][10]){req_armour=obj_ini.armour[100,10];req_armour_num=units;req_wep1=obj_ini.wep1[100,10];req_wep1_num=units;req_wep2=obj_ini.wep2[100,10];req_wep2_num=units;req_mobi="Jump Pack";req_mobi_num=units;}

        if (rall=obj_ini.role[100][2]){req_wep1=obj_ini.wep1[100,2];req_wep1_num=units;req_wep2=obj_ini.wep2[100,2];req_wep2_num=units;req_mobi=obj_ini.mobi[100,2];req_mobi_num=units;}

        if (rall=obj_ini.role[100][6]){req_armour="Dreadnought";req_armour_num=units;req_wep1=obj_ini.wep1[100,6];req_wep1_num=units;req_wep2=obj_ini.wep2[100,6];req_wep2_num=units;}
        if (rall="Venerable "+string(obj_ini.role[100][6])){req_armour="";req_armour_num=0;req_wep1="";req_wep1_num=0;req_wep2="";req_wep2_num=0;}



        repeat(obj_controller.man_max){
            i+=1;

            if (obj_controller.man[i]!="") and (obj_controller.man_sel[i]=1) and (obj_controller.ma_promote[i]=1) and (obj_controller.ma_exp[i]>=min_exp){
                if (req_armour="Power Armour"){
                    if (obj_controller.ma_armour[i]="MK3 Iron Armour") or (obj_controller.ma_armour[i]="MK4 Maximus") or (obj_controller.ma_armour[i]="MK5 Heresy") or (obj_controller.ma_armour[i]="MK6 Corvus") then have_armour_num+=1;
                    if (obj_controller.ma_armour[i]="MK7 Aquila") or (obj_controller.ma_armour[i]="Power Armour") then have_armour_num+=1;
                }
                if (req_armour="Terminator Armour"){if (obj_controller.ma_armour[i]="Terminator Armour") or (obj_controller.ma_armour[i]="Tartaros") then have_armour_num+=1;}

                if (obj_controller.ma_wep1[i]=req_wep1) or (obj_controller.ma_wep2[i]=req_wep1) then have_wep1_num+=1;
                if (obj_controller.ma_wep2[i]=req_wep2) or (obj_controller.ma_wep1[i]=req_wep2) then have_wep2_num+=1;


                if (obj_controller.ma_gear[i]=req_gear) then have_gear_num+=1;
                if (obj_controller.ma_mobi[i]=req_mobi) then have_mobi_num+=1;

                if (req_wep1="Heavy Ranged"){
                    if (obj_controller.ma_wep1[i]="Heavy Bolter") or (obj_controller.ma_wep1[i]="Lascannon") or (obj_controller.ma_wep1[i]="Missile Launcher") then have_wep1_num+=1;
                }
            }

            // if (n_wep1=n_wep2) and ((o_wep1!=n_wep1) or (o_wep2!=n_wep2)){have_wep1_num-=1;have_wep2_num-=1;}

        }// End Repeat

        // This checks to see if there is any more in the armoury
        if (req_armour="Power Armour"){
            have_armour_num+=scr_item_count("MK3 Iron Armour");
            have_armour_num+=scr_item_count("MK4 Maximus");
            have_armour_num+=scr_item_count("MK5 Heresy");
            have_armour_num+=scr_item_count("MK6 Corvus");
            have_armour_num+=scr_item_count("MK7 Aquila");
            have_armour_num+=scr_item_count("Power Armour");
        }
        if (req_armour="Terminator Armour"){
            have_armour_num+=scr_item_count("Terminator Armour");
            have_armour_num+=scr_item_count("Tartaros");
        }
        if (req_armour="Dreadnought") then have_armour_num+=scr_item_count("Dreadnought");

        if (req_wep1!="Heavy Ranged") then have_wep1_num+=scr_item_count(string(req_wep1));
        if (req_wep2!="Heavy Ranged") then have_wep2_num+=scr_item_count(string(req_wep2));
        if (req_wep1="Heavy Ranged"){
            have_wep1_num+=scr_item_count("Lascannon");
            have_wep1_num+=scr_item_count("Heavy Bolter");
            have_wep1_num+=scr_item_count("Missile Launcher");
        }
        if (req_wep2="Heavy Ranged"){
            have_wep2_num+=scr_item_count("Heavy Bolter");
            have_wep2_num+=scr_item_count("Lascannon");
            have_wep2_num+=scr_item_count("Missile Launcher");
        }
        if (req_gear!="") then have_gear_num+=scr_item_count(string(req_gear));
        if (req_mobi!="") then have_mobi_num+=scr_item_count(string(req_mobi));

        if ((have_armour_num>=req_armour_num) or (req_armour="")) and ((have_wep1_num>=req_wep1_num) or (req_wep1="")) and ((have_wep2_num>=req_wep2_num) or (req_wep2="")) then all_good=0.4;
        if (req_gear="") or (req_gear_num<=have_gear_num) then all_good+=0.3;
        if (req_mobi="") or (req_mobi_num<=have_mobi_num) then all_good+=0.3;
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
        if (company>10) then company=0;
        manag=obj_controller.managing;
        if (manag>10) then manag=0;
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
        for (w=0;w<500;w++){
            if (obj_controller.man_sel[w]==1){
                if (obj_controller.man[w]=="man"){
                    moveable=true;
                    unit = obj_ini.TTRPG[company,obj_controller.ide[w]];
                    if (unit.squad != "none"){   // this evaluates if you are tryin to move a whole squad and if so moves teh squad to a new company
                        move_squad = unit.squad;
                        squad = obj_ini.squads[move_squad];
                        if (squad.base_company == company){
                            move_members = squad.members;
                            for (var mem = 0;mem<array_length(move_members);mem++){//check all members have been selected and are in the same company
                                if (w+mem<500){
                                    if (move_members[mem][0] != company || obj_controller.man_sel[w+mem]!=1 || obj_ini.TTRPG[company,obj_controller.ide[w+mem]].squad != move_squad){
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
                                    scr_move_unit_info(company,target_comp,obj_controller.ide[w+mem],mahreens, false);
                                    obj_ini.TTRPG[target_comp,mahreens].squad = move_squad;
                                    squad.members[mem][0] = target_comp;
                                    squad.members[mem][1] = mahreens;
                                    mahreens++;
                                }
                                w+=mem-2;
                                squad.base_company = target_comp;
                            }
                        } else {moveable=false}
                    } else {moveable=false}
                    //move individual
                    if (!moveable){
                        scr_move_unit_info(company,target_comp,obj_controller.ide[w],mahreens, true);
                        mahreens++;
                    }
                    var check=0;
                }else if(obj_controller.man[w]=="vehicle"){ // This seems to execute the correct number of times
                    var check=0;
    				// Check if the target company is within the allowed range
                    if (target_comp >= 1) and (target_comp <= 10) {
                        obj_ini.veh_race[target_comp,vehi]=obj_ini.veh_race[company,obj_controller.ide[w]];
                        obj_ini.veh_loc[target_comp,vehi]=obj_ini.veh_loc[company,obj_controller.ide[w]];
                        obj_ini.veh_role[target_comp,vehi]=obj_ini.veh_role[company,obj_controller.ide[w]];
                        obj_ini.veh_wep1[target_comp,vehi]=obj_ini.veh_wep1[company,obj_controller.ide[w]];
                        obj_ini.veh_wep2[target_comp,vehi]=obj_ini.veh_wep2[company,obj_controller.ide[w]];
                        obj_ini.veh_wep3[target_comp,vehi]=obj_ini.veh_wep3[company,obj_controller.ide[w]];
                        obj_ini.veh_upgrade[target_comp,vehi]=obj_ini.veh_upgrade[company,obj_controller.ide[w]];
                        obj_ini.veh_acc[target_comp,vehi]=obj_ini.veh_acc[company,obj_controller.ide[w]];
                        obj_ini.veh_hp[target_comp,vehi]=obj_ini.veh_hp[company,obj_controller.ide[w]];
                        obj_ini.veh_chaos[target_comp,vehi]=obj_ini.veh_chaos[company,obj_controller.ide[w]];
                        obj_ini.veh_pilots[target_comp,vehi]=0;
                        obj_ini.veh_lid[target_comp,vehi]=obj_ini.veh_lid[company,obj_controller.ide[w]];
                        obj_ini.veh_wid[target_comp,vehi]=obj_ini.veh_wid[company,obj_controller.ide[w]];

                        obj_ini.veh_race[company,obj_controller.ide[w]]=0;
                        obj_ini.veh_loc[company,obj_controller.ide[w]]="";
                        obj_ini.veh_role[company,obj_controller.ide[w]]="";
                        obj_ini.veh_wep1[company,obj_controller.ide[w]]="";
                        obj_ini.veh_wep2[company,obj_controller.ide[w]]="";
                        obj_ini.veh_wep3[company,obj_controller.ide[w]]="";
                        obj_ini.veh_upgrade[company,obj_controller.ide[w]]="";
                        obj_ini.veh_acc[company,obj_controller.ide[w]]="";
                        obj_ini.veh_hp[company,obj_controller.ide[w]]=0;
                        obj_ini.veh_chaos[company,obj_controller.ide[w]]=0;
                        obj_ini.veh_pilots[company,obj_controller.ide[w]]=0;
                        obj_ini.veh_lid[company,obj_controller.ide[w]]=0;
                        obj_ini.veh_wid[company,obj_controller.ide[w]]=0;

                        vehi++;
                    }

                }
            }
		
        }

        // Check this

        with(obj_controller){scr_management(1);}
            obj_ini.selected_company=company;
            obj_ini.temp_target_company=target_comp;
        with(obj_ini){
            scr_company_order(selected_company);
            scr_company_order(temp_target_company);
            scr_vehicle_order(selected_company);
            scr_vehicle_order(temp_target_company);
        }

        with(obj_controller){
            // man_current=0;
            var i;i=-1;man_size=0;selecting_location="";selecting_types="";selecting_ship=0;
            repeat(501){w+=1;
                man[w]="";ide[w]=0;man_sel[w]=0;ma_lid[w]=0;ma_wid[w]=0;ma_god[w]=0;ma_bio[w]=0;
                ma_race[w]=0;ma_loc[w]="";ma_name[w]="";ma_role[w]="";ma_wep1[w]="";display_unit[w]={};
                ma_wep2[w]="";ma_armour[w]="";ma_health[w]=100;ma_chaos[w]=0;ma_exp[w]=0;ma_promote[w]=0;
                sh_ide[w]=0;sh_name[w]="";sh_class[w]="";sh_loc[w]="";sh_hp[w]="";sh_cargo[w]=0;sh_cargo_max[w]="";
            }
            alll=0;
            if (managing<=10) and (managing!=0) then scr_company_view(managing);
            if (managing>10) or (managing=0) then scr_special_view(managing);
            cooldown=10;sel_loading=0;unload=0;alarm[6]=30;
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
        if (mouse_y>=yy+318) and (mouse_y<yy+330) and (mouse_x>=xx+1190) and (mouse_x<xx+1216) and (tab!=1){change_tab=1;tab=1;obj_controller.last_weapons_tab=1;cooldown=8000;}
        if (mouse_y>=yy+318) and (mouse_y<yy+330) and (mouse_x>=xx+1263) and (mouse_x<xx+1289) and (tab!=2){change_tab=1;tab=2;obj_controller.last_weapons_tab=2;cooldown=8000;}
        if (mouse_y>=yy+318) and (mouse_y<yy+330) and (mouse_x>=xx+1409) and (mouse_x<xx+1435) and (target_comp<3){
            var onceh;onceh=0;cooldown=8000;
            if (onceh=0) and (master_crafted=0){master_crafted=1;obj_controller.popup_master_crafted=1;onceh=1;scr_weapons_equip();}
            if (onceh=0) and (master_crafted=1){master_crafted=0;obj_controller.popup_master_crafted=0;onceh=1;scr_weapons_equip();}
        }
    }


    if ((mouse_x>=xx+1296) and (mouse_x<xx+1578)) or (change_tab=1){
        var befi;befi=target_comp;

        if (change_tab=0){
            if (mouse_y>=yy+220) and (mouse_y<yy+240){target_comp=1;cooldown=8000;tab=obj_controller.last_weapons_tab;}
            if (mouse_y>=yy+240) and (mouse_y<yy+260){target_comp=2;cooldown=8000;tab=obj_controller.last_weapons_tab;}
            if (mouse_y>=yy+260) and (mouse_y<yy+280){target_comp=3;cooldown=8000;}
            if (mouse_y>=yy+280) and (mouse_y<yy+300){target_comp=4;cooldown=8000;}
            if (mouse_y>=yy+300) and (mouse_y<yy+320){target_comp=5;cooldown=8000;}
        }

        if ((befi!=target_comp) and (vehicle_equipment!=-1)) or (change_tab=1){
            var i;i=0;repeat(40){i+=1;item_name[i]="";}

            scr_weapons_equip();

        }



    }



    var top;top=0;
    if (mouse_x>=xx+1016) and (mouse_x<xx+1160){
        if (mouse_y>=yy+335) and (mouse_y<yy+355) and (item_name[1]!=""){top=1;cooldown=8000;}
        if (mouse_y>=yy+355) and (mouse_y<yy+375) and (item_name[2]!=""){top=2;cooldown=8000;}
        if (mouse_y>=yy+375) and (mouse_y<yy+395) and (item_name[3]!=""){top=3;cooldown=8000;}
        if (mouse_y>=yy+395) and (mouse_y<yy+415) and (item_name[4]!=""){top=4;cooldown=8000;}
        if (mouse_y>=yy+415) and (mouse_y<yy+435) and (item_name[5]!=""){top=5;cooldown=8000;}
        if (mouse_y>=yy+435) and (mouse_y<yy+455) and (item_name[6]!=""){top=6;cooldown=8000;}
        if (mouse_y>=yy+455) and (mouse_y<yy+475) and (item_name[7]!=""){top=7;cooldown=8000;}
    }
    if (mouse_x>=xx+1170) and (mouse_x<xx+1314){
        if (mouse_y>=yy+335) and (mouse_y<yy+355) and (item_name[8]!=""){top=8;cooldown=8000;}
        if (mouse_y>=yy+355) and (mouse_y<yy+375) and (item_name[9]!=""){top=9;cooldown=8000;}
        if (mouse_y>=yy+375) and (mouse_y<yy+395) and (item_name[10]!=""){top=10;cooldown=8000;}
        if (mouse_y>=yy+395) and (mouse_y<yy+415) and (item_name[11]!=""){top=11;cooldown=8000;}
        if (mouse_y>=yy+415) and (mouse_y<yy+435) and (item_name[12]!=""){top=12;cooldown=8000;}
        if (mouse_y>=yy+435) and (mouse_y<yy+455) and (item_name[13]!=""){top=13;cooldown=8000;}
        if (mouse_y>=yy+455) and (mouse_y<yy+475) and (item_name[14]!=""){top=14;cooldown=8000;}
    }
    if (mouse_x>=xx+1324) and (mouse_x<xx+1468){
        if (mouse_y>=yy+335) and (mouse_y<yy+355) and (item_name[15]!=""){top=15;cooldown=8000;}
        if (mouse_y>=yy+355) and (mouse_y<yy+375) and (item_name[16]!=""){top=16;cooldown=8000;}
        if (mouse_y>=yy+375) and (mouse_y<yy+395) and (item_name[17]!=""){top=17;cooldown=8000;}
        if (mouse_y>=yy+395) and (mouse_y<yy+415) and (item_name[18]!=""){top=18;cooldown=8000;}
        if (mouse_y>=yy+415) and (mouse_y<yy+435) and (item_name[19]!=""){top=19;cooldown=8000;}
        if (mouse_y>=yy+435) and (mouse_y<yy+455) and (item_name[20]!=""){top=20;cooldown=8000;}
        if (mouse_y>=yy+455) and (mouse_y<yy+475) and (item_name[21]!=""){top=21;cooldown=8000;}
    }
    if (mouse_x>=xx+1468) and (mouse_x<xx+1612){
        if (mouse_y>=yy+335) and (mouse_y<yy+355) and (item_name[22]!=""){top=22;cooldown=8000;}
        if (mouse_y>=yy+355) and (mouse_y<yy+375) and (item_name[23]!=""){top=23;cooldown=8000;}
        if (mouse_y>=yy+375) and (mouse_y<yy+395) and (item_name[24]!=""){top=24;cooldown=8000;}
        if (mouse_y>=yy+395) and (mouse_y<yy+415) and (item_name[25]!=""){top=25;cooldown=8000;}
        if (mouse_y>=yy+415) and (mouse_y<yy+435) and (item_name[26]!=""){top=26;cooldown=8000;}
        if (mouse_y>=yy+435) and (mouse_y<yy+455) and (item_name[27]!=""){top=27;cooldown=8000;}
        if (mouse_y>=yy+455) and (mouse_y<yy+475) and (item_name[28]!=""){top=28;cooldown=8000;}
    }



    if (top!=0){
        warning="";// Add have right here?
        if (target_comp=1){n_wep1=item_name[top];sel1=top;}
        if (target_comp=2){n_wep2=item_name[top];sel2=top;}
        if (target_comp=3){n_armour=item_name[top];sel3=top;}
        if (target_comp=4){n_gear=item_name[top];sel4=top;}
        if (target_comp=5){n_mobi=item_name[top];sel5=top;}
    }

    if (target_comp=1) and ((n_wep1="(None)") or (n_wep1="")){n_good1=1;}
    if (target_comp=2) and ((n_wep2="(None)") or (n_wep2="")){n_good2=1;}
    if (target_comp=3) and ((n_armour="(None)") or (n_armour="")){n_good2=1;}
    if (target_comp=4) and ((n_gear="(None)") or (n_gear="")){n_good4=1;}
    if (target_comp=5) and ((n_mobi="(None)") or (n_mobi="")){n_good5=1;}
    // Removed EXIT; from each of these


    // if (n_wep1=n_wep2){if (o_wep1=n_wep1) and (o_wep2!=n_wep2) then have_wep2_num-=1;if (o_wep2=n_wep2) and (o_wep1!=n_wep1) then have_wep1_num-=1;}



    if (target_comp=1) and (n_wep1!="Assortment") and (n_wep1!="(None)"){// Check numbers
        req_wep1_num=units;have_wep1_num=0;
        var i;i=0;
        repeat(obj_controller.man_max){i+=1;
            if (vehicle_equipment!=-1) and (obj_controller.ma_wep1[i]=n_wep1) then have_wep1_num+=1;
        }
        // req_wep1_num+=scr_item_count(n_wep1);
        have_wep1_num+=scr_item_count(n_wep1);
        // req_wep1_num=units;

        if (have_wep1_num>=req_wep1_num) or (n_wep1="(None") then n_good1=1;
        if (have_wep1_num<req_wep1_num){n_good1=0;warning="Not enough "+string(n_wep1)+"; "+string(req_wep1_num-have_wep1_num)+" more are required.";}
        if (n_wep1="Thunder Hammer"){
            var g,exp_check;g=0;exp_check=0;
            repeat(obj_controller.man_max){
                g+=1;if (obj_controller.man_sel[g]=1) and (obj_controller.ma_exp[g]<140) then exp_check=1;
            }
            if (exp_check=1){n_good1=0;warning="A unit must have 140+ EXP to use a Thunder Hammer.";}
        }
        if (string_count("Terminator",n_armour)=0) and (string_count("Dreadnought",n_armour)=0) and (string_count("Tartaros",n_armour)=0) and (n_wep1="Assault Cannon"){n_good1=0;warning="Cannot use Assault Cannons without Terminator/Dreadnought Armour.";}
        if (string_count("Dreadnought",n_armour)=0) and (n_wep1="Close Combat Weapon"){n_good1=0;warning="Only "+string(obj_ini.role[100][6])+" can use Close Combat Weapons.";}
    }
    if (target_comp=2) and (n_wep2!="Assortment") and (n_wep2!="(None)"){// Check numbers
        req_wep2_num=units;have_wep2_num=0;
        var i;i=0;
        repeat(obj_controller.man_max){i+=1;
            if (vehicle_equipment!=-1) and (obj_controller.ma_wep2[i]=n_wep2) then have_wep2_num+=1;
        }
        // req_wep2_num+=scr_item_count(n_wep2);
        have_wep2_num+=scr_item_count(n_wep2);
        // req_wep2_num=units;

        if (have_wep2_num>=req_wep2_num) or (n_wep2="(None") then n_good2=1;
        if (have_wep2_num<req_wep2_num){n_good2=0;warning="Not enough "+string(n_wep2)+"; "+string(req_wep2_num-have_wep2_num)+" more are required.";}
        if (n_wep2="Thunder Hammer"){
            var g,exp_check;g=0;exp_check=0;
            repeat(obj_controller.man_max){
                g+=1;if (obj_controller.man_sel[g]=1) and (obj_controller.ma_exp[g]<140) then exp_check=1;
            }
            if (exp_check=1){n_good2=0;warning="A unit must have 140+ EXP to use a Thunder Hammer.";}
        }
        if (string_count("Terminator",n_armour)=0) and (string_count("Dreadnought",n_armour)=0) and (string_count("Tartaros",n_armour)=0) and (n_wep2="Assault Cannon"){n_good2=0;warning="Cannot use Assault Cannons without Terminator/Dreadnought Armour.";}
        if (string_count("Dreadnought",n_armour)=0) and (n_wep2="Close Combat Weapon"){n_good2=0;warning="Only "+string(obj_ini.role[100][6])+" can use Close Combat Weapons.";}
        if ((string_count("Terminator",n_armour)>0) or (string_count("Tartaros",n_armour)>0) or (string_count("Dreadnought",n_armour)>0)) and (n_mobi!="") then n_good2=0;
        if ((string_count("Terminator",o_armour)>0) or (string_count("Tartaros",o_armour)>0) or (string_count("Dreadnought",o_armour)>0)) and (n_mobi!="") then n_good2=0;
    }
    if (target_comp=3) and (n_armour!="Assortment") and (n_armour!="(None)"){// Check numbers
        req_armour_num=units;have_armour_num=0;
        var i;i=0;
        repeat(obj_controller.man_max){i+=1;
            if (vehicle_equipment!=-1) and (obj_controller.man_sel[i]=1) and (obj_controller.ma_armour[i]=n_armour) then have_armour_num+=1;
        }
        have_armour_num+=scr_item_count(n_armour);

        if (have_armour_num>=req_armour_num) or (n_armour="(None") then n_good3=1;
        if (have_armour_num<req_armour_num){n_good3=0;warning="Not enough "+string(n_armour)+"; "+string(units-req_armour_num)+" more are required.";}

        var g,exp_check;g=0;exp_check=0;
        if (n_armour="Terminator Armour") or (n_armour="Tartaros") then repeat(obj_controller.man_max){
            g+=1;
            if (obj_controller.man_sel[g]=1) and (obj_controller.ma_exp[g]<90) then exp_check=1;
        }
        if (exp_check=1){n_good3=0;warning="A unit must have 90+ EXP to use Terminator armour.";}
        if (string_count("Dread",o_armour)>0) and (string_count("Dread",n_armour)=0){
            n_good4=0;warning="Marines may not exit Dreadnoughts.";
        }

    }
    if (target_comp=4) and (n_gear!="Assortment") and (n_gear!="(None)"){// Check numbers
        req_gear_num=units;have_gear_num=0;
        var i;i=0;
        repeat(obj_controller.man_max){i+=1;
            if (vehicle_equipment!=-1) and (obj_controller.man_sel[i]=1) and (obj_controller.ma_gear[i]=n_gear) then have_gear_num+=1;
        }
        have_gear_num+=scr_item_count(n_gear);

        if (have_gear_num>=req_gear_num) or (n_gear="(None") then n_good4=1;
        if (have_gear_num<req_gear_num){n_good4=0;warning="Not enough "+string(n_gear)+"; "+string(units-req_gear_num)+" more are required.";}

        if (n_gear!="(None)") and (n_gear!="") and (string_count("Dreadnought",n_armour)>0){
            n_good4=0;warning="Dreadnoughts may not use infantry equipment.";
        }
    }
    if (target_comp=5) and (n_mobi!="Assortment") and (n_mobi!="(None)"){// Check numbers
        req_mobi_num=units;have_mobi_num=0;
        var i;i=0;
        repeat(obj_controller.man_max){i+=1;
            if (vehicle_equipment!=-1) and (obj_controller.man_sel[i]=1) and (obj_controller.ma_mobi[i]=n_mobi) then have_mobi_num+=1;
        }
        have_mobi_num+=scr_item_count(n_mobi);

        if (have_mobi_num>=req_mobi_num) or (n_mobi="(None")  then n_good5=1;
        if (have_mobi_num<req_mobi_num){n_good5=0;warning="Not enough "+string(n_mobi)+"; "+string(units-req_mobi_num)+" more are required.";}

        if (n_mobi!="") and ((n_armour="Terminator Armour") or (n_armour="Tartaros")){
            n_good5=0;warning="Terminators cannot use Mobility gear.";
        }
        if (n_mobi!="(None)") and (n_mobi!="") and (n_armour="Dreadnought"){
            n_good5=0;warning=string(obj_ini.role[100][6])+"s may not use mobility gear.";
        }

    }
}







if (mouse_x>=xx+1465) and (mouse_y>=yy+499) and (mouse_x<xx+1576) and (mouse_y<yy+518){// Promoting right here
    if (type=5) and (cooldown<=0) and (all_good=1) and (target_comp!=-1) and (role_name[target_role]!=""){
        cooldown=999;obj_controller.cooldown=8000;

        var mahreens=0;i=0;

        if (target_comp>10) then target_comp=0;
        if (company>10) then company=0;
        manag=obj_controller.managing;
        if (manag>10) then manag=0;

        for(i=0;i<501;i++){
            if (obj_ini.name[target_[comp][i]]=="" and obj_ini.name[target_[comp][i]+1]=="") {
                mahreens=i;
                break;
            }
        }
        // Gets the number of marines in the target company
        if (role_name[target_role]=="DoNotChange") then do_not_change=true;
        var unit;
        for(i=0;i<=obj_controller.man_max;i++){

            if (obj_controller.man[i]!="") and (obj_controller.man_sel[i]=1) and (obj_controller.ma_promote[i]>=1) and (obj_controller.ma_exp[i]>=min_exp){
                var check;
                unit = obj_controller.display_unit[i];
                check=0;

                if (req_armour="") or (do_not_change=true) then check=1;
                if (req_armour="Power Armour"){
                    if (array_contains(global.power_armour,obj_controller.ma_armour[i]))  then check=1;
                }
                if (req_armour="Terminator Armour"){if (obj_controller.ma_armour[i]="Terminator Armour") or (obj_controller.ma_armour[i]="Tartaros") then check=1;}
                if (req_armour="Scout Armour"){if (obj_controller.ma_armour[i]="Scout Armour") then check=1;}
                if (req_armour="Dreadnought"){if (obj_controller.ma_armour[i]="Dreadnought") then check=1;}

                if (check=0){
                    var satisfied = 0;
                    if (req_armour="Power Armour"){
                        if (obj_controller.ma_armour[i]!=""){// Move current armour to armoury
                            scr_add_item(obj_ini.armour[company,obj_controller.ide[i]],1);
                            obj_controller.ma_armour[i]="";obj_ini.armour[company,obj_controller.ide[i]]="";
                        }
                        var pa_type = ""
                        for (var pa=0;pa<array_length(global.power_armour);pa++){
                            satisfied = 0;
                            if (obj_controller.ma_armour[i]=""){
                                pa_type = global.power_armour[pa];
                                satisfied=scr_item_count(pa_type);
                                if (satisfied>0){
                                    scr_add_item(pa_type,-1);
                                    obj_controller.ma_armour[i]=pa_type;
                                    obj_ini.armour[company,obj_controller.ide[i]]=pa_type;
                                    break;
                                }
                            }
                        }
                    }else if (req_armour="Terminator Armour"){
                        if (obj_controller.ma_armour[i]!=""){// Move current armour to armoury
                            scr_add_item(obj_ini.armour[company,obj_controller.ide[i]],1);
                            obj_controller.ma_armour[i]="";obj_ini.armour[company,obj_controller.ide[i]]="";
                        }

                        if (obj_controller.ma_armour[i]=""){
                            satisfied=scr_item_count("Terminator Armour");
                            if (satisfied>0){scr_add_item("Terminator Armour",-1);obj_controller.ma_armour[i]="Terminator Armour";obj_ini.armour[company,obj_controller.ide[i]]="Terminator Armour";}
                        }
                        if (obj_controller.ma_armour[i]=""){
                           satisfied=scr_item_count("Tartarus");
                            if (satisfied>0){scr_add_item("Tartarus",-1);obj_controller.ma_armour[i]="Tartarus";obj_ini.armour[company,obj_controller.ide[i]]="Tartarus";}
                        }
                    }else if (req_armour="Scout Armour"){
                        if (obj_controller.ma_armour[i]!=""){// Move current armour to armoury
                            scr_add_item(obj_ini.armour[company,obj_controller.ide[i]],1);
                            obj_controller.ma_armour[i]="";obj_ini.armour[company,obj_controller.ide[i]]="";
                        }

                        if (obj_controller.ma_armour[i]=""){
                            satisfied=scr_item_count("Scout Armour");
                            if (satisfied>0){scr_add_item("Scout Armour",-1);obj_controller.ma_armour[i]="Scout Armour";obj_ini.armour[company,obj_controller.ide[i]]="Scout Armour";}
                        }
                    }else if (req_armour="Dreadnought"){
                        if (obj_controller.ma_armour[i]!=""){// Move current armour to armoury
                            scr_add_item(obj_ini.armour[company,obj_controller.ide[i]],1);
                            obj_controller.ma_armour[i]="";obj_ini.armour[company,obj_controller.ide[i]]="";
                            if (obj_ini.age[company,obj_controller.ide[i]]!=floor(obj_ini.age[company,obj_controller.ide[i]])) then obj_ini.age[company,obj_controller.ide[i]]=floor(obj_ini.age[company,obj_controller.ide[i]]);
                        }

                        if (obj_controller.ma_armour[i]=""){
                            satisfied=scr_item_count("Dreadnought");
                            if (satisfied>0){scr_add_item("Dreadnought",-1);obj_controller.ma_armour[i]="Dreadnought";obj_ini.armour[company,obj_controller.ide[i]]="Dreadnought";}
                        }
                    }
                }

                // End swap armour


                if (obj_controller.ma_wep1[i]!=req_wep1) and (req_wep1!="Heavy Ranged") and (req_wep1!="") and (do_not_change=false){// NOT HEAVY RANGED
                    check=0;var satisfied;satisfied=0;

                    if (obj_controller.ma_wep2[i]=req_wep1)/* and (role_name[target_role]!=obj_ini.role[100][6])*/{
                        var temp;temp="";temp=obj_controller.ma_wep1[i];// Get temp
                        obj_controller.ma_wep1[i]=obj_controller.ma_wep2[i];obj_ini.wep1[company,obj_controller.ide[i]]=obj_ini.wep2[company,obj_controller.ide[i]];// Wep2 -> Wep1
                        obj_controller.ma_wep2[i]=temp;obj_ini.wep2[company,obj_controller.ide[i]]=temp;// Temp -> Wep2
                    }

                    if (obj_controller.ma_wep1[i]!=req_wep1){// If still not it, and has weapon, return to armoury
                        if (obj_controller.ma_wep1[i]!=""){
                            scr_add_item(obj_ini.wep1[company,obj_controller.ide[i]],1);
                            obj_controller.ma_wep1[i]="";obj_ini.wep1[company,obj_controller.ide[i]]="";
                        }
                        if (obj_controller.ma_wep1[i]="") and (req_wep1!="")/* and (role_name[target_role]!=obj_ini.role[100][6])*/{// Check armoury for the weapon
                            satisfied=scr_item_count(req_wep1);
                            if (satisfied>0){scr_add_item(req_wep1,-1);obj_controller.ma_wep1[i]=req_wep1;obj_ini.wep1[company,obj_controller.ide[i]]=req_wep1;}
                        }
                    }
                }
                if (obj_controller.ma_wep1[i]!="Heavy Bolter") and (obj_controller.ma_wep1[i]!="Lascannon") and (obj_controller.ma_wep1[i]!="Missile Launcher") and (req_wep1="Heavy Ranged") and (req_wep1!="") and (do_not_change=false){// HEAVY RANGED
                    check=0;var satisfied;satisfied=0;

                    if (obj_controller.ma_wep2[i]="Heavy Bolter") or (obj_controller.ma_wep2[i]="Lascannon") or (obj_controller.ma_wep2[i]="Missile Launcher"){
                        var temp;temp="";temp=obj_controller.ma_wep1[i];// Get temp
                        obj_controller.ma_wep1[i]=obj_controller.ma_wep2[i];obj_ini.wep1[company,obj_controller.ide[i]]=obj_ini.wep2[company,obj_controller.ide[i]];// Wep2 -> Wep1
                        obj_controller.ma_wep2[i]=temp;obj_ini.wep2[company,obj_controller.ide[i]]=temp;// Temp -> Wep2
                    }

                    if (obj_controller.ma_wep1[i]!="Heavy Bolter") and (obj_controller.ma_wep1[i]!="Lascannon") and (obj_controller.ma_wep1[i]!="Missile Launcher"){// If still not it, and has weapon, return to armoury
                        if (obj_controller.ma_wep1[i]!=""){
                            scr_add_item(obj_ini.wep1[company,obj_controller.ide[i]],1);
                            obj_controller.ma_wep1[i]="";obj_ini.wep1[company,obj_controller.ide[i]]="";
                        }

                        if (obj_controller.ma_wep1[i]=""){// Check armoury for lascannon
                            satisfied=scr_item_count("Lascannon");
                            if (satisfied>0){scr_add_item("Lascannon",-1);obj_controller.ma_wep1[i]="Lascannon";obj_ini.wep1[company,obj_controller.ide[i]]="Lascannon";}
                        }
                        if (obj_controller.ma_wep1[i]=""){// Check armoury for Heavy Bolter
                            satisfied=scr_item_count("Heavy Bolter");
                            if (satisfied>0){scr_add_item("Heavy Bolter",-1);obj_controller.ma_wep1[i]="Heavy Bolter";obj_ini.wep1[company,obj_controller.ide[i]]="Heavy Bolter";}
                        }
                        if (obj_controller.ma_wep1[i]=""){// Check armoury for Missile Launcher
                            satisfied=scr_item_count("Missile Launcher");
                            if (satisfied>0){scr_add_item("Missile Launcher",-1);obj_controller.ma_wep1[i]="Missile Launcher";obj_ini.wep1[company,obj_controller.ide[i]]="Missile Launcher";}
                        }
                    }
                }
                // End swap first weapon

                if (obj_controller.ma_wep2[i]!=req_wep1) and (req_wep2!="") and (do_not_change=false){// SECOND WEAPON
                    check=0;var satisfied;satisfied=0;

                    if (obj_controller.ma_wep2[i]!=req_wep2){// If still not it, and has weapon, return to armoury
                        if (obj_controller.ma_wep2[i]!=""){
                            scr_add_item(obj_ini.wep2[company,obj_controller.ide[i]],1);
                            obj_controller.ma_wep2[i]="";obj_ini.wep2[company,obj_controller.ide[i]]="";
                        }
                        if (obj_controller.ma_wep2[i]="") and (req_wep2!="")/* and (role_name[target_role]!=obj_ini.role[100][6])*/{// Check armoury for the weapon
                            satisfied=scr_item_count(req_wep2);
                            if (satisfied>0){scr_add_item(req_wep2,-1);obj_controller.ma_wep2[i]=req_wep2;obj_ini.wep2[company,obj_controller.ide[i]]=req_wep2;}
                        }
                    }
                }
                // End swap second weapon

                if (obj_controller.ma_gear[i]!=req_gear) and (req_gear!="") and (do_not_change=false){// GEAR
                    check=0;var satisfied;satisfied=0;

                    if (obj_controller.ma_gear[i]!=req_gear){// If still not it, and have gear, return to armoury
                        if (obj_controller.ma_gear[i]!=""){
                            scr_add_item(obj_ini.gear[company,obj_controller.ide[i]],1);
                            obj_controller.ma_gear[i]="";
                            obj_ini.gear[company,obj_controller.ide[i]]="";
                        }
                        if (obj_controller.ma_gear[i]="") and (req_gear!=""){// Check armoury for the gear
                            satisfied=scr_item_count(req_gear);
                            if (satisfied>0){
                                scr_add_item(req_gear,-1);
                                obj_controller.ma_gear[i]=req_gear;
                                obj_ini.gear[company,obj_controller.ide[i]]=req_gear;
                            }
                        }
                    }
                }

                // End swap gear

                if (obj_controller.ma_mobi[i]!=req_mobi) and (req_mobi!="") and (do_not_change=false){// mobi
                    check=0;
                    var satisfied=0;

                    if (obj_controller.ma_mobi[i]!=req_mobi){// If still not it, and have mobi, return to armoury
                        if (obj_controller.ma_mobi[i]!=""){
                            scr_add_item(unit.mobility_item(),1);
                            obj_controller.ma_mobi[i]="";
                            unit.update_mobility_item("");
                        }
                        if (obj_controller.ma_mobi[i]="") and (req_mobi!=""){// Check armoury for the mobi
                            satisfied=scr_item_count(req_mobi);
                            if (satisfied>0){scr_add_item(req_mobi,-1);
                                obj_controller.ma_mobi[i]=req_mobi;
                                unit.update_mobility_item(req_mobi);
                            }
                        }
                    }
                }

                // Pass variables here

                // This changes a marine from MARINE to COMMAND if they get put into a dreadnought
                var  bef=obj_controller.ma_role[i],aft=role_name[target_role];

                if (do_not_change==true){
                    aft=obj_ini.role[company,obj_controller.ide[i]];
                } else{
                    obj_ini.role[company,obj_controller.ide[i]] = role_name[target_role];
                    
                    if (role_name[target_role]==obj_ini.role[100][5]){// Restock recruiter or admiral dude
                        if (target_comp=4) then obj_ini.lord_admiral_name=obj_controller.ma_name[i];
                        if (target_comp=10) then obj_ini.recruiter_name=obj_controller.ma_name[i];
                    }

                }

                if (!is_specialist(bef)) and (is_specialist(aft)){obj_controller.marines-=1;obj_controller.command+=1;}
                if (is_specialist(bef)) and (!is_specialist(aft)){obj_controller.marines+=1;obj_controller.command-=1;}

                scr_move_unit_info(company,target_comp,obj_controller.ide[i],mahreens);	
                if (role_name[target_role]==obj_ini.role[100][6]) and (do_not_change==false){
                    obj_ini.hp[target_comp,mahreens]=100;
                    var dread_weapons =["Close Combat Weapon","Force Weapon","Lascannon","Assault Cannon","Missile Launcher","Heavy Bolter"];

                    if (!array_contains(dread_weapons,obj_ini.wep1[target_comp,mahreens])){
                        scr_add_item(obj_ini.wep1[target_comp,mahreens],1);
                        obj_ini.wep1[target_comp,mahreens]="";
                    }
                    if (!array_contains(dread_weapons,obj_ini.wep2[target_comp,mahreens])){
                        scr_add_item(obj_ini.wep2[target_comp,mahreens],1);
                        obj_ini.wep2[target_comp,mahreens]="";
                    }                    
                    if (obj_ini.mobi[target_comp,mahreens]!=""){
                        scr_add_item(obj_ini.mobi[target_comp,mahreens],1);
                        obj_ini.mobi[target_comp,mahreens]="";
                    }
                    if (obj_ini.gear[target_comp,mahreens]!=""){
                        scr_add_item(obj_ini.gear[target_comp,mahreens],1);
                        obj_ini.gear[target_comp,mahreens]="";
                    }
                    // Remove illegal weapons here
                }             
                if (role_name[target_role]=obj_ini.role[100][5]) then scr_recent("captain_promote",obj_ini.name[target_comp,mahreens],target_comp);
                if (role_name[target_role]=obj_ini.role[100][4]) then scr_recent("terminator_promote",obj_ini.name[target_comp,mahreens],target_comp);
                if (role_name[target_role]=obj_ini.role[100][2]) then scr_recent("honor_promote",obj_ini.name[target_comp,mahreens],target_comp);			

                mahreens+=1;

            }// End that [i]

        }// End repeat


        with(obj_controller){scr_management(1);}

        with(obj_ini){
            scr_company_order(obj_popup.manag);
            scr_company_order(obj_popup.target_comp);
        }


        with(obj_controller){
            // man_current=0;
            var man_size=0;selecting_location="";selecting_types="";selecting_ship=0;
            for (var i=0;i<=500;i++){
                man[i]="";
                ide[i]=0;
                man_sel[i]=0;
                ma_lid[i]=0;
                ma_wid[i]=0;
                ma_god[i]=0;
                ma_race[i]=0;
                ma_loc[i]="";
                ma_name[i]="";
                ma_role[i]="";
                ma_wep1[i]="";
                display_unit[i]={};
                ma_wep2[i]="";
                ma_armour[i]="";
                ma_health[i]=100;
                ma_chaos[i]=0;
                ma_exp[i]=0;
                ma_promote[i]=0;
                sh_ide[i]=0;
                sh_name[i]="";
                sh_class[i]="";
                sh_loc[i]="";
                sh_hp[i]="";
                sh_cargo[i]=0;
                sh_cargo_max[i]="";
            }
            alll=0;
            if (managing<=10) and (managing!=0) then scr_company_view(managing);
            if (managing>10) or (managing=0) then scr_special_view(managing);
            cooldown=10;sel_loading=0;unload=0;alarm[6]=30;
        }

        with(obj_managment_panel){instance_destroy();}

        obj_controller.cooldown=10;
        instance_destroy();
    }
}



/* */

if (mouse_x>=xx+1465) and (mouse_y>=yy+499) and (mouse_x<xx+1577) and (mouse_y<yy+520){// Equipment

    var w=0
    if (company>10) then company=0;
    for(var w=0;w<500;w++){ // Gets the number of marines in the selected company
        if (obj_ini.name[company,w]=="") and (obj_ini.name[company,w+1]==""){
            infantrycount=w;
            break;
        }
    }  
    if (type=6) and (cooldown<=0) and (n_good1+n_good2+n_good3+n_good4+n_good5=5){
        cooldown=999;obj_controller.cooldown=8;

        if (n_wep1="(None)") then n_wep1="";
        if (n_wep2="(None)") then n_wep2="";
        if (n_armour="(None)") then n_armour="";
        if (n_gear="(None)") then n_gear="";
        if (n_mobi="(None)") then n_mobi="";


        for (var i=1;i<=obj_controller.man_max;i++){

            var endcount=0;

            if (obj_controller.man[i]!="") and (obj_controller.man_sel[i]=1) and (vehicle_equipment!=-1){
                var check=0,scout_check=0;
                unit = obj_controller.display_unit[i];

                if (n_armour=obj_controller.ma_armour[i]) then check=1;
                if (check=0) and (n_armour!=obj_controller.ma_armour[i]) and (n_armour!="Assortment")and ((vehicle_equipment=1) or (vehicle_equipment=6)){ //normal infantry or dread armour
                    if (string_count("Dread",obj_ini.armour[company,obj_controller.ide[i]])=0){
                        /* if (obj_controller.ma_role[i]=obj_ini.role[100][12]){
                            if (n_armour!="") and (n_armour!="Power Armour") and (n_armour!="Scout Armour") then scout_check=1;
                        }*/
                        if (scout_check=0){
                            unit.update_armour(n_armour)
                            obj_controller.ma_armour[i]=n_armour;
                            if (n_armour="Dreadnought") and (obj_ini.age[company,obj_controller.ide[i]]!=floor(obj_ini.age[company,obj_controller.ide[i]])) then obj_ini.age[company,obj_controller.ide[i]]=floor(obj_ini.age[company,obj_controller.ide[i]]);
                        }
                    }

                    // NOPE
                    if ((n_armour="Terminator Armour") or (n_armour="Tartaros")) and (unit.mobility_item()!=""){
                        unit.update_mobility_item("");
                        obj_controller.ma_mobi[i]="";
                    }
                    if (obj_ini.wep1[company,obj_controller.ide[i]]="Assault Cannon") or (obj_ini.wep2[company,obj_controller.ide[i]]="Assault Cannon"){
                        var bed=0,bgn=obj_ini.armour[company,obj_controller.ide[i]];
                        if (bgn!="Terminator Armour") and (bgn!="Tartaros") then bed+=1;
                        if (string_count("Termi",bgn)=0) then bed+=1;
                        if (bed=2){
                            if (obj_ini.wep1[company,obj_controller.ide[i]]="Assault Cannon"){
                                scr_add_item(obj_ini.wep1[company,obj_controller.ide[i]],1);obj_ini.wep1[company,obj_controller.ide[i]]="";
                            }
                            if (obj_ini.wep2[company,obj_controller.ide[i]]="Assault Cannon"){
                                scr_add_item(obj_ini.wep2[company,obj_controller.ide[i]],1);obj_ini.wep2[company,obj_controller.ide[i]]="";
                            }
                        }
                    }
                }
                if (check=0) and (n_armour!=obj_controller.ma_armour[i]) and (n_armour!="Assortment") and (vehicle_equipment!=1) and (vehicle_equipment!=6){ //vehicle wep3
                    if (obj_controller.ma_armour[i]!="") then scr_add_item(obj_controller.ma_armour[i],1);
                    obj_controller.ma_armour[i]="";
                    obj_ini.veh_wep3[company,i-infantrycount+1]="";

                    if (n_armour!="(None") and (n_armour!=""){
                        obj_controller.ma_armour[i]=n_armour;
                        obj_ini.veh_wep3[company,i-infantrycount+1]=n_armour;
                        if (n_armour!="") then scr_add_item(n_armour,-1);
                    }
                }
                // End swap armour and wep3


                // if (n_wep1=n_wep2) and (


                if (n_wep1=obj_controller.ma_wep2[i]) and (n_wep2!="Assortment") and (n_wep1!="Assortment") and ((vehicle_equipment=1) or (vehicle_equipment=6)){ //normal infantry or dread wep swap
                    var temp;temp="";
                    temp=obj_controller.ma_wep1[i];// Get temp
                    obj_controller.ma_wep1[i]=obj_controller.ma_wep2[i];
                    obj_ini.wep1[company,obj_controller.ide[i]]=obj_ini.wep2[company,obj_controller.ide[i]];// Wep2 -> Wep1
                    obj_controller.ma_wep2[i]=temp;
                    obj_ini.wep2[company,obj_controller.ide[i]]=temp;
                }


                if (n_wep2=obj_controller.ma_wep1[i]) and (n_wep2!="Assortment") and (n_wep1!="Assortment") and ((vehicle_equipment=1) or (vehicle_equipment=6)){ //normal infantry or dread wep swap
                    var temp;temp="";
                    temp=obj_controller.ma_wep2[i];// Get temp
                    obj_controller.ma_wep2[i]=obj_controller.ma_wep1[i];
                    obj_ini.wep2[company,obj_controller.ide[i]]=obj_ini.wep1[company,obj_controller.ide[i]];// Wep1 -> Wep2
                    obj_controller.ma_wep1[i]=temp;
                    obj_ini.wep1[company,obj_controller.ide[i]]=temp;
                }



                check=0;
                if (obj_controller.ma_role[i]="Standard Bearer"){
                    if (obj_controller.ma_wep1[i]="Company Standard") and (n_wep1!="Company Standard") and (n_wep2!="Company Standard") then check=1;
                }

                if (n_wep1=obj_controller.ma_wep1[i]) or (n_wep1="Assortment") then check=1;

                if (check==0){
                    if (n_wep1!=obj_controller.ma_wep1[i]) and (n_wep1!="Assortment") and ((vehicle_equipment=1) or (vehicle_equipment=6)){ //normal infantry or dread wep1
                        unit.update_weapon_one(n_wep1)
                        obj_controller.ma_wep1[i]=n_wep1;
                    }
                    if (n_wep1!=obj_controller.ma_wep1[i])  and (n_wep1!="Assortment") and (vehicle_equipment!=1) and (vehicle_equipment!=6){ // vehicle wep1
                        if (obj_controller.ma_wep1[i]!="") and (obj_controller.ma_wep1[i]!=n_wep1){
                            scr_add_item(obj_controller.ma_wep1[i],1);
                            obj_controller.ma_wep1[i]="";
                            obj_ini.veh_wep1[company,i-infantrycount+1]="";
                        }
                        if (n_wep1!=""){
                            scr_add_item(n_wep1,-1);
                            obj_controller.ma_wep1[i]=n_wep1;
                            obj_ini.veh_wep1[company,i-infantrycount+1]=n_wep1;
                        }
                    }
                }
                // End swap weapon1

                check=0;
                if (obj_controller.ma_role[i]="Standard Bearer"){
                    if (obj_controller.ma_wep2[i]="Company Standard") and (n_wep1!="Company Standard") and (n_wep2!="Company Standard") then check=1;
                }
                if (n_wep2=obj_controller.ma_wep2[i]) or (n_wep2="Assortment") then check=1;
                if (check==0) and (n_wep2!=obj_controller.ma_wep2[i]) and (n_wep2!="Assortment") and ((vehicle_equipment=1) or (vehicle_equipment=6)){ //normal infantry or dread wep2
                    unit.update_weapon_two(n_wep2)
                    obj_controller.ma_wep2[i]=n_wep2;
                }
                if (check==0) and (n_wep2!=obj_controller.ma_wep2[i]) and (n_wep2!="Assortment") and (vehicle_equipment!=1) and (vehicle_equipment!=6){ // vehicle wep2
                    if (obj_controller.ma_wep2[i]!="") and (obj_controller.ma_wep2[i]!=n_wep2){
                        scr_add_item(obj_controller.ma_wep2[i],1);
                        obj_controller.ma_wep2[i]="";
                        obj_ini.veh_wep2[company,i-infantrycount+1]="";
                    }
                    if (n_wep2!=""){
                        scr_add_item(n_wep2,-1);
                        obj_controller.ma_wep2[i]=n_wep2;
                        obj_ini.veh_wep2[company,i-infantrycount+1]=n_wep2;
                    }
                }
                // End swap weapon2

                check=0;
                if (n_gear!=obj_controller.ma_gear[i]) and (n_gear!="Assortment") and ((vehicle_equipment=1) or (vehicle_equipment=6)){ //normal infantry or dread wargear item
                    unit.update_gear(n_gear)
                    obj_controller.ma_gear[i]=n_gear;
                }
                if (n_gear==obj_controller.ma_gear[i]) then check=1;

                if (check=0) and (n_gear!=obj_controller.ma_gear[i]) and (n_gear!="Assortment") and (vehicle_equipment!=1) and (vehicle_equipment!=6){ //vehicle upgrade item
                    if (obj_controller.ma_gear[i]!="") then scr_add_item(obj_controller.ma_gear[i],1);
                    obj_controller.ma_gear[i]="";
                    obj_ini.veh_upgrade[company,i-infantrycount+1]="";
                    if (n_gear!="(None)") and (n_gear!=""){
                        obj_controller.ma_gear[i]=n_gear;
                        obj_ini.veh_upgrade[company,i-infantrycount+1]=n_gear;
                    }
                    if (n_gear!="") then scr_add_item(n_gear,-1);
                }
                // End gear and upgrade

                check=0;
                if (n_mobi=obj_controller.ma_mobi[i]) then check=1;
                if (check=0) and (n_mobi!=obj_controller.ma_mobi[i]) and (n_mobi!="Assortment") and ((vehicle_equipment=1) or (vehicle_equipment=6)){ //normal infantry or dread mobility item
                    if (string_count("Terminator",obj_ini.armour[company,obj_controller.ide[i]])=0) and (obj_ini.armour[company,obj_controller.ide[i]]!="Tartaros"){
                        unit.update_mobility_item(n_mobi);
                        obj_controller.ma_mobi[i]=n_mobi;
                    }
                }
                if (check=0) and (n_mobi!=obj_controller.ma_mobi[i]) and (n_mobi!="Assortment") and (vehicle_equipment!=1) and (vehicle_equipment!=6){ //vehicle accessory item
                    if (obj_controller.ma_mobi[i]!="") then scr_add_item(obj_controller.ma_mobi[i],1);
                    obj_controller.ma_mobi[i]="";
                    obj_ini.veh_acc[company,i-infantrycount+1]="";
                    obj_controller.ma_mobi[i]=n_mobi;
                    obj_ini.veh_acc[company,i-infantrycount+1]=n_mobi;
                    if (n_mobi!="") then scr_add_item(n_mobi,-1);
                }
                // End mobility and accessory

                /*
                if (obj_controller.ma_wep1[i]="(None)") then obj_controller.ma_wep1[i]="";
                if (obj_controller.ma_wep2[i]="(None)") then obj_controller.ma_wep2[i]="";
                if (obj_controller.ma_armour[i]="(None)") then obj_controller.ma_armour[i]="";
                if (obj_controller.ma_gear[i]="(None)") then obj_controller.ma_gear[i]="";
                if (obj_controller.ma_mobi[i]="(None)") then obj_controller.ma_mobi[i]="";
                if (obj_ini.wep1[company,obj_controller.ide[i]]="(None)") then obj_ini.wep1[company,obj_controller.ide[i]]="";
                if (obj_ini.wep2[company,obj_controller.ide[i]]="(None)") then obj_ini.wep2[company,obj_controller.ide[i]]="";
                if (obj_ini.armour[company,obj_controller.ide[i]]="(None)") then obj_ini.armour[company,obj_controller.ide[i]]="";
                if (obj_ini.gear[company,obj_controller.ide[i]]="(None)") then obj_ini.gear[company,obj_controller.ide[i]]="";
                */

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
            if (string_count("inq",obj_ini.artifact_tags[obj_controller.menu_artifact])>0){
                var i;i=0;
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


            var e;e=0;
            repeat(50){e+=1;
                if (obj_controller.fest_display=obj_controller.menu_artifact) then obj_controller.fest_display=0;

                /*if (obj_ini.artifact_tags[obj_controller.menu_artifact]=obj_controller.recent_keyword[e]){
                    obj_controller.recent_keyword[e]="";obj_controller.recent_type[e]="";
                    obj_controller.recent_turn[e]=0;obj_controller.recent_number[e]=0;
                    scr_recent("artifact_gifted",obj_controller.recent_keyword,giveto);
                    scr_recent("","",0);
                }*/
            }




            old_tags=obj_ini.artifact_tags[obj_controller.menu_artifact];
            obj_ini.artifact[obj_controller.menu_artifact]="";obj_ini.artifact_tags[obj_controller.menu_artifact]="";
            obj_ini.artifact_identified[obj_controller.menu_artifact]=0;obj_ini.artifact_condition[obj_controller.menu_artifact]=100;
            obj_ini.artifact_loc[obj_controller.menu_artifact]="";obj_ini.artifact_sid[obj_controller.menu_artifact]=0;
            obj_controller.artifacts-=1;cooldown=7000;

            var g;g=obj_controller.menu_artifact;
            repeat(20){
                if (obj_ini.artifact[g]="") and (obj_ini.artifact[g+1]!=""){
                    obj_ini.artifact[g]=obj_ini.artifact[g+1];obj_ini.artifact_tags[g]=obj_ini.artifact_tags[g+1];
                    obj_ini.artifact_identified[g]=obj_ini.artifact_identified[g+1];
                    obj_ini.artifact_condition[g]=obj_ini.artifact_condition[g+1];
                    obj_ini.artifact_loc[g]=obj_ini.artifact_loc[g+1];obj_ini.artifact_sid[g]=obj_ini.artifact_sid[g+1];
                    //
                    obj_ini.artifact[g+1]="";obj_ini.artifact_tags[g+1]="";
                    obj_ini.artifact_identified[g+1]=0;obj_ini.artifact_condition[g+1]=100;
                    obj_ini.artifact_loc[g+1]="";obj_ini.artifact_sid[g+1]=0;
                }
                g+=1;
            }
            obj_controller.cooldown=10;
            if (obj_controller.menu_artifact>obj_controller.artifacts) then obj_controller.menu_artifact=obj_controller.artifacts;

            obj_controller.menu=20;
            obj_controller.diplomacy=giveto;
            obj_controller.force_goodbye=-1;
            var the;the="";if (giveto!=7) and (giveto!=10) then the="the ";
            scr_event_log("","Artifact gifted to "+string(the)+string(obj_controller.faction[giveto])+".");

            if (inq_hide!=2) then with(obj_controller){
                if (string_count("Daemon",obj_popup.old_tags)=0) or ((diplomacy!=4) and (diplomacy!=5) and (diplomacy!=2)) then scr_dialogue("artifact_thanks");
                if (string_count("Daemon",obj_popup.old_tags)>0) and ((diplomacy=4) or (diplomacy=5) or (diplomacy=2)) then scr_dialogue("artifact_daemon");
            }
            if (inq_hide=2) and (obj_controller.diplomacy=4) then with(obj_controller){scr_dialogue("artifact_returned");}

            if (string_count("mnr",old_tags)=0){
                if (giveto=2) then obj_controller.disposition[2]+=6;
                if (giveto=3) then obj_controller.disposition[3]+=4;
                if (giveto=4) and (inq_hide!=2) then obj_controller.disposition[4]+=4;
                if (giveto=4) and (inq_hide=2) then obj_controller.disposition[4]+=2;
                if (giveto=5) and (string_count(old_tags,"Daemon")=0){
                    obj_controller.disposition[5]+=4;
                    var o;o=0;repeat(4){if (o<=4){o+=1;if (obj_ini.adv[o]="Reverent Guardians") then o=500;}}if (o>100) then obj_controller.disposition[5]+=2;
                }
                if (giveto=6) then obj_controller.disposition[6]+=3;
                if (giveto=8) then obj_controller.disposition[8]+=4;
            }

            // Need to modify ^^^^ based on if it is chaos or daemonic

            if (giveto=2){
                if (string_count("Daemon",old_tags)>0){
                    var v,ev;v=0;ev=0;repeat(99){v+=1;if (ev=0) and (obj_controller.event[v]="") then ev=v;}
                    obj_controller.event[ev]="imperium_daemon";obj_controller.event_duration[ev]=1;
                    with(obj_star){
                        if (p_owner[1]=2) then p_heresy[1]+=choose(30,40,50,60);
                        if (p_owner[2]=2) then p_heresy[2]+=choose(30,40,50,60);
                        if (p_owner[3]=2) then p_heresy[3]+=choose(30,40,50,60);
                        if (p_owner[4]=2) then p_heresy[4]+=choose(30,40,50,60);
                    }
                }
                if (string_count("Chaos",old_tags)>0){
                    with(obj_star){
                        if (p_owner[1]=2) and (p_heresy[1]>0) then p_heresy[1]+=10;
                        if (p_owner[2]=2) and (p_heresy[2]>0) then p_heresy[2]+=10;
                        if (p_owner[3]=2) and (p_heresy[3]>0) then p_heresy[3]+=10;
                        if (p_owner[4]=2) and (p_heresy[4]>0) then p_heresy[4]+=10;
                    }
                }
            }
            if (giveto=8){
                if (string_count("Daemon",old_tags)>0){
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
if (mouse_x>=xx+408) and (mouse_y>=yy+393) and (mouse_x<xx+518) and (mouse_y<yy+414){
    if (type=8) and (cooldown<=0) and (all_good=1){
        cooldown=100;obj_controller.cooldown=8000;

        var i,this,dwarn;i=0;this=0;dwarn=false;
        repeat(obj_controller.man_max){
            i+=1;if (this=0) and (obj_controller.man_sel[i]=1) then this=i;
        }
        i=this;

        if (obj_controller.man[i]!="") and (obj_controller.man_sel[i]=1){
            var replace;replace="";

            if (target_role=1) then replace="weapon1";
            if (target_role=2) then replace="weapon2";
            if (target_role>3){
                if (obj_ini.artifact[obj_controller.menu_artifact]="Power Armour") then replace="armour";
                if (obj_ini.artifact[obj_controller.menu_artifact]="Terminator Armour") then replace="armour";
                if (obj_ini.artifact[obj_controller.menu_artifact]="Artificer Armour") then replace="armour";
                if (obj_ini.artifact[obj_controller.menu_artifact]="Dreadnought Armour") or (obj_ini.artifact[obj_controller.menu_artifact]="Dreadnought") then replace="armour";

                if (obj_ini.artifact[obj_controller.menu_artifact]="Rosarius") then replace="gear";
                if (obj_ini.artifact[obj_controller.menu_artifact]="Bionics") then replace="gear";
                if (obj_ini.artifact[obj_controller.menu_artifact]="Psychic Hood") then replace="gear";
                if (obj_ini.artifact[obj_controller.menu_artifact]="Servo Arms") then replace="gear";

                if (obj_ini.artifact[obj_controller.menu_artifact]="Jump Pack") then replace="mobility";
                if (obj_ini.artifact[obj_controller.menu_artifact]="Bike") then replace="mobility";
            }
            if (replace="armour") and (obj_controller.ma_race[i]>5){cooldown=8;obj_controller.cooldown=8;exit;}

            if (target_comp>10) then target_comp=0;

            if (string_count("aemon",obj_ini.artifact_tags[obj_controller.menu_artifact])>0){
                obj_ini.chaos[target_comp,obj_controller.ide[i]]+=choose(1,2,3,4,5,6)+choose(1,2,3,4,5,6);
                if (string_count("dwarn|",obj_controller.useful_info)=0) and (obj_ini.role[target_comp,obj_controller.ide[i]]="Chapter Master"){
                    obj_controller.useful_info+="dwarn|";dwarn=true;
                }
            }

            if (replace="armour"){
                if (obj_controller.ma_armour[i]!="") and (obj_controller.ma_armour[i]!="None") then scr_add_item(obj_ini.armour[target_comp,obj_controller.ide[i]],1);

                if (obj_controller.menu_artifact=obj_controller.fest_display) then obj_controller.fest_display=0;

                if (obj_ini.artifact[obj_controller.menu_artifact]="Terminator Armour") or (obj_ini.artifact[obj_controller.menu_artifact]="Dreadnought Armour"){
                    if (obj_ini.mobi[target_comp,obj_controller.ide[i]]!=""){// NOPE
                        scr_add_item(obj_ini.mobi[target_comp,obj_controller.ide[i]],1);
                        obj_ini.mobi[target_comp,obj_controller.ide[i]]="";obj_controller.ma_mobi[i]="";
                        if (obj_ini.artifact[obj_controller.menu_artifact]="Dreadnought Armour"){
                            if (obj_ini.age[target_comp,obj_controller.ide[i]]!=floor(obj_ini.age[target_comp,obj_controller.ide[i]])) then obj_ini.age[target_comp,obj_controller.ide[i]]=floor(obj_ini.age[target_comp,obj_controller.ide[i]]);
                        }

                    }
                }
                obj_controller.ma_armour[i]="";obj_ini.armour[target_comp,obj_controller.ide[i]]="";
                obj_controller.ma_armour[i]=obj_ini.artifact[obj_controller.menu_artifact]+string("&")+obj_ini.artifact_tags[obj_controller.menu_artifact];
                obj_ini.armour[target_comp,obj_controller.ide[i]]=obj_ini.artifact[obj_controller.menu_artifact]+string("&")+obj_ini.artifact_tags[obj_controller.menu_artifact];

                // NOPE
                if (obj_ini.wep1[target_comp,obj_controller.ide[i]]="Assault Cannon") or (obj_ini.wep2[target_comp,obj_controller.ide[i]]="Assault Cannon"){
                    var bgn,bed;bed=0;bgn=obj_ini.armour[target_comp,obj_controller.ide[i]];
                    if (string_count("Termi",bgn)=0) then bed+=2;
                    if (bed=2){
                        if (obj_ini.wep1[target_comp,obj_controller.ide[i]]="Assault Cannon"){
                            scr_add_item(obj_ini.wep1[target_comp,obj_controller.ide[i]],1);obj_ini.wep1[target_comp,obj_controller.ide[i]]="";
                        }
                        if (obj_ini.wep2[target_comp,obj_controller.ide[i]]="Assault Cannon"){
                            scr_add_item(obj_ini.wep2[target_comp,obj_controller.ide[i]],1);obj_ini.wep2[target_comp,obj_controller.ide[i]]="";
                        }
                    }
                }


            }
            if (replace="gear"){
                if (obj_controller.ma_gear[i]!="") and (obj_controller.ma_gear[i]!="None") then scr_add_item(obj_ini.gear[target_comp,obj_controller.ide[i]],1);
                obj_controller.ma_gear[i]="";obj_ini.gear[target_comp,obj_controller.ide[i]]="";
                obj_controller.ma_gear[i]=obj_ini.artifact[obj_controller.menu_artifact]+string("&")+obj_ini.artifact_tags[obj_controller.menu_artifact];
                obj_ini.gear[target_comp,obj_controller.ide[i]]=obj_ini.artifact[obj_controller.menu_artifact]+string("&")+obj_ini.artifact_tags[obj_controller.menu_artifact];
            }
            if (replace="mobility"){
                if (obj_controller.ma_mobi[i]!="") and (obj_controller.ma_mobi[i]!="None") then scr_add_item(obj_ini.mobi[target_comp,obj_controller.ide[i]],1);
                obj_controller.ma_mobi[i]="";obj_ini.mobi[target_comp,obj_controller.ide[i]]="";
                obj_controller.ma_mobi[i]=obj_ini.artifact[obj_controller.menu_artifact]+string("&")+obj_ini.artifact_tags[obj_controller.menu_artifact];
                obj_ini.mobi[target_comp,obj_controller.ide[i]]=obj_ini.artifact[obj_controller.menu_artifact]+string("&")+obj_ini.artifact_tags[obj_controller.menu_artifact];
            }
            if (replace="weapon1"){
                if (obj_controller.ma_wep1[i]!="") and (obj_controller.ma_wep1[i]!="None") then scr_add_item(obj_ini.wep1[target_comp,obj_controller.ide[i]],1);
                obj_controller.ma_wep1[i]="";obj_ini.wep1[target_comp,obj_controller.ide[i]]="";
                obj_controller.ma_wep1[i]=obj_ini.artifact[obj_controller.menu_artifact]+string("&")+obj_ini.artifact_tags[obj_controller.menu_artifact];
                obj_ini.wep1[target_comp,obj_controller.ide[i]]=obj_ini.artifact[obj_controller.menu_artifact]+string("&")+obj_ini.artifact_tags[obj_controller.menu_artifact];
            }
            if (replace="weapon2"){
                if (obj_controller.ma_wep2[i]!="") and (obj_controller.ma_wep2[i]!="None") then scr_add_item(obj_ini.wep2[target_comp,obj_controller.ide[i]],1);
                obj_controller.ma_wep2[i]="";obj_ini.wep2[target_comp,obj_controller.ide[i]]="";
                obj_controller.ma_wep2[i]=obj_ini.artifact[obj_controller.menu_artifact]+string("&")+obj_ini.artifact_tags[obj_controller.menu_artifact];
                obj_ini.wep2[target_comp,obj_controller.ide[i]]=obj_ini.artifact[obj_controller.menu_artifact]+string("&")+obj_ini.artifact_tags[obj_controller.menu_artifact];
            }


            obj_ini.artifact[obj_controller.menu_artifact]="";obj_ini.artifact_tags[obj_controller.menu_artifact]="";
            obj_ini.artifact_identified[obj_controller.menu_artifact]=0;obj_ini.artifact_condition[obj_controller.menu_artifact]=100;
            obj_ini.artifact_loc[obj_controller.menu_artifact]="";obj_ini.artifact_sid[obj_controller.menu_artifact]=0;
            obj_controller.artifacts-=1;cooldown=12;

            var g;g=obj_controller.menu_artifact;
            repeat(20){
                if (obj_ini.artifact[g]="") and (obj_ini.artifact[g+1]!=""){
                    obj_ini.artifact[g]=obj_ini.artifact[g+1];obj_ini.artifact_tags[g]=obj_ini.artifact_tags[g+1];
                    obj_ini.artifact_identified[g]=obj_ini.artifact_identified[g+1];
                    obj_ini.artifact_condition[g]=obj_ini.artifact_condition[g+1];
                    obj_ini.artifact_loc[g]=obj_ini.artifact_loc[g+1];obj_ini.artifact_sid[g]=obj_ini.artifact_sid[g+1];
                    //
                    obj_ini.artifact[g+1]="";obj_ini.artifact_tags[g+1]="";
                    obj_ini.artifact_identified[g+1]=0;obj_ini.artifact_condition[g+1]=100;
                    obj_ini.artifact_loc[g+1]="";obj_ini.artifact_sid[g+1]=0;
                }
                g+=1;
            }
            obj_controller.cooldown=10;

            if (obj_controller.menu_artifact>obj_controller.artifacts) then obj_controller.menu_artifact=obj_controller.artifacts;

            if (dwarn=true){
                var pip;pip=instance_create(0,0,obj_popup);
                pip.title="Daemon Artifacts";
                pip.text="Some artifacts, like the one you now wield, are a blasphemous union of the Materium's matter and the Immaterium's spirit, containing the essence of a bound daemon.  While they may offer great power, and enhanced perception, they are known to whisper poisonous lies to the wielder.  The path to damnation begins with good intentions, and many times artifacts such as these have been the cause.";
                pip.image="";pip.cooldown=8;obj_controller.cooldown=8;
            }


            instance_destroy();exit;
        }
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
        var i;i=0;
        repeat(obj_controller.man_max){i+=1;
            obj_controller.man_sel[i]=0;
        }i=0;
    }


    if (cooldown<=0) and (target_comp!=-1){
        var xx,yy,bb;bb="";x2=__view_get( e__VW.XView, 0 )+951;y2=__view_get( e__VW.YView, 0 )+398;
        var top,sel,temp1,temp2,temp3,temp4,temp5;temp1="";temp2="";temp3="";temp4="";temp5="";
        top=obj_controller.man_current;var stop;stop=0;sel=top;

        repeat(min(obj_controller.man_max,23)){
            if (mouse_x>=xx+29) and (mouse_y>=yy+150) and (mouse_x<xx+569) and (mouse_y<yy+175.4){
                var onceh;onceh=0;stop=0;
                if (obj_controller.man_sel[sel]=0) and (onceh=0){cooldown=8000;units=1;
                    if (stop=0){onceh=1;obj_controller.man_sel[sel]=1;stop=sel;}
                }
                if (obj_controller.man_sel[sel]=1) and (onceh=0){
                    onceh=1;units=0;obj_controller.man_sel[sel]=0;cooldown=8000;
                }
            }
            yy+=25.4;sel+=1;
        }

        if (stop!=0){var i;i=0;
            repeat(obj_controller.man_max){i+=1;
                if (i!=stop) then obj_controller.man_sel[i]=0;
            }
        }

    }
}

/* */
}
}
/*  */
