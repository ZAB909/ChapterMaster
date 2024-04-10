
if (obj_controller.cooldown<=0){
    var x2,y2,wid,hei;
    x2=__view_get( e__VW.XView, 0 )+x1;
    y2=__view_get( e__VW.YView, 0 )+y1;
    
    if (header=3){wid=177;hei=200;}
    if (header=2){wid=175;hei=200;}
    if (header=1){wid=122+16;hei=240;}
    
    if (mouse_x>=x2) and (mouse_y>=y2) and (mouse_x<x2+wid) and (mouse_y<y2+hei){
        obj_controller.cooldown=8000;obj_controller.managing=manage;
        
        with(obj_controller){
            if (managing!=0) and (managing<=15){
                var i;i=-1;man_size=0;selecting_location="";selecting_types="";selecting_ship=0;sel_uid=0;
                reset_manage_arrays();
                repeat(501){i+=1;
                    sh_ide[i]=0;sh_uid[i]=0;sh_name[i]="";sh_class[i]="";sh_loc[i]="";sh_hp[i]="";sh_cargo[i]=0;sh_cargo_max[i]="";
                }
                alll=0;
                if (managing<=10) then scr_company_view(managing);
                if (managing>20) then scr_company_view(managing);
                if (managing>10) and (managing<=20) then scr_special_view(managing);
                cooldown=10;sel_loading=0;unload=0;alarm[6]=7;
            }
        }
        with(obj_managment_panel){instance_destroy();}
        instance_destroy();
    }
}

