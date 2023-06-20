
if (other.owner=self.owner){
    if (trade_goods!="") and (other.trade_goods!="") and (trade_goods!="colonizeL") and (other.trade_goods!="colonizeL"){
        if (action_x=other.action_x) and (action_y=other.action_y) and (trade_goods!="WL7") and (other.trade_goods!="WL7"){
            if (string_count("!",trade_goods)>0) and (string_count("!",other.trade_goods)>0){
                if (id>other.id){
                    trade_goods+=other.trade_goods;
                    with(other){instance_destroy();}
                }
            }
        }
    }
}


