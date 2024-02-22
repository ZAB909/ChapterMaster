

var i,xx,yy,x2,y2,cost,multiple;i=0;
xx=__view_get( e__VW.XView, 0 )+0;
yy=__view_get( e__VW.YView, 0 )+0;

x2=962;
y2=107;


if (mouse_x>=xx+1262) and (mouse_y>=yy+82) and (mouse_x<=xx+1417) and (mouse_y<yy+103) and (obj_controller.cooldown<=0){
    var onceh;onceh=0;obj_controller.cooldown=8000;
    if (target_comp>=1) and (onceh=0) then target_comp+=1;
    if (target_comp>obj_ini.companies) then target_comp=1;
    obj_controller.new_vehicles=target_comp;
}

var shop_area="";
if (mouse_y>=yy+76) and (mouse_y<yy+104) and (obj_controller.cooldown<=0){
    if (mouse_x>=xx+957) and (mouse_x<xx+1062) then shop_area="equipment";
    if (mouse_x>=xx+1068) and (mouse_x<xx+1136) then shop_area="equipment2";
    if (mouse_x>=xx+1167) and (mouse_x<xx+1255) then shop_area="vehicles";
     if (mouse_x>=xx+1447) and (mouse_x<xx+1545){
        if (obj_controller.in_forge){
            shop_area="production";
        }else {
            shop_area="warships";
        }
    }
    if (shop_area!=""){
        obj_controller.cooldown=8000;
        shop=shop_area
        instance_create(50,50,obj_shop);
    }
}

draw_rectangle(xx+957,yy+76,xx+1062,yy+104,0);
draw_rectangle(xx+1068,yy+76,xx+1150,yy+104,0);
draw_rectangle(xx+1167,yy+76,xx+1255,yy+104,0);
draw_rectangle(xx+1487,yy+76,xx+1545,yy+104,0);

draw_set_color(c_black);

draw_text_transformed(xx+960,yy+76,string_hash_to_newline("Equipment"),0.6,0.6,0);
draw_text_transformed(xx+1070,yy+76,string_hash_to_newline("Armour"),0.6,0.6,0);
draw_text_transformed(xx+1170,yy+76,string_hash_to_newline("Vehicles"),0.6,0.6,0);
draw_text_transformed(xx+1490,yy+76,string_hash_to_newline("Ships"),0.6,0.6,0);



if (obj_controller.cooldown<=0){
    repeat(39){
        i+=1;y2+=20;
        if (item[i]!="") && (nobuy[i]=0) && point_in_rectangle(mouse_x, mouse_y,xx+1520, yy+y2+2, xx+1580, yy+y2+18) && (!obj_controller.in_forge){
            cost=item_cost[i];
            if (keyboard_check(vk_shift)) and (shop!="warships") then cost=item_cost[i]*5;
            if (obj_controller.requisition>=cost) and (shop!="warships"){
                if (item[i]!="Rhino") and (item[i]!="Predator") and (item[i]!="Land Raider") and (item[i]!="Whirlwind") and (item[i]!="Land Speeder"){
                    if (keyboard_check(vk_shift)){scr_add_item(item[i],5);item_stocked[i]+=5;click2=1;}
                    if (!keyboard_check(vk_shift)){scr_add_item(item[i],1);item_stocked[i]+=1;click2=1;}
                }
                if (item[i]="Rhino") or (item[i]="Predator") or (item[i]="Land Raider") or (item[i]="Whirlwind") or (item[i]="Land Speeder"){
                    if (keyboard_check(vk_shift)){repeat(5){scr_add_vehicle(item[i],target_comp,"standard","standard","standard","standard","standard");}item_stocked[i]+=5;click2=1;}
                    if (!keyboard_check(vk_shift)){scr_add_vehicle(item[i],target_comp,"standard","standard","standard","standard","standard");item_stocked[i]+=1;click2=1;}
                }
                with(obj_ini){scr_vehicle_order(obj_shop.target_comp);}
                obj_controller.requisition-=cost;
            }

            if (obj_controller.requisition>=cost) and (shop="warships"){
                var v=0,ev=0;
                repeat(99){v+=1;if (ev=0) and (obj_controller.event[v]="") then ev=v;}
                obj_controller.event[ev]="new_"+string(item[i]);

                if (item[i]="Battle Barge") then obj_controller.event_duration[ev]=12;
                if (item[i]="Strike Cruiser") then obj_controller.event_duration[ev]=4;
                if (item[i]="Gladius") then obj_controller.event_duration[ev]=1;
                if (item[i]="Hunter") then obj_controller.event_duration[ev]=1;
                obj_controller.event_duration[ev]+=choose(0,0,1);
                eta=obj_controller.event_duration[ev];

                construction_started=120;obj_controller.requisition-=cost;
            }

            obj_controller.cooldown=8000;
        }
    }
}



/* */
/*  */
