
type=0;size=2;y_scale=1;
if (size=1) then sprite_index=spr_popup_small;
if (size=2) then sprite_index=spr_popup_medium;
if (size=3) then sprite_index=spr_popup_large;
image_wid=0;image_hei=0;image="";

master_crafted=0;hide=false;
if (instance_exists(obj_controller)){if (obj_controller.popup_master_crafted!=0) then master_crafted=obj_controller.popup_master_crafted;}
type=0;
size=2;
image="";
title="";
fancy_title=0;
text_center=0;
text="";
text2="";
option1="";
option2="";
option3="";
option4="";
amount=0;
save=0;
loc="";
planet=0;
estimate=0;
mission="";
old_tags="";
giveto=0;
inq_hide=0;
ma_co=0;
ma_id=0;
ma_name="";
manag=0;
fallen=0;
ship_lost=0;
battle_special=0;
owner=0;
tab=1;
woopwoopwoop=0;
press=0;
reset=0;
demand=0;

company=0;
target_comp=-1;
target_role=0;
unit_role="";
units=0;
min_exp=0;
cooldown=20;
all_good=0;

new_target=0;

if (instance_exists(obj_controller)){obj_controller.cooldown=9999;}
number=0;
company_promote_data = [
    [1030,230,150],//1st company
    [1140,230,120],
    [1250,230,110],
    [1360,230,100],
    [1470,230,80],
    [1030,250,70],
    [1140,250,60],
    [1250,250,50],
    [1360,250,40],
    [1470,250,0],//10th company
]
var i;i=-1;
repeat(11){i+=1;role_name[i]="";role_exp[i]=0;}

req_armour="";req_armour_num=0;have_armour_num=0;
req_gear="";req_gear_num=0;have_gear_num=0;
req_wep1="";req_wep1_num=0;have_wep1_num=0;
req_wep2="";req_wep2_num=0;have_wep2_num=0;
req_mobi="";req_mobi_num=0;have_mobi_num=0;

o_wep1="";o_wep2="";o_armour="";o_gear="";o_mobi="";
n_wep1="";n_wep2="";n_armour="";n_gear="";n_mobi="";
a_wep1="";a_wep2="";a_armour="";a_gear="";a_mobi="";
n_good1=1;n_good2=1;n_good3=1;n_good4=1;n_good5=1;
sel1=0;sel2=0;sel3=0;sel4=0;sel5=0;
vehicle_equipment=0;warning="";
var i;i=-1;
repeat(51){
    i+=1;item_name[i]="";
}

