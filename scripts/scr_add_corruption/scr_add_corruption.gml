function scr_add_corruption(is_fleet, amount) 
	{

		// argument0: fleet (true) or planet (false)
		// argument1: amount

		// Corrupts marines at the target location

		var total_ships, c, ship, m, co, ide;
		total_ships = capital_number + escort_number + frigate_number; // this is not used
		c = 0;
		ship = 0;
		m = 0;
		co = 0;
		ide = 0;

		if (is_fleet = true)
			{
			    repeat(capital_number)
					{
				        c += 1;
						ship = capital_num[c];
						co = 0;
						ide = 0;
				        if (obj_ini.ship_carrying[ship] > 0) then repeat(3500)
							{
					            if (co < 10)
									{
										ide += 1;
					                
										if (ide >= 300)
											{
												co += 1;
												ide = 1;
											}
						                if (obj_ini.lid[co,ide] = ship)
											{
							                    if (amount="1d3") then obj_ini.chaos[co,ide] += choose(1, 2, 3);
							                }
						            }
					        }
				    }
			    repeat(frigate_number)
				{
			        c += 1;
					ship = frigate_num[c];
					co = 0;
					ide = 0;
			        
					if (obj_ini.ship_carrying[ship] > 0) then repeat(3500)
						{
				            if (co < 10)
								{
									ide += 1;
					                if (ide >= 300)
										{
											co += 1;
											ide = 1;
										}
					                if (obj_ini.lid[co,ide] = ship)
										{
						                    if (amount="1d3") then obj_ini.chaos[co,ide] += choose(1, 2, 3);
						                }
					            }
				        }
			    } 
			    repeat(escort_number)
					{
				        c += 1;
						ship = escort_num[c];
						co = 0;
						ide = 0;
				        if (obj_ini.ship_carrying[ship] > 0) then repeat(3500)
							{
					            if (co < 10)
									{
										ide += 1;
						                if (ide >= 300)
											{	
												co += 1;
												ide = 1;
											}
						                if (obj_ini.lid[co,ide] = ship)
											{
							                    if (amount = "1d3") then obj_ini.chaos[co,ide] += choose(1, 2, 3);
							                }
						            }
					        }
				    }
			}
	}
