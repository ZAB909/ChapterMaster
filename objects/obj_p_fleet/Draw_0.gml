
if (instance_exists(orbiting)) and (obj_controller.is_test_map=true){
    draw_set_color(c_red);draw_line_width(x,y,orbiting.x,orbiting.y,1);
}

var m_dist, within;m_dist=point_distance(x,y,mouse_x,mouse_y);within=0;
if (obj_controller.zoomed=0){
    if (m_dist<=16) and (!instance_exists(obj_ingame_menu)) then within=1;
}
if (obj_controller.zoomed=1){
    draw_set_color(c_blue);
    draw_circle(x,y,12,0);    
    
    if (m_dist<=16) and (!instance_exists(obj_ingame_menu)) then within=1;
}

// if (obj_controller.selected!=0) and (selected=1) then within=1;

if (obj_controller.selecting_planet>0){
    if (mouse_x>=__view_get( e__VW.XView, 0 )+529) and (mouse_y>=__view_get( e__VW.YView, 0 )+234) and (mouse_x<__view_get( e__VW.XView, 0 )+611) and (mouse_y<__view_get( e__VW.YView, 0 )+249){
        if (instance_exists(obj_star_select)){if (obj_star_select.button1!="") then within=0;}
    }
    if (mouse_x>=__view_get( e__VW.XView, 0 )+529) and (mouse_y>=__view_get( e__VW.YView, 0 )+234+16) and (mouse_x<__view_get( e__VW.XView, 0 )+611) and (mouse_y<__view_get( e__VW.YView, 0 )+249+16){
        if (instance_exists(obj_star_select)){if (obj_star_select.button2!="") then within=0;}
    }
    if (mouse_x>=__view_get( e__VW.XView, 0 )+529) and (mouse_y>=__view_get( e__VW.YView, 0 )+234+32) and (mouse_x<__view_get( e__VW.XView, 0 )+611) and (mouse_y<__view_get( e__VW.YView, 0 )+249+32){
        if (instance_exists(obj_star_select)){if (obj_star_select.button3!="") then within=0;}
    }
}



if (action!=""){
    draw_set_halign(fa_left);draw_set_alpha(1);
    draw_set_color(c_white);
    draw_line_width(x,y,action_x,action_y,1);
    // 
    draw_set_font(fnt_40k_14b);
    if (obj_controller.zoomed=0) then draw_text_transformed(x+12,y,string_hash_to_newline("ETA "+string(action_eta)),1,1,0);
    if (obj_controller.zoomed=1) then draw_text_transformed(x+24,y,string_hash_to_newline("ETA "+string(action_eta)),1.4,1.4,0);
}


if (within=1) or (selected>0){
    draw_set_color(38144);
    
    draw_set_font(fnt_40k_14b);
    draw_set_halign(fa_center);
    
    var ppp;
    if (owner  = eFACTION.Player) then ppp=global.chapter_name;
    
    if (capital_number=1) and (frigate_number=0) and (escort_number=0) then ppp=capital[1];
    if (capital_number=0) and (frigate_number=1) and (escort_number=0) then ppp=frigate[1];
    if (capital_number=0) and (frigate_number=0) and (escort_number=1) then ppp=escort[1];
    
    
    
    // ppp=acted;
    
    
    // 
    if (obj_controller.zoomed=0) then draw_text_transformed(x,y-32,string_hash_to_newline(ppp),1,1,0);
    if (obj_controller.zoomed=1) then draw_text_transformed(x,y-48,string_hash_to_newline(ppp),2,2,0);// was 1.4
    
    draw_circle(x,y,12,0);
    
    draw_set_halign(fa_left);
}

draw_self();



