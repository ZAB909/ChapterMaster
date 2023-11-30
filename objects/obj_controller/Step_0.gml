// Handles most logic for main menus, audio and checks if cheats are enabled
// TODO refactor will wait untill squads PR (#76) is merged
if (double_click>=0) then double_click-=1;
if (text_bar>0){
    text_bar+=1;
    if (menu==1) and (managing>0) then obj_ini.company_title[managing]=keyboard_string;
    if (menu==24) and (formating>0) and (formating>3) then bat_formation[formating]=keyboard_string;
}
if (text_bar>60) then text_bar=1;
if (bar_fix>0){
    bar_fix=-1;
    scr_ui_formation_bars();
}
// TODO change this into a constructor which is in a separated script
if (fest_scheduled==0) and (fest_sid+fest_wid>0) and (menu!=12.1){
    fest_sid=0;
    fest_wid=0;
    fest_planet=0;
    fest_type="";
    fest_cost=0;
    fest_lav=0;
    fest_locals=0;
    fest_feature1=0;
    fest_feature2=0;
    fest_feature3=0;
    fest_display=0;
    fest_repeats=0;
    fest_honor_co=0;
    fest_honor_id=0;
    fest_attend="";
}
if (menu!=24) and (formating>0) then formating=0;

if (instance_exists(obj_formation_bar)) and ((menu!=24) or (formating<=0)){
    with(obj_formation_bar){instance_destroy();}
    with(obj_temp8){instance_destroy();}
    formating=0;
}
// Sounds
if (sound_in>=0) then sound_in-=1;
if (sound_in==0) and (sound_to!=""){
    audio_stop_all();
    var nope=false;
    if (sound_to=="blood"){
        global.sound_playing=audio_play_sound(snd_blood,0,true);
        audio_sound_gain(global.sound_playing, 0, 0);
        nope=false;
        if (obj_controller.master_volume=0) or (obj_controller.music_volume=0) then nope=true;
        if (!nope){audio_sound_gain(global.sound_playing,0.2*obj_controller.master_volume*obj_controller.music_volume,2000);}
    }
    if (sound_to=="royal"){
        global.sound_playing=audio_play_sound(snd_royal,0,true);
        audio_sound_gain(global.sound_playing, 0, 0);
        nope=false;
        if (obj_controller.master_volume=0) or (obj_controller.music_volume=0) then nope=true;
        if (!nope){audio_sound_gain(global.sound_playing,0.25*obj_controller.master_volume*obj_controller.music_volume,2000);}
    }
}
// Cheat codes
if (cheatcode != ""){
	cheatyface = 1;
}
if (cheatcode == "req" && global.cheat_req == 0){
    global.cheat_req = 1;
    obj_controller.tempRequisition = obj_controller.requisition;
    obj_controller.requisition = 51234;
}
else if (cheatcode == "req" && global.cheat_req == 1){
    global.cheat_req = 0;
    obj_controller.requisition = obj_controller.tempRequisition;
}
if (cheatcode == "seed" && global.cheat_gene == 0){
    global.cheat_gene = 1;
    obj_controller.tempGene_seed = obj_controller.gene_seed;
    obj_controller.gene_seed = 9999;
}
else if (cheatcode == "seed" && global.cheat_gene == 1){
    global.cheat_gene = 0;
    obj_controller.gene_seed = obj_controller.tempGene_seed;
}
if (cheatcode == "dep"){
    global.cheat_disp = 1;
    obj_controller.disposition[2] = 100;
    obj_controller.disposition[3] = 100;
    obj_controller.disposition[4] = 100;
    obj_controller.disposition[5] = 100;
    obj_controller.disposition[6] = 100;
    obj_controller.disposition[7] = 100;
    obj_controller.disposition[8] = 100;
    obj_controller.disposition[9] = 100;
    obj_controller.disposition[10] = 100;
}
if (cheatcode == "debug" && global.cheat_debug == 0){
    global.cheat_debug = 1;
}
else if (cheatcode == "debug" && global.cheat_debug == 1){
    global.cheat_debug = 0;
}
if (cheatcode == "test"){
    diplomacy = 10.5;
    scr_dialogue("test");
}
if (global.cheat_req == 1 && obj_controller.requisition != 51234){
    obj_controller.requisition = 51234;
}
cheatcode = ""
if (menu != 17.5 && instance_exists(obj_event_log)){
    obj_event_log.help = 0;
}
if ((!instance_exists(obj_event_log)) && instance_exists(obj_controller)){
    instance_activate_object(obj_event_log);
}
if (!instance_exists(obj_ingame_menu)){
    play_second += 1;
    if (play_second >= 30){
        play_second = 0;
        play_time += 1;
        window_old = window_data;
        window_data = (((((((string(window_get_x()) + "|") + string(window_get_y())) + "|") + string(window_get_width())) + "|") + string(window_get_height())) + "|");
        if (window_get_fullscreen() == 1){
            window_old = "fullscreen";
            window_data = "fullscreen";
        }
        if (window_data != "fullscreen" && window_get_fullscreen() == 0){
            if (window_data != window_old){
                ini_open("saves.ini");
                ini_write_string("Settings", "window_data", (((((((string(window_get_x()) + "|") + string(window_get_y())) + "|") + string(window_get_width())) + "|") + string(window_get_height())) + "|"));
                ini_close();
            }
        }
    }
}
// Nope // Cleans up menu
if (menu!=60) and (instance_exists(obj_temp_build)){
    if (obj_temp_build.isnew==1) then menu=60;
    with(obj_shop){instance_destroy();}
    with(obj_managment_panel){instance_destroy();}
    with(obj_drop_select){instance_destroy();}
    with(obj_star_select){instance_destroy();}
    with(obj_fleet_select){instance_destroy();}
}
// Return to star selection
if (menu==0) and (instance_exists(obj_temp_build)){
    obj_controller.selecting_planet=obj_temp_build.planet;
    // Pass variables to obj_controller.temp[t]=""; here
    instance_create(obj_temp_build.x,obj_temp_build.y,obj_star_select);
    obj_star_select.loading_name=obj_controller.selected.name;
    popup=3;
    with(obj_temp_build){instance_destroy();}
}
// REMOVE
if (menu!=60) and (instance_exists(obj_temp_build)){
    with(obj_temp_build){instance_destroy();}
}

