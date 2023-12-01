
if (hide=true) then exit;

var romanNumerals=scr_roman_numerals();
var xx,yy;
xx=__view_get( e__VW.XView, 0 );
yy=__view_get( e__VW.YView, 0 );

if (instance_exists(obj_fleet)) then exit;

if (type=99){
    draw_set_font(fnt_large);
    draw_set_halign(fa_center);
    draw_set_color(38144);
    
    if (obj_controller.zoomed=0){draw_text_transformed(__view_get( e__VW.XView, 0 )+320,__view_get( e__VW.YView, 0 )+60,string_hash_to_newline("SELECT DESTINATION"),0.5,0.5,0);}
    if (obj_controller.zoomed=1){draw_text_transformed(room_width/2,60*3,string_hash_to_newline("SELECT DESTINATION"),1.5,1.5,0);}
    
    draw_set_halign(fa_left);
}else if (type=10){
    target_comp+=1;
    draw_set_color(0);
    draw_set_alpha(target_comp/60);
    draw_rectangle(0,0,room_width,room_height,0);
    draw_set_alpha(1);
    exit;
}else if  ((type=9) or (type=9.1)) and (instance_exists(obj_controller)){
    draw_sprite(spr_planet_screen,0,xx+231,yy+112);
    draw_set_font(fnt_40k_14);
    draw_set_halign(fa_center);
    draw_set_color(c_gray);
    
    var ch,inq_hide;ch="";inq_hide=0;
    if (type=9){
        if (string_count("inq",obj_ini.artifact_tags[obj_controller.menu_artifact])>0){
            var i;i=0;
            repeat(10){i+=1;
                if (obj_controller.quest[i]="artifact_loan") then inq_hide=1;
                if (obj_controller.quest[i]="artifact_return") then inq_hide=2;
            }
        }
    }
    
    if (obj_controller.disposition[2]>0) then ch="+";
    if (obj_controller.known[eFACTION.Imperium]>1) then draw_text(xx+740,yy+120,string_hash_to_newline("Imperium ("+string(ch)+string(obj_controller.disposition[2])+")#"+string(obj_controller.faction_title[2])));
    draw_line(xx+239+420,yy+150,xx+398+420,yy+150);
    ch="";
    if (obj_controller.disposition[3]>0) then ch="+";
    if (obj_controller.known[eFACTION.Mechanicus]>1) then draw_text(xx+740,yy+150,string_hash_to_newline("Mechanicus ("+string(ch)+string(obj_controller.disposition[3])+")#"+string(obj_controller.faction_title[3])));
    draw_line(xx+239+420,yy+180,xx+398+420,yy+180);
    ch="";
    if (obj_controller.disposition[4]>0) then ch="+";
    if ((obj_controller.known[eFACTION.Inquisition]>1) or (inq_hide=2)) and (inq_hide!=1) then draw_text(xx+740,yy+180,string_hash_to_newline("Inquisition ("+string(ch)+string(obj_controller.disposition[4])+")#"+string(obj_controller.faction_title[4])));
    draw_line(xx+239+420,yy+210,xx+398+420,yy+210);
    ch="";
    if (obj_controller.disposition[5]>0) then ch="+";
    if (obj_controller.known[eFACTION.Ecclesiarchy]>1) then draw_text(xx+740,yy+210,string_hash_to_newline("Ecclesiarchy ("+string(ch)+string(obj_controller.disposition[5])+")#"+string(obj_controller.faction_title[5])));
    draw_line(xx+239+420,yy+240,xx+398+420,yy+240);
    ch="";
    if (obj_controller.disposition[6]>0) then ch="+";
    if (obj_controller.known[eFACTION.Eldar]>1) then draw_text(xx+740,yy+240,string_hash_to_newline("Eldar ("+string(ch)+string(obj_controller.disposition[6])+")#"+string(obj_controller.faction_title[6])));
    draw_line(xx+239+420,yy+270,xx+398+420,yy+270);
    ch="";
    if (obj_controller.disposition[8]>0) then ch="+";
    if (obj_controller.known[eFACTION.Tau]>1) then draw_text(xx+740,yy+270,string_hash_to_newline("Tau ("+string(ch)+string(obj_controller.disposition[8])+")#"+string(obj_controller.faction_title[8])));
    draw_line(xx+239+420,yy+300,xx+398+420,yy+300);
    
    if (mouse_x>=xx+240+420) and (mouse_x<=xx+387+420){
        draw_set_alpha(0.33);draw_set_color(c_gray);
        if (mouse_y>=yy+121) and (mouse_y<=yy+149) and (obj_controller.known[eFACTION.Imperium]>1) then draw_rectangle(xx+340+420,yy+121,xx+398+420,yy+149,0);
        if (mouse_y>=yy+151) and (mouse_y<=yy+179) and (obj_controller.known[eFACTION.Mechanicus]>1) then draw_rectangle(xx+340+420,yy+151,xx+398+420,yy+179,0);
        if (mouse_y>=yy+181) and (mouse_y<=yy+209) and ((obj_controller.known[eFACTION.Inquisition]>1) or (inq_hide=2)) and (inq_hide!=1) then draw_rectangle(xx+340,yy+181,xx+398+420,yy+209,0);
        if (mouse_y>=yy+211) and (mouse_y<=yy+239) and (obj_controller.known[eFACTION.Ecclesiarchy]>1) then draw_rectangle(xx+340+420,yy+211,xx+398+420,yy+239,0);
        if (mouse_y>=yy+241) and (mouse_y<=yy+269) and (obj_controller.known[eFACTION.Eldar]>1) then draw_rectangle(xx+340+420,yy+241,xx+398+420,yy+269,0);
        if (mouse_y>=yy+271) and (mouse_y<=yy+299) and (obj_controller.known[eFACTION.Tau]>1) then draw_rectangle(xx+340+420,yy+271,xx+398+420,yy+299,0);
    }
    
    draw_set_alpha(1);
    draw_set_color(38144);
    draw_text(xx+740,yy+326,string_hash_to_newline("[Cancel]"));
}

