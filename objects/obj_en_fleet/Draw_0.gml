

if (owner = eFACTION.Eldar) and (instance_exists(orbiting)) and (obj_controller.is_test_map=true){
    draw_set_color(c_red);draw_line_width(x,y,orbiting.x,orbiting.y,1);
}

if (x<0) or (x>room_width) or (y<0) or (y>room_height) then exit;
if (image_alpha=0) then exit;




if (image_index>9) then image_index=9;

var m_dist, within;m_dist=point_distance(x,y,mouse_x,mouse_y);within=0;
if (obj_controller.zoomed=0){
    if (m_dist<=16) and (!instance_exists(obj_ingame_menu)) then within=1;
}
if (obj_controller.zoomed=1){
    if (owner = eFACTION.Imperium) then draw_set_color(c_gray);
    if (owner = eFACTION.Mechanicus) then draw_set_color(16512);
    if (owner = eFACTION.Ecclesiarchy) then draw_set_color(c_white);
    if (owner = eFACTION.Eldar) then draw_set_color(33023);
    if (owner = eFACTION.Ork) then draw_set_color(38144);
    if (owner = eFACTION.Tau) then draw_set_color(117758);
    if (owner = eFACTION.Tyranids) then draw_set_color(7492269);
    if (owner = eFACTION.Chaos) then draw_set_color(c_purple);
    if (owner = eFACTION.Necrons) then draw_set_color(65408);
    
    if (owner = eFACTION.Imperium) and (navy=0) then draw_set_alpha(0.5);
    draw_circle(x,y,12,0);draw_set_alpha(1);
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
    if (obj_controller.zoomed=1) then draw_text_transformed(x+24,y,string_hash_to_newline("ETA "+string(action_eta)),2,2,0);// was 1.4
}


if (within=1) or (selected>0){
    draw_set_color(38144);
    draw_set_font(fnt_40k_14b);
    draw_set_halign(fa_center);
    
    var ppp;ppp="";
    if (owner  = eFACTION.Player) then ppp="Renegade Fleet";
    if (owner = eFACTION.Imperium){
        if (navy=0) then ppp="Defense Fleet";
        if (navy=1) then ppp="Imperial Navy";
    }
    if (navy=0){
        if (owner = eFACTION.Imperium) and ((trade_goods="colonize") or (trade_goods="colonizeL")) then ppp="Imperial Colonists";
        if (owner = eFACTION.Imperium) and (trade_goods!="colonize") and (trade_goods!="colonizeL") and (trade_goods!="") and (trade_goods!="merge") then ppp="Trade Fleet";
    }
    // if (navy=1) then ppp=string(trade_goods)+" ("+string(guardsmen_unloaded)+"/"+string(guardsmen_ratio)+")";
    // if (owner = eFACTION.Imperium) and ((trade_goods="colonize") or (trade_goods="colonizeL")) then ppp=string(trade_goods)+": "+string(guardsmen);
    if (owner = eFACTION.Mechanicus) then ppp="Mechanicus Fleet";
    if (owner  = eFACTION.Inquisition) then ppp="Inquisitor Ship";
    if (owner = eFACTION.Eldar) then ppp="Eldar Fleet";
    if (owner = eFACTION.Ork) then ppp="Ork Fleet";
    if (owner = eFACTION.Tau) then ppp="Tau Fleet";
    if (owner = eFACTION.Tyranids) then ppp="Hive Fleet";
    if (owner = eFACTION.Chaos) then ppp="Heretic Fleet";
    if (owner = eFACTION.Chaos) and ((trade_goods="BLOODBLOODBLOOD") or (trade_goods="BLOODBLOODBLOODBLOOD")){
        ppp=string(obj_controller.faction_leader[eFACTION.Chaos])+"'s Fleet";
        if (string_count("s's Fleet",ppp)>0) then ppp=string_replace(ppp,"s's Fleet","s' Fleet");
    }
    if (owner = eFACTION.Necrons) then ppp="Necron Fleet";
    // if (owner = eFACTION.Imperium) and (navy=1){ppp=string(capital_max_imp[1]+frigate_max_imp[1]+escort_max_imp[1]);}
    
    if (global.cheat_debug=true){
        ppp+="C"+string(capital_number)+"|F"+string(frigate_number)+"|E"+string(escort_number);
    }
    
    // ppp=string(capital_number)+"|"+string(frigate_number)+"|"+string(escort_number);
    // ppp+="|"+string(trade_goods);
    
    // 
    
    if (navy=0){
        if (obj_controller.zoomed=0) then draw_text_transformed(x,y-32,string_hash_to_newline(ppp),1,1,0);
        if (obj_controller.zoomed=1) then draw_text_transformed(x,y-48,string_hash_to_newline(ppp),2,2,0);// was 1.4
    }
    if (navy=1){
        if (obj_controller.zoomed=0) then draw_text_transformed(x,y+32,string_hash_to_newline(ppp),1,1,0);
        if (obj_controller.zoomed=1) then draw_text_transformed(x,y+48,string_hash_to_newline(ppp),2,2,0);// was 1.4
    }
    
    draw_circle(x,y,12,0);
    
    draw_set_halign(fa_left);
}

draw_self();

/*if (owner = eFACTION.Ork){
    draw_set_font(fnt_small);
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    draw_text(x,y+32,string(escort_number)+"/"+string(frigate_number)+"/"+string(capital_number));
}*/


if (instance_exists(target)){
    draw_set_color(c_red);draw_set_alpha(0.5);
    draw_line(x,y,target.x,target.y);draw_set_alpha(1);
}

/* */
/*  */