if (text_selected!="") and (text_selected!="none") then text_bar+=1;
if (text_bar>60) then text_bar=1;

if (obj_controller.disposition[4]<=20) or (obj_controller.loyalty<=33) and (demanding==0) then demanding=1;
if (obj_controller.disposition[4]>20) and (obj_controller.loyalty>33) and (demanding==1) then demanding=0;
// Main menu movement
if ((menu==0) and (formating==0)) or (instance_exists(obj_fleet)){
    var spd=12,keyb="";
    if ((!instance_exists(obj_ingame_menu)) and (!instance_exists(obj_ncombat))) or (instance_exists(obj_fleet)){
        if ((keyboard_check(vk_left)) or (mouse_x<=__view_get( e__VW.XView, 0 )+2) or (keyboard_check(ord("A")))) and (x>800) then x-=spd;
        if ((keyboard_check(vk_right)) or (mouse_x>=__view_get( e__VW.XView, 0 )+1598) or (keyboard_check(ord("D")))) and (x<(room_width-800)) then x+=spd;
        if ((keyboard_check(vk_up)) or (mouse_y<=__view_get( e__VW.YView, 0 )+2) or (keyboard_check(ord("W")))) and (y>450) then y-=spd;
        if ((keyboard_check(vk_down)) or (mouse_y>=__view_get( e__VW.YView, 0 )+898) or (keyboard_check(ord("S")))) and (y<(room_height-450)) then y+=spd;
    }
}

if (x<800) then x=800;
if (y<450) then y=450;
if (x>(room_width-800)) then x=room_width-800;
if (y>(room_height-450)) then y=room_height-450;
// For testing purposes
if (is_test_map=true) then with(obj_en_fleet){
    if (owner = eFACTION.Imperium){
        capital_number=0;
        frigate_number=1;
        escort_number=2;
    }
}
// Menu selection screens
var freq=150;
if (l_options>0) then l_options+=1;
if (l_options>105) then l_options=0;
if (l_options==0) and (floor(random(freq))==3) then l_options=1;
if (l_menu>0) then l_menu+=1;
if (l_menu>105) then l_menu=0;
if (l_menu==0) and (floor(random(freq))==3) then l_menu=1;

if (l_manage>0) then l_manage+=1;
if (l_manage>141) then l_manage=0;
if (l_manage==0) and (floor(random(freq))==3) then l_manage=1;
if (l_settings>0) then l_settings+=1;
if (l_settings>141) then l_settings=0;
if (l_settings==0) and (floor(random(freq))==3) then l_settings=1;

if (l_apothecarium>0) then l_apothecarium+=1;
if (l_apothecarium>113) then l_apothecarium=0;
if (l_apothecarium==0) and (floor(random(freq))==3) then l_apothecarium=1;
if (l_reclusium>0) then l_reclusium+=1;
if (l_reclusium>113) then l_reclusium=0;
if (l_reclusium==0) and (floor(random(freq))==3) then l_reclusium=1;
if (l_librarium>0) then l_librarium+=1;
if (l_librarium>113) then l_librarium=0;
if (l_librarium==0) and (floor(random(freq))==3) then l_librarium=1;
if (l_armoury>0) then l_armoury+=1;
if (l_armoury>113) then l_armoury=0;
if (l_armoury==0) and (floor(random(freq))==3) then l_armoury=1;
if (l_recruitment>0) then l_recruitment+=1;
if (l_recruitment>113) then l_recruitment=0;
if (l_recruitment==0) and (floor(random(freq))==3) then l_recruitment=1;
if (l_fleet>0) then l_fleet+=1;
if (l_fleet>113) then l_fleet=0;
if (l_fleet==0) and (floor(random(freq))==3) then l_fleet=1;

