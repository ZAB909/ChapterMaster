
    draw_set_color(38144);draw_set_alpha(0.5);
    if (left_down!=0) then draw_rectangle(sel_x1,sel_y1,mouse_x,mouse_y,1);
    draw_set_alpha(1);
    
    draw_set_font(fnt_menu);
    draw_set_halign(fa_center);
    draw_set_color(0);
    
    var xx, yy;
    xx=940;yy=0;

    if (start=0){
        if (obj_controller.zoomed=0){
            draw_set_alpha(0.75);draw_set_color(38144);
            draw_rectangle(__view_get( e__VW.XView, 0 )+192,__view_get( e__VW.YView, 0 )+40,__view_get( e__VW.XView, 0 )+448,__view_get( e__VW.YView, 0 )+72,0);
            draw_set_alpha(1);draw_set_color(0);
            draw_rectangle(__view_get( e__VW.XView, 0 )+192,__view_get( e__VW.YView, 0 )+40,__view_get( e__VW.XView, 0 )+448,__view_get( e__VW.YView, 0 )+72,1);
            draw_text(__view_get( e__VW.XView, 0 )+320,__view_get( e__VW.YView, 0 )+48,string_hash_to_newline("Press [Enter] to Begin"));
        }
        if (obj_controller.zoomed=1){
            draw_set_alpha(0.75);draw_set_color(38144);
            draw_rectangle(192*2,40*2,448*2,72*2,0);
            draw_set_alpha(1);draw_set_color(0);
            draw_rectangle(192*2,40*2,448*2,72*2,1);
            draw_text_transformed(320*2,48*2,string_hash_to_newline("Press [Enter] to Begin"),2,2,0);
        }
        
    }
    
    if (room_speed!=90){
        if (start=5) and (obj_controller.zoomed=0) then draw_sprite(spr_fast_forward,0,__view_get( e__VW.XView, 0 )+12,__view_get( e__VW.YView, 0 )+436);
        if (start=5) and (obj_controller.zoomed=1) then draw_sprite_ext(spr_fast_forward,0,24,872,2,2,0,c_white,1);
    }

    draw_set_halign(fa_left);
    
    if (obj_controller.zoomed=0){
        draw_set_alpha(0.75);draw_set_color(38144);
        draw_rectangle(__view_get( e__VW.XView, 0 )+0,__view_get( e__VW.YView, 0 )+0,__view_get( e__VW.XView, 0 )+168,__view_get( e__VW.YView, 0 )+52,0);
        draw_set_alpha(1);draw_set_color(0);
        draw_rectangle(__view_get( e__VW.XView, 0 )+0,__view_get( e__VW.YView, 0 )+0,__view_get( e__VW.XView, 0 )+168,__view_get( e__VW.YView, 0 )+52,1);
    }

    if (obj_controller.zoomed=1){
        draw_set_alpha(0.75);draw_set_color(38144);
        draw_rectangle(0,1,336,104,0);
        draw_set_alpha(1);draw_set_color(0);
        draw_rectangle(0,1,336,104,1);
    }
    
    if (capital>0) and (obj_controller.zoomed=0) then draw_text(__view_get( e__VW.XView, 0 )+2,__view_get( e__VW.YView, 0 )+2,string_hash_to_newline("Battleships: "+string(capital)));
    if (frigate>0) and (obj_controller.zoomed=0) then draw_text(__view_get( e__VW.XView, 0 )+2,__view_get( e__VW.YView, 0 )+18,string_hash_to_newline("Cruisers: "+string(frigate)));
    if (escort>0) and (obj_controller.zoomed=0) then draw_text(__view_get( e__VW.XView, 0 )+2,__view_get( e__VW.YView, 0 )+34,string_hash_to_newline("Escorts: "+string(escort)));
    
    if (obj_controller.zoomed=1){
        if (capital>0) then draw_text_transformed(4,4,string_hash_to_newline("Battleships: "+string(capital)),2,2,0);
        if (frigate>0) then draw_text_transformed(4,36,string_hash_to_newline("Cruisers: "+string(frigate)),2,2,0);
        if (escort>0) then draw_text_transformed(4,68,string_hash_to_newline("Escorts: "+string(escort)),2,2,0);
    }

    
    /*
    if (obj_controller.zoomed=0){
        draw_set_alpha(0.75);draw_set_color(38144);
        draw_rectangle(view_xview[0]+470,view_yview[0]+yy,view_xview[0]+168+470,view_yview[0]+52+yy,0);
        draw_set_alpha(1);draw_set_color(0);
        draw_rectangle(view_xview[0]+470,view_yview[0]+yy,view_xview[0]+168+470,view_yview[0]+52+yy,1);
    }
    if (obj_controller.zoomed=1){
        draw_set_alpha(0.75);draw_set_color(38144);
        draw_rectangle(xx,yy+1,xx+336,yy+104,0);
        draw_set_alpha(1);draw_set_color(0);
        draw_rectangle(xx,yy+1,xx+336,yy+104,1);
    }
    

    if (en_capital>0) and (obj_controller.zoomed=0) then draw_text(view_xview[0]+2+470,view_yview[0]+2+yy,"Battleships: "+string(en_capital));
    if (en_frigate>0) and (obj_controller.zoomed=0) then draw_text(view_xview[0]+2+470,view_yview[0]+18+yy,"Cruisers: "+string(en_frigate));
    if (en_escort>0) and (obj_controller.zoomed=0) then draw_text(view_xview[0]+2+470,view_yview[0]+34+yy,"Escorts: "+string(en_escort));
    
    if (obj_controller.zoomed=1){
        if (en_capital>0) then draw_text_transformed(4+xx,4+yy,"Battleships: "+string(en_capital),2,2,0);
        if (en_frigate>0) then draw_text_transformed(4+xx,36+yy,"Cruisers: "+string(en_frigate),2,2,0);
        if (en_escort>0) then draw_text_transformed(4+xx,68+yy,"Escorts: "+string(en_escort),2,2,0);
    }*/