var zm;zm=0;
if (instance_exists(obj_controller)) then zm=obj_controller.zoomed;
if ((zm=0) and (type<=4)) or (type=98){
    
    var widd,image_bot;
    image_bot=0;

    if (size=0) or (size=2){
        sprite_index=spr_popup_medium;image_alpha=0;widd=sprite_width-50;
        draw_sprite_ext(spr_popup_medium,type,xx+((1600-sprite_width)/2),yy+((900-sprite_height)/2),1,y_scale,0,c_white,1);
        if (image!=""){image_wid=100;image_hei=100;}
    }
    if (size=1){
        sprite_index=spr_popup_small;image_alpha=0;widd=sprite_width-10;
        draw_sprite_ext(spr_popup_small,type,xx+((1600-sprite_width)/2),yy+((900-sprite_height)/2),1,y_scale,0,c_white,1);
        if (image!=""){image_wid=150;image_hei=150;}
    }
    if (size=3){
        sprite_index=spr_popup_large;image_alpha=0;widd=sprite_width-50;
        draw_sprite_ext(spr_popup_large,type,xx+((1600-sprite_width)/2),yy+((900-sprite_height)/2),1,y_scale,0,c_white,1);
        if (image!=""){image_wid=200;image_hei=200;}
    }
    
    if (image_wid>0) then widd-=(image_wid+10);
    
    var x1,y1;
    x1=xx+((1600-sprite_width)/2);
    y1=yy+((900-sprite_height)/2);
    
    draw_set_font(fnt_40k_14b);
    draw_set_halign(fa_center);
    draw_set_color(38144);
    
    if (fancy_title=1){
        draw_set_font(fnt_fancy);    
        if (type=1) then draw_set_color(255);
    }
    draw_text(x1+(sprite_width/2),y1+(sprite_height*0.07),string_hash_to_newline(string(title)));
    // draw_text(xx+320.5,yy+123.5,string(title));
    
    draw_set_font(fnt_40k_14);
    draw_set_halign(fa_left);
    draw_set_color(38144);
    
    if (instance_exists(obj_turn_end)){
        if (obj_turn_end.popups>0) then draw_text(x1+20,y1+(sprite_height*0.07),string_hash_to_newline(string(obj_turn_end.current_popup)+"/"+string(obj_turn_end.popups)));
    }
    
    if (image=""){
        if (size=1) then draw_text_ext(x1+5,y1+(sprite_height*0.18),string_hash_to_newline(string(text)),-1,widd);
        if (size!=1) then draw_text_ext(x1+25,y1+(sprite_height*0.18),string_hash_to_newline(string(text)),-1,widd);
        str_h=string_height_ext(string_hash_to_newline(string(text)),-1,widd)+(sprite_height*0.18);
    }
    if (image!=""){
        if (size=1) then draw_text_ext(x1+15+image_wid,y1+(sprite_height*0.18),string_hash_to_newline(string(text)),-1,widd);
        if (size!=1) then draw_text_ext(x1+35+image_wid,y1+(sprite_height*0.18),string_hash_to_newline(string(text)),-1,widd);
        str_h=string_height_ext(string_hash_to_newline(string(text)),-1,widd)+(sprite_height*0.18);
    }
    
    // if (image!="") then draw_text_ext(x1+126+150,y1+152,string(text),-1,384-150);
    // if (text2!="") then draw_text_ext(x1+126,y1+309,string(text2),-1,384);
    // TODO change this into an array in a function (like romanNumerals does in here)
    var img=-1;
    if (image="") then img=-1;
    if (image="orks") then img=0;
    if (image="tau") then img=1;
    if (image="chaos") then img=2;
    if (image="shadow") then img=3;
    if (image="distinguished") then img=4;
    if (image="tech_build") then img=5;
    if (image="sororitas") then img=6;
    if (image="angry") then img=7;
    if (image="gene_bad") then img=8;
    if (image="lost_warp") then img=10;
    if (image="warp") then img=11;
    if (image="crusade") then img=12;
    if (image="fuklaw") then img=13;
    if (image="artifact") or (image="artifact2") then img=14;
    if (image="artifact_recovered") then img=15;
    if (image="artifact_given") then img=15;
    if (image="waaagh") then img=16;
    if (image="shipyard") then img=17;
    if (image="inquisition") then img=18;
    if (image="succession") then img=19;
    if (image="rogue_trader") then img=20;
    if (image="necron_tomb") then img=21;
    if (image="webber") then img=22;
    if (image="spyrer") then img=23;
    if (image="fortress") then img=24;
    if (image="fortress_hive") then img=25;
    if (image="fortress_death") then img=26;
    if (image="fortress_ice") then img=27;
    if (image="fortress_lava") then img=28;
    if (image="fortress_dorf") then img=29;
    if (image="exploding_ship") then img=30;
    if (image="necron_cave") then img=31;
    if (image="exterminatus_new") then img=32;
    if (image="necron_tunnels_1") then img=33;
    if (image="necron_tunnels_2") then img=34;
    if (image="necron_tunnels_3") then img=35;
    if (image="necron_army") then img=36;
    if (image="harlequin") then img=37;
    if (image="black_rage") then img=39;
    if (image="exterminatus") then img=40;
    if (image="stc") then img=41;
    if (image="thallax") then img=42;
    if (image="space_hulk_done") then img=44;
    if (image="ancient_ruins") then img=45;
    if (image="geneseed_lab") then img=47;
    if (image="ruins_bunker") then img=48;
    if (image="ruins_fort") then img=49;
    if (image="ruins_ship") then img=50;
    if (image="fallen") then img=51;
    if (image="debug_banshee") then img=52;
    if (image="mechanicus") then img=53;
    if (image="chaos_cultist") then img=54;
    if (image="chaos_symbol") then img=55;
    if (image="chaos_messenger") then img=56;
    if (image="event_feast") then img=57;
    if (image="event_tournament") then img=58;
    if (image="event_deathmatch") then img=59;
    if (image="event_mass") then img=60;
    if (image="event_ccult") then img=61;
    if (image="event_crelic") then img=62;
    if (image="event_march") then img=63;
    
    if (img!=-1) and (image!="") and (image_wid>0){
        var sh=999;
        if (size=1){sh=24;scr_image("popup",img,x1+5,y1+sh+24,image_wid,image_hei);}
        if (size>=2){sh=24;scr_image("popup",img,x1+25,y1+sh+24,image_wid,image_hei);}
        
        image_bot=(sprite_height*0.07)+image_hei+5;
    }
    
    if (option1 != "") and(string_count("Servitors and Skitarii", option1) = 0) {
        var tox = "1. " + string(option1);
        if (option2 != "") then tox += "#2. " + string(option2);
        if (option3 != "") then tox += "#3. " + string(option3);

        var top = y1 + 0.5 + (sprite_height * 0.6);
        if (str_h != 0) then top = y1 + str_h + 20;
        if (image != "") then top = max(top, y1 + image_bot);

        draw_text_ext(x1 + 25.5, top, string_hash_to_newline("  Choices:"), -1, widd);
        draw_text_ext(x1 + 25, top + 0.5, string_hash_to_newline("  Choices:"), -1, widd);

        var sz = 0,
            sz2 = 0,
            oy = y1,
            t8 = 0;
        if (str_h != 0) {
            y1 += str_h + 20;
            y1 -= (sprite_height * 0.6);
        }

        y1 = top;

        if (option1 != "") then draw_text_ext(x1 + 25.5, y1 + 20, string_hash_to_newline("1. " + string(option1)), -1, widd);

        sz = string_height_ext(string_hash_to_newline("1. " + string(option1)), -1, widd);
        if (option2 != "") then draw_text_ext(x1 + 25.5, y1 + 20 + sz, string_hash_to_newline("2. " + string(option2)), -1, widd);

        sz2 = string_height_ext(string_hash_to_newline("1. " + string(option1)), -1, widd);
        sz2 += string_height_ext(string_hash_to_newline("2. " + string(option2)), -1, widd);
        if (option3 != "") then draw_text_ext(x1 + 25.5, y1 + 20 + sz2, string_hash_to_newline("3. " + string(option3)), -1, widd);

        if (option1 != "") then t8 = (y1 + 20) + 5;
        if (option2 != "") then t8 = (y1 + 20 + sz) + 5;
        if (option3 = "") then t8 = (y1 + 20 + sz2 + string_height_ext(string_hash_to_newline("3. " + string(option3)), -1, widd)) + 5;


        if (option1 != "") and(mouse_x >= x1) and(mouse_y >= y1 + 21) and(mouse_x <= x1 + 30 + string_width_ext(string_hash_to_newline("1. " + string(option1)), -1, widd)) and(mouse_y < y1 + 39) {
            draw_sprite(spr_popup_select, 0, x1 + 8.5, y1 + 21);
            if (mouse_check_button(mb_left)) then press = 1;
        }
        if (option2 != "") and(mouse_x >= x1) and(mouse_y >= y1 + 21 + sz) and(mouse_x <= x1 + 30 + string_width_ext(string_hash_to_newline("2. " + string(option2)), -1, widd)) and(mouse_y < y1 + 39 + sz) {
            draw_sprite(spr_popup_select, 0, x1 + 8.5, y1 + 21 + sz);
            if (mouse_check_button(mb_left)) then press = 2;
        }
        if (option3 != "") and(mouse_x >= x1) and(mouse_y >= y1 + 21 + sz2) and(mouse_x <= x1 + 30 + string_width_ext(string_hash_to_newline("3. " + string(option3)), -1, widd)) and(mouse_y < y1 + 39 + sz2) {
            draw_sprite(spr_popup_select, 0, x1 + 8.5, y1 + 21 + sz2);
            if (mouse_check_button(mb_left)) then press = 3;
        }

        if (t8 < (oy + sprite_height)) {
            y_scale = (t8 / (oy + sprite_height));
        }
        if (t8 > (oy + sprite_height)) {
            y_scale = (t8 / (oy + sprite_height));
        }
    }
}

