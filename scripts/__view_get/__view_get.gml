function __view_get(argument0, argument1) 
	{
		var __prop = argument0;
		var __index = argument1;

		var __res;
		var __cam = view_get_camera(__index);

		switch(__prop)
			{
				case e__VW.XView: 
					__res = camera_get_view_x(__cam); 
				break;
			
				case e__VW.YView:  
					__res = camera_get_view_y(__cam); 
				break;
			
				case e__VW.WView:  
					__res = camera_get_view_width(__cam); 
				break;
			
				case e__VW.HView:  
					__res = camera_get_view_height(__cam); 
				break;
			
				case e__VW.Angle:  
					__res = camera_get_view_angle(__cam); 
				break;
			
				case e__VW.HBorder: 
					__res = camera_get_view_border_x(__cam); 
				break;
			
				case e__VW.VBorder: 
					__res = camera_get_view_border_y(__cam); 
				break;
			
				case e__VW.HSpeed:  
					__res = camera_get_view_speed_x(__cam); 
				break;
			
				case e__VW.VSpeed:  
					__res = camera_get_view_speed_y(__cam); 
				break;
			
				case e__VW.Object:  
					__res = camera_get_view_target(__cam); 
				break;
			
				case e__VW.Visible: 
					__res = view_get_visible(__index); 
				break;
			
				case e__VW.XPort: 
					__res = view_get_xport(__index); 
				break;
			
				case e__VW.YPort: 
					__res = view_get_yport(__index); 
				break;
			
				case e__VW.WPort: 
					__res = view_get_wport(__index); 
				break;
			
				case e__VW.HPort: 
					__res = view_get_hport(__index); 
				break;
			
				case e__VW.Camera: 
					__res = view_get_camera(__index); 
				break;
			
				case e__VW.SurfaceID: 
					__res = view_get_surface_id(__index); 
				break;
			
				default:
					show_debug_message("Default case in __view_get this should not happen");
				break;
			};

		return __res;
	}