if (l_diplomacy>0) then l_diplomacy+=1;
if (l_diplomacy>141) then l_diplomacy=0;
if (l_diplomacy==0) and (floor(random(freq))==3) then l_diplomacy=1;
if (l_log>0) then l_log+=1;
if (l_log>141) then l_log=0;
if (l_log==0) and (floor(random(freq))==3) then l_log=1;
if (l_turn>0) then l_turn+=1;
if (l_turn>141) then l_turn=0;
if (l_turn==0) and (floor(random(freq))==3) then l_turn=1;

if (new_buttons_hide==1) and (y_slide<43){
    if (y_slide<43) then y_slide+=2;
    if (new_buttons_frame<24) then new_buttons_frame+=1;
}
if (new_buttons_hide==0) and (y_slide>0){
    if (y_slide>0) then y_slide-=2;
    if (new_buttons_frame>0) then new_buttons_frame-=1;
}
if (new_buttons_hide==1) and (y_slide<43){
    if (y_slide<43) then y_slide+=2;
    if (new_buttons_frame<24) then new_buttons_frame+=1;
}
if (new_buttons_hide==0) and (y_slide>0){
    if (y_slide>0) then y_slide-=2;
    if (new_buttons_frame>0) then new_buttons_frame-=1;
}

if ((new_buttons_hide+hide_banner>0)) and (new_banner_x<161) then new_banner_x+=(161/11);
if ((new_buttons_hide+hide_banner==0)) and (new_banner_x>0) then new_banner_x-=(161/11);