// ** Equip Artifact **
if (type=8) and (instance_exists(obj_controller)){
    var x2,y2;x2=__view_get( e__VW.XView, 0 )+951;y2=__view_get( e__VW.YView, 0 )+48;
    
    // draw_sprite(spr_popup_large,0,x2,y2);
    
    draw_set_font(fnt_40k_14b);
    draw_set_halign(fa_center);
    draw_set_color(c_gray);
    
    draw_text(x2+312,y2+26,string_hash_to_newline("Equip Artifact ("+string(obj_ini.artifact[obj_controller.menu_artifact])+")"));
    // draw_text(xx+320.5,yy+123.5,"Equip Artifact ("+string(obj_ini.artifact[obj_controller.menu_artifact])+")");
    
    draw_set_font(fnt_40k_12);draw_set_halign(fa_left);
    draw_text(x2+31,y2+55,string_hash_to_newline("View Company:"));
    var check=" ";
    // HQ Company
    if (target_comp=0) then check="x";
    draw_text(x2+73,y2+71,string_hash_to_newline(" HQ ["+string(check)+"]"));
    check=" ";
    // I Company
    if (target_comp=1) then check="x";
    draw_text(x2+77,y2+87,string_hash_to_newline(romanNumerals[0]+" ["+string(check)+"]"));
    check=" ";
    // II Company
    if (target_comp=2) then check="x";
    draw_text(x2+158,y2+87,string_hash_to_newline(romanNumerals[1]+" ["+string(check)+"]"));
    check=" ";
    // III Company
    if (target_comp=3) then check="x";
    draw_text(x2+275,y2+87,string_hash_to_newline(romanNumerals[2]+" ["+string(check)+"]"));
    check=" ";
    // IV Company
    if (target_comp=4) then check="x";
    draw_text(x2+386,y2+87,string_hash_to_newline(romanNumerals[3]+" ["+string(check)+"]"));
    check=" ";
    // V Company
    if (target_comp=5) then check="x";
    draw_text(x2+497,y2+87,string_hash_to_newline(romanNumerals[4]+" ["+string(check)+"]"));
    check=" ";
    // VI Company
    if (target_comp=6) then check="x";
    draw_text(x2+73,y2+103,string_hash_to_newline(romanNumerals[5]+" ["+string(check)+"]"));
    check=" ";
    // VII Company
    if (target_comp=7) then check="x";
    draw_text(x2+160,y2+103,string_hash_to_newline(romanNumerals[6]+" ["+string(check)+"]"));
    check=" ";
    // VIII Company
    if (target_comp=8) then check="x";
    draw_text(x2+275,y2+103,string_hash_to_newline(romanNumerals[7]+" ["+string(check)+"]"));
    check=" ";
    // IX Company
    if (target_comp=9) then check="x";
    draw_text(x2+386,y2+103,string_hash_to_newline(romanNumerals[8]+" ["+string(check)+"]"));
    check=" ";
    // X Company
    if (target_comp=10) then check="x";
    draw_text(x2+497,y2+103,string_hash_to_newline(romanNumerals[9]+" ["+string(check)+"]"));
    check=" ";
    
    if (target_role>2) then draw_set_alpha(0.25);
    check=" ";
    draw_text(x2+30,y2+128,string_hash_to_newline("Replace:"));
    
    if (target_role=1) then check="x";
    draw_text(x2+200,y2+128,string_hash_to_newline("1st Weapon ["+string(check)+"]"));
    check=" ";
    
    if (target_role=2) then check="x";
    draw_text(x2+426,y2+128,string_hash_to_newline("2nd Weapon ["+string(check)+"]"));
    check=" ";
    draw_set_alpha(1);
    
    
    draw_set_font(fnt_40k_12);
    draw_rectangle(x2+29,y2+160,x2+569,y2+363+356,1);// Main rectangle?
    
    scr_scrollbar(1520,220,1543,761,23,obj_controller.man_max,obj_controller.man_current);
    draw_rectangle(x2+569,y2+171,x2+592,y2+357+356,1);// Inside of scroll
    draw_rectangle(x2+569,y2+150,x2+592,y2+378+356,1);// Outside of scroll
    draw_sprite_stretched(spr_arrow,2,x2+569,y2+150,23,22);
    draw_sprite_stretched(spr_arrow,3,x2+569,y2+357+356,23,22);
    
    if (target_comp!=-1){
        var x2,y2,
        x2=__view_get( e__VW.XView, 0 )+951;y2=__view_get( e__VW.YView, 0 )+48;
    
        var top,sel,temp1,temp2,temp3,temp4,temp5;temp1="";temp2="";temp3="";temp4="";temp5="";
        top=obj_controller.man_current;sel=top;
        
        var ma_ar,ma_we1,ma_we2,ma_ge,ma_mb,ttt;
        ma_ar="";ma_we1="";ma_we2="";ma_ge="";ma_mb="";ttt=0;
        
        repeat(min(obj_controller.man_max,23)){
            if (obj_controller.man[sel]="man"){
                temp1=string(obj_controller.ma_role[sel])+" "+string(obj_controller.ma_name[sel]);
                temp2=string(obj_controller.ma_loc[sel]);
                if (obj_controller.ma_wid[sel]!=0){
                    if (obj_controller.ma_wid[sel]=1) then temp2+=" I";
                    if (obj_controller.ma_wid[sel]=2) then temp2+=" II";
                    if (obj_controller.ma_wid[sel]=3) then temp2+=" III";
                    if (obj_controller.ma_wid[sel]=4) then temp2+=" IV";
                }
                if (obj_controller.ma_health[sel]>=100) then temp3="Unwounded";
                if (obj_controller.ma_health[sel]>=70) and (obj_controller.ma_health[sel]<100) then temp3="Lightly Wounded";
                if (obj_controller.ma_health[sel]>=40) and (obj_controller.ma_health[sel]<70) then temp3="Wounded";
                if (obj_controller.ma_health[sel]>=8) and (obj_controller.ma_health[sel]<40) then temp3="Badly Wounded";
                if (obj_controller.ma_health[sel]<8) then temp3="CRITICAL";
                temp4=string(obj_controller.ma_exp[sel])+" exp";
                
                ma_ar="";ma_we1="";ma_we2="";ma_ge="";ma_mb="";ttt=0;
                if (string_count("&",obj_controller.ma_gear[sel])=0) then ma_ge=obj_controller.ma_gear[sel];
                if (string_count("&",obj_controller.ma_gear[sel])>0) then ma_ge=clean_tags(obj_controller.ma_gear[sel]);
                if (string_count("&",obj_controller.ma_mobi[sel])=0) then ma_mb=obj_controller.ma_mobi[sel];
                if (string_count("&",obj_controller.ma_mobi[sel])>0) then ma_mb=clean_tags(obj_controller.ma_mobi[sel]);
                if (string_count("&",obj_controller.ma_armour[sel])=0) then ma_ar=obj_controller.ma_armour[sel];
                if (string_count("&",obj_controller.ma_armour[sel])>0) then ma_ar=clean_tags(obj_controller.ma_armour[sel]);
                if (string_count("&",obj_controller.ma_wep1[sel])=0) then ma_we1=obj_controller.ma_wep1[sel];
                if (string_count("&",obj_controller.ma_wep1[sel])>0) then ma_we1=clean_tags(obj_controller.ma_wep1[sel]);
                if (string_count("&",obj_controller.ma_wep2[sel])=0) then ma_we2=obj_controller.ma_wep2[sel];
                if (string_count("&",obj_controller.ma_wep2[sel])>0) then ma_we2=clean_tags(obj_controller.ma_wep2[sel]);
                
                if (obj_controller.ma_gear[sel]!="") then temp5="(("+string(ma_ar)+" + "+string(ma_mb)+")) | "+string(ma_we1)+" | "+string(ma_we2)+" + ("+string(ma_ge)+")";
                if (obj_controller.ma_gear[sel]="") then temp5="(("+string(ma_ar)+" + "+string(ma_mb)+")) | "+string(ma_we1)+" | "+string(ma_we2)+"";
            }
            if (obj_controller.man[sel]="vehicle"){
                temp1=string(obj_controller.ma_role[sel]);
                temp2=string(obj_controller.ma_loc[sel]);
                if (obj_controller.ma_wid[sel]!=0){
                    if (obj_controller.ma_wid[sel]=1) then temp2+=" I";
                    if (obj_controller.ma_wid[sel]=2) then temp2+=" II";
                    if (obj_controller.ma_wid[sel]=3) then temp2+=" III";
                    if (obj_controller.ma_wid[sel]=4) then temp2+=" IV";
                }
                temp3="Undamaged";
                temp4="";
                temp5="("+string(obj_controller.ma_wep1[sel])+" | "+string(obj_controller.ma_wep2[sel])+" | "+string(obj_controller.ma_gear[sel])+")";
            }
            
            
            if (obj_controller.man_sel[sel]=0) then draw_set_color(c_black);
            if (obj_controller.man_sel[sel]!=0) then draw_set_color(6052956);
            draw_rectangle(x2+29,y2+150,x2+569,y2+175.4,0);
            draw_set_color(c_gray);draw_rectangle(x2+29,y2+150,x2+569,y2+175.4,1);
            
            // if (obj_controller.man[sel]="man") and (obj_controller.ma_promote[sel]>0) then draw_set_color(c_yellow);
            if (ma_ar="") then draw_set_alpha(0.5);
            draw_text_transformed(x2+32,y2+151,string_hash_to_newline(string(temp1)),1,1,0);draw_text_transformed(x2+32.5,y2+151.5,string_hash_to_newline(string(temp1)),1,1,0);
            draw_set_color(c_gray);draw_set_alpha(1);
                
            /*
            if (string_count("Chapter Master",temp1)>0){
                draw_text_transformed(xx+27+16,y2+64,string(temp1),0.7,0.7,0);draw_text_transformed(xx+28+16,y2+64,string(temp1),0.7,0.7,0);
                draw_text_transformed(xx+27+16,y2+65,string(temp1),0.7,0.7,0);draw_text_transformed(xx+28+16,y2+65,string(temp1),0.7,0.7,0);
                // draw inspect icon
                draw_sprite(spr_inspect_small,0,xx+27,y2+68);
            }
            */
            
            draw_text_transformed(x2+271,y2+151,string_hash_to_newline(string(temp2)),1,1,0);
            if (obj_controller.man[sel]="man") and (obj_controller.ma_lid[sel]=0) then draw_text_transformed(x2+271,y2+151,string_hash_to_newline(string(temp2)),1,1,0);
            if (obj_controller.man[sel]="vehicle") and (obj_controller.ma_lid[sel]=0) then draw_text_transformed(x2+271,y2+151,string_hash_to_newline(string(temp2)),1,1,0);
            
            if (temp3="CRITICAL") then draw_set_color(c_red);
            draw_text_transformed(x2+400,y2+151,string_hash_to_newline(string(temp3)),1,1,0);
            draw_set_color(c_gray);
            
            draw_text_transformed(x2+506,y2+151,string_hash_to_newline(string(temp4)),1,1,0);
            
            draw_set_color(c_gray);
            if (string_count("Artifact",temp5)>0) then draw_set_color(881503);
            draw_text_transformed(x2+38,y2+164,string_hash_to_newline(string(temp5)),1,1,0);draw_set_color(38144);
            
            y2+=25.4;
            sel+=1;
        }
    }
    
    x2=__view_get( e__VW.XView, 0 )+951;
    y2=__view_get( e__VW.YView, 0 )+398;
    
    draw_set_alpha(1);
    draw_set_font(fnt_small);
    draw_set_color(c_gray);
    draw_rectangle(x2+121,y2+393,x2+231,y2+414,1);
    draw_set_alpha(0.5);
    draw_rectangle(x2+122,y2+394,x2+230,y2+413,1);
    
    if (all_good=1){
        draw_set_alpha(1);
        draw_rectangle(x2+408,y2+393,x2+518,y2+414,1);
        draw_set_alpha(0.5);
        draw_rectangle(x2+409,y2+394,x2+517,y2+413,1);
    }
    if (all_good!=1){
        draw_set_alpha(0.25);
        draw_rectangle(x2+408,y2+393,x2+518,y2+414,1);
        draw_rectangle(x2+409,y2+394,x2+517,y2+413,1);
    }
    
    draw_set_alpha(1);
    
    draw_set_halign(fa_center);
    draw_text(x2+173,y2+397,string_hash_to_newline("Cancel"));draw_text(x2+173.5,y2+397.5,string_hash_to_newline("Cancel"));
    
    if (all_good=1){
        draw_text(x2+464,y2+397,string_hash_to_newline("Equip!"));
        draw_text(x2+464.5,y2+397.5,string_hash_to_newline("Equip!"));
    }
    if (all_good!=1){
        draw_set_alpha(0.25);
        draw_text(x2+464,y2+397,string_hash_to_newline("Equip!"));
        draw_text(x2+464.5,y2+397.5,string_hash_to_newline("Equip!"));
    }
    draw_set_alpha(1);
    
}

