
var xx,yy,x2,y2;
var romanNumerals=scr_roman_numerals();
xx=__view_get( e__VW.XView, 0 )+0;
yy=__view_get( e__VW.YView, 0 )+0;

x2=962;y2=107;

draw_set_font(fnt_40k_14);
draw_set_color(c_gray);
draw_set_halign(fa_left);


var te="";
// TODO refactor target_comp and how companies are counted in general
if (target_comp<=10) then te=romanNumerals[target_comp-1];
if (mouse_x>=xx+1262) and (mouse_y>=yy+82) and (mouse_x<=xx+1417) and (mouse_y<yy+103) then draw_set_alpha(0.8);
draw_text(xx+1262,yy+82,string_hash_to_newline("Target: "+string(te)+" Company"));


draw_set_alpha(1);
draw_set_font(fnt_40k_14);
draw_rectangle(xx+962,yy+107,xx+1579,yy+127,0);
draw_set_color(0);
draw_text(xx+962,yy+109,string_hash_to_newline("Name"));
draw_text(xx+1150,yy+109,string_hash_to_newline("Stocked"));
var buy_type = obj_controller.in_forge ?  "Forge Requirement" : "Requisition";
draw_text(xx+962.5,yy+109.5,string_hash_to_newline("Name"));
draw_text(xx+1150.5,yy+109.5,string_hash_to_newline("Stocked"));
draw_text(xx+1330.5,yy+109.5,string_hash_to_newline(buy_type));
draw_set_color(c_gray);


if (shop="warships"){
    if (construction_started>0){
        var apa=construction_started/30;draw_set_alpha(apa);
        draw_set_color(c_yellow);
        draw_set_halign(fa_center);
        draw_text_transformed(__view_get( e__VW.XView, 0 )+420,yy+370,string_hash_to_newline("CONSTRUCTION STARTED!#ETA: "+string(eta)+" months"),1.5,1.5,0);
        draw_set_halign(fa_left);
        draw_set_color(38144);
        draw_set_alpha(1);
    }
}

for(var i=1; i<=39; i++){
    y2+=20;
    if (item[i]!=""){
        if (!obj_controller.in_forge && nobuy[i]=0) ||  (obj_controller.in_forge && forge_cost[i]>0){
            draw_set_color(c_gray);
            if (hover=i) then draw_set_color(c_white);
            if (!keyboard_check(vk_shift)) or (shop="warships") then draw_text(xx+x2+x_mod[i],yy+y2,string_hash_to_newline(item[i]));// Name
            if (keyboard_check(vk_shift)) and (shop!="warships") then draw_text(xx+x2+x_mod[i],yy+y2,string_hash_to_newline(string(item[i])+" x5"));// Name
            
            if (item_stocked[i]=0) and ((mc_stocked[i]=0) or (shop!="equipment")) then draw_set_alpha(0.5);
            if (mc_stocked[i]=0) then draw_text(xx+1150,yy+y2,string_hash_to_newline(item_stocked[i]));// Stocked
            if (mc_stocked[i]>0) then draw_text(xx+1150,yy+y2,string_hash_to_newline(string(item_stocked[i])+"   mc: "+string(mc_stocked[i])));
            draw_set_alpha(1);

            if (obj_controller.in_forge){
                draw_sprite_ext(
                            spr_forge_points_icon,0, 
                            xx+1330,
                            yy+y2+3, 
                            0.3, 
                            0.3, 
                            0,
                            c_white,
                            1); 
            } else{
                draw_sprite_ext(spr_requisition,0,xx+1330,yy+y2+4,1,0.65,0,c_white,1);
            }            
			draw_set_color(16291875)
            if (obj_controller.in_forge){
				draw_set_color(c_red)
			}

            var cost = obj_controller.in_forge ? forge_cost[i] : item_cost[i]
            
            if (!keyboard_check(vk_shift)) and (obj_controller.requisition<item_cost[i]) then draw_set_color(255);
            if (keyboard_check(vk_shift)) and (obj_controller.requisition<(item_cost[i]*5)) then draw_set_color(255);
            
            if (keyboard_check(vk_shift)) then cost*=5;

            draw_text(xx+1347,yy+y2,cost);// Requisition
            if (!obj_controller.in_forge ){
                if (obj_controller.requisition< cost) then draw_set_alpha(0.25);
            }

            draw_sprite(spr_build_tiny2,0,xx+1530,yy+y2+2);

            draw_set_alpha(1);
           if (obj_controller.in_forge){
            if (point_in_rectangle(mouse_x, mouse_y, xx+1520, yy+y2+2, xx+1580, yy+y2+18)&& mouse_check_button_pressed(mb_left) ){
                if (array_length(obj_controller.forge_queue)<20){
                    var new_queue_item = {
                        name:item[i],
                        count:1,
                        forge_points:forge_cost[i],
                        ordered:obj_controller.turn,
                    }
                    if (keyboard_check(vk_shift)){
                        new_queue_item.count = 5;
                        new_queue_item.forge_points = 5 * forge_cost[i];
                    }
                    array_push(obj_controller.forge_queue, new_queue_item);
                }               
            }
           }
        }
        if (!obj_controller.in_forge && nobuy[i]=1) ||  (obj_controller.in_forge && forge_cost[i]=0){
            draw_set_alpha(1);
            draw_set_color(881503);
            draw_text(xx+x2+x_mod[i],yy+y2,string_hash_to_newline(item[i]));// Name
            if (item_stocked[i]=0) then draw_set_alpha(0.5);
            draw_text(xx+1150,yy+y2,string_hash_to_newline(item_stocked[i]));// Stocked
            draw_set_alpha(1);
        }
    }
}

if (tooltip_show!=0){
    draw_set_color(0);
    draw_set_alpha(1);
    draw_set_font(fnt_40k_12);
    
    tooltip_width=string_width_ext(string_hash_to_newline(tooltip),-1,400)+4;
    tooltip_height=string_height_ext(string_hash_to_newline(tooltip),-1,400)+4;
    draw_rectangle(tooltip_x-2,tooltip_y,tooltip_x+tooltip_width,tooltip_y+tooltip_height,0);
    draw_set_color(c_gray);
    draw_rectangle(tooltip_x-2,tooltip_y,tooltip_x+tooltip_width,tooltip_y+tooltip_height,1);
    draw_text_ext(tooltip_x+2,tooltip_y+2,string_hash_to_newline(tooltip),-1,400);
}
