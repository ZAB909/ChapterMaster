var x2=__view_get( e__VW.XView, 0 )+x1;
var y2=__view_get( e__VW.YView, 0 )+y1;
var wid,hei,cus;
slate_panel.inside_method = function(){
    draw_set_color(c_gray);
    var x2,y2,wid,hei,cus;
    x2=__view_get( e__VW.XView, 0 )+x1;
    y2=__view_get( e__VW.YView, 0 )+y1;
    cus=false;

    if (header=3){
        wid=177;
        hei=200;
    }
    if (header=2){
        wid=175;
        hei=200;
    }
    if (header=1){wid=122+16;hei=240;}

    draw_set_halign(fa_center);

    if (header=3){
        draw_sprite_stretched(spr_master_title,0,x2,y2-2,wid+2,4);
        if (mouse_x>=x2) and (mouse_y>=y2) and (mouse_x<x2+wid) and (mouse_y<y2+hei){
            draw_set_alpha(0.25);
            draw_set_color(c_gray);
            draw_rectangle(x2,y2,x2+wid,y2+hei,0);
            draw_set_alpha(1);
        }
        
        var icon_sprite,icc;icon_sprite=spr_icon;icc=obj_ini.icon;
        if (icc>20){
            icon_sprite=spr_icon_chapters;
            icc-=19;
        }
        
        if (string_pos("custom",obj_ini.icon_name)>0) then cus=true;
        if (cus=false) and (icc<=20) then scr_image("creation",icc,x2+(wid/2)-50,y2-10,141*0.7,141*0.7);
        if (cus=false) and (icc>20) then draw_sprite_ext(icon_sprite,icc,x2+(wid/2)-50,y2-10,0.7,0.7,0,c_white,1);
        if (cus=true){
            var cusl=string_replace(obj_ini.icon_name,"custom","");
            cusl=real(cusl);
            if (obj_cuicons.spr_custom[cusl]>0) and (sprite_exists(obj_cuicons.spr_custom_icon[cusl])){
                draw_sprite_ext(obj_cuicons.spr_custom_icon[cusl],0,x2+(wid/2)-50,y2-10,0.7,0.7,0,c_white,1);
            }
        }
        
        if (line[1]!=""){
            draw_set_font(fnt_cul_14);
            draw_text(x2+(wid/2),y2+79,string_hash_to_newline("CHAPTER MASTER"));
            if (italic[1]=1) then draw_set_font(fnt_40k_12i);
            draw_text(x2+(wid/2),y2+99,string_hash_to_newline(line[1]));
            draw_set_font(fnt_40k_12);
        }
    }

    else if (header=2){
        draw_sprite_stretched(spr_company_title,company,x2+40,y2-2,wid-80,4);
        if (mouse_x>=x2) and (mouse_y>=y2) and (mouse_x<x2+wid) and (mouse_y<y2+hei){
            draw_set_alpha(0.25);
            draw_set_color(c_gray);
            draw_rectangle(x2,y2,x2+wid,y2+hei,0);
            draw_set_alpha(1);
        }
        if (title=="ARMOURY"){
            draw_sprite_ext(spr_tech_area_pad, 0, x2+(wid/2)-((0.3*180)/2),y2-30,0.3,0.3,0,c_white,1)
        } else if (title=="APOTHECARIUM"){
            draw_sprite_ext(spr_apoth_area_pad, 0, x2+(wid/2)-((0.3*180)/2),y2-30,0.3,0.3,0,c_white,1)
        } else if (title=="RECLUSIUM"){
            draw_sprite_ext(spr_chap_area_pad, 0, x2+(wid/2)-((0.3*180)/2),y2-30,0.3,0.3,0,c_white,1)
        } else if (title=="LIBRARIUM"){
            draw_sprite_ext(spr_lib_area_pad, 0, x2+(wid/2)-((0.3*180)/2),y2-30,0.3,0.3,0,c_white,1)
        }else {      
            
            var icon_sprite,icc;icon_sprite=spr_icon;icc=obj_ini.icon;
            if (icc>20){icon_sprite=spr_icon_chapters;icc-=19;}
            
            if (string_pos("custom",obj_ini.icon_name)>0) then cus=true;
            if (cus=false) and (icc<=20) then scr_image("creation",icc,x2+(wid/2)-16,y2-16,141*0.23,141*0.23);
            if (cus=false) and (icc>20) then draw_sprite_ext(icon_sprite,icc,x2+(wid/2)-16,y2-16,0.23,0.23,0,c_white,1);
            if (cus=true){
                var cusl;cusl=string_replace(obj_ini.icon_name,"custom","");cusl=real(cusl);
                if (obj_cuicons.spr_custom[cusl]>0) and (sprite_exists(obj_cuicons.spr_custom_icon[cusl])){
                    draw_sprite_ext(obj_cuicons.spr_custom_icon[cusl],0,x2+(wid/2)-16,y2-16,0.23,0.23,0,c_white,1);
                }
            }
        }
        
        // draw_sprite_ext(icon_sprite,icc,x2+(wid/2)-16,y2-16,0.23,0.23,0,c_white,1);
        
        draw_set_font(fnt_cul_14);
        draw_text(x2+(wid/2),y2+20,string_hash_to_newline(title));
        draw_set_font(fnt_40k_12);
        if (line[1]!=""){
            if (italic[1]=1) then draw_set_font(fnt_40k_12i);
            draw_text(x2+(wid/2),y2+43,string_hash_to_newline(line[1]));
            draw_set_font(fnt_40k_12);
        }
        var l=1;
        repeat(10){l+=1;
            if (line[l]!="") then draw_text(x2+(wid/2),y2+43+((l-1)*20),string_hash_to_newline(line[l]));
        }
    }

    else if (header=1){
        draw_sprite_stretched(spr_master_title,0,x2,y2-2,wid+2,4);
        if (mouse_x>=x2) and (mouse_y>=y2) and (mouse_x<x2+wid) and (mouse_y<y2+hei){
            draw_set_alpha(0.25);
            draw_set_color(c_gray);
            draw_rectangle(x2,y2,x2+wid,y2+hei,0);
            draw_set_alpha(1);
        }
        draw_set_font(fnt_cul_14);
        draw_text(x2+(wid/2),y2+4,string_hash_to_newline(title));
        draw_set_font(fnt_40k_12);
        if (line[1]!=""){
            if (italic[1]=1) then draw_set_font(fnt_40k_12i);
            draw_text(x2+(wid/2),y2+27,string_hash_to_newline(line[1]));
            draw_set_font(fnt_40k_12);
        }
        var l;l=1;
        draw_set_color(c_gray);
        repeat(23){l+=1;
            if (line[l]!="") then draw_text(x2+(wid/2),y2+27+((l-1)*16),string_hash_to_newline(line[l]));
        }
    }

}
if (header=3){
    wid=177;
    hei=200;
} else if (header=2){
    wid=175;
    hei=200;
}else if (header=1){wid=150;hei=240;}

var x_scale = (wid/850)
var y_scale = (hei/860)
slate_panel.draw(x2, y2, x_scale,y_scale);
// draw_text(x2+(wid/2),y2-60,string(manage)+") "+string(line[1])+"#"+string(line[2])+"#"+string(line[3]));



