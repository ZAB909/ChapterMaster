function create_boarding_craft(target_ship){
    show_debug_message("start_boarding")
    var first=0,o=1;
    
    repeat(500){
        o+=1;
        if (first=0) and (board_id[o]!=0) and (board_location[o]=0) then first=o;
    }
    
    board_cooldown=45;
    
    var bear=instance_create(x,y,obj_p_assra);
    bear.apothecary=0;
    o=first;
    
    while(o<500 && o<first+20){
        if (board_id[o]!=0) and (board_location[o]=0){
            board_raft[o]=bear;
            board_location[o]=-1;
            boarders-=1;
            bear.boarders+=1;
            unit = fetch_unit([board_co[o] , board_id[o]]);
            if (unit.IsSpecialist("apoth")){
                if (unit.gear()=="Narthecium") and (unit.hp()>=10) then bear.apothecary+=1;
            }
        }
        o+=1;
    }
    
    bear.apothecary_had=bear.apothecary;
    
    bear.target=target_ship;
    bear.direction=direction;
    bear.origin=self.id;
    bear.speed=4;
    bear.firstest=first;
    
    if (boarders<=0) then obj_cursor.board=0;
}