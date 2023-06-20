
mouse_left=1;

if (instance_exists(obj_ingame_menu)){
    if (obj_ingame_menu.cooldown>0) then exit;
}

if (highlighted=true){
    if (target>10){
        obj_ingame_menu.effect=self.target;
    }
}

