
var i,xx,yy,x2,y2;i=0;
xx=__view_get( e__VW.XView, 0 )+0;
yy=__view_get( e__VW.YView, 0 )+0;

x2=962;y2=107;

draw_set_font(fnt_40k_14);
draw_set_color(c_gray);
draw_set_halign(fa_left);


var te;te="";if (target_comp=1) then te="1st";if (target_comp=2) then te="2nd";
if (target_comp=3) then te="3rd";if (target_comp>3) then te=string(target_comp)+"th";
if (mouse_x>=xx+1262) and (mouse_y>=yy+82) and (mouse_x<=xx+1417) and (mouse_y<yy+103) then draw_set_alpha(0.8);
draw_text(xx+1262,yy+82,string_hash_to_newline("Target: "+string(te)+" Company"));


draw_set_alpha(1);
draw_set_font(fnt_40k_14);
draw_rectangle(xx+962,yy+107,xx+1579,yy+127,0);
draw_set_color(0);
draw_text(xx+962,yy+109,string_hash_to_newline("Name"));
draw_text(xx+1150,yy+109,string_hash_to_newline("Stocked"));
draw_text(xx+1330,yy+109,string_hash_to_newline("Requisition"));
draw_text(xx+962.5,yy+109.5,string_hash_to_newline("Name"));
draw_text(xx+1150.5,yy+109.5,string_hash_to_newline("Stocked"));
draw_text(xx+1330.5,yy+109.5,string_hash_to_newline("Requisition"));
draw_set_color(c_gray);


if (shop="warships"){
    if (construction_started>0){
        var apa;apa=construction_started/30;draw_set_alpha(apa);
        draw_set_color(c_yellow);draw_set_halign(fa_center);
        draw_text_transformed(__view_get( e__VW.XView, 0 )+420,yy+370,string_hash_to_newline("CONSTRUCTION STARTED!#ETA: "+string(eta)+" months"),1.5,1.5,0);
        draw_set_halign(fa_left);draw_set_color(38144);
        draw_set_alpha(1);
    }
}

/*if (shop="vehicles"){
    var lol;
    lol=" ";if (target_comp=1) then lol="x";draw_text(xx+224,yy+377,"1st ["+string(lol)+"]");
    lol=" ";if (target_comp=2) then lol="x";draw_text(xx+301,yy+377,"2nd ["+string(lol)+"]");
    lol=" ";if (target_comp=3) then lol="x";draw_text(xx+378,yy+377,"3rd ["+string(lol)+"]");
    lol=" ";if (target_comp=4) then lol="x";draw_text(xx+455,yy+377,"4th ["+string(lol)+"]");
    lol=" ";if (target_comp=5) then lol="x";draw_text(xx+532,yy+377,"5th ["+string(lol)+"]");
    
    lol=" ";if (target_comp=6) then lol="x";draw_text(xx+224,yy+389,"6st ["+string(lol)+"]");
    lol=" ";if (target_comp=7) then lol="x";draw_text(xx+301,yy+389,"7nd ["+string(lol)+"]");
    lol=" ";if (target_comp=8) then lol="x";draw_text(xx+378,yy+389,"8rd ["+string(lol)+"]");
    lol=" ";if (target_comp=9) then lol="x";draw_text(xx+455,yy+389,"9th ["+string(lol)+"]");
    lol=" ";if (target_comp=10) then lol="x";draw_text(xx+532,yy+389,"10th ["+string(lol)+"]");
}*/

repeat(39){
    i+=1;y2+=20;
    if (item[i]!="") and (nobuy[i]=0){
        draw_set_color(c_gray);if (hover=i) then draw_set_color(c_white);
        if (!keyboard_check(vk_shift)) or (shop="warships") then draw_text(xx+x2+x_mod[i],yy+y2,string_hash_to_newline(item[i]));// Name
        if (keyboard_check(vk_shift)) and (shop!="warships") then draw_text(xx+x2+x_mod[i],yy+y2,string_hash_to_newline(string(item[i])+" x5"));// Name
        
        if (item_stocked[i]=0) and ((mc_stocked[i]=0) or (shop!="equipment")) then draw_set_alpha(0.5);
        if (mc_stocked[i]=0) then draw_text(xx+1150,yy+y2,string_hash_to_newline(item_stocked[i]));// Stocked
        if (mc_stocked[i]>0) then draw_text(xx+1150,yy+y2,string_hash_to_newline(string(item_stocked[i])+"   mc: "+string(mc_stocked[i])));
        draw_set_alpha(1);
        
        draw_sprite_ext(spr_requisition,0,xx+1330,yy+y2+4,1,0.65,0,c_white,1);
        draw_set_color(16291875);
        
        if (!keyboard_check(vk_shift)) and (obj_controller.requisition<item_cost[i]) then draw_set_color(255);
        if (keyboard_check(vk_shift)) and (obj_controller.requisition<(item_cost[i]*5)) then draw_set_color(255);
        if (!keyboard_check(vk_shift)) then draw_text(xx+1347,yy+y2,string_hash_to_newline(item_cost[i]));// Requisition
        if (keyboard_check(vk_shift)) then draw_text(xx+1347,yy+y2,string_hash_to_newline(item_cost[i]*5));// Requisition

        if (!keyboard_check(vk_shift)) and (obj_controller.requisition<item_cost[i]) then draw_set_alpha(0.25);
        if (keyboard_check(vk_shift)) and (obj_controller.requisition<(item_cost[i]*5)) then draw_set_alpha(0.25);
        draw_sprite(spr_build_tiny2,0,xx+1530,yy+y2+2);draw_set_alpha(1);
    }
    if (item[i]!="") and (nobuy[i]=1){
        draw_set_alpha(1);draw_set_color(881503);
        draw_text(xx+x2+x_mod[i],yy+y2,string_hash_to_newline(item[i]));// Name
        if (item_stocked[i]=0) then draw_set_alpha(0.5);
        draw_text(xx+1150,yy+y2,string_hash_to_newline(item_stocked[i]));// Stocked
        draw_set_alpha(1);
    }  
}


if (tooltip_show!=0){
    draw_set_color(0);draw_set_alpha(1);draw_set_font(fnt_40k_12);
    
    var tlp;tlp="";
    if (tooltip_weapon=1){
        // tlp=string(tooltip)+"#  ATT:"+string(tooltip_stat1)+"|ARP:"+string(tooltip_stat2)+" ";
        tlp=string(tooltip)+"#  DAM:"+string(tooltip_stat1)+"  ";
        if (tooltip_stat4>0) then tlp+=" Ammo:"+string(tooltip_stat4);
        tlp+="  "+string(tooltip_other);
    }
    if (tooltip_weapon=2){
        tlp=string(tooltip);
        if (string_length(tooltip_other)>0) then tlp+="#  "+string(tooltip_other)
    }
    if (tooltip_weapon=3){
        tlp=string(tooltip)+"#  Armor:"+string(tooltip_stat1);
        tlp+="  "+string(tooltip_other);
    }
    
    tooltip_width=string_width_ext(string_hash_to_newline(tlp),-1,400)+4;tooltip_height=string_height_ext(string_hash_to_newline(tlp),-1,400)+4;
    draw_rectangle(tooltip_x-2,tooltip_y,tooltip_x+tooltip_width,tooltip_y+tooltip_height,0);
    draw_set_color(c_gray);
    draw_rectangle(tooltip_x-2,tooltip_y,tooltip_x+tooltip_width,tooltip_y+tooltip_height,1);
    draw_text_ext(tooltip_x+2,tooltip_y+2,string_hash_to_newline(tlp),-1,400);
}

/* */
/*  */