if (y_slide<0) then y_slide=0;
if (new_banner_x<0) then new_banner_x=0;
if (y_slide>0) then new_button_highlight="";
// Checks which menu was clicked
var high="";
var stop = 0;
if (new_buttons_hide==0) and (y_slide<=0) and (!instance_exists(obj_ingame_menu)){
    var but=4,bx=1374,by=8,button_width=108,hei=42;
    if (mouse_y>=__view_get( e__VW.YView, 0 )+by) and (mouse_y<=__view_get( e__VW.YView, 0 )+by+hei){
        if (mouse_x>=__view_get( e__VW.XView, 0 )+bx) and (mouse_x<=__view_get( e__VW.XView, 0 )+bx+button_width){
            if (mouse_x>=__view_get( e__VW.XView, 0 )+bx+108){
                var dif1,dif2;
                dif1=mouse_x-(__view_get( e__VW.XView, 0 )+bx+108);
                dif2=dif1*2;
                if (mouse_y<__view_get( e__VW.YView, 0 )+by+hei-dif2) then stop=1;
            }
            if (stop==0) then high="options";
        }
    }
    but=4;
    bx=1484;
    by=8;
    button_width=108;
    hei=42;
    if (mouse_y>=__view_get( e__VW.YView, 0 )+by) and (mouse_y<=__view_get( e__VW.YView, 0 )+by+hei){
        if (mouse_x>=__view_get( e__VW.XView, 0 )+bx) and (mouse_x<=__view_get( e__VW.XView, 0 )+bx+button_width){
            if (mouse_x>=__view_get( e__VW.XView, 0 )+bx+108){
                var dif1,dif2;
                dif1=mouse_x-(__view_get( e__VW.XView, 0 )+bx+108);
                dif2=dif1*2;
                if (mouse_y<__view_get( e__VW.YView, 0 )+by+hei-dif2) then stop=1;
            }
            if (stop==0) then high="menu";
        }
    }
    but=1;
    bx=34;
    by=838;
    button_width=142;
    hei=43;
    if (mouse_y>=__view_get( e__VW.YView, 0 )+by) and (mouse_y<=__view_get( e__VW.YView, 0 )+by+hei){
        if (mouse_x>=__view_get( e__VW.XView, 0 )+bx) and (mouse_x<=__view_get( e__VW.XView, 0 )+bx+button_width){
            if (mouse_x>=__view_get( e__VW.XView, 0 )+bx+134){
                var dif1,dif2;
                dif1=mouse_x-(__view_get( e__VW.XView, 0 )+bx+134);
                dif2=dif1*1.25;
                if (mouse_y<__view_get( e__VW.YView, 0 )+by+dif2) then stop=1;
            }
            if (stop==0) then high="manage";
        }
    }
    but=1;
    bx=179;
    by=838;
    button_width=142;
    hei=43;
    if (mouse_y>=__view_get( e__VW.YView, 0 )+by) and (mouse_y<=__view_get( e__VW.YView, 0 )+by+hei){
        if (mouse_x>=__view_get( e__VW.XView, 0 )+bx) and (mouse_x<=__view_get( e__VW.XView, 0 )+bx+button_width){
            if (mouse_x>=__view_get( e__VW.XView, 0 )+bx+134){
                var dif1,dif2;
                dif1=mouse_x-(__view_get( e__VW.XView, 0 )+bx+134);
                dif2=dif1*1.25;
                if (mouse_y<__view_get( e__VW.YView, 0 )+by+dif2) then stop=1;
            }
            if (stop==0) then high="settings";
        }
    }
    but=1;
    bx=1130;
    by=838;
    button_width=142;
    hei=43;
    if (mouse_y>=__view_get( e__VW.YView, 0 )+by) and (mouse_y<=__view_get( e__VW.YView, 0 )+by+hei){
        if (mouse_x>=__view_get( e__VW.XView, 0 )+bx) and (mouse_x<=__view_get( e__VW.XView, 0 )+bx+button_width){
            if (mouse_x>=__view_get( e__VW.XView, 0 )+bx+134){
                var dif1,dif2;
                dif1=mouse_x-(__view_get( e__VW.XView, 0 )+bx+134);
                dif2=dif1*1.25;
                if (mouse_y<__view_get( e__VW.YView, 0 )+by+dif2) then stop=1;
            }
            if (stop==0) then high="diplomacy";
        }
    }
    but=1;
    bx=1275;
    by=838;
    button_width=142;
    hei=43;
    if (mouse_y>=__view_get( e__VW.YView, 0 )+by) and (mouse_y<=__view_get( e__VW.YView, 0 )+by+hei){
        if (mouse_x>=__view_get( e__VW.XView, 0 )+bx) and (mouse_x<=__view_get( e__VW.XView, 0 )+bx+button_width){
            if (mouse_x>=__view_get( e__VW.XView, 0 )+bx+134){
                var dif1,dif2;
                dif1=mouse_x-(__view_get( e__VW.XView, 0 )+bx+134);
                dif2=dif1*1.25;
                if (mouse_y<__view_get( e__VW.YView, 0 )+by+dif2) then stop=1;
            }
            if (stop==0) then high="log";
        }
    }
    but=2;
    bx=1420;
    by=838;
    button_width=142;
    hei=43;
    if (mouse_y>=__view_get( e__VW.YView, 0 )+by) and (mouse_y<=__view_get( e__VW.YView, 0 )+by+hei){
        if (mouse_x>=__view_get( e__VW.XView, 0 )+bx) and (mouse_x<=__view_get( e__VW.XView, 0 )+bx+button_width){
            if (mouse_x>=__view_get( e__VW.XView, 0 )+bx+134){
                var dif1,dif2;
                dif1=mouse_x-(__view_get( e__VW.XView, 0 )+bx+134);
                dif2=dif1*1.25;
                if (mouse_y<__view_get( e__VW.YView, 0 )+by+dif2) then stop=1;
            }
            if (stop==0) then high="turn";
        }
    }
    but=3;
    bx=357;
    by=838;
    button_width=115;
    hei=43;
    if (mouse_y>=__view_get( e__VW.YView, 0 )+by) and (mouse_y<=__view_get( e__VW.YView, 0 )+by+hei){
        if (mouse_x>=__view_get( e__VW.XView, 0 )+bx) and (mouse_x<=__view_get( e__VW.XView, 0 )+bx+button_width){
            if (mouse_x>=__view_get( e__VW.XView, 0 )+bx+108){
                var dif1,dif2;
                dif1=mouse_x-(__view_get( e__VW.XView, 0 )+bx+108);
                dif2=dif1*2;
                if (mouse_y<__view_get( e__VW.YView, 0 )+by+dif2) then stop=1;
            }
            if (stop==0) then high="apoth";
        }
    }
    but=3;
    bx=473;
    by=838;
    button_width=115;
    hei=43;
    if (mouse_y>=__view_get( e__VW.YView, 0 )+by) and (mouse_y<=__view_get( e__VW.YView, 0 )+by+hei){
        if (mouse_x>=__view_get( e__VW.XView, 0 )+bx) and (mouse_x<=__view_get( e__VW.XView, 0 )+bx+button_width){
            if (mouse_x>=__view_get( e__VW.XView, 0 )+bx+108){
                var dif1,dif2;
                dif1=mouse_x-(__view_get( e__VW.XView, 0 )+bx+108);
                dif2=dif1*2;
                if (mouse_y<__view_get( e__VW.YView, 0 )+by+dif2) then stop=1;
            }
            if (stop==0) then high="reclusium";
        }
    }
    but=3;
    bx=590;
    by=838;
    button_width=115;
    hei=43;
    if (mouse_y>=__view_get( e__VW.YView, 0 )+by) and (mouse_y<=__view_get( e__VW.YView, 0 )+by+hei){
        if (mouse_x>=__view_get( e__VW.XView, 0 )+bx) and (mouse_x<=__view_get( e__VW.XView, 0 )+bx+button_width){
            if (mouse_x>=__view_get( e__VW.XView, 0 )+bx+108){
                var dif1,dif2;
                dif1=mouse_x-(__view_get( e__VW.XView, 0 )+bx+108);
                dif2=dif1*2;
                if (mouse_y<__view_get( e__VW.YView, 0 )+by+dif2) then stop=1;
            }
            if (stop==0) then high="librarium";
        }
    }
    but=3;
    bx=706;
    by=838;
    button_width=115;
    hei=43;
    if (mouse_y>=__view_get( e__VW.YView, 0 )+by) and (mouse_y<=__view_get( e__VW.YView, 0 )+by+hei){
        if (mouse_x>=__view_get( e__VW.XView, 0 )+bx) and (mouse_x<=__view_get( e__VW.XView, 0 )+bx+button_width){
            if (mouse_x>=__view_get( e__VW.XView, 0 )+bx+108){
                var dif1,dif2;
                dif1=mouse_x-(__view_get( e__VW.XView, 0 )+bx+108);
                dif2=dif1*2;
                if (mouse_y<__view_get( e__VW.YView, 0 )+by+dif2) then stop=1;
            }
            if (stop==0) then high="armoury";
        }
    }
    but=3;
    bx=822;
    by=838;
    button_width=115;
    hei=43;
    if (mouse_y>=__view_get( e__VW.YView, 0 )+by) and (mouse_y<=__view_get( e__VW.YView, 0 )+by+hei){
        if (mouse_x>=__view_get( e__VW.XView, 0 )+bx) and (mouse_x<=__view_get( e__VW.XView, 0 )+bx+button_width){
            if (mouse_x>=__view_get( e__VW.XView, 0 )+bx+108){
                var dif1,dif2;
                dif1=mouse_x-(__view_get( e__VW.XView, 0 )+bx+108);
                dif2=dif1*2;
                if (mouse_y<__view_get( e__VW.YView, 0 )+by+dif2) then stop=1;
            }
            if (stop==0) then high="recruitment";
        }
    }
    but=3;
    bx=938;
    by=838;
    button_width=115;
    hei=43;
    if (mouse_y>=__view_get( e__VW.YView, 0 )+by) and (mouse_y<=__view_get( e__VW.YView, 0 )+by+hei){
        if (mouse_x>=__view_get( e__VW.XView, 0 )+bx) and (mouse_x<=__view_get( e__VW.XView, 0 )+bx+button_width){
            if (mouse_x>=__view_get( e__VW.XView, 0 )+bx+108){
                var dif1,dif2;
                dif1=mouse_x-(__view_get( e__VW.XView, 0 )+bx+108);
                dif2=dif1*2;
                if (mouse_y<__view_get( e__VW.YView, 0 )+by+dif2) then stop=1;
            }
            if (stop==0) then high="fleet";
        }
    }    
    new_button_highlight=high;
}
// Which menu is highlighted
if (high=="options") and (h_options<0.5) and (new_buttons_hide==0) and (y_slide<=0) then h_options+=0.02;
if ((high!="options") or (new_buttons_hide==1)) and (h_options>0) then h_options-=0.04;