var xx,yy;
xx=__view_get( e__VW.XView, 0 );
yy=__view_get( e__VW.YView, 0 );

// Changing Equipment
if (zm=0) and (type=6) and (instance_exists(obj_controller)){
    draw_set_color(0);draw_rectangle(xx+1006,yy+143,xx+1577,yy+518,0);
    
    draw_set_font(fnt_40k_14b);
    draw_set_halign(fa_center);
    draw_set_color(c_gray);
    
    draw_text(xx+1292,yy+145,string_hash_to_newline("Change Equipment"));
    
    draw_set_font(fnt_40k_12);
    var comp="";
    if (company <= 10 and company > 0) {
        comp=romanNumerals[company-1];
    }
    else if (company>10) then comp="HQ";

    if (vehicle_equipment=0) then draw_text(xx+1292,yy+170,string_hash_to_newline(string(comp)+" Company, "+string(units)+" Marines"));
    if (vehicle_equipment=1) then draw_text(xx+1292,yy+170,string_hash_to_newline(string(comp)+" Company, "+string(units)+" Vehicles"));
    
    draw_set_halign(fa_left);
    draw_set_color(c_gray);
    
    draw_rectangle(xx+1010,yy+215,xx+1288,yy+315,1);
    draw_rectangle(xx+1574,yy+215,xx+1296,yy+315,1);
    
    
    var show_name="";
    // Need to not show the artifact tags here somehow
    
    draw_text(xx+1010,yy+195,string_hash_to_newline("Before"));
    draw_text(xx+1010.5,yy+195.5,string_hash_to_newline("Before"));
    
    show_name=o_wep1;
    if (a_wep1!="") then show_name=a_wep1;
    if (o_wep1!="") then draw_text(xx+1014,yy+215,string_hash_to_newline(show_name));
    else draw_text(xx+1014,yy+215,string_hash_to_newline("(None)"));
    
    show_name=o_wep2;
    if (a_wep2!="") then show_name=a_wep2;
    if (o_wep2!="") then draw_text(xx+1014,yy+235,string_hash_to_newline(string(show_name)));
    else draw_text(xx+1014,yy+235,string_hash_to_newline("(None)"));
    
    show_name=o_armour;
    if (a_armour!="") then show_name=a_armour;
    if (o_armour!="") then draw_text(xx+1014,yy+255,string_hash_to_newline(string(show_name)));
    else draw_text(xx+1014,yy+255,string_hash_to_newline("(None)"));
    
    show_name=o_gear;
    if (a_gear!="") then show_name=a_gear;
    if (o_gear!="") then draw_text(xx+1014,yy+275,string_hash_to_newline(string(show_name)));
    else draw_text(xx+1014,yy+275,string_hash_to_newline("(None)"));
    
    show_name=o_mobi;
    if (a_mobi!="") then show_name=a_mobi;
    if (o_mobi!="") then draw_text(xx+1014,yy+295,string_hash_to_newline(string(show_name)));
    else draw_text(xx+1014,yy+295,string_hash_to_newline("(None)"));
    
    draw_text(xx+1296,yy+195,string_hash_to_newline("After"));
    draw_text(xx+1296.5,yy+195.5,string_hash_to_newline("After"));
    
    draw_set_color(c_gray);
    if (n_good1=0) then draw_set_color(255);
    show_name=n_wep1;
    if (a_wep1!="") and (n_wep1=o_wep1) then show_name=a_wep1;
    if (n_wep1!="") then draw_text(xx+1300,yy+215,string_hash_to_newline(string(show_name)));
    else draw_text(xx+1300,yy+215,string_hash_to_newline("(None)"));
    
    draw_set_color(c_gray);
    if (n_good2=0) then draw_set_color(255);
    show_name=n_wep2;
    if (a_wep2!="") and (n_wep2=o_wep2) then show_name=a_wep2;
    if (n_wep2!="") then draw_text(xx+1300,yy+235,string_hash_to_newline(string(show_name)));
    else draw_text(xx+1300,yy+235,string_hash_to_newline("(None)"));
    
    draw_set_color(c_gray);
    if (n_good3=0) then draw_set_color(255);
    show_name=n_armour;
    if (a_armour!="") and (n_armour=o_armour) then show_name=a_armour;
    if (n_armour!="") then draw_text(xx+1300,yy+255,string_hash_to_newline(string(show_name)));
    else draw_text(xx+1300,yy+255,string_hash_to_newline("(None)"));
    
    draw_set_color(c_gray);
    if (n_good4=0) then draw_set_color(255);
    show_name=n_gear;
    if (a_gear!="") and (n_gear=o_gear) then show_name=a_gear;
    if (n_gear!="") then draw_text(xx+1300,yy+275,string_hash_to_newline(string(show_name)));
    else draw_text(xx+1300,yy+275,string_hash_to_newline("(None)"));
    
    draw_set_color(c_gray);
    if (n_good5=0) then draw_set_color(255);
    show_name=n_mobi;
    if (a_mobi!="") and (n_mobi=o_mobi) then show_name=a_mobi;
    if (n_mobi!="") then draw_text(xx+1300,yy+295,string_hash_to_newline(string(show_name)));
    else draw_text(xx+1300,yy+295,string_hash_to_newline("(None)"));
    
    draw_set_color(c_gray);
    
    if (target_comp=1) then draw_text(xx+1292,yy+215,string_hash_to_newline("->"));
    if (target_comp=2) then draw_text(xx+1292,yy+235,string_hash_to_newline("->"));
    if (target_comp=3) then draw_text(xx+1292,yy+255,string_hash_to_newline("->"));
    if (target_comp=4) then draw_text(xx+1292,yy+275,string_hash_to_newline("->"));
    if (target_comp=5) then draw_text(xx+1292,yy+295,string_hash_to_newline("->"));
    
    
    if (mouse_x>=xx+1296) and (mouse_x<xx+1574){
        if (mouse_y>=yy+215) and (mouse_y<yy+235){
            draw_set_alpha(0.5);
            draw_line(xx+1296,yy+225,xx+1574,yy+225);
        }
        if (mouse_y>=yy+235) and (mouse_y<yy+255){
            draw_set_alpha(0.5);
            draw_line(xx+1296,yy+245,xx+1574,yy+245);
        }
        if (mouse_y>=yy+255) and (mouse_y<yy+275){
            draw_set_alpha(0.5);
            draw_line(xx+1296,yy+265,xx+1574,yy+265);
        }
        if (mouse_y>=yy+275) and (mouse_y<yy+295){
            draw_set_alpha(0.5);
            draw_line(xx+1296,yy+285,xx+1574,yy+285);
        }
        if (mouse_y>=yy+295) and (mouse_y<yy+315){
            draw_set_alpha(0.5);
            draw_line(xx+1296,yy+305,xx+1574,yy+305);
        }
    }
    draw_set_alpha(1);
     
     
     if (target_comp!=-1){
         var check=" ",o=1,mct=1;
         if (master_crafted=1) then mct=0.7;
         
         if (item_name[o]!=""){if (target_role=o) then check="x";draw_text_transformed(xx+1016,yy+335,string_hash_to_newline("["+string(check)+"] "+string(item_name[o])),mct,1,0);check=" ";}o+=1;
         if (item_name[o]!=""){if (target_role=o) then check="x";draw_text_transformed(xx+1016,yy+355,string_hash_to_newline("["+string(check)+"] "+string(item_name[o])),mct,1,0);check=" ";}o+=1;
         if (item_name[o]!=""){if (target_role=o) then check="x";draw_text_transformed(xx+1016,yy+375,string_hash_to_newline("["+string(check)+"] "+string(item_name[o])),mct,1,0);check=" ";}o+=1;
         if (item_name[o]!=""){if (target_role=o) then check="x";draw_text_transformed(xx+1016,yy+395,string_hash_to_newline("["+string(check)+"] "+string(item_name[o])),mct,1,0);check=" ";}o+=1;
         if (item_name[o]!=""){if (target_role=o) then check="x";draw_text_transformed(xx+1016,yy+415,string_hash_to_newline("["+string(check)+"] "+string(item_name[o])),mct,1,0);check=" ";}o+=1;
         if (item_name[o]!=""){if (target_role=o) then check="x";draw_text_transformed(xx+1016,yy+435,string_hash_to_newline("["+string(check)+"] "+string(item_name[o])),mct,1,0);check=" ";}o+=1;
         if (item_name[o]!=""){if (target_role=o) then check="x";draw_text_transformed(xx+1016,yy+455,string_hash_to_newline("["+string(check)+"] "+string(item_name[o])),mct,1,0);check=" ";}o+=1;
         
         if (item_name[o]!=""){if (target_role=o) then check="x";draw_text_transformed(xx+1170,yy+335,string_hash_to_newline("["+string(check)+"] "+string(item_name[o])),mct,1,0);check=" ";}o+=1;
         if (item_name[o]!=""){if (target_role=o) then check="x";draw_text_transformed(xx+1170,yy+355,string_hash_to_newline("["+string(check)+"] "+string(item_name[o])),mct,1,0);check=" ";}o+=1;
         if (item_name[o]!=""){if (target_role=o) then check="x";draw_text_transformed(xx+1170,yy+375,string_hash_to_newline("["+string(check)+"] "+string(item_name[o])),mct,1,0);check=" ";}o+=1;
         if (item_name[o]!=""){if (target_role=o) then check="x";draw_text_transformed(xx+1170,yy+395,string_hash_to_newline("["+string(check)+"] "+string(item_name[o])),mct,1,0);check=" ";}o+=1;
         if (item_name[o]!=""){if (target_role=o) then check="x";draw_text_transformed(xx+1170,yy+415,string_hash_to_newline("["+string(check)+"] "+string(item_name[o])),mct,1,0);check=" ";}o+=1;
         if (item_name[o]!=""){if (target_role=o) then check="x";draw_text_transformed(xx+1170,yy+435,string_hash_to_newline("["+string(check)+"] "+string(item_name[o])),mct,1,0);check=" ";}o+=1;
         if (item_name[o]!=""){if (target_role=o) then check="x";draw_text_transformed(xx+1170,yy+455,string_hash_to_newline("["+string(check)+"] "+string(item_name[o])),mct,1,0);check=" ";}o+=1;
         
         if (item_name[o]!=""){if (target_role=o) then check="x";draw_text_transformed(xx+1324,yy+335,string_hash_to_newline("["+string(check)+"] "+string(item_name[o])),mct,1,0);check=" ";}o+=1;
         if (item_name[o]!=""){if (target_role=o) then check="x";draw_text_transformed(xx+1324,yy+355,string_hash_to_newline("["+string(check)+"] "+string(item_name[o])),mct,1,0);check=" ";}o+=1;
         if (item_name[o]!=""){if (target_role=o) then check="x";draw_text_transformed(xx+1324,yy+375,string_hash_to_newline("["+string(check)+"] "+string(item_name[o])),mct,1,0);check=" ";}o+=1;
         if (item_name[o]!=""){if (target_role=o) then check="x";draw_text_transformed(xx+1324,yy+395,string_hash_to_newline("["+string(check)+"] "+string(item_name[o])),mct,1,0);check=" ";}o+=1;
         if (item_name[o]!=""){if (target_role=o) then check="x";draw_text_transformed(xx+1324,yy+415,string_hash_to_newline("["+string(check)+"] "+string(item_name[o])),mct,1,0);check=" ";}o+=1;
         if (item_name[o]!=""){if (target_role=o) then check="x";draw_text_transformed(xx+1324,yy+435,string_hash_to_newline("["+string(check)+"] "+string(item_name[o])),mct,1,0);check=" ";}o+=1;
         if (item_name[o]!=""){if (target_role=o) then check="x";draw_text_transformed(xx+1324,yy+455,string_hash_to_newline("["+string(check)+"] "+string(item_name[o])),mct,1,0);check=" ";}o+=1;
         
         if (item_name[o]!=""){if (target_role=o) then check="x";draw_text_transformed(xx+1478,yy+335,string_hash_to_newline("["+string(check)+"] "+string(item_name[o])),mct,1,0);check=" ";}o+=1;
         if (item_name[o]!=""){if (target_role=o) then check="x";draw_text_transformed(xx+1478,yy+355,string_hash_to_newline("["+string(check)+"] "+string(item_name[o])),mct,1,0);check=" ";}o+=1;
         if (item_name[o]!=""){if (target_role=o) then check="x";draw_text_transformed(xx+1478,yy+375,string_hash_to_newline("["+string(check)+"] "+string(item_name[o])),mct,1,0);check=" ";}o+=1;
         if (item_name[o]!=""){if (target_role=o) then check="x";draw_text_transformed(xx+1478,yy+395,string_hash_to_newline("["+string(check)+"] "+string(item_name[o])),mct,1,0);check=" ";}o+=1;
         if (item_name[o]!=""){if (target_role=o) then check="x";draw_text_transformed(xx+1478,yy+415,string_hash_to_newline("["+string(check)+"] "+string(item_name[o])),mct,1,0);check=" ";}o+=1;
         if (item_name[o]!=""){if (target_role=o) then check="x";draw_text_transformed(xx+1478,yy+435,string_hash_to_newline("["+string(check)+"] "+string(item_name[o])),mct,1,0);check=" ";}o+=1;
         if (item_name[o]!=""){if (target_role=o) then check="x";draw_text_transformed(xx+1478,yy+455,string_hash_to_newline("["+string(check)+"] "+string(item_name[o])),mct,1,0);check=" ";}o+=1;
    }
    
    draw_set_halign(fa_center);
    if (target_comp=1) or (target_comp=2){
        var msc=" ";
        if (master_crafted=1) then msc="x";
        if (tab=1) then draw_text(xx+1292,yy+318,string_hash_to_newline("Tab 1 [x]    Tab 2 [ ]        Master-Crafted ["+string(msc)+"]"));
        if (tab=2) then draw_text(xx+1292,yy+318,string_hash_to_newline("Tab 1 [ ]    Tab 2 [x]        Master-Crafted ["+string(msc)+"]"));
    }
    
    draw_set_color(255);
    draw_set_halign(fa_center);
    draw_text(xx+1292,yy+476,string_hash_to_newline(warning));
    
    draw_set_color(c_gray);
    draw_set_halign(fa_left);
    draw_rectangle(xx+1006,yy+499,xx+1115,yy+518,1);
    draw_set_alpha(0.5);
    draw_rectangle(xx+1007,yy+500,xx+1114,yy+517,1);
    
    
    if (n_good1+n_good2+n_good3+n_good4+n_good5=5){
        draw_set_alpha(1);
        draw_rectangle(xx+1465,yy+499,xx+1576,yy+518,1);
        draw_set_alpha(0.5);
        draw_rectangle(xx+1466,yy+500,xx+1575,yy+517,1);
    }
    if (n_good1+n_good2+n_good3+n_good4+n_good5!=5){
        draw_set_alpha(0.25);
        draw_rectangle(xx+1465,yy+499,xx+1576,yy+518,1);
        draw_rectangle(xx+1466,yy+500,xx+1575,yy+517,1);
    }
    
    draw_set_alpha(1);
    draw_set_halign(fa_center);
    draw_text(xx+1061,yy+501,string_hash_to_newline("Cancel"));
    draw_text(xx+1061.5,yy+501.5,string_hash_to_newline("Cancel"));
    
    if (n_good1+n_good2+n_good3+n_good4=4){
        draw_text(xx+1521,yy+501,string_hash_to_newline("Equip!"));
        draw_text(xx+1521.5,yy+501.5,string_hash_to_newline("Equip!"));
    }
    if (n_good1+n_good2+n_good3+n_good4!=4){
        draw_set_alpha(0.25);
        draw_text(xx+1521,yy+501,string_hash_to_newline("Equip!"));
        draw_text(xx+1521.5,yy+501.5,string_hash_to_newline("Equip!"));
    }
    draw_set_alpha(1);
}

