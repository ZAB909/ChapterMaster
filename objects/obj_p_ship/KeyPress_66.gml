
// if (obj_fleet.start!=5) then exit;

if (selected=1) and (boarders>0) and (board_cooldown<=0) and (point_distance(x,y,mouse_x,mouse_y)<=428){
    var first,o;
    first=0;o=0;
    
    repeat(500){o+=1;
        if (first=0) and (board_id[o]!=0) and (board_location[o]=0) then first=o;
    }
    
    
    // show_message("First marine to send is slot "+string(first)+", CO:"+string(board_co[first])+" ID:"+string(board_id[first]));
    
    board_cooldown=45;
    
    var bear;bear=instance_create(x,y,obj_p_assra);
    o=first;
    
    repeat(20){
        if (board_id[o]!=0) and (board_location[o]=0){
            board_raft[o]=bear;board_location[o]=-1;boarders-=1;bear.boarders+=1;
            if (obj_ini.role[board_co[o],board_id[o]]=obj_ini.role[100][15]) or (obj_ini.role[board_co[o],board_id[o]]="Master of Sanctity"){
                if (obj_ini.gear[board_co[o],board_id[o]]="Narthecium") and (obj_ini.hp[board_co[o],board_id[o]]>=10) then bear.apothecary+=1;
            }
        }
        o+=1;
    }
    bear.apothecary_had=bear.apothecary;
    
    var tar1,tar2,tar_final;
    tar1=instance_nearest(mouse_x,mouse_y,obj_en_ship);
    tar2=instance_nearest(mouse_x,mouse_y,obj_en_capital);
    
    if (!instance_exists(obj_en_capital)) and (instance_exists(obj_en_ship)) then tar_final=instance_nearest(mouse_x,mouse_y,obj_en_ship);
    if (instance_exists(obj_en_capital)){
        if ((point_distance(tar2.x,tar2.y,mouse_x,mouse_y)-32)<(point_distance(tar1.x,tar1.y,mouse_x,mouse_y))) then tar_final=instance_nearest(mouse_x,mouse_y,obj_en_capital);
        if ((point_distance(tar2.x,tar2.y,mouse_x,mouse_y)-32)>=(point_distance(tar1.x,tar1.y,mouse_x,mouse_y))) then tar_final=instance_nearest(mouse_x,mouse_y,obj_en_ship);
    }
    
    bear.target=tar_final;
    bear.direction=direction;
    bear.origin=self.id;
    bear.speed=4;
    bear.firstest=first;
    
    if (boarders<=0) then obj_cursor.board=0;
}


// board_co[i]=0;board_id[i]=0;board_location[i]=0;

