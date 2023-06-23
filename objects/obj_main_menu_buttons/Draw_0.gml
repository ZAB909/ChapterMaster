


if (room_get_name(room)="Creation"){
    var yy,i;yy=y;i=1;
    if (glowing[i]=1) and (hover[i]=1){glow[i]+=1;if (glow[i]>=40) then glowing[i]=-1;}
    if (glowing[i]=-1) and (hover[i]=1){glow[i]-=1;if (glow[i]<=0) then glowing[i]=1;}
    draw_set_alpha((glow[i]/80)+0.2);
    draw_sprite(spr_mm_glow,4,x,yy);
    if (hover[i]=0) and (glow[i]>0) then glow[i]-=4;
    draw_set_alpha((50-obj_creation.fade_in)/50);
    draw_sprite(spr_mm_butts,4,x,yy);
    draw_set_alpha(1);
}


if (instance_exists(obj_main_menu)) and ((instance_exists(obj_saveload))) and (!instance_exists(obj_ingame_menu)){
    var yy,i;yy=830;i=6;
    if (glowing[i]=1) and (hover[i]=1){glow[i]+=1;if (glow[i]>=40) then glowing[i]=-1;}
    if (glowing[i]=-1) and (hover[i]=1){glow[i]-=1;if (glow[i]<=0) then glowing[i]=1;}
    draw_set_alpha((glow[i]/80)+0.2);
    draw_sprite(spr_mm_glow,4,687,yy);
    if (hover[i]=0) and (glow[i]>0) then glow[i]-=4;
    draw_set_alpha(1);
    draw_sprite(spr_mm_butts,4,687,yy);
}
if (instance_exists(obj_main_menu)) and (!instance_exists(obj_ingame_menu)){
    if (obj_main_menu.menu=3){
        var yy,i;yy=830;i=6;
        if (glowing[i]=1) and (hover[i]=1){glow[i]+=1;if (glow[i]>=40) then glowing[i]=-1;}
        if (glowing[i]=-1) and (hover[i]=1){glow[i]-=1;if (glow[i]<=0) then glowing[i]=1;}
        draw_set_alpha((glow[i]/80)+0.2);
        draw_sprite(spr_mm_glow,4,687,yy);
        if (hover[i]=0) and (glow[i]>0) then glow[i]-=4;
        draw_set_alpha(1);
        draw_sprite(spr_mm_butts,4,687,yy);
    }
}


if (instance_exists(obj_main_menu)) and (!instance_exists(obj_saveload)) and (!instance_exists(obj_credits)){
    if (obj_main_menu.tim4>0){
        draw_set_alpha((oth/40)/4);
        if (point_distance(mouse_x,mouse_y,24,room_height-24)<=24) and (!instance_exists(obj_ingame_menu)) and (oth>=40){
            if (instance_exists(obj_cursor)){
                if (obj_cursor.image_alpha>=1){
                    draw_set_alpha(1);
                    if (mouse_left=1) and (cooldown<=0){
                        instance_create(0,0,obj_ingame_menu);
                    }
                }
            }
        }
        draw_sprite_stretched(spr_settings_button,0,0,room_height-48,48,48);
        draw_set_alpha(1);
    }


    if (obj_main_menu.tim4>0) and (obj_main_menu.menu!=3){
        var yy,i;yy=784;i=0;
        repeat(4){i+=1;
            if ((obj_main_menu.tim4/50)>=1){
                if (glowing[i]=1) and (hover[i]=1){glow[i]+=1;if (glow[i]>=40) then glowing[i]=-1;}
                if (glowing[i]=-1) and (hover[i]=1){glow[i]-=1;if (glow[i]<=0) then glowing[i]=1;}
                draw_set_alpha((glow[i]/80)+0.2);
                if (i=1) then draw_sprite(spr_mm_glow,0,126,yy);
                if (i=2) then draw_sprite(spr_mm_glow,1,550,yy);
                if (i=3) then draw_sprite(spr_mm_glow,2,968,yy);
                if (i=4) then draw_sprite(spr_mm_glow,3,1280,700);
            }
            if (hover[i]=0) and (glow[i]>0) then glow[i]-=4;
        }
    
        draw_set_alpha(obj_main_menu.tim4/50);
        draw_sprite(spr_mm_butts,0,1073,453);
        draw_sprite(spr_mm_butts,1,1073,564);
        draw_sprite(spr_mm_butts,2,1072,685);
        draw_sprite(spr_mm_butts,3,1073,792);
        draw_set_alpha(1);
    }
    
    
    if (obj_main_menu.tim4>0) and (obj_main_menu.menu!=3) then with(obj_main_menu){
        draw_set_font(fnt_menu);draw_set_halign(fa_center);
        
        var wfd,xx,yy,wad;wfd="";// xx=1138;yy=532;wad=430;
        xx=room_width/2;yy=850;wad=800;
        
        if (word_from_duke!="blank") and (word_from_duke!="") then wfd=word_from_duke;
        if (word_from_duke2!="blank") and (word_from_duke2!="") then wfd=word_from_duke2;
        
        if (wfd!="blank") and (wfd!="") and (obj_main_menu.tim4<400){
            if (global.version>=version){
                draw_set_alpha((tim4-20)/50);
                draw_set_color(c_yellow);
                draw_text_ext_transformed(xx,yy,string_hash_to_newline("Server: "+string(wfd)),-1,wad,1,1,0);
                draw_text_ext_transformed(xx+0.5,yy+0.5,string_hash_to_newline("Server: "+string(wfd)),-1,wad,1,1,0);
                
                var da;da=0;
                if (mess_alpha<=60) then da=mess_alpha/60;
                if (mess_alpha>60) then da=1+(((mess_alpha-60)*-1)/60);
                draw_set_alpha(min(da,((obj_main_menu.tim4-20)/50)));
                
                draw_set_color(c_red);
                draw_text_ext_transformed(xx,yy,string_hash_to_newline("Server: "+string(wfd)),-1,wad,1,1,0);
                draw_text_ext_transformed(xx+0.5,yy+0.5,string_hash_to_newline("Server: "+string(wfd)),-1,wad,1,1,0);
                draw_set_alpha(1);
            }
            if (global.version<version){
                draw_set_alpha(min(((tim4-20)/50),(obj_main_menu.tim4/50)));
                /*draw_set_color(c_white);
                draw_text_ext_transformed(room_width/2,724,"Server: Chapter Master is out of date.  Visit 1d4chan for the newest client.",-1,279,1,1,0);
                draw_text_ext_transformed((room_width/2)+0.5,724+0.5,"Server: Chapter Master is out of date.  Visit 1d4chan for the newest client.",-1,279,1,1,0);
                
                var da;da=0;
                if (mess_alpha<=60) then da=mess_alpha/60;
                if (mess_alpha>60) then da=1+(((mess_alpha-60)*-1)/60);
                draw_set_alpha(da);*/
                
                draw_set_color(c_red);
                draw_text_ext_transformed(xx,yy,string_hash_to_newline("Server: Chapter Master is out of date.  Visit 1d4chan for v0."+string(obj_main_menu.version*1000)),-1,wad,1,1,0);
                draw_text_ext_transformed(xx+0.5,yy+0.5,string_hash_to_newline("Server: Chapter Master is out of date.  Visit 1d4chan for v0."+string(obj_main_menu.version*1000)),-1,wad,1,1,0);
                draw_set_alpha(1);
            }
        }
    }

}


if (fade>0){
    draw_set_color(0);
    draw_set_alpha(fade/40);
    draw_rectangle(0,0,room_width,room_height,0);
}

draw_set_alpha(1);

/* */
/*  */
