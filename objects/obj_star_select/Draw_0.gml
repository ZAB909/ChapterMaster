var __b__;
__b__ = action_if_number(obj_bomb_select, 0, 0);
if __b__
{
__b__ = action_if_number(obj_drop_select, 0, 0);
if __b__
{
__b__ = action_if_number(obj_popup, 0, 0);
if __b__
{

if (obj_controller.zoomed=1) then exit;
if (!instance_exists(target)) then exit;
if (obj_controller.menu=60) then exit;

draw_set_font(fnt_40k_14b);
draw_set_halign(fa_center);
draw_set_color(0);

var temp1=0;
var xx=__view_get( e__VW.XView, 0 )+0;
var yy=__view_get( e__VW.YView, 0 )+0;
if (loading=1){
    xx=xx;
    yy=yy;
}
if (mouse_check_button(mb_left)){
    if (obj_controller.menu=0) and (obj_controller.zoomed=0) and (!instance_exists(obj_bomb_select)) and (!instance_exists(obj_drop_select)) and (obj_controller.cooldown<=0){
        var closes=0,sta1=0,sta2=0;
        sta1=instance_nearest(mouse_x,mouse_y,obj_star);
        sta2=point_distance(mouse_x,mouse_y,sta1.x,sta1.y);
        closes=true;
        if (sta2>15){
            if (scr_hit(
                xx+27,
                yy+165,
                xx+300,
                yy+165+294)
            ){
                closes=false
            }else if (obj_controller.selecting_planet>0){
                if (scr_hit(
                    main_data_slate.XX-4,
                    yy+165,
                    main_data_slate.XX+main_data_slate.width,
                    yy+165 + main_data_slate.height,
                )){
                    closes=false
                    if (garrison==""){
                        closes=false
                    } else if (!garrison.garrison_force){
                        closes=false
                    }
                    
                }

                if (feature!=""){
                    if (scr_hit(
                        feature.main_slate.XX,
                        feature.main_slate.YY,
                        feature.main_slate.XX+feature.main_slate.width,
                        feature.main_slate.YY+feature.main_slate.height
                        )){
                        closes=false;
                    }
                }
            }
            var shutter_button;
            var shutters = [shutter_1, shutter_2, shutter_3, shutter_4];
            for (var i=0; i<4;i++){
                shutter_button = shutters[i];
                if (scr_hit(shutter_button.XX,shutter_button.YY,shutter_button.XX+shutter_button.width,shutter_button.YY+shutter_button.height)){
                    closes=false;
                    break;
                }
            }
            if (closes){
                cooldown=0;
                obj_controller.sel_system_x=0;
                obj_controller.sel_system_y=0;
                obj_controller.selecting_planet=0;
                obj_controller.popup=0;
                obj_controller.cooldown=0;
                instance_destroy();
            }
        }
    }
}

if (target.craftworld=0) and (target.space_hulk=0) then draw_sprite(spr_star_screen,target.planets,xx+27,yy+165);
if (target.craftworld=1) then draw_sprite(spr_star_screen,5,xx+27,yy+165);
if (target.space_hulk=1) then draw_sprite(spr_star_screen,6,xx+27,yy+165);
if (target.craftworld=0) and (target.space_hulk=0) then draw_sprite_ext(target.sprite_index,target.image_index,xx+77,yy+287,1.25,1.25,0,c_white,1);

var system_string = target.name+" System"
if (target.owner!=1) then draw_set_color(0);
if (target.owner  = eFACTION.Player) then draw_set_color(c_blue);
if (target.craftworld=0) and (target.space_hulk=0){
    draw_text_transformed(xx+184,yy+180,system_string,1,1,0);
}

if (target.craftworld=0) and (target.space_hulk=0){
    draw_set_color(global.star_name_colors[target.owner]);
    draw_text_transformed(xx+184,yy+180,system_string,1,1,0);
}


if (global.cheat_debug == true && obj_controller.selecting_planet > 0 && loading == false)
    {
        draw_set_color(c_gray)
        draw_rectangle(((xx + 184) - 123), (yy + 200), ((xx + 184) + 123), (yy + 226), false)
        draw_set_color(c_black)
        draw_text((xx + 184), (yy + 204), string_hash_to_newline("Debug"))
        draw_set_color(c_white)
        draw_set_alpha(0.2)
        if (scr_hit(((xx + 184) - 123), ((xx + 184) + 123), (yy + 200), (yy + 226)) == true)
        {
            draw_rectangle(((xx + 184) - 123), (yy + 200), ((xx + 184) + 123), (yy + 226), false)
            if (obj_controller.cooldown <= 0 && obj_controller.mouse_left == 1)
            {
                debug = true
                obj_controller.cooldown = 8000
            }
        }
        draw_set_alpha(1)
    }



if (loading!=0){
    draw_set_font(fnt_40k_14);
    draw_set_color(38144);
    draw_text(xx+184,yy+202,
    string_hash_to_newline("Select Destination"));
}



draw_set_font(fnt_40k_14b);

var pt,xxx;pt=0;
repeat(4){
    pt+=1;xxx=159-41+(pt*41);
    if (target.planets>=pt) and (target.craftworld=0) and (target.space_hulk=0){
        if (target.p_type[pt]="Lava") then temp1=0;if (target.p_type[pt]="Desert") then temp1=2;
        if (target.p_type[pt]="Dead") then temp1=12;if (target.p_type[pt]="Hive") then temp1=4;
        if (target.p_type[pt]="Temperate") or (target.p_type[pt]="Feudal") then temp1=8;
        if (target.p_type[pt]="Agri") then temp1=6;
        if (target.p_type[pt]="Death") then temp1=5;if (target.p_type[pt]="Ice") then temp1=10;
        if (target.p_type[pt]="Forge") then temp1=3;if (target.p_type[pt]="Daemon") then temp1=14;
        if (target.p_type[pt]="Shrine") then temp1=15;draw_sprite(spr_planets,temp1,xx+xxx,yy+287);
        
        if (target.p_owner[pt]=1) then draw_set_color(c_blue);if (target.p_owner[pt]=2) then draw_set_color(c_gray);
        if (target.p_owner[pt]=3) then draw_set_color(16512);if (target.p_owner[pt]=5) then draw_set_color(c_white);
        if (target.p_owner[pt]=7) then draw_set_color(38144);if (target.p_owner[pt]=8) then draw_set_color(117758);
        if (target.p_owner[pt]=10) then draw_set_color(c_purple);
        
        if (pt=1) then draw_text(xx+xxx,yy+255,string_hash_to_newline("I"));if (pt=2) then draw_text(xx+xxx,yy+255,string_hash_to_newline("II"));
        if (pt=3) then draw_text(xx+xxx,yy+255,string_hash_to_newline("III"));if (pt=4) then draw_text(xx+xxx,yy+255,string_hash_to_newline("IV"));
    }
}
if (instance_exists(target)){
    if (target.craftworld=1) then obj_controller.selecting_planet=1;
    if (target.space_hulk=1) then obj_controller.selecting_planet=1;
    x=target.x;
    y=target.y;
}
if (obj_controller.selecting_planet!=0){
// Buttons that are available
    if (!buttons_selected){
        var is_enemy=false;
        if (obj_controller.selecting_planet>0){
            if (target.present_fleet[1]=0)/* and (target.p_type[obj_controller.selecting_planet]!="Dead")*/{
                if (target.p_owner[obj_controller.selecting_planet]>5) then is_enemy=true;
                if (obj_controller.faction_status[target.p_owner[obj_controller.selecting_planet]]="War") then enma=true;
                
                if (target.p_player[obj_controller.selecting_planet]>0){
                    if (is_enemy){
                        button1="Attack";
                        button2="Purge";
                    }
                }
            }
            if (target.present_fleet[1]>0)/* and (target.p_type[obj_controller.selecting_planet]!="Dead")*/{
                if (target.p_owner[obj_controller.selecting_planet]>5) then is_enemy=true;
                if (obj_controller.faction_status[target.p_owner[obj_controller.selecting_planet]]="War") then enma=true;
                
                if (is_enemy){
                    button1="Attack";
                    button2="Raid";
                    button3="Bombard";
                }
                else {
                    button1="Attack";
                    button2="Raid";
                    button3="Purge";
                }
                
                if (torpedo>0){
                    var pfleet=instance_nearest(x,y,obj_p_fleet);
                    if (instance_exists(pfleet)) and (point_distance(pfleet.x,pfleet.y,target.x,target.y)<=40) and (pfleet.action=""){
                        if (pfleet.capital_number+pfleet.frigate_number>0) and (button4="") then button4="Cyclonic Torpedo";
                    }
                }
                
            }
        }
        var planet_upgrades = target.p_upgrades[obj_controller.selecting_planet];
        if (((target.p_type[obj_controller.selecting_planet]=="Dead") or (array_length(target.p_upgrades[obj_controller.selecting_planet])>0)) and ((target.present_fleet[1]>0) or (target.p_player[obj_controller.selecting_planet]>0))){
            if (array_length(target.p_feature[obj_controller.selecting_planet])==0) or (array_length(planet_upgrades)>0){
                var chock=1;
                if ((target.p_orks[obj_controller.selecting_planet]>0) or
                    (target.p_chaos[obj_controller.selecting_planet]>0) or
                    (target.p_tyranids[obj_controller.selecting_planet]>0) or
                    (target.p_necrons[obj_controller.selecting_planet]>0) or
                    (target.p_tau[obj_controller.selecting_planet]>0) or
                    (target.p_demons[obj_controller.selecting_planet]>0)){chock=0;}
                if (chock==1){
                    if (planet_feature_bool(planet_upgrades, P_features.Secret_Base)==1){
                        button1="Base";
                    }else if (planet_feature_bool(planet_upgrades, P_features.Arsenal)==1){
                        button1="Arsenal"; 
                    }else if (planet_feature_bool(planet_upgrades, P_features.Gene_Vault)==1){
                        button1="Gene-Vault";
                    }else if (array_length(target.p_upgrades[obj_controller.selecting_planet])==0){
                        button1="Build";
                    }
                    if (array_contains(["Build","Gene-Vault","Arsenal","Base"],button1)){
                        button2="";
                        button3="";
                        button4="";
                        button5="";
                    }
                }
            }
        }
        
        if (obj_controller.recruiting_worlds_bought>0) and (target.p_owner[obj_controller.selecting_planet]<=5) and (obj_controller.faction_status[target.p_owner[obj_controller.selecting_planet]]!="War"){
            if (planet_feature_bool(target.p_feature[obj_controller.selecting_planet], P_features.Recruiting_World)==0) and (target.p_type[obj_controller.selecting_planet]!="Dead") and (target.space_hulk=0){
                button4="+Recruiting";
            }
        }
        if (target.space_hulk=1){
            if (target.present_fleet[1]>0){
                button1="Raid";
                button2="Bombard";
                button3="";
                button4="";
            }
        }
        buttons_selected=true;  
    }

    main_data_slate.inside_method = function(){
        improve=0
        var xx=__view_get( e__VW.XView, 0 )+15;
        var yy=__view_get( e__VW.YView, 0 )+25;
        var current_planet=obj_controller.selecting_planet;
        var nm, temp1;temp1=0;nm=scr_roman(current_planet);
        draw_set_halign(fa_center);
        draw_set_font(fnt_40k_14);
        
        
        if (target.p_owner[current_planet]<=5) and (target.p_orks[current_planet]+target.p_eldar[current_planet]+target.p_traitors[current_planet]+target.p_chaos[current_planet]+target.p_tyranids[current_planet]+target.p_necrons[current_planet]+target.p_demons[current_planet]+target.p_tau[current_planet]=0){
            if (target.p_player[current_planet]>0) or (target.present_fleet[1]>0){
                if (target.p_fortified[current_planet]<5) then improve=1;
            }
        }
        
        // Draw disposition here
        var succession,yyy;succession=0;yyy=0;

        if (has_problem_planet(current_planet, "succession",target)) then succession=1;

        if ((target.dispo[current_planet]>=0) and (target.p_owner[current_planet]<=5) and (target.p_population[current_planet]>0)) and (succession=0){
            var wack=0;
            draw_set_color(c_blue);
            draw_rectangle(xx+349,yy+175,xx+349+(min(100,target.dispo[current_planet])*3.68),yy+192,0);
        }
        draw_set_color(c_gray);
        draw_rectangle(xx+349,yy+175,xx+717,yy+192,1);
        draw_set_color(c_white);
        
        if (!succession){
            if (target.dispo[current_planet]>=0) and (target.p_first[current_planet]<=5) and (target.p_owner[current_planet]<=5) and (target.p_population[current_planet]>0) then draw_text(xx+534,yy+176,string_hash_to_newline("Disposition: "+string(min(100,target.dispo[current_planet]))+"/100"));
            if (target.dispo[current_planet]>-30) and (target.dispo[current_planet]<0) and (target.p_owner[current_planet]<=5) and (target.p_population[current_planet]>0) then draw_text(xx+534,yy+176,string_hash_to_newline("Disposition: ???/100"));
            if ((target.dispo[current_planet]>=0) and (target.p_first[current_planet]<=5) and (target.p_owner[current_planet]>5)) or (target.p_population[current_planet]<=0) then draw_text(xx+534,yy+176,string_hash_to_newline("-------------"));
            if (target.dispo[current_planet]<=-3000) then draw_text(xx+534,yy+176,string_hash_to_newline("Disposition: N/A"));
        }else  if (succession=1) then draw_text(xx+534,yy+176,string_hash_to_newline("War of Succession"));
        draw_set_color(c_gray);
        // End draw disposition
        draw_set_color(c_gray);
        draw_rectangle(xx+349,yy+193,xx+717,yy+210,0);
        var bar_width = 717-349;
        var bar_start_point = xx+349;
        var bar_percent_length = (bar_width/100);
        var current_bar_percent = 0;
        with (target){
            for (var i=1;i<13;i++){
                if (p_influence[current_planet][i]>0){
                    draw_set_color(global.star_name_colors[i]);
                    var current_start = bar_start_point+(current_bar_percent*bar_percent_length)
                    draw_rectangle(current_start,yy+193,current_start+(bar_percent_length*p_influence[current_planet][i]),yy+210,0);
                    current_bar_percent+=p_influence[current_planet][i];
                }
                draw_set_color(c_gray);
            }
        }
        draw_set_color(c_white);   
        draw_text(xx+534,yy+194,"Population Influence");
        yy+=20;
        draw_set_font(fnt_40k_14b);draw_set_halign(fa_left);
        if (target.craftworld=0) and (target.space_hulk=0) then draw_text(xx+480,yy+196,string_hash_to_newline(string(target.name)+" "+string(nm)+"  ("+string(target.p_type[current_planet])+")"));
        if (target.craftworld=1) then draw_text(xx+480,yy+196,string_hash_to_newline(string(target.name)+" (Craftworld)"));
        // if (target.craftworld=0) and (target.space_hulk=0) then draw_text(xx+534,yy+214,string(target.p_type[current_planet])+" World");
        // if (target.craftworld=1) then draw_text(xx+594,yy+214,"Craftworld");
        if (target.space_hulk=1) then draw_text(xx+480,yy+196,string_hash_to_newline("Space Hulk"));
        
        if (target.p_type[current_planet]="Lava") and (target.p_population[current_planet]>0) then temp1=1;
        if (target.p_type[current_planet]="Lava") and (target.p_population[current_planet]=0) then temp1=0;
        if (target.p_type[current_planet]="Desert")  {temp1=2;}
        else if (target.p_type[current_planet]="Dead")  {temp1=10;}
        else if (target.p_type[current_planet]="Hive")  {temp1=4;}
        else if (target.p_type[current_planet]="Temperate")  {temp1=8;}
        else if (target.p_type[current_planet]="Feudal")  {temp1=7;}
        else if (target.p_type[current_planet]="Agri")  {temp1=6;}
        else if (target.p_type[current_planet]="Death")  {temp1=5;}
    	else if (target.p_type[current_planet]="Ice")  {temp1=9;}
        else if (target.p_type[current_planet]="Forge")  {temp1=3;}  
        else if (target.p_type[current_planet]="Daemon")  {temp1=11;}
    	else if (target.p_type[current_planet]="Craftworld")  {temp1=12;}
        else if (target.p_type[current_planet]="Space Hulk")  {temp1=14;}
        else if (target.p_type[current_planet]="Shrine")  {temp1=16;}
        
        // draw_sprite(spr_planet_splash,temp1,xx+349,yy+194);
        scr_image("planet",temp1,xx+349,yy+194,128,128);
        draw_rectangle(xx+349,yy+194,xx+477,yy+322,1);
        draw_set_font(fnt_40k_14);
        
        
        if (target.p_large[current_planet]=0){
            var temp2;temp2=string(scr_display_number(target.p_population[current_planet]));
            draw_text(xx+480,yy+220,string_hash_to_newline("Population: "+string(temp2)));
        }
        if (target.p_large[current_planet]=1){
            draw_text(xx+480,yy+220,string_hash_to_newline("Population: "+string(target.p_population[current_planet])+" billion"));
        }
        
        if (target.craftworld=0) and (target.space_hulk=0){
            var y7=240,temp3=string(scr_display_number(target.p_guardsmen[current_planet]));
            if (target.p_guardsmen[current_planet]>0){
                draw_text(xx+480,yy+y7,"Imperial Guard: "+string(temp3));y7+=20;
            }
            if (target.p_owner[current_planet]!=8){
                var temp4=string(scr_display_number(target.p_pdf[current_planet]));
                draw_text(xx+480,yy+y7,string_hash_to_newline("Defense Force: "+string(temp4)));
            }
            if (target.p_owner[current_planet]=8){
                var temp4=string(scr_display_number(target.p_pdf[current_planet]));
                draw_text(xx+480,yy+y7,string_hash_to_newline("Gue'Vesa Force: "+string(temp4)));
            }
        }
        
        var temp5="";
        
        
        if (target.space_hulk=0){
            if (improve=1){
                draw_set_color(c_green);
                draw_rectangle(xx+481,yy+280,xx+716,yy+298,0);
                draw_sprite(spr_requisition,0,xx+657,yy+283);
                
                
                var improve_cost,yep,o;improve_cost=1500;
                o=0;yep=0;
                if (array_contains(obj_ini.adv, "Siege Masters")) then improve_cost=1100;
                
                draw_set_color(0);
                draw_text(xx+671-1,yy+281-1,string_hash_to_newline(string(improve_cost)));
                draw_text(xx+671+1,yy+281-1,string_hash_to_newline(string(improve_cost)));
                draw_text(xx+671+1,yy+281+1,string_hash_to_newline(string(improve_cost)));
                draw_text(xx+671-1,yy+281+1,string_hash_to_newline(string(improve_cost)));
                draw_set_color(16291875);
                draw_text(xx+671,yy+281,string_hash_to_newline(string(improve_cost)));
                
                if (scr_hit(xx+481,yy+282,xx+716,yy+300)=true){
                    draw_set_color(0);
                    draw_set_alpha(0.2);
                    draw_rectangle(xx+481,yy+280,xx+716,yy+298,0);
                    if (obj_controller.cooldown<=0) and (obj_controller.mouse_left=1) and (obj_controller.requisition>=improve_cost){
                        obj_controller.cooldown=8000;
                        obj_controller.requisition-=improve_cost;
                        target.p_fortified[current_planet]+=1;
                        
                        if (target.dispo[current_planet]>0) and (target.dispo[current_planet]<=100){
                            if (target.p_fortified[current_planet]=1) then target.dispo[current_planet]=min(100,target.dispo[current_planet]+8);
                            if (target.p_fortified[current_planet]=2) then target.dispo[current_planet]=min(100,target.dispo[current_planet]+7);
                            if (target.p_fortified[current_planet]=3) then target.dispo[current_planet]=min(100,target.dispo[current_planet]+6);
                            if (target.p_fortified[current_planet]=4) then target.dispo[current_planet]=min(100,target.dispo[current_planet]+5);
                            if (target.p_fortified[current_planet]=5) then target.dispo[current_planet]=min(100,target.dispo[current_planet]+4);
                        }
                    }
                    
                }
                draw_set_alpha(1);
                draw_set_color(0);
            }
            var forti_string = ["None", "Sparse","Light","Moderate","Heavy","Major","Extreme"];
            var planet_forti = $"Defenses: {forti_string[target.p_fortified[current_planet]]}";

            draw_text(xx+480,yy+280,planet_forti);
        }
        
        draw_set_color(c_gray);
        
        if (target.space_hulk=1){
            temp5="Integrity: "+string(floor(target.p_fortified[current_planet]*20))+"%";
            draw_text(xx+480,yy+280,string_hash_to_newline(string(temp5)));
        }
        
        var temp6="???";
        var tau_influence = target.p_influence[current_planet][eFACTION.Tau];
        var target_planet_heresy=target.p_heresy[current_planet];
        if (max(target_planet_heresy,tau_influence)<=10) then temp6="None";
        if (max(target_planet_heresy,tau_influence)>10) and (max(target_planet_heresy,tau_influence)<=30) then temp6="Little";
        if (max(target_planet_heresy,tau_influence)>30) and (max(target_planet_heresy,tau_influence)<=50) then temp6="Major";
        if (max(target_planet_heresy,tau_influence)>50) and (max(target_planet_heresy,tau_influence)<=70) then temp6="Heavy";
        if (max(target_planet_heresy,tau_influence)>70) and (max(target_planet_heresy,tau_influence)<=96) then temp6="Extreme";
        if (target_planet_heresy>=96) or (tau_influence>=96) then temp6="Maximum";
        draw_text(xx+480,yy+300,$"Corruption: {temp6}");
        
        
        draw_set_font(fnt_40k_14b);
        draw_text(xx+349,yy+326,string_hash_to_newline("Planet Forces"));
        draw_text(xx+535,yy+326,string_hash_to_newline("Planet Features"));
        draw_set_font(fnt_40k_14);
        
        
        var temp8="",t=-1;
        repeat(8){
            var ahuh,ahuh2,ahuh3;ahuh="";ahuh2=0;ahuh3=0;t+=1;
            with (target){
                if (t=0){ahuh="Adepta Sororitas: ";ahuh2=p_sisters[current_planet];}
                if (t=1){ahuh="Ork Presence: ";ahuh2=p_orks[current_planet];}
                if (t=2){ahuh="Tau Presence: ";ahuh2=p_tau[current_planet];}
                if (t=3){ahuh="Tyranid Presence: ";ahuh2=p_tyranids[current_planet];}
                if (t=4){ahuh="Traitor Presence: ";ahuh2=p_traitors[current_planet];if (ahuh2>6) then ahuh="Daemon Presence: ";}
                if (t=5){ahuh="CSM Presence: ";ahuh2=p_chaos[current_planet];}
                if (t=6){ahuh="Daemon Presence: ";ahuh2=p_demons[current_planet];}
                if (t=7){ahuh="Necron Presence: ";ahuh2=p_necrons[current_planet];}
            }
            
            if (t!=0){
                if (ahuh2=1) then ahuh3="Tiny";if (ahuh2=2) then ahuh3="Sparse";
                if (ahuh2=3) then ahuh3="Moderate";if (ahuh2=4) then ahuh3="Heavy";
                if (ahuh2=5) then ahuh3="Extreme";if (ahuh2>=6) then ahuh3="Rampant";
            }
            if (t=0){
                if (ahuh2=1) then ahuh3="Very Few";if (ahuh2=2) then ahuh3="Few";
                if (ahuh2=3) then ahuh3="Moderate";if (ahuh2=4) then ahuh3="Numerous";
                if (ahuh2=5) then ahuh3="Very Numerous";if (ahuh2>=6) then ahuh3="Overwhelming";
            }
            
            if (ahuh!="") and (ahuh2>0) then temp8+=string(ahuh)+" "+string(ahuh3)+"#";
        }
        draw_text(xx+349,yy+346,string_hash_to_newline(string(temp8)));
        
        
        var fit,to_show,temp9;t=-1;to_show=0;temp9="";
        repeat(11){t+=1;fit[t]="";}
    	var planet_displays = [], i;
    	var feat_count;
    	var feat_count = array_length(target.p_feature[current_planet]);
        var upgrade_count = array_length(target.p_upgrades[current_planet]);
        var size = ["", "Small", "", "Large"]
    	if ( feat_count > 0){
        	for (i =0; i <  feat_count ;i++){
        		if (target.p_feature[current_planet][i].planet_display != 0){
        			if (target.p_feature[current_planet][i].player_hidden == 1){
                        array_push(planet_displays, ["????", ""] );
                    }else{
                        array_push(planet_displays, [target.p_feature[current_planet][i].planet_display, target.p_feature[current_planet][i]]);
        			}
                    if (target.p_feature[current_planet][i].f_type == P_features.Monastery){
                        if (target.p_feature[current_planet][i].forge>0){
                            var forge = target.p_feature[current_planet][i].forge_data;
                            var size_string= $"{size[forge.size]} Chapter Forge"
                            array_push(planet_displays, [size_string, target.p_feature[current_planet][i].forge_data]);
                        }
                    }                
        		}
        	}
        }
        if (upgrade_count>0){
            for (i =0; i <  upgrade_count ;i++){
                if (target.p_upgrades[current_planet][i].f_type == P_features.Secret_Base){
                    if (target.p_upgrades[current_planet][i].forge>0){
                        var forge = target.p_upgrades[current_planet][i].forge_data;
                        var size_string= $"{size[forge.size]} Chapter Forge"
                        array_push(planet_displays, [size_string, target.p_upgrades[current_planet][i].forge_data]);
                    }
                }
            }
        }

        t=0;
        var button_size, y_move=0, button_colour;
        for (i=0; i< array_length(planet_displays); i++){
            button_colour = c_green;
            if (planet_displays[i][0] == "????") then button_colour = c_red;
            button_size = draw_unit_buttons([xx+535,yy+346+y_move], planet_displays[i][0],[1,1], button_colour,, fnt_40k_14b, 1);
            y_move += button_size[3]-button_size[1];
            if (point_in_rectangle(mouse_x, mouse_y, button_size[0], button_size[1],button_size[2],button_size[3]) && (mouse_check_button_pressed(mb_left))){
                if (planet_displays[i][0] != "????"){
                    feature = new feature_selected(planet_displays[i][1]);
                } else {
                    feature = "";
                }
            }
        }
        if (obj_controller.selecting_planet>0){
            var current_planet=obj_controller.selecting_planet;
            draw_set_color(c_black);
            draw_set_halign(fa_center);
            
            /*if (obj_controller.recruiting_worlds_bought>0) and (target.p_owner[obj_controller.selecting_planet]<=5) and (obj_controller.faction_status[target.p_owner[obj_controller.selecting_planet]]!="War"){
                if (string_count("Recr",target.p_feature[obj_controller.selecting_planet])=0){
                    button4="+Recruiting";
                }
            }*/
            
            /*if (target.p_first[current_planet]=1){
                if (mouse_x>=xx+363) and (mouse_y>=yy+194) and (mouse_x<xx+502) and (mouse_y<yy+204){
                    if (string_count("Monastery",target.p_feature[current_planet])>0){
                        var wid,hei,tex;draw_set_halign(fa_left);
                        tex=string(target.p_lasers[current_planet])+" Defense Laser, "+string(target.p_defenses[current_planet])+" Weapon Emplacements, "+string(target.p_silo[current_planet])+" Missile Silo";
                        hei=string_height_ext(tex,-1,200)+4;wid=string_width_ext(tex,-1,200)+4;
                        draw_set_color(c_black);
                        draw_rectangle(xx+363,yy+210,xx+363+wid,yy+210+hei,0);
                        draw_set_color(38144);
                        draw_rectangle(xx+363,yy+210,xx+363+wid,yy+210+hei,1);
                        draw_text_ext(xx+365,yy+212,tex,-1,200);
                    }
                }
            }*/
        }
    }
    var slate_draw_scale = 420/850;
    if (feature!=""){
        if (is_struct(feature)){
            feature.draw_planet_features(xx+344+main_data_slate.width-4,yy+165)
            if (feature.remove){
                feature="";
            }
        }
    }else if (garrison!=""){
        if (garrison.garrison_force){
            draw_set_font(fnt_40k_14);
            if (!garrison.garrison_leader){
                garrison.find_leader()
                garrison.garrison_disposition_change(target, obj_controller.selecting_planet, true);
                garrison_data_slate.sub_title = $"Garrison Leader {garrison.garrison_leader.name_role()}"
                garrison_data_slate.body_text = garrison.garrison_report();
            }
            garrison_data_slate.inside_method=function(){
                draw_set_color(c_gray);
                var xx = garrison_data_slate.XX;
                var yy = garrison_data_slate.YY;
                var cur_planet = obj_controller.selecting_planet;
                var half_way =  garrison_data_slate.height/2;
                draw_set_halign(fa_left);
                draw_line(xx+10, yy+half_way, xx+garrison_data_slate.width-10, yy+half_way);
                var defence_data  = determine_pdf_defence(target.p_pdf[cur_planet], garrison,target.p_fortified[cur_planet]);
                var defence_string = $"Planetary Defence : {defence_data[0]}";
                draw_text(xx+20, yy+half_way, defence_string);
                if (scr_hit(xx+20, yy+half_way+10, xx+20+string_width(defence_string), yy+half_way+10+20)){
                    tooltip_draw(defence_data[1], 400);
                }
                if (garrison.dispo_change!="none"){
                    if (garrison.dispo_change>55){
                        draw_text(xx+20, yy+half_way+30, $"Garrison Disposition Effect : Positive");
                    } else if (garrison.dispo_change>44){
                        draw_text(xx+20, yy+half_way+30, $"Garrison Disposition Effect : Neutral");
                    } else{ 
                        draw_text(xx+20, yy+half_way+30, $"Garrison Disposition Effect : Negative");
                    }
                }
            }
            garrison_data_slate.draw(xx+344+main_data_slate.width-4, yy+160, 0.6, 0.6);

        }
    }    
    main_data_slate.draw(xx+344,yy+160, slate_draw_scale, slate_draw_scale+0.1);
    var current_button="";
    if (shutter_1.draw_shutter(main_data_slate.XX-165, yy+296+165, button1, 0.5, true)) then current_button=button1;
    if (shutter_2.draw_shutter(main_data_slate.XX-165, yy+296+165+47, button2,0.5, true))then current_button=button2;
    if (shutter_3.draw_shutter(main_data_slate.XX-165, yy+296+165+(47*2), button3,0.5, true))then current_button=button3;
    if (shutter_4.draw_shutter(main_data_slate.XX-165, yy+296+165+(47*3), button4,0.5, true))then current_button=button4;
    if (current_button!=""){
        if (array_contains(["Build","Base","Arsenal","Gene-Vault"],current_button)){
            var building=instance_create(x,y,obj_temp_build);
            building.target=target;
            building.planet=obj_controller.selecting_planet;
            if (planet_feature_bool(target.p_upgrades[obj_controller.selecting_planet], P_features.Secret_Base)) then building.lair=1;
            if (planet_feature_bool(target.p_upgrades[obj_controller.selecting_planet], P_features.Arsenal)) then building.arsenal=1;
            if (planet_feature_bool(target.p_upgrades[obj_controller.selecting_planet], P_features.Gene_Vault)) then building.gene_vault=1;
            
            
            obj_controller.temp[104]=string(scr_master_loc());
            obj_controller.cooldown=3000;
            obj_controller.menu=60;
            with(obj_star_select){instance_destroy();}
        }else if (current_button=="Raid"){
            instance_create(x,y,obj_drop_select);
            obj_drop_select.p_target=target;
            obj_drop_select.sh_target=instance_nearest(x+24,y-24,obj_p_fleet);
            if (instance_nearest(x+24,y-24,obj_p_fleet).acted>1) then with(obj_drop_select){instance_destroy();}
            obj_controller.cooldown=3000;
        }else if (current_button=="Attack"){
            instance_create(x,y,obj_drop_select);
            obj_drop_select.p_target=target;
            obj_drop_select.attack=1;
            if (target.present_fleet[1]=0) then obj_drop_select.sh_target=-50;
            if (target.present_fleet[1]>0){
                obj_drop_select.sh_target=instance_nearest(x+24,y-24,obj_p_fleet);
                if (instance_nearest(x+24,y-24,obj_p_fleet).acted>=2) then with(obj_drop_select){instance_destroy();}
            }
            obj_controller.cooldown=3000;
        }else if (current_button=="Purge"){
            instance_create(x,y,obj_drop_select);
            obj_drop_select.p_target=target;
            obj_drop_select.purge=1;
            if (target.present_fleet[1]=0) then obj_drop_select.sh_target=-50;
            if (target.present_fleet[1]>0){
                obj_drop_select.sh_target=instance_nearest(x+24,y-24,obj_p_fleet);
                if (instance_nearest(x+24,y-24,obj_p_fleet).acted>0) then with(obj_drop_select){instance_destroy();}
            }
            obj_controller.cooldown=3000;
        }else if (current_button=="Bombard"){
            instance_create(x,y,obj_bomb_select);
            if (instance_exists(obj_bomb_select)){
                obj_bomb_select.p_target=target;
                obj_bomb_select.sh_target=instance_nearest(x+24,y-24,obj_p_fleet);
                if (instance_nearest(x+24,y-24,obj_p_fleet).acted=0) then instance_create(target.x,target.y,obj_temp3);
                if (instance_nearest(x+24,y-24,obj_p_fleet).acted>0) then with(obj_bomb_select){instance_destroy();}
            }
            obj_controller.cooldown=3000;
        }else if (current_button=="+Recruiting"){
            if (obj_controller.recruiting_worlds_bought>0) and (target.p_owner[obj_controller.selecting_planet]<=5) and (obj_controller.faction_status[target.p_owner[obj_controller.selecting_planet]]!="War"){
                if (planet_feature_bool(target.p_feature[obj_controller.selecting_planet],P_features.Recruiting_World)==0){
                    obj_controller.cooldown=3000;
                    obj_controller.recruiting_worlds_bought-=1;
                    array_push(target.p_feature[obj_controller.selecting_planet] ,new new_planet_feature(P_features.Recruiting_World))
                    
                    if (obj_controller.selecting_planet=1) then obj_controller.recruiting_worlds+=string(target.name)+" I|";
                    if (obj_controller.selecting_planet=2) then obj_controller.recruiting_worlds+=string(target.name)+" II|";
                    if (obj_controller.selecting_planet=3) then obj_controller.recruiting_worlds+=string(target.name)+" III|";
                    if (obj_controller.selecting_planet=4) then obj_controller.recruiting_worlds+=string(target.name)+" IV|";
                    
                    obj_controller.income_recruiting=(obj_controller.recruiting*-2)*string_count("|",obj_controller.recruiting_worlds);
                    if (obj_controller.recruiting_worlds_bought=0){
                        if (button1=="+Recruiting") then button1="";
                        if (button2=="+Recruiting") then button2="";
                        if (button3=="+Recruiting") then button3="";
                        if (button4=="+Recruiting") then button4="";
                    }
                    // 135 ; popup?
                }
            }
        }else if (current_button=="Cyclonic Torpedo"){
            obj_controller.cooldown=6000;
            scr_destroy_planet(2);
        }
    } 
}


if (target!=0){
    if (player_fleet>0) and (imperial_fleet+mechanicus_fleet+inquisitor_fleet+eldar_fleet+ork_fleet+tau_fleet+heretic_fleet>0){
        draw_set_color(0);draw_set_alpha(0.75);
        draw_rectangle(xx+37,yy+413,xx+270,yy+452,0);
        draw_set_alpha(1);
        
        /*draw_set_color(38144);draw_rectangle(xx+40,yy+247,xx+253,yy+273,1);*/
        
        
        draw_set_halign(fa_left);
        
        
        draw_set_color(0);draw_set_font(fnt_40k_14b);
        draw_text(xx+37,yy+413,string_hash_to_newline("Select Fleet Combat"));
        
        draw_set_color(38144);draw_set_font(fnt_40k_14b);
        draw_text(xx+37.5,yy+413.5,string_hash_to_newline("Select Fleet Combat"));
        
        var i,x3,y3;i=0;
        // x3=xx+46;y3=yy+252;
        x3=xx+49;y3=yy+441;
        
        repeat(7){i+=1;
            if (en_fleet[i]>0){
                // draw_sprite_ext(spr_force_icon,en_fleet[i],x3,y3,0.5,0.5,0,c_white,1);
                scr_image("force",en_fleet[i],x3-16,y3-16,32,32);
                x3+=64;
            }
        }
        
        
    }
}






if (debug=1){
    var xx,yy,current_planet;
    xx=__view_get( e__VW.XView, 0 )+0;
    yy=__view_get( e__VW.YView, 0 )+0;
    
    if (scr_hit(xx+274,yy+426,xx+337,yy+451)=true) and (obj_controller.cooldown<=0) and (obj_controller.mouse_left=1){
        debug=0;obj_controller.cooldown=8000;exit;
    }
    
    xx=__view_get( e__VW.XView, 0 )+27;
    yy=__view_get( e__VW.YView, 0 )+165;
    current_planet=obj_controller.selecting_planet;
    
    draw_set_color(c_black);draw_rectangle(xx+9,yy+9,xx+310,yy+260,0);
    draw_set_font(fnt_40k_14b);draw_set_color(c_gray);draw_set_halign(fa_left);
    
    draw_text(xx+11,yy+11,string_hash_to_newline("Orks: "+string(target.p_orks[current_planet])));
    draw_text(xx+11,yy+31,string_hash_to_newline("Tau: "+string(target.p_tau[current_planet])));
    draw_text(xx+11,yy+51,string_hash_to_newline("Tyranids: "+string(target.p_tyranids[current_planet])));
    draw_text(xx+11,yy+71,string_hash_to_newline("Traitors: "+string(target.p_traitors[current_planet])));
    draw_text(xx+11,yy+91,string_hash_to_newline("CSM: "+string(target.p_chaos[current_planet])));
    draw_text(xx+11,yy+111,string_hash_to_newline("Daemons: "+string(target.p_demons[current_planet])));
    draw_text(xx+11,yy+131,string_hash_to_newline("Necrons: "+string(target.p_necrons[current_planet])));
    draw_text(xx+11,yy+151,string_hash_to_newline("Sisters: "+string(target.p_sisters[current_planet])));
    
    draw_text(xx+120,yy+11,string_hash_to_newline("[-] [+]"));
    draw_text(xx+120,yy+31,string_hash_to_newline("[-] [+]"));
    draw_text(xx+120,yy+51,string_hash_to_newline("[-] [+]"));
    draw_text(xx+120,yy+71,string_hash_to_newline("[-] [+]"));
    draw_text(xx+120,yy+91,string_hash_to_newline("[-] [+]"));
    draw_text(xx+120,yy+111,string_hash_to_newline("[-] [+]"));
    draw_text(xx+120,yy+131,string_hash_to_newline("[-] [+]"));
    draw_text(xx+120,yy+151,string_hash_to_newline("[-] [+]"));
    
    if (obj_controller.cooldown<=0) and (obj_controller.mouse_left=1){var cool;cool=false;
        if (mouse_x>=xx+120) and (mouse_x<xx+140){
            if (mouse_y>=yy+11) and (mouse_y<yy+31){target.p_orks[current_planet]-=1;cool=true;}
            if (mouse_y>=yy+31) and (mouse_y<yy+51){target.p_tau[current_planet]-=1;cool=true;}
            if (mouse_y>=yy+51) and (mouse_y<yy+71){target.p_tyranids[current_planet]-=1;cool=true;}
            if (mouse_y>=yy+71) and (mouse_y<yy+91){target.p_traitors[current_planet]-=1;cool=true;}
            if (mouse_y>=yy+91) and (mouse_y<yy+111){target.p_chaos[current_planet]-=1;cool=true;}
            if (mouse_y>=yy+111) and (mouse_y<yy+131){target.p_demons[current_planet]-=1;cool=true;}
            if (mouse_y>=yy+131) and (mouse_y<yy+151){target.p_necrons[current_planet]-=1;cool=true;}
            if (mouse_y>=yy+151) and (mouse_y<yy+171){target.p_sisters[current_planet]-=1;cool=true;}
        }
        if (mouse_x>=xx+150) and (mouse_x<xx+170){
            if (mouse_y>=yy+11) and (mouse_y<yy+31){target.p_orks[current_planet]+=1;cool=true;}
            if (mouse_y>=yy+31) and (mouse_y<yy+51){target.p_tau[current_planet]+=1;cool=true;}
            if (mouse_y>=yy+51) and (mouse_y<yy+71){target.p_tyranids[current_planet]+=1;cool=true;}
            if (mouse_y>=yy+71) and (mouse_y<yy+91){target.p_traitors[current_planet]+=1;cool=true;}
            if (mouse_y>=yy+91) and (mouse_y<yy+111){target.p_chaos[current_planet]+=1;cool=true;}
            if (mouse_y>=yy+111) and (mouse_y<yy+131){target.p_demons[current_planet]+=1;cool=true;}
            if (mouse_y>=yy+131) and (mouse_y<yy+151){target.p_necrons[current_planet]+=1;cool=true;}
            if (mouse_y>=yy+151) and (mouse_y<yy+171){target.p_sisters[current_planet]+=1;cool=true;}
        }
        if (cool=true) then obj_controller.cooldown=8000;
    }
}

/* */
}
}
}


/*  */