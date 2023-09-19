// Manages ship and unit selection depending on menus
var __b__ = action_if_number(obj_popup, 0, 0);
if (__b__){
    if (menu==1) and (managing>0) and (man_max>0){
        if (man_current>1) then man_current-=1;
        if (man_current>1) then man_current-=1;
    }
    if (menu==30) and (managing>0) and (man_max>=10){
        if (ship_current>1) then ship_current-=1;
        if (ship_current>1) then ship_current-=1;
    }
    if (menu==30) and (managing>0) and (man_max>=50){
        if (ship_current>1) then ship_current-=1;
        if (ship_current>1) then ship_current-=1;
    }
    if (menu==16) and (man_current>1){
        if (man_current>1) then man_current-=1;
        if (man_current>1) then man_current-=1;
    }
}