if (combat_end<=120){
    draw_set_color(0);
    draw_set_alpha((120-combat_end)/100);
    draw_rectangle(0,0,room_width,room_height,0);
    draw_set_alpha(1);
}



if (start=7){
    var losses, aa, bb, cc, dd;losses=0;
    aa=0;bb=0;cc=0;dd=0;
    
    if (capital_max>0) and (capital!=0){aa=((max(capital,0)/max(0,capital_max)));dd+=1;}
    if (capital_max>0) and (capital=0){aa=0;dd+=1;}
    
    if (frigate_max>0) and (frigate!=0){bb=((max(frigate,0)/max(0,frigate_max)));dd+=1;}
    if (frigate_max>0) and (frigate=0){bb=0;dd+=1;}
    
    if (escort_max>0) and (escort!=0){cc=((max(escort,0)/max(0,escort_max)));dd+=1;}
    if (escort_max>0) and (escort=0){cc=0;dd+=1;}
    
    
    losses=(aa+bb+cc)/dd;
    
    // losses=(((max(capital,0)/capital_max))+((max(frigate,0)/frigate_max))+((max(escort,0)/escort_max)))/3;

    
    draw_set_alpha(0.75);draw_set_color(38144);
    draw_rectangle(__view_get( e__VW.XView, 0 )+192-24,__view_get( e__VW.YView, 0 )+128-96,__view_get( e__VW.XView, 0 )+448+24,__view_get( e__VW.YView, 0 )+272-96,0);
    
    draw_set_alpha(1);draw_set_color(0);draw_set_halign(fa_center);draw_set_font(fnt_menu);

    
    if (losses>=0.95){
        draw_text(__view_get( e__VW.XView, 0 )+320,__view_get( e__VW.YView, 0 )+130-96,string_hash_to_newline("Major Victory"));
        draw_text(__view_get( e__VW.XView, 0 )+320.5,__view_get( e__VW.YView, 0 )+130.5-96,string_hash_to_newline("Major Victory"));
        // draw_sprite(spr_postbattle_space,0,view_xview[0]+115,view_yview[0]+216);
        scr_image("postspace",0,__view_get( e__VW.XView, 0 )+115,__view_get( e__VW.YView, 0 )+216,409,247);
    }
    if (losses>=0.75) and (losses<0.95){
        draw_text(__view_get( e__VW.XView, 0 )+320,__view_get( e__VW.YView, 0 )+130-96,string_hash_to_newline("Victory"));
        draw_text(__view_get( e__VW.XView, 0 )+320.5,__view_get( e__VW.YView, 0 )+130.5-96,string_hash_to_newline("Victory"));
        // draw_sprite(spr_postbattle_space,1,view_xview[0]+115,view_yview[0]+216);
        scr_image("postspace",1,__view_get( e__VW.XView, 0 )+115,__view_get( e__VW.YView, 0 )+216,409,247);
    }
    if (losses<0.75) and (losses>0.01){
        draw_text(__view_get( e__VW.XView, 0 )+320,__view_get( e__VW.YView, 0 )+130-96,string_hash_to_newline("Minor Victory"));
        draw_text(__view_get( e__VW.XView, 0 )+320.5,__view_get( e__VW.YView, 0 )+130.5-96,string_hash_to_newline("Minor Victory"));
        scr_image("postspace",1,__view_get( e__VW.XView, 0 )+115,__view_get( e__VW.YView, 0 )+216,409,247);
        // draw_sprite(spr_postbattle_space,1,view_xview[0]+115,view_yview[0]+216);
    }
    if (losses<=0.01){
        draw_text(__view_get( e__VW.XView, 0 )+320,__view_get( e__VW.YView, 0 )+130-96,string_hash_to_newline("Defeat"));
        draw_text(__view_get( e__VW.XView, 0 )+320.5,__view_get( e__VW.YView, 0 )+130.5-96,string_hash_to_newline("Defeat"));
        scr_image("postspace",2,__view_get( e__VW.XView, 0 )+115,__view_get( e__VW.YView, 0 )+216,409,247);
        // draw_sprite(spr_postbattle_space,2,view_xview[0]+115,view_yview[0]+216);
        
        
        // fallen=100;vlost=100;dlost=100;
    }
    
    
    if (capital_max!=0) then draw_text(__view_get( e__VW.XView, 0 )+320,__view_get( e__VW.YView, 0 )+160-96,string_hash_to_newline("Battleships Lost: "+string(max(0,capital_lost))+" ("+string(min(100,((max(0,capital_lost)/max(0,capital_max))*100)))+"%)"));
    if (frigate_max!=0) then draw_text(__view_get( e__VW.XView, 0 )+320,__view_get( e__VW.YView, 0 )+176-96,string_hash_to_newline("Cruisers Lost: "+string(max(0,frigate_lost))+" ("+string(min(100,((max(0,frigate_lost)/max(0,frigate_max))*100)))+"%)"));
    if (escort_max!=0) then draw_text(__view_get( e__VW.XView, 0 )+320,__view_get( e__VW.YView, 0 )+192-96,string_hash_to_newline("Escorts Lost: "+string(max(0,escort_lost))+" ("+string(min(100,((min(max(0,escort_lost,escort_max))/max(0,escort_max))*100)))+"%)"));
    if (ships_max!=0) and (capital_lost+frigate_lost+escort_lost>0){
        if ((capital_lost+frigate_lost+escort_lost)<(capital_max+frigate_max+escort_max)) then draw_text(__view_get( e__VW.XView, 0 )+320,__view_get( e__VW.YView, 0 )+208-96,string_hash_to_newline("Ships Damaged: "+string(max(0,ships_damaged-(capital_lost+frigate_lost+escort_lost)))+" ("+string(max(0,min(100,((ships_damaged-(capital_lost+frigate_lost+escort_lost))/(ships_max-(capital_lost+frigate_lost+escort_lost))))*100))+"%)"));
        if ((capital_lost+frigate_lost+escort_lost)=(capital_max+frigate_max+escort_max)) then draw_text(__view_get( e__VW.XView, 0 )+320,__view_get( e__VW.YView, 0 )+208-96,string_hash_to_newline("Ships Damaged: 0 (0%)"));
    }
    draw_text(__view_get( e__VW.XView, 0 )+320,__view_get( e__VW.YView, 0 )+224-96,string_hash_to_newline("Marines Lost: "+string(max(0,fallen))));
    
    draw_set_halign(fa_center);
    draw_text(__view_get( e__VW.XView, 0 )+320,__view_get( e__VW.YView, 0 )+256-3-96,string_hash_to_newline("[ Continue ]"));
    
    

}

/* */
/*  */
