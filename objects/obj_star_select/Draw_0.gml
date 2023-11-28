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

var xx, yy, temp1,improve;temp1=0;improve=0;
xx=__view_get( e__VW.XView, 0 )+0;yy=__view_get( e__VW.YView, 0 )+0;
if (loading=1){xx=xx;yy=yy;}


if (target.craftworld=0) and (target.space_hulk=0) then draw_sprite(spr_star_screen,target.planets,xx+27,yy+165);
if (target.craftworld=1) then draw_sprite(spr_star_screen,5,xx+27,yy+165);
if (target.space_hulk=1) then draw_sprite(spr_star_screen,6,xx+27,yy+165);
if (target.craftworld=0) and (target.space_hulk=0) then draw_sprite_ext(target.sprite_index,target.image_index,xx+77,yy+287,1.25,1.25,0,c_white,1);


if (target.owner!=1) then draw_set_color(0);
if (target.owner  = eFACTION.Player) then draw_set_color(c_blue);
if (target.craftworld=0) and (target.space_hulk=0){
    draw_text_transformed(xx+184,yy+180,string_hash_to_newline(string(target.name)+" System"),1,1,0);
}

if (target.craftworld=0) and (target.space_hulk=0){
    if (target.owner  = eFACTION.Player) or (target.owner = eFACTION.Ecclesiarchy) then draw_set_color(c_white);if (target.owner = eFACTION.Imperium) then draw_set_color(c_gray);
    if (target.owner = eFACTION.Mechanicus) then draw_set_color(c_red);if (target.owner = eFACTION.Ork) then draw_set_color(38144);
    if (target.owner = eFACTION.Tau) then draw_set_color(117758);if (target.owner = eFACTION.Tyranids) then draw_set_color(7492269);
    if (target.owner = eFACTION.Chaos) then draw_set_color(c_purple);if (target.owner = eFACTION.Necrons) then draw_set_color(65408);
    draw_text_transformed(xx+184,yy+180,string_hash_to_newline(string(target.name)+" System"),1,1,0);
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



if (loading!=0){draw_set_font(fnt_40k_14);draw_set_color(38144);draw_text(xx+184,yy+202,string_hash_to_newline("Select Destination"));}



draw_set_font(fnt_40k_14b);

var pt,xxx;pt=0;
repeat(4){
    pt+=1;xxx=159-41+(pt*41);
    if (target.planets>=pt) and (target.craftworld=0) and (target.space_hulk=0){
        if (target.p_type[pt]="Lava") then temp1=0;if (target.p_type[pt]="Desert") then temp1=2;
        if (target.p_type[pt]="Dead") then temp1=12;if (target.p_type[pt]="Hive") then temp1=4;
        if (target.p_type[pt]="Temperate") or (target.p_type[pt]="Feudal") then temp1=8;if (target.p_type[pt]="Agri") then temp1=6;
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


if (obj_controller.selecting_planet!=0){
    var pp;pp=obj_controller.selecting_planet;
    var nm, temp1;temp1=0;nm=scr_roman(pp);
    draw_set_halign(fa_center);
    draw_set_font(fnt_40k_14);
    draw_sprite(spr_planet_screen,0,xx+27,yy+165);
    
    
    if (target.p_owner[pp]<=5) and (target.p_orks[pp]+target.p_eldar[pp]+target.p_traitors[pp]+target.p_chaos[pp]+target.p_tyranids[pp]+target.p_necrons[pp]+target.p_demons[pp]+target.p_tau[pp]=0){
        if (target.p_player[pp]>0) or (target.present_fleet[1]>0){
            if (target.p_fortified[pp]<5) then improve=1;
        }
    }
    
    // Draw disposition here
    var succession,yyy;succession=0;yyy=0;
    repeat(4){yyy+=1;if (target.p_problem[pp,yyy]="succession") then succession=1;}
    
    if ((target.dispo[pp]>=0) and (target.p_owner[pp]<=5) and (target.p_population[pp]>0)) and (succession=0){
        var wack;wack=0;
        draw_set_color(c_blue);
        draw_rectangle(xx+349,yy+175,xx+349+(min(100,target.dispo[pp])*3.68),yy+192,0);
    }
    draw_set_color(c_gray);
    draw_rectangle(xx+349,yy+175,xx+717,yy+192,1);
    draw_set_color(c_white);
    
    if (succession=0){
        if (target.dispo[pp]>=0) and (target.p_first[pp]<=5) and (target.p_owner[pp]<=5) and (target.p_population[pp]>0) then draw_text(xx+534,yy+176,string_hash_to_newline("Disposition: "+string(min(100,target.dispo[pp]))+"/100"));
        if (target.dispo[pp]>-30) and (target.dispo[pp]<0) and (target.p_owner[pp]<=5) and (target.p_population[pp]>0) then draw_text(xx+534,yy+176,string_hash_to_newline("Disposition: ???/100"));
        if ((target.dispo[pp]>=0) and (target.p_first[pp]<=5) and (target.p_owner[pp]>5)) or (target.p_population[pp]<=0) then draw_text(xx+534,yy+176,string_hash_to_newline("-------------"));
        if (target.dispo[pp]<=-3000) then draw_text(xx+534,yy+176,string_hash_to_newline("Disposition: N/A"));
    }
    if (succession=1) then draw_text(xx+534,yy+176,string_hash_to_newline("War of Succession"));
    draw_set_color(c_gray);
    // End draw disposition
    
    draw_set_font(fnt_40k_14b);draw_set_halign(fa_left);
    if (target.craftworld=0) and (target.space_hulk=0) then draw_text(xx+480,yy+196,string_hash_to_newline(string(target.name)+" "+string(nm)+"  ("+string(target.p_type[pp])+")"));
    if (target.craftworld=1) then draw_text(xx+480,yy+196,string_hash_to_newline(string(target.name)+" (Craftworld)"));
    // if (target.craftworld=0) and (target.space_hulk=0) then draw_text(xx+534,yy+214,string(target.p_type[pp])+" World");
    // if (target.craftworld=1) then draw_text(xx+594,yy+214,"Craftworld");
    if (target.space_hulk=1) then draw_text(xx+480,yy+196,string_hash_to_newline("Space Hulk"));
    
    if (target.p_type[pp]="Lava") and (target.p_population[pp]>0) then temp1=1;
    if (target.p_type[pp]="Lava") and (target.p_population[pp]=0) then temp1=0;
    if (target.p_type[pp]="Desert") then temp1=2;
    if (target.p_type[pp]="Dead") then temp1=10;
    if (target.p_type[pp]="Hive") then temp1=4;
    if (target.p_type[pp]="Temperate") then temp1=8;
    if (target.p_type[pp]="Feudal") then temp1=7;
    if (target.p_type[pp]="Agri") then temp1=6;
    if (target.p_type[pp]="Death") then temp1=5;
	if (target.p_type[pp]="Ice") then temp1=9;
    if (target.p_type[pp]="Forge") then temp1=3;  
    if (target.p_type[pp]="Daemon") then temp1=11;
	if (target.p_type[pp]="Craftworld") then temp1=12;
    if (target.p_type[pp]="Space Hulk") then temp1=14;
    if (target.p_type[pp]="Shrine") then temp1=16;
    
    // draw_sprite(spr_planet_splash,temp1,xx+349,yy+194);
    scr_image("planet",temp1,xx+349,yy+194,128,128);
    draw_rectangle(xx+349,yy+194,xx+477,yy+322,1);
    draw_set_font(fnt_40k_14);
    
    
    if (target.p_large[pp]=0){
        var temp2;temp2=string(scr_display_number(target.p_population[pp]));
        draw_text(xx+480,yy+220,string_hash_to_newline("Population: "+string(temp2)));
    }
    if (target.p_large[pp]=1){
        draw_text(xx+480,yy+220,string_hash_to_newline("Population: "+string(target.p_population[pp])+" billion"));
    }
    
    if (target.craftworld=0) and (target.space_hulk=0){
        var temp3,y7;y7=240;temp3=string(scr_display_number(target.p_guardsmen[pp]));
        if (target.p_guardsmen[pp]>0){draw_text(xx+480,yy+y7,string_hash_to_newline("Imperial Guard: "+string(temp3)));y7+=20;}
        if (target.p_owner[pp]!=8){var temp4;temp4=string(scr_display_number(target.p_pdf[pp]));draw_text(xx+480,yy+y7,string_hash_to_newline("Defense Force: "+string(temp4)));}
        if (target.p_owner[pp]=8){var temp4;temp4=string(scr_display_number(target.p_pdf[pp]));draw_text(xx+480,yy+y7,string_hash_to_newline("Gue'Vesa Force: "+string(temp4)));}
    }
    
    var temp5;temp5="";
    
    
    if (target.space_hulk=0){
        if (improve=1){
            draw_set_color(c_green);draw_rectangle(xx+481,yy+280,xx+716,yy+298,0);
            draw_sprite(spr_requisition,0,xx+657,yy+283);
            
            
            var improve_cost,yep,o;improve_cost=1500;
            o=0;yep=0;repeat(4){o+=1;if (obj_ini.adv[o]="Siege Masters") then yep=1;}if (yep=1) then improve_cost=1100;
            
            draw_set_color(0);
            draw_text(xx+671-1,yy+281-1,string_hash_to_newline(string(improve_cost)));
            draw_text(xx+671+1,yy+281-1,string_hash_to_newline(string(improve_cost)));
            draw_text(xx+671+1,yy+281+1,string_hash_to_newline(string(improve_cost)));
            draw_text(xx+671-1,yy+281+1,string_hash_to_newline(string(improve_cost)));
            draw_set_color(16291875);
            draw_text(xx+671,yy+281,string_hash_to_newline(string(improve_cost)));
            
            if (scr_hit(xx+481,yy+282,xx+716,yy+300)=true){
                draw_set_color(0);draw_set_alpha(0.2);draw_rectangle(xx+481,yy+280,xx+716,yy+298,0);
                if (obj_controller.cooldown<=0) and (obj_controller.mouse_left=1) and (obj_controller.requisition>=improve_cost){
                    obj_controller.cooldown=8000;obj_controller.requisition-=improve_cost;target.p_fortified[pp]+=1;
                    
                    if (target.dispo[pp]>0) and (target.dispo[pp]<=100){
                        if (target.p_fortified[pp]=1) then target.dispo[pp]=min(100,target.dispo[pp]+8);
                        if (target.p_fortified[pp]=2) then target.dispo[pp]=min(100,target.dispo[pp]+7);
                        if (target.p_fortified[pp]=3) then target.dispo[pp]=min(100,target.dispo[pp]+6);
                        if (target.p_fortified[pp]=4) then target.dispo[pp]=min(100,target.dispo[pp]+5);
                        if (target.p_fortified[pp]=5) then target.dispo[pp]=min(100,target.dispo[pp]+4);
                    }
                }
                
            }
            draw_set_alpha(1);draw_set_color(0);
        }
        
        if (target.p_fortified[pp]=0) then temp5="None";if (target.p_fortified[pp]=1) then temp5="Sparse";
        if (target.p_fortified[pp]=2) then temp5="Light";if (target.p_fortified[pp]=3) then temp5="Moderate";
        if (target.p_fortified[pp]=4) then temp5="Heavy";if (target.p_fortified[pp]=5) then temp5="Major";
        if (target.p_fortified[pp]=6) then temp5="Extreme";
        draw_text(xx+480,yy+280,string_hash_to_newline("Defenses: "+string(temp5)));
    }
    
    draw_set_color(c_gray);
    
    if (target.space_hulk=1){
        temp5="Integrity: "+string(floor(target.p_fortified[pp]*20))+"%";
        draw_text(xx+480,yy+280,string_hash_to_newline(string(temp5)));
    }
    
    var temp6;temp6="???";
    if (max(target.p_heresy[pp],target.p_influence[pp])<=10) then temp6="None";
    if (max(target.p_heresy[pp],target.p_influence[pp])>10) and (max(target.p_heresy[pp],target.p_influence[pp])<=30) then temp6="Little";
    if (max(target.p_heresy[pp],target.p_influence[pp])>30) and (max(target.p_heresy[pp],target.p_influence[pp])<=50) then temp6="Major";
    if (max(target.p_heresy[pp],target.p_influence[pp])>50) and (max(target.p_heresy[pp],target.p_influence[pp])<=70) then temp6="Heavy";
    if (max(target.p_heresy[pp],target.p_influence[pp])>70) and (max(target.p_heresy[pp],target.p_influence[pp])<=96) then temp6="Extreme";
    if (target.p_heresy[pp]>=96) or (target.p_influence[pp]>=96) then temp6="Maximum";
    draw_text(xx+480,yy+300,string_hash_to_newline("Corruption: "+string(temp6)));
    
    
    draw_set_font(fnt_40k_14b);
    draw_text(xx+349,yy+326,string_hash_to_newline("Planet Forces"));
    draw_text(xx+535,yy+326,string_hash_to_newline("Planet Features"));
    draw_set_font(fnt_40k_14);
    
    
    var temp8,t;temp8="";t=-1;
    repeat(8){
        var ahuh,ahuh2,ahuh3;ahuh="";ahuh2=0;ahuh3=0;t+=1;
        
        if (t=0){ahuh="Adepta Sororitas: ";ahuh2=target.p_sisters[pp];}
        if (t=1){ahuh="Ork Presence: ";ahuh2=target.p_orks[pp];}
        if (t=2){ahuh="Tau Presence: ";ahuh2=target.p_tau[pp];}
        if (t=3){ahuh="Tyranid Presence: ";ahuh2=target.p_tyranids[pp];}
        if (t=4){ahuh="Traitor Presence: ";ahuh2=target.p_traitors[pp];if (ahuh2>6) then ahuh="Daemon Presence: ";}
        if (t=5){ahuh="CSM Presence: ";ahuh2=target.p_chaos[pp];}
        if (t=6){ahuh="Daemon Presence: ";ahuh2=target.p_demons[pp];}
        if (t=7){ahuh="Necron Presence: ";ahuh2=target.p_necrons[pp];}
        
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
	var planet_displays = "";
	var feat_count;
	var feat_count = array_length(target.p_feature[pp]);
	if ( feat_count > 0){
	for (var i =0; i <  feat_count ;i++){
		if (target.p_feature[pp][i].planet_display != 0){
			if (target.p_feature[pp][i].player_hidden == 1){planet_displays += "???? |"}else{
				planet_displays += target.p_feature[pp][i].planet_display + "|";
			}
		}
	}}
    t=0;to_show=string_count("|",planet_displays);
    if (to_show>0){
        explode_script(planet_displays,"|");
        t+=1;if (to_show>=t) then fit[t]=string_replace(string(explode[0]),"|","");if (string_count("WL",fit[t])>0) and (string_count(fit[t],obj_controller.useful_info)=0) then fit[t]="";
        t+=1;if (to_show>=t) then fit[t]=string_replace(string(explode[1]),"|","");if (string_count("WL",fit[t])>0) and (string_count(fit[t],obj_controller.useful_info)=0) then fit[t]="";
        t+=1;if (to_show>=t) then fit[t]=string_replace(string(explode[2]),"|","");if (string_count("WL",fit[t])>0) and (string_count(fit[t],obj_controller.useful_info)=0) then fit[t]="";
        t+=1;if (to_show>=t) then fit[t]=string_replace(string(explode[3]),"|","");if (string_count("WL",fit[t])>0) and (string_count(fit[t],obj_controller.useful_info)=0) then fit[t]="";
        t+=1;if (to_show>=t) then fit[t]=string_replace(string(explode[4]),"|","");if (string_count("WL",fit[t])>0) and (string_count(fit[t],obj_controller.useful_info)=0) then fit[t]="";
        
        t=0;
        t+=1;if (fit[t]!="") then temp9+=string(fit[t])+"#";
        t+=1;if (fit[t]!="") then temp9+=string(fit[t])+"#";
        t+=1;if (fit[t]!="") then temp9+=string(fit[t])+"#";
        t+=1;if (fit[t]!="") then temp9+=string(fit[t])+"#";
        t+=1;if (fit[t]!="") then temp9+=string(fit[t])+"#";
    }
    draw_text(xx+535,yy+346,string_hash_to_newline(string(temp9)));
    
    
    if (obj_controller.selecting_planet>0){
        var pppp,pp;pppp=obj_controller.selecting_planet;pp=pppp;
        draw_set_color(c_black);
        draw_set_halign(fa_center);
        
        /*if (obj_controller.recruiting_worlds_bought>0) and (target.p_owner[obj_controller.selecting_planet]<=5) and (obj_controller.faction_status[target.p_owner[obj_controller.selecting_planet]]!="War"){
            if (string_count("Recr",target.p_feature[obj_controller.selecting_planet])=0){
                button4="+Recruiting";
            }
        }*/
        
        var lol,butt,lx,ly;
        lol=0;lx=xx+348;ly=yy+461-28;butt="";
        
        if (debug=0) then repeat(4){ly+=28;lol+=1;butt="";
            if (lol=1) then butt=button1;if (lol=2) then butt=button2;
            if (lol=3) then butt=button3;if (lol=4) then butt=button4;
            
            if (butt!=""){
                draw_set_color(c_gray);draw_rectangle(lx,ly,lx+246,ly+26,0);
                draw_set_color(c_black);draw_set_halign(fa_center);
                draw_set_font(fnt_40k_14b);draw_text(lx+123,ly+4,string_hash_to_newline(string(butt)));
                draw_set_color(c_white);draw_set_alpha(0.2);
                if (scr_hit(lx,ly,lx+246,ly+26)=true) then draw_rectangle(lx,ly,lx+246,ly+26,0);
            }
            draw_set_alpha(1);
        }
        
        
        
        
        /*if (target.p_first[pp]=1){
            if (mouse_x>=xx+363) and (mouse_y>=yy+194) and (mouse_x<xx+502) and (mouse_y<yy+204){
                if (string_count("Monastery",target.p_feature[pp])>0){
                    var wid,hei,tex;draw_set_halign(fa_left);
                    tex=string(target.p_lasers[pp])+" Defense Laser, "+string(target.p_defenses[pp])+" Weapon Emplacements, "+string(target.p_silo[pp])+" Missile Silo";
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
    var xx,yy,pp;
    xx=__view_get( e__VW.XView, 0 )+0;
    yy=__view_get( e__VW.YView, 0 )+0;
    
    if (scr_hit(xx+274,yy+426,xx+337,yy+451)=true) and (obj_controller.cooldown<=0) and (obj_controller.mouse_left=1){
        debug=0;obj_controller.cooldown=8000;exit;
    }
    
    xx=__view_get( e__VW.XView, 0 )+27;
    yy=__view_get( e__VW.YView, 0 )+165;
    pp=obj_controller.selecting_planet;
    
    draw_set_color(c_black);draw_rectangle(xx+9,yy+9,xx+310,yy+260,0);
    draw_set_font(fnt_40k_14b);draw_set_color(c_gray);draw_set_halign(fa_left);
    
    draw_text(xx+11,yy+11,string_hash_to_newline("Orks: "+string(target.p_orks[pp])));
    draw_text(xx+11,yy+31,string_hash_to_newline("Tau: "+string(target.p_tau[pp])));
    draw_text(xx+11,yy+51,string_hash_to_newline("Tyranids: "+string(target.p_tyranids[pp])));
    draw_text(xx+11,yy+71,string_hash_to_newline("Traitors: "+string(target.p_traitors[pp])));
    draw_text(xx+11,yy+91,string_hash_to_newline("CSM: "+string(target.p_chaos[pp])));
    draw_text(xx+11,yy+111,string_hash_to_newline("Daemons: "+string(target.p_demons[pp])));
    draw_text(xx+11,yy+131,string_hash_to_newline("Necrons: "+string(target.p_necrons[pp])));
    draw_text(xx+11,yy+151,string_hash_to_newline("Sisters: "+string(target.p_sisters[pp])));
    
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
            if (mouse_y>=yy+11) and (mouse_y<yy+31){target.p_orks[pp]-=1;cool=true;}
            if (mouse_y>=yy+31) and (mouse_y<yy+51){target.p_tau[pp]-=1;cool=true;}
            if (mouse_y>=yy+51) and (mouse_y<yy+71){target.p_tyranids[pp]-=1;cool=true;}
            if (mouse_y>=yy+71) and (mouse_y<yy+91){target.p_traitors[pp]-=1;cool=true;}
            if (mouse_y>=yy+91) and (mouse_y<yy+111){target.p_chaos[pp]-=1;cool=true;}
            if (mouse_y>=yy+111) and (mouse_y<yy+131){target.p_demons[pp]-=1;cool=true;}
            if (mouse_y>=yy+131) and (mouse_y<yy+151){target.p_necrons[pp]-=1;cool=true;}
            if (mouse_y>=yy+151) and (mouse_y<yy+171){target.p_sisters[pp]-=1;cool=true;}
        }
        if (mouse_x>=xx+150) and (mouse_x<xx+170){
            if (mouse_y>=yy+11) and (mouse_y<yy+31){target.p_orks[pp]+=1;cool=true;}
            if (mouse_y>=yy+31) and (mouse_y<yy+51){target.p_tau[pp]+=1;cool=true;}
            if (mouse_y>=yy+51) and (mouse_y<yy+71){target.p_tyranids[pp]+=1;cool=true;}
            if (mouse_y>=yy+71) and (mouse_y<yy+91){target.p_traitors[pp]+=1;cool=true;}
            if (mouse_y>=yy+91) and (mouse_y<yy+111){target.p_chaos[pp]+=1;cool=true;}
            if (mouse_y>=yy+111) and (mouse_y<yy+131){target.p_demons[pp]+=1;cool=true;}
            if (mouse_y>=yy+131) and (mouse_y<yy+151){target.p_necrons[pp]+=1;cool=true;}
            if (mouse_y>=yy+151) and (mouse_y<yy+171){target.p_sisters[pp]+=1;cool=true;}
        }
        if (cool=true) then obj_controller.cooldown=8000;
    }
}

/* */
}
}
}
/*  */