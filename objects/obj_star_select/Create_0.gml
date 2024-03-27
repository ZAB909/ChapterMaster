
owner=0;
target=instance_nearest(x,y,obj_star);
loading=0;
loading_name="";
alarm[0]=1;
debug=0;

population=0;
guard=0;
pdf=0;
fortification=0;
corruption=0;
ork=0;
tau=0;
chaos=0;
torpedo=scr_item_count("Cyclonic Torpedo");

feature="";
garrison="";
garrison_data_slate = new data_slate();
garrison_data_slate.title = "Garrison Report"
main_data_slate = new data_slate();

buttons_selected = false;
button1="";
button2="";
button3="";
button4="";
button5="";
        
shutter_1 = new shutter_button();
shutter_2 = new shutter_button();
shutter_3 = new shutter_button();
shutter_4 = new shutter_button();
shutter_5 = new shutter_button();
attack=0;
raid=0;
bombard=0;
purge=0;

player_fleet=0;
imperial_fleet=0;
mechanicus_fleet=0;
inquisitor_fleet=0;
eldar_fleet=0;
ork_fleet=0;
tau_fleet=0;
tyranid_fleet=0;
heretic_fleet=0;

en_fleet[0]=0;
var i;i=-1;
repeat(15){i+=1;en_fleet[i]=0;}

if (obj_controller.menu=0) then alarm[1]=1;