if (high=="menu") and (h_menu<0.5) and (new_buttons_hide==0) and (y_slide<=0) then h_menu+=0.02;
if ((high!="menu") or (new_buttons_hide==1)) and (h_menu>0) then h_menu-=0.04;

if (high=="manage") and (h_manage<0.5) and (new_buttons_hide==0) and (y_slide<=0) then h_manage+=0.02;
if ((high!="manage") or (new_buttons_hide==1)) and (h_manage>0) then h_manage-=0.04;

if (high=="settings") and (h_settings<0.5) and (new_buttons_hide==0) and (y_slide<=0) then h_settings+=0.02;
if ((high!="settings") or (new_buttons_hide==1)) and (h_settings>0) then h_settings-=0.04;

if (high=="diplomacy") and (h_diplomacy<0.5) and (new_buttons_hide==0) and (y_slide<=0) then h_diplomacy+=0.02;
if ((high!="diplomacy") or (new_buttons_hide==1)) and (h_diplomacy>0) then h_diplomacy-=0.04;

if (high=="log") and (h_log<0.5) and (new_buttons_hide==0) and (y_slide<=0) then h_log+=0.02;
if ((high!="log") or (new_buttons_hide==1)) and (h_log>0) then h_log-=0.04;

if (high=="turn") and (h_turn<0.5) and (new_buttons_hide==0) and (y_slide<=0) then h_turn+=0.02;
if ((high!="turn") or (new_buttons_hide==1)) and (h_turn>0) then h_turn-=0.04;

if (high=="apoth") and (h_apothecarium<0.5) and (new_buttons_hide==0) and (y_slide<=0) then h_apothecarium+=0.02;
if ((high!="apoth") or (new_buttons_hide==1)) and (h_apothecarium>0) then h_apothecarium-=0.04;

if (high=="reclusium") and (h_reclusium<0.5) and (new_buttons_hide==0) and (y_slide<=0) then h_reclusium+=0.02;
if ((high!="reclusium") or (new_buttons_hide==1)) and (h_reclusium>0) then h_reclusium-=0.04;

if (high=="librarium") and (h_librarium<0.5) and (new_buttons_hide==0) and (y_slide<=0) then h_librarium+=0.02;
if ((high!="librarium") or (new_buttons_hide==1)) and (h_librarium>0) then h_librarium-=0.04;

if (high=="armoury") and (h_armoury<0.5) and (new_buttons_hide==0) and (y_slide<=0) then h_armoury+=0.02;
if ((high!="armoury") or (new_buttons_hide==1)) and (h_armoury>0) then h_armoury-=0.04;

if (high=="recruitment") and (h_recruitment<0.5) and (new_buttons_hide==0) and (y_slide<=0) then h_recruitment+=0.02;
if ((high!="recruitment") or (new_buttons_hide==1)) and (h_recruitment>0) then h_recruitment-=0.04;

