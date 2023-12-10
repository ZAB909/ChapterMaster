function __view_set_internal(argument0, argument1, argument2) 
	{
		var __prop = argument0;
		var __index = argument1;
		var __val = argument2;
	
		var __cam = view_get_camera(__index);

		switch(__prop)
			{
				case e__VW.XView: 
					camera_set_view_pos(__cam, __val, camera_get_view_y(__cam)); 
				break;
			
				case e__VW.YView: 
					camera_set_view_pos(__cam, camera_get_view_x(__cam), __val); 
				break;
			
				case e__VW.WView:  //This is not used anywhere
					camera_set_view_size(__cam, __val, camera_get_view_height(__cam)); 
				break;
			
				case e__VW.HView: //This is not used anywhere
					camera_set_view_size(__cam, camera_get_view_width(__cam), __val); 
				break;
			
				case e__VW.Angle: //This is not used anywhere 
					camera_set_view_angle(__cam, __val); 
				break;
			
				case e__VW.HBorder://This is not used anywhere 
					camera_set_view_border(__cam, __val, camera_get_view_border_y(__cam)); 
				break;
			
				case e__VW.VBorder: //This is not used anywhere
					camera_set_view_border(__cam, camera_get_view_border_x(__cam), __val); 
				break;
			
				case e__VW.HSpeed: //This is not used anywhere
					camera_set_view_speed(__cam, __val, camera_get_view_speed_y(__cam)); 
				break;
			
				case e__VW.VSpeed: //This is not used anywhere
					camera_set_view_speed(__cam, camera_get_view_speed_x(__cam), __val); 
				break;
			
				case e__VW.Object: //This is not used anywhere
					camera_set_view_target(__cam, __val); 
				break;
		
				case e__VW.Visible: // used for spacebar zoom in/out
					__res = view_set_visible(__index, __val); 
				break;
		
				case e__VW.XPort: //This is not used anywhere
					__res = view_set_xport(__index, __val); 
				break;
		
				case e__VW.YPort: //This is not used anywhere
					__res =	view_set_yport(__index, __val); 
				break;
		
				case e__VW.WPort: //This is not used anywhere
					__res = view_set_wport(__index, __val); 
				break;
		
				case e__VW.HPort: //This is not used anywhere
					__res = view_set_hport(__index, __val); 
				break;
		
				case e__VW.Camera: //This is not used anywhere
					__res = view_set_camera(__index, __val); 
				break;
		
				case e__VW.SurfaceID: //This is not used anywhere
					__res = view_set_surface_id(__index, __val); 
				break;
				
				default: 
					show_debug_message("Default case in __view_set_internal this should not happen")
				break;
			};

		return 0;
	}
