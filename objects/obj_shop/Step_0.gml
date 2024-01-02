
if (click>0){click=-1;audio_play_sound(snd_click,-100,0);audio_sound_gain(snd_click,0.25*obj_controller.master_volume*obj_controller.effect_volume,0);}
if (click2>0){click2=-1;audio_play_sound(snd_click,-100,0);audio_sound_gain(snd_click,0.25*obj_controller.master_volume*obj_controller.effect_volume,0);}

hover=0;
var i,xx,yy,x2,y2;i=0;
xx=__view_get( e__VW.XView, 0 )+0;
yy=__view_get( e__VW.YView, 0 )+0;

if (construction_started>0) then construction_started-=1;

x2=962;
y2=107;
tooltip_show=0;


if (instance_exists(obj_ingame_menu)) then exit;
var equip_data;
repeat(39){
    i+=1;y2+=20;
    
    if (item[i]!="") and (mouse_x>=xx+962) and (mouse_y>=yy+y2) and (mouse_x<xx+1100) and (mouse_y<yy+y2+19) and (shop!="warships"){
        tooltip_stat1=0;tooltip_stat2=0;tooltip_stat3=0;tooltip_stat4=0;tooltip_other="";wep_data="";
        marine_armour[0]="";
        equip_data=gear_weapon_data("any",item[i],"all");
        if (is_struct(equip_data)){
            tooltip=$"{equip_data.description}#{equip_data.special_description_gen()}";
        }
        tooltip_x=mouse_x;
        tooltip_y=mouse_y+12;
        tooltip_show=1;
    }
    
    if (item[i]!="") /*and (nobuy[i]=0)*/ and (mouse_x>=xx+x2) and (mouse_y>=yy+y2+1) and (xx+1579) and (mouse_y<yy+y2+19){
        hover=i;
    }  
}

/* */
/*  */
