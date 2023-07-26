if (ship.hp<ship.max_hp){
    obj_fleet.ships_damaged += 1;
    if (hp <= 0) then ++obj_fleet.ship_lost;
    
	//if (ship_id=1) and (obj_ini.fleet_type!=1) and (obj_ini.ship_class[1]="Battle Barge") {// I think this wants to check if that ship is your capital ship, we need a better way to indicate that
	//	if (obj_controller.und_gene_vaults=0){
	//		obj_controller.gene_seed=0;
	//		var w=0;
	//		repeat(120) {
	//			w+=1;
	//			if (obj_ini.slave_batch_num[w]>0) {
	//				obj_ini.slave_batch_num[w]=0;
	//				obj_ini.slave_batch_eta[w]=0;
	//			}
	//		}
    //    }
	//	if (obj_controller.und_gene_vaults>0) {
	//		obj_controller.gene_seed-=floor(obj_controller.gene_seed/10);
	//	}
	//}
}