if (high=="fleet") and (h_fleet<0.5) and (new_buttons_hide==0) and (y_slide<=0) then h_fleet+=0.02;
if ((high!="fleet") or (new_buttons_hide==1)) and (h_fleet>0) then h_fleet-=0.04;

if (menu=14) and (!instance_exists(obj_shop)) then instance_create(0,0,obj_shop);
if (menu!=14) and (instance_exists(obj_shop)) then with(obj_shop){instance_destroy();}

if (instance_exists(obj_ingame_menu)) or (instance_exists(obj_saveload)) then exit;
// Default view
if (menu==1 && managing>0){
    if (!view_squad){
        var c=0,fx="";
        var xx, yy, bb="";
        xx=__view_get( e__VW.XView, 0 )+0;
        yy=__view_get( e__VW.YView, 0 )+0;
    
        if (managing<=10) then c=managing;
        if (managing>20) then c=managing-10;
        
        var top,sel,unit,temp1="",temp2="",temp3="",temp4="",temp5="",force_tool=0;
        top=man_current;
        sel=top;
        
        yy+=77;
        for(var r=0; r<(min(man_max,man_see)); r++){
            force_tool=0;
            if (man[sel]=="man"){
                unit = display_unit[sel];
                if (temp[101] == $"{unit.role()} {unit.name}")
                and ((temp[102]!=unit.armour()) or (temp[104]!=unit.gear()) or (temp[106]=unit.mobility_item()) 
                or (temp[108]!=unit.weapon_one()) or (temp[110]!=unit.weapon_one())
                or (temp[114]="refresh")) then force_tool=1;
            }
            
            if (((mouse_x>=xx+25 && mouse_y>=yy+64 && mouse_x<xx+974 && mouse_y<yy+85) || force_tool==1)){
                temp[120] = unit; // unit_struct
            }
            draw_set_color(38144);
            draw_rectangle(xx+25,yy+64,xx+974,yy+85,1);
            
            yy+=20;
            sel+=1;
        }
    }
    if (is_struct(temp[120])){
        var ach=0,damage_res=1,melee_attack,ranged_attack,acy=0;
        // Checks if the marine is not hidden
        if (temp[120].base_group != 0){
            var unit = temp[120];
            melee_attack=unit.melee_attack();
            ranged_attack = unit.ranged_attack();
            marine_armour[0]=unit.armour();
            fix_right=0;
            
            var cah=managing;
            if (cah>10) then cah=0;
            temp[100]="1";
            if (unit.race()!=1) then temp[100]=unit.race();
            
            damage_res= unit.damage_resistance();
            
            if (unit.gear()=="Rosarius") then damage_res+=0.33;
            if (unit.gear()=="Iron Halo"){
                damage_res+=0.33;
                ach+=20;
            }
            if (unit.mobility_item()=="Jump Pack"){
                damage_res+=0.1;
            }
            if (unit.mobility_item()=="Bike") then ach+=25;
            if (unit.weapon_one()=="Boarding Shield"){
                ach+=20;
                acy+=4;
            }
            if (unit.weapon_two()=="Boarding Shield"){
                ach+=20;
                acy+=4;
            }
            if (unit.weapon_one()=="Storm Shield"){
                ach+=30;
                acy+=8;
            }
            if (unit.weapon_two()=="Storm Shield"){
                ach+=30;
                acy+=8;
            }
            if (unit.armour()=="MK3 Iron Armour") then ranged_attack-=0.1;
            if (unit.armour()=="MK4 Maximus"){
                ranged_attack+=0.05;
                melee_attack+=0.05;
            }
            // heresy should be lower damage resistance, lowered ap for now so it's easier for players to digest
            if (unit.armour()=="MK5 Heresy"){
                melee_attack+=0.2;
                ranged_attack-=0.05;
            }
            if (unit.armour()=="MK6 Corvus"){
                ranged_attack+=0.1;
            }
            if (string_count("Artificer",unit.armour())>0){
                melee_attack+=0.1;
            }
            if (string_count("Terminator",unit.armour())>0){
                ranged_attack-=0.1;
                melee_attack+=0.2;
            }
            if (unit.armour()=="Tartaros"){
                ranged_attack-=0.05;
                melee_attack+=0.2;
            }

            ui_specialist=0;
            ui_coloring="";
            // Sets up the description for the equipement of current marine
            temp[101]=unit.name_role();
            temp[102]=unit.armour();
            temp[103]="";
            if (string_count("&",temp[102])>0) then temp[102]=clean_tags(temp[102]);
            tooltip="";
            tooltip_weapon=0;
            tooltip_stat1=0;
            tooltip_stat2=0;
            tooltip_stat3=0;
            tooltip_stat4=0;
            tooltip_other="";
            tooltip=scr_weapon(unit.armour(),"",true,0,false,"","description");
            // Sets AC for current marine equipement
            if (acy==0){
                if (tooltip_other=="") then temp[103]="("+string(tooltip_stat1)+"AC)";
                if (tooltip_other!="") then temp[103]="("+string(tooltip_stat1)+"AC, "+string(tooltip_other)+")";
            }
            if (acy>0){
                if (tooltip_other=="") then temp[103]="("+string(tooltip_stat1)+"+"+string(acy)+"AC)";
                if (tooltip_other!="") then temp[103]="("+string(tooltip_stat1)+"+"+string(acy)+"AC, "+string(tooltip_other)+")";
            }
            // Gear
            temp[104]=unit.gear();
            if (string_count("&",temp[104])>0) then temp[104]=clean_tags(temp[104]);
            tooltip="";
            tooltip_weapon=0;
            tooltip_stat1=0;
            tooltip_stat2=0;
            tooltip_stat3=0;
            tooltip_stat4=0;
            tooltip_other="";
            tooltip=scr_weapon(unit.gear(),"",true,0,false,"","description");
            // Mobility Item
            temp[105]="";
            temp[105]="("+string(tooltip_other)+")";
            temp[106]=unit.mobility_item();
            temp[107]="";
            if (string_count("&",temp[106])>0) then temp[106]=clean_tags(temp[106]);
            tooltip="";
            tooltip_weapon=0;
            tooltip_stat1=0;
            tooltip_stat2=0;
            tooltip_stat3=0;
            tooltip_stat4=0;
            tooltip_other="";
            tooltip=scr_weapon(unit.mobility_item(),"",true,0,false,"","description");
            temp[107]="("+string(tooltip_other)+")";
            // Checks if Dread
            var is_a_dread=false;
            if (string_count("Dread",temp[102])>0) then is_a_dread=true;
            // Weapon 1
            temp[108]=unit.weapon_one();
            temp[109]="";
            if (string_count("&",temp[108])>0) then temp[108]=clean_tags(temp[108]);
            tooltip="";
            tooltip_weapon=0;
            tooltip_stat1=0;
            tooltip_stat2=0;
            tooltip_stat3=0;
            tooltip_stat4=0;
            tooltip_other="";
            if (is_a_dread==false) then tooltip=scr_weapon(unit.weapon_one(),unit.weapon_two(),true,0,false,"","description");
            if (is_a_dread==true) then tooltip=scr_weapon(unit.weapon_one(),unit.weapon_two(),true,0,true,"","description");
            temp[109]="("+string(tooltip_stat1)+"DAM, "+string(tooltip_other)+")";
            if (tooltip_stat4==0) then temp[109]="("+string(tooltip_stat1)+"DAM, "+string(tooltip_other)+")";
            if (tooltip_stat4>0) then temp[109]="("+string(tooltip_stat1)+"DAM, "+string(tooltip_stat4)+" ammo, "+string(tooltip_other)+")";
            // Weapon 2
            temp[110]=unit.weapon_two();
            temp[111]="";
            if (string_count("&",temp[110])>0) then temp[110]=clean_tags(temp[110]);
            tooltip="";
            tooltip_weapon=0;
            tooltip_stat1=0;
            tooltip_stat2=0;
            tooltip_stat3=0;
            tooltip_stat4=0;
            tooltip_other="";
            if (is_a_dread==false) then tooltip=scr_weapon(unit.weapon_two(),unit.weapon_one(),true,0,false,"","description");
            if (is_a_dread==true) then tooltip=scr_weapon(unit.weapon_two(),unit.weapon_one(),true,0,true,"","description");
            temp[111]="("+string(tooltip_stat1)+"DAM, "+string(tooltip_other)+")";
            if (tooltip_stat4==0) then temp[111]="("+string(tooltip_stat1)+"DAM, "+string(tooltip_other)+")";
            if (tooltip_stat4>0) then temp[111]="("+string(tooltip_stat1)+"DAM, "+string(tooltip_stat4)+" ammo, "+string(tooltip_other)+")";
            // Experience
            temp[113]=string(floor(unit.experience()));
            var cah=managing;
            if (cah>10) then cah=0;
            // Bonuses
            temp[119]="";
            if (string_length(unit.specials())>0){
                if (string_count("$",unit.specials())>0) then temp[119]="Born Leader Bonus";
                if (string_count("@",unit.specials())>0){
                    temp[119]="Champion Bonus";
                    melee_attack=melee_attack*1.15;ranged_attack=ranged_attack*1.15;
                }
                if (string_count("0",unit.specials())>0){
                    temp[119]="PSYKER ("+string_upper(string(obj_ini.psy_powers))+"): ";
                    temp[119]+=string(string_count("|",unit.specials()));
                    temp[119]+=" Powers known.";
                }
            }
            // Corruption
            if (obj_controller.chaos_rating>0) and (temp[119]!="") then temp[119]+="#"+string(max(0,unit.corruption()))+"% Corruption.";
            if (obj_controller.chaos_rating>0) and (temp[119]="") then temp[119]=string(max(0,unit.corruption()))+"% Corruption.";
            // Melee Attack
            temp[116]=$"{floor(melee_attack*100)}%";
            // Ranged Attack
            temp[117]=$"{floor(ranged_attack*100)}%";
            // Damage Resistance
            temp[118]=string(min(75,round(damage_res*100)))+"%";
        }
        /*if (man[sel]="vehicle"){
            // TODO
        }*/
    }    
}