// ** Promoting **
if (zm=0) and (type=5) and (instance_exists(obj_controller)){

    draw_set_color(0);
    draw_rectangle(xx+1006,yy+143,xx+1577,yy+518,0);
    
    draw_set_font(fnt_40k_14b);
    draw_set_halign(fa_center);
    draw_set_color(c_gray);
    draw_text(xx+1292,yy+145,string_hash_to_newline("Promoting"));
    
    draw_set_font(fnt_40k_12);
    var comp="";
    if (company <= 10 and company > 0) {
        comp=romanNumerals[company-1];
    }
    else if (company>10) then comp="HQ";
    draw_text(xx+1292,yy+170,string_hash_to_newline(string(comp)+" Company "+string(unit_role)));
    
    draw_set_halign(fa_left);
    draw_set_color(c_gray);
    draw_text(xx+1014,yy+210,string_hash_to_newline("Target Company:"));
    
    var check=" ";
    draw_set_alpha(1);

    // HQ Company
    if (target_comp=0) or (target_comp>10) then check="x";
    draw_text(xx+1470,yy+210,string_hash_to_newline("HQ ["+string(check)+"]"));
    check=" ";

    // TODO refactor Promoting and Transfer to use a function or a for loop
    if ((unit_role!=obj_ini.role[100,17]) or (obj_controller.command_set[1]!=0)) and (unit_role!="Lexicanum") and (unit_role!="Codiciery"){
        // I Company
        if (min_exp<80) then draw_set_alpha(0.25);
        if (target_comp==1) then check="x";
        draw_text(xx+1030,yy+230,string_hash_to_newline(romanNumerals[0]+" ["+string(check)+"]"));
        check=" ";
        draw_set_alpha(1);
        // II Company
        if (min_exp<70) then draw_set_alpha(0.25);
        if (target_comp==2) then check="x";
        draw_text(xx+1140,yy+230,string_hash_to_newline(romanNumerals[1]+" ["+string(check)+"]"));
        check=" ";
        draw_set_alpha(1);
        // III Company
        if (min_exp<60) then draw_set_alpha(0.25);
        if (target_comp==3) then check="x";
        draw_text(xx+1250,yy+230,string_hash_to_newline(romanNumerals[2]+" ["+string(check)+"]"));
        check=" ";
        draw_set_alpha(1);
        // IV Company
        if (min_exp<50) then draw_set_alpha(0.25);
        if (target_comp==4) then check="x";
        draw_text(xx+1360,yy+230,string_hash_to_newline(romanNumerals[3]+" ["+string(check)+"]"));
        check=" ";
        draw_set_alpha(1);
        // V Company
        if (min_exp<40) then draw_set_alpha(0.25);
        if (target_comp=5) then check="x";
        draw_text(xx+1470,yy+230,string_hash_to_newline(romanNumerals[4]+" ["+string(check)+"]"));
        check=" ";
        draw_set_alpha(1);
        // VI Company
        if (min_exp<35) then draw_set_alpha(0.25);
        if (target_comp=6) then check="x";
        draw_text(xx+1030,yy+250,string_hash_to_newline(romanNumerals[5]+" ["+string(check)+"]"));
        check=" ";
        draw_set_alpha(1);
        // VII Company
        if (min_exp<30) then draw_set_alpha(0.25);
        if (target_comp=7) then check="x";
        draw_text(xx+1140,yy+250,string_hash_to_newline(romanNumerals[6]+" ["+string(check)+"]"));
        check=" ";draw_set_alpha(1);
        // VIII Company
        if (min_exp<25) then draw_set_alpha(0.25);
        if (target_comp=8) then check="x";
        draw_text(xx+1250,yy+250,string_hash_to_newline(romanNumerals[7]+" ["+string(check)+"]"));
        check=" ";
        draw_set_alpha(1);
        // IX Company
        if (min_exp<20) then draw_set_alpha(0.25);
        if (target_comp=9) then check="x";
        draw_text(xx+1360,yy+250,string_hash_to_newline(romanNumerals[8]+" ["+string(check)+"]"));
        check=" ";
        draw_set_alpha(1);
        // X Company
        if (target_comp=10) then check="x";
        draw_text(xx+1470,yy+250,string_hash_to_newline(romanNumerals[9]+" ["+string(check)+"]"));
        check=" ";
    }
    
    draw_text(xx+1014,yy+290,string_hash_to_newline("Target Role:"));
    
    if (target_comp!=-1){
        if (role_name[1]!=""){draw_set_alpha(1);check=" ";if (target_role=1) then check="x";
            if (min_exp<role_exp[1]) then draw_set_alpha(0.25);
            draw_text(xx+1030,yy+310,string_hash_to_newline(string(role_name[1])+" ["+string(check)+"]"));
        }
        if (role_name[2]!=""){draw_set_alpha(1);check=" ";if (target_role=2) then check="x";
            if (min_exp<role_exp[2]) then draw_set_alpha(0.25);
            draw_text(xx+1200,yy+310,string_hash_to_newline(string(role_name[2])+" ["+string(check)+"]"));
        }
        if (role_name[3]!=""){draw_set_alpha(1);check=" ";if (target_role=3) then check="x";
            if (min_exp<role_exp[3]) then draw_set_alpha(0.25);
            draw_text(xx+1370,yy+310,string_hash_to_newline(string(role_name[3])+" ["+string(check)+"]"));
        }
        
        if (role_name[4]!=""){draw_set_alpha(1);check=" ";if (target_role=4) then check="x";
            if (min_exp<role_exp[4]) then draw_set_alpha(0.25);
            draw_text(xx+1030,yy+330,string_hash_to_newline(string(role_name[4])+" ["+string(check)+"]"));
        }
        if (role_name[5]!=""){draw_set_alpha(1);check=" ";if (target_role=5) then check="x";
            if (min_exp<role_exp[5]) then draw_set_alpha(0.25);
            draw_text(xx+1200,yy+330,string_hash_to_newline(string(role_name[5])+" ["+string(check)+"]"));
        }
        if (role_name[6]!=""){draw_set_alpha(1);check=" ";if (target_role=6) then check="x";
            if (min_exp<role_exp[6]) then draw_set_alpha(0.25);
            draw_text(xx+1370,yy+330,string_hash_to_newline(string(role_name[6])+" ["+string(check)+"]"));
        }
    }
    
    draw_set_alpha(1);
    
    draw_text(xx+1014,yy+370,string_hash_to_newline("Required Gear:"));
    var gr=0,tox="";
    
    if (target_role>0){
        if (req_armour!=""){
            gr=req_armour_num-have_armour_num;
            tox="";
            if (gr>0){draw_set_color(255);
            draw_text(xx+1030,yy+390,string_hash_to_newline(string(req_armour)+" (-"+string(gr)+")"));}
            if (gr<=0) and (req_armour!=""){
                draw_set_color(c_gray);
                draw_text(xx+1030,yy+390,string_hash_to_newline(string(req_armour)+" ("+string(have_armour_num)+"-"+string(req_armour_num)+")"));
            }
        }
        if (req_gear!=""){
            gr=req_gear_num-have_gear_num;
            tox="";
            if (gr>0){draw_set_color(255);
            draw_text(xx+1030,yy+410,string_hash_to_newline(string(req_gear)+" (-"+string(gr)+")"));}
            if (gr<=0) and (req_gear!=""){
                draw_set_color(c_gray);
                draw_text(xx+1030,yy+390,string_hash_to_newline(string(req_gear)+" ("+string(have_gear_num)+"-"+string(req_gear_num)+")"));
            }
        }
        if (req_mobi!=""){
            gr=req_mobi_num-have_mobi_num;
            tox="";
            if (gr>0){draw_set_color(255);
            draw_text(xx+1030,yy+410,string_hash_to_newline(string(req_mobi)+" (-"+string(gr)+")"));}
            if (gr<=0) and (req_mobi!=""){
                draw_set_color(c_gray);
                draw_text(xx+1030,yy+410,string_hash_to_newline(string(req_mobi)+" ("+string(have_mobi_num)+"-"+string(req_mobi_num)+")"));
            }
        }
        if (req_wep1!=""){
            gr=req_wep1_num-have_wep1_num;
            tox="";
            if (gr>0){draw_set_color(255);
            draw_text(xx+1200,yy+390,string_hash_to_newline(string(req_wep1)+" (-"+string(gr)+")"));}
            if (gr<=0) and (req_wep1!=""){
                draw_set_color(c_gray);
                draw_text(xx+1140,yy+390,string_hash_to_newline(string(req_wep1)+" ("+string(have_wep1_num)+"-"+string(req_wep1_num)+")"));
            }
        }
        if (req_wep2!=""){
            gr=req_wep2_num-have_wep2_num;
            tox="";
            if (gr>0){draw_set_color(255);
            draw_text(xx+1200,yy+410,string_hash_to_newline(string(req_wep2)+" (-"+string(gr)+")"));}
            if (gr<=0) and (req_wep2!=""){
                draw_set_color(c_gray);
                draw_text(xx+1140,yy+410,string_hash_to_newline(string(req_wep2)+" ("+string(have_wep2_num)+"-"+string(req_wep2_num)+")"));
            }
        }
        
    }
    
    draw_set_alpha(1);
    
    draw_set_color(c_gray);
    draw_set_halign(fa_left);
    draw_rectangle(xx+1006,yy+499,xx+1115,yy+518,1);
    draw_set_alpha(0.5);
    draw_rectangle(xx+1007,yy+500,xx+1114,yy+517,1);
    
    if (all_good=1){
        draw_set_alpha(1);
        draw_rectangle(xx+1465,yy+499,xx+1576,yy+518,1);
        draw_set_alpha(0.5);
        draw_rectangle(xx+1466,yy+500,xx+1575,yy+517,1);
    }
    if (all_good!=1){
        draw_set_alpha(0.25);
        draw_rectangle(xx+1465,yy+499,xx+1576,yy+518,1);
        draw_rectangle(xx+1466,yy+500,xx+1575,yy+517,1);
    }
    
    draw_set_alpha(1);
    draw_set_halign(fa_center);
    draw_text(xx+1061,yy+501,string_hash_to_newline("Cancel"));
    draw_text(xx+1061.5,yy+501.5,string_hash_to_newline("Cancel"));
    
    if (all_good=1){
        draw_text(xx+1521,yy+501,string_hash_to_newline("Promote!"));
        draw_text(xx+1521.5,yy+501.5,string_hash_to_newline("Promote!"));
    }
    if (all_good!=1){
        draw_set_alpha(0.25);
        draw_text(xx+1521,yy+501,string_hash_to_newline("Promote!"));
        draw_text(xx+1521.5,yy+501.5,string_hash_to_newline("Promote!"));
    }
    draw_set_alpha(1);
}

