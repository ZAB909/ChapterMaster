


if (other.x=self.x) and (other.y=self.y) and (action="") and (other.action="") and (other.owner  = eFACTION.Player){
    if (other.id>self.id){
        
        
        var w, new_fleet, cap, fri, esc, tempp;
        
        cap=other.capital_number;
        fri=other.frigate_number;
        esc=other.escort_number;
        
        
        w=0;
        repeat(capital_number){
            cap+=1;w+=1;
            other.capital_num[cap]=capital_num[w];
            other.capital_uid[cap]=capital_uid[w];
            other.capital[cap]=capital[w];
            other.capital_number+=1;
        }
        
        w=0;
        repeat(frigate_number){
            fri+=1;w+=1;
            other.frigate_num[fri]=frigate_num[w];
            other.frigate_uid[fri]=frigate_uid[w];
            other.frigate[fri]=frigate[w];
            other.frigate_number+=1;
        }
    
        w=0;
        repeat(escort_number){
            esc+=1;w+=1;
            other.escort_num[esc]=escort_num[w];
            other.escort_uid[esc]=escort_uid[w];
            other.escort[esc]=escort[w];
            other.escort_number+=1;
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