if (global.load>0) then exit;
if (menu==0) then otha=0;
// Sound controls
if (cooldown>=0) and (cooldown<9000) then cooldown-=1;
if (click>0){
    click=-1;
    audio_play_sound(snd_click,-80,0);
    audio_sound_gain(snd_click,0.25*master_volume*effect_volume,0);
}
if (click2>0){
    click2=-1;
    audio_play_sound(snd_click_small,-80,0);
    audio_sound_gain(snd_click_small,0.25*master_volume*effect_volume,0);
}
// Return artifact
if (qsfx==1){
    qsfx=0;
    scr_quest(0,"artifact_return",4,turn=1);
}
// Diplomacy options
if (diplomacy==0) then trading_artifact=0;

if (trading_artifact==0) and (trading==0) and (trading_artifact==0) 
and (faction_justmet==1) and (questing==0) and (trading_demand==0) and (complex_event==false){
    for(var h=1; h<=4; h++){
        obj_controller.diplo_option[h]="";
        obj_controller.diplo_goto[h]="";
    }
}

income=income_base+income_home+income_forge+income_agri+income_recruiting+income_training+income_fleet+income_trade+income_tribute;

if (menu==20) and ((diplomacy>0) or ((diplomacy<-5) and (diplomacy>-6))){
    if (string_length(diplo_txt)<string_length(diplo_text)){
        diplo_char+=2;
        diplo_txt=string_copy(diplo_text,0,diplo_char);
    }
    if (diplo_alpha<1) then diplo_alpha+=0.05;
}
// Check if fleet is minimized or not
if (instance_exists(obj_popup)){
    if (obj_popup.type=99) then fleet_minimized=1;
}
// Rrepair ships
if (menu==0) and (repair_ships>0) and (instance_number(obj_turn_end)==0) and (instance_number(obj_popup)==0){
    repair_ships=0;
    
    var pip=instance_create(0,0,obj_popup);
    pip.title="Ships Repaired";
    pip.text="In accordance with the Imperial Repair License, all "+string(obj_ini.chapter_name)+" ships orbiting friendly planets have been repaired. Note that repaired ships, and their fleets, are unable to act further this turn.";
    pip.image="shipyard";
    pip.cooldown=15;
    
    with(obj_p_fleet){
        if (capital_health<100) and (capital_number>0) then acted=2;
        if (frigate_health<100) and (frigate_number>0) then acted=2;
        if (escort_health<100) and (escort_number>0) then acted=2;
    }
    for(var i=1; i<=30; i++){
        if (obj_ini.ship_location[i]!="Warp") and (obj_ini.ship_location[i]!="Lost"){obj_ini.ship_hp[i]=obj_ini.ship_maxhp[i];}
    }
    // TODO need something here to veryify that the ships are within a friendly star system
}
// Unloads units from a ship
if (unload>0){
    cooldown=8;
    var b=selecting_ship,manaj=managing;
    
    if (manaj>10) then manaj=0;

    for(var q=1; q<=500; q++){
        if (man[q]=="man") and (ma_loc[q]==selecting_location) and (ma_wid[q]<1)and (man_sel[q]!=0){
            if (b==0) then b=ma_lid[q];
            obj_ini.loc[manaj][ide[q]]=obj_ini.ship_location[b];
            obj_ini.lid[manaj][ide[q]]=0;
            obj_ini.wid[manaj][ide[q]]=unload;
            obj_ini.uid[manaj][ide[q]]=0;
            
            ma_loc[q]=obj_ini.ship_location[b];
            ma_lid[q]=0;
            ma_wid[q]=unload;
        }
        if (man[q]=="vehicle") and (ma_loc[q]==selecting_location)  and (ma_wid[q]<1) and(man_sel[q]!=0){
            if (b==0) then b=ma_lid[q];
            obj_ini.veh_loc[manaj][ide[q]]=obj_ini.ship_location[b];
            obj_ini.veh_lid[manaj][ide[q]]=0;
            obj_ini.veh_wid[manaj][ide[q]]=unload;
            obj_ini.veh_uid[manaj][ide[q]]=0;
            
            ma_loc[q]=obj_ini.ship_location[b];
            ma_lid[q]=0;
            ma_wid[q]=unload;
        }
    }
    selecting_location="";
    for(var i=0; i<501; i++){
        man_sel[i]=0;
    }
    obj_ini.ship_carrying[b]-=man_size;
    sh_cargo[b]-=man_size;
    cooldown=10;
    sel_loading=0;
    man_size=0;
    unload=0;
    with(obj_star_select){instance_destroy();}
}
// Resets selections
if (managing>0) and (man_size==0) and ((selecting_location!="") or (selecting_types!="") or (selecting_planet!=0) or (selecting_ship!=0)){
    selecting_location="";
    selecting_types="";
    selecting_planet=0;
    selecting_ship=0;
}

if (marines<=0) and (alarm[7]=-1) and (!instance_exists(obj_fleet_controller)) and (!instance_exists(obj_ncombat)) then alarm[7]=15;
