
mouse_left=1;


if (room_get_name(room)="Creation"){
    if (hover[1]=1){
        cooldown=9999;button=1;fading=1;
    }
    exit;
}

if ((obj_main_menu.tim4/50)>=1) and (button=0){
    if (hover[1]=1){// New
        ini_open("saves.ini");var skap;skap=0;
        skap = ini_read_real("Data", "tutorial", 0);
        ini_close();cooldown=9999;button=1;
        
        if (skap=1){
            obj_main_menu_buttons.fading=1;obj_main_menu_buttons.crap=2;
            obj_main_menu_buttons.cooldown=9999;
        }
        if (skap=0){var pop;
            pop=instance_create(0,0,obj_popup);
            pop.size=1;pop.title="Tutorial";
            pop.text="Would you like to play the tutorial?  It is strongly advisable for those new to Chapter Master.";
            pop.option1="Play the tutorial.";pop.option2="Skip the tutorial.";pop.option3="Skip and never ask again.";
        }
    }
    if (hover[2]=1){cooldown=9999;button=2;fading=1;}// Load?
    if (hover[3]=1){cooldown=9999;button=3;fading=1;}// Info
    if (hover[4]=1){cooldown=9999;button=4;fading=1;debugl("=========Exited Game from Main Menu");}// Exit
    if (hover[6]=1){
        cooldown=8000;button=6;fading=1;// Return from load
    }
}




