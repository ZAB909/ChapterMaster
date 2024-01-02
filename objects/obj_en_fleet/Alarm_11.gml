if (action="") and (orbiting != undefined)
	{
	    orbiting = instance_nearest(x, y, obj_star);
	    if (owner != 1) then orbiting.present_fleet[owner] += 1;
	}