// ** Transfering **
if (zm=0) and (type=5.1) and (instance_exists(obj_controller)){
    draw_set_color(0);
    draw_rectangle(xx+1006,yy+143,xx+1577,yy+518,0);
    
    draw_set_font(fnt_40k_14b);
    draw_set_halign(fa_center);
    draw_set_color(c_gray);
    draw_text(xx+1292,yy+145,string_hash_to_newline("Transfering"));
    
    draw_set_font(fnt_40k_12);
    var comp="";
    if (company <=10 and company > 0) {
        comp=romanNumerals[company-1];
    }
    else if (company>10) then comp="HQ";
    draw_text(xx+1292,yy+170,string_hash_to_newline(string(comp)+" Company "+string(unit_role)));
    
    draw_set_halign(fa_left);
    draw_set_color(c_gray);
    draw_text(xx+1014,yy+210,string_hash_to_newline("Target Company:"));
    
    var check=" ";
    // HQ Company
    if (target_comp=0) or (target_comp>10) then check="x";
    draw_text(xx+1470,yy+210,string_hash_to_newline("HQ ["+string(check)+"]"));
    check=" ";
    
    if ((unit_role!=obj_ini.role[100,17]) or (obj_controller.command_set[1]!=0)) and (unit_role!="Lexicanum") and (unit_role!="Codiciery"){
        // I Company
        if (target_comp==1) then check="x";
        draw_text(xx+1030,yy+230,string_hash_to_newline(romanNumerals[0]+" ["+string(check)+"]"));
        check=" ";
        // II Company
        if (target_comp==2) then check="x";
        draw_text(xx+1140,yy+230,string_hash_to_newline(romanNumerals[1]+" ["+string(check)+"]"));
        check=" ";
        // III Company
        if (target_comp==3) then check="x";
        draw_text(xx+1250,yy+230,string_hash_to_newline(romanNumerals[2]+" ["+string(check)+"]"));
        check=" ";
        // IV Company
        if (target_comp==4) then check="x";
        draw_text(xx+1360,yy+230,string_hash_to_newline(romanNumerals[3]+" ["+string(check)+"]"));
        check=" ";
        // V Company
        if (target_comp==5) then check="x";
        draw_text(xx+1470,yy+230,string_hash_to_newline(romanNumerals[4]+" ["+string(check)+"]"));
        check=" ";
        // VI Company
        if (target_comp==6) then check="x";
        draw_text(xx+1030,yy+250,string_hash_to_newline(romanNumerals[5]+" ["+string(check)+"]"));
        check=" ";
        // VII Company
        if (target_comp==7) then check="x";
        draw_text(xx+1140,yy+250,string_hash_to_newline(romanNumerals[6]+" ["+string(check)+"]"));
        check=" ";
        // VIII Company
        if (target_comp==8) then check="x";
        draw_text(xx+1250,yy+250,string_hash_to_newline(romanNumerals[7]+" ["+string(check)+"]"));
        check=" ";
        // IX Company
        if (target_comp==9) then check="x";
        draw_text(xx+1360,yy+250,string_hash_to_newline(romanNumerals[8]+" ["+string(check)+"]"));
        check=" ";
        // X Company
        if (target_comp==10) then check="x";
        draw_text(xx+1470,yy+250,string_hash_to_newline(romanNumerals[9]+" ["+string(check)+"]"));
        check=" ";
    }
    
    draw_set_alpha(1);
    
    draw_set_color(c_gray);
    draw_set_halign(fa_left);
    draw_rectangle(xx+1006,yy+499,xx+1115,yy+518,1);
    draw_set_alpha(0.5);
    draw_rectangle(xx+1007,yy+500,xx+1114,yy+517,1);
    
    if (company!=target_comp) and (target_comp>=0){
        draw_set_alpha(1);
        draw_rectangle(xx+1465,yy+499,xx+1576,yy+518,1);
        draw_set_alpha(0.5);
        draw_rectangle(xx+1466,yy+500,xx+1575,yy+517,1);
    }
    if (company==target_comp) or (target_comp<0){
        draw_set_alpha(0.25);
        draw_rectangle(xx+1465,yy+499,xx+1576,yy+518,1);
        draw_rectangle(xx+1466,yy+500,xx+1575,yy+517,1);
    }
    
    draw_set_alpha(1);
    draw_set_halign(fa_center);
    draw_text(xx+1061,yy+501,string_hash_to_newline("Cancel"));
    draw_text(xx+1061.5,yy+501.5,string_hash_to_newline("Cancel"));
    
    if (company!=target_comp) and (target_comp>=0){
        draw_text(xx+1521,yy+501,string_hash_to_newline("Transfer!"));
        draw_text(xx+1521.5,yy+501.5,string_hash_to_newline("Transfer!"));
    }
    if (company==target_comp) or (target_comp<0){
        draw_set_alpha(0.25);
        draw_text(xx+1521,yy+501,string_hash_to_newline("Transfer!"));
        draw_text(xx+1521.5,yy+501.5,string_hash_to_newline("Transfer!"));
    }
    draw_set_alpha(1);
}

if (type == "duel"){
    
}
