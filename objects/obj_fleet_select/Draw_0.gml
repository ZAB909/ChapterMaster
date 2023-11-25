var __b__;
__b__ = action_if_number(obj_drop_select, 0, 0);
if __b__
{
__b__ = action_if_number(obj_bomb_select, 0, 0);
if __b__
{

if (obj_controller.diplomacy>0) then exit;


/*if (target!=0) and (!instance_exists(target)){
    instance_destroy();
    exit;
}*/

draw_set_color(38144);

draw_set_font(fnt_40k_14b);
draw_set_halign(fa_center);

var ppp;ppp="";
if (owner  = eFACTION.Player) then ppp=global.chapter_name;
if (owner = eFACTION.Imperium) then ppp="Imperial Navy";
if (owner = eFACTION.Mechanicus) then ppp="Mechanicus Fleet";
if (owner = eFACTION.Tau) then ppp="Tau Fleet";
// 

if (obj_controller.zoomed=0) then draw_text_transformed(x,y-32,string_hash_to_newline(string(ppp)),1,1,0);
if (obj_controller.zoomed=1) then draw_text_transformed(x,y-48,string_hash_to_newline(string(ppp)),1.4,1.4,0);
    
draw_circle(x,y,12,0);
draw_set_halign(fa_left);


// Order here


if (owner  = eFACTION.Player) and (instance_nearest(x,y,obj_p_fleet).action=""){
    var free,z;free=1;z=obj_fleet_select;
    if (mouse_x>=__view_get( e__VW.XView, 0 )+z.void_x) and (mouse_y>=__view_get( e__VW.YView, 0 )+z.void_y) 
    and (mouse_x<__view_get( e__VW.XView, 0 )+z.void_x+z.void_wid) and (mouse_y<__view_get( e__VW.YView, 0 )+z.void_y+z.void_hei) and (obj_controller.fleet_minimized=0) then free=0;
    
    if (mouse_x>=__view_get( e__VW.XView, 0 )+z.void_x) and (mouse_y>=__view_get( e__VW.YView, 0 )+z.void_y) 
    and (mouse_x<__view_get( e__VW.XView, 0 )+z.void_x+z.void_wid) and (mouse_y<__view_get( e__VW.YView, 0 )+137) and (obj_controller.fleet_minimized=1) then free=0;
    
    if (free=1){
        var sys, sys_dist, mine, connected;
        sys_dist=9999;connected=0;
        
        with(obj_star){if (p_type[1]="Craftworld") and (obj_controller.known[eFACTION.Eldar]=0) then instance_deactivate_object(id);}
        sys=instance_nearest(mouse_x,mouse_y,obj_star);
        sys_dist=point_distance(mouse_x,mouse_y,sys.x,sys.y);
        act_dist=point_distance(x,y,sys.x,sys.y);
        
        mine=instance_nearest(x,y,obj_star);
        if (mine.buddy=sys) then connected=1;
        if (sys.buddy=mine) then connected=1;
        
        var web1,web2,web;
        web1=0;web2=0;web=0;
        
        if (sys_dist<32){
            if (planet_feature_bool(mine.p_feature[1], P_features.Webway)==1) then web1=1;
            if (planet_feature_bool(mine.p_feature[2], P_features.Webway)==1) then web1=1;
            if (planet_feature_bool(mine.p_feature[3], P_features.Webway)==1) then web1=1;
            if (planet_feature_bool(mine.p_feature[4], P_features.Webway)==1) then web1=1;
            
           if (planet_feature_bool(sys.p_feature[1], P_features.Webway)==1) then web2=1;
            if (planet_feature_bool(sys.p_feature[2], P_features.Webway)==1) then web2=1;
            if (planet_feature_bool(sys.p_feature[3], P_features.Webway)==1) then web2=1;
           if (planet_feature_bool(sys.p_feature[4], P_features.Webway)==1) then web2=1;
            
            if (web1=1) and (web2=1) then web=1;
            if (mine.id=sys.id) then web=0;
        }
        
        
        if (sys_dist<32) and (sys.id!=mine.id){
            draw_set_color(c_white);
            draw_set_alpha(1);
            
            if (web!=0) then draw_set_color(c_orange);
            if (sys.storm>0) or (instance_nearest(x,y+24,obj_star).storm>0) then draw_set_color(c_red);
    
            
            draw_line_dashed(x,y,sys.x,sys.y,16,0.5);
        
            draw_set_font(fnt_40k_14b);
            var eta;eta=0;
            eta=floor(point_distance(mine.x,mine.y,sys.x,sys.y)/instance_nearest(x,y,obj_p_fleet).action_spd)+1;
            if (connected=0) then eta=eta*2;
            if (web!=0) then eta=1;
            if (sys.storm>0) or (instance_nearest(x,y+24,obj_star).storm>0) then eta="N/A";
            
            draw_set_font(fnt_40k_14b);
            if (obj_controller.zoomed=0) then draw_text_transformed(sys.x+16,sys.y,string_hash_to_newline("ETA "+string(eta)),1,1,0);
            if (obj_controller.zoomed=1) then draw_text_transformed(sys.x+24,sys.y,string_hash_to_newline("ETA "+string(eta)),1.4,1.4,0);
            
            if (connected=1){
                if (obj_controller.zoomed=0) then draw_text_transformed(sys.x+17,sys.y,string_hash_to_newline("ETA "+string(eta)),1,1,0);
                if (obj_controller.zoomed=1) then draw_text_transformed(sys.x+25,sys.y,string_hash_to_newline("ETA "+string(eta)),1.4,1.4,0);
            }
        }
        instance_activate_object(obj_star);
    }
}

/* */
}
}
/*  */
