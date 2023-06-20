
exit;

if (other.sprite_index!=self.sprite_index) then exit;// No colonists and fleets bashing together

if (other.action="") and (action="") and (other.owner=owner) and (string_count("her",trade_goods)=0) and (string_count("her",other.trade_goods)=0){
    if (obj_controller.faction_status[2]="War") and (instance_nearest(x,y,obj_star).owner=1) and (owner=2) and (other.owner=2){
        if (id>other.id){
            guardsmen+=other.guardsmen;
            capital_number+=other.capital_number;
            frigate_number+=other.frigate_number;
            escort_number+=other.escort_number;
            with(other){instance_destroy();}
        }
    }
}

