function scr_has_adv(advantage){
	var adv_count = array_length(obj_ini.adv);
	for(var i = 0; i < adv_count; i++){
		if(obj_ini.adv[i] == advantage){
			return true;
		}
	}
	return false;
}