


if (other.x=self.x) and (other.y=self.y) and (action="") and (other.action="") and (other.owner=1){
    if (other.id>self.id){
        
        
		var ship_count = array_length(other.ships);
		for(var i = 0; i < ship_count; i++) {
			array_push(other.ships, ships[i]);
			if(ships[i].size == SHIP_SIZE.capital) then other.capital_number++;
			else if(ships[i].size == SHIP_SIZE.frigate) then other.frigate_number++;
			else if(ships[i].size == SHIP_SIZE.escort) then other.escort_number++;
		}
		
        other.alarm[7]=1;
    
        if (instance_exists(obj_fleet_select)){
            if (obj_fleet_select.x=self.x) and (obj_fleet_select.y=self.y){
                with(obj_fleet_select){instance_destroy();}
                other.alarm[3]=1;
            }
        }
        
        instance_destroy();
    }
}


