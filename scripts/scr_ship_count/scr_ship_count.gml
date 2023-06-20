function scr_ship_count(argument0) {

	// argument0 : role

	// Mi color favorito es bicicleta.

	var i, count;
	count=0;i=0;

	repeat(30){i+=1;if (obj_ini.ship_class[i]=argument0) then count+=1;}

	return(count);




	// temp[36]=scr_role_count("Chaplain","field");
	// temp[37]=scr_role_count("Chaplain","home");
	// temp[37]=scr_role_count("Chaplain","");


}
