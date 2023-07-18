function scr_has_disadv(disadvantage){
	var disadv_count = array_length(obj_ini.dis);
	for(var i = 0; i < disadv_count; i++){
		if(obj_ini.dis[i] == disadvantage){
			return true;
		}
	}
	return false;
}