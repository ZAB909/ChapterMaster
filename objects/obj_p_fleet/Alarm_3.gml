
if (obj_controller.zoomed=1){obj_controller.x=self.x;obj_controller.y=self.y;}
obj_controller.popup=1;// 1: fleet, 2: other fleet, 3: other
selected=1;obj_controller.fleet_minimized=0;


var xx,yy;xx=x;yy=y;

obj_controller.selected=instance_nearest(xx,yy,obj_p_fleet);

// obj_controller.selected=self;
obj_controller.sel_owner=self.owner;
// show_message(obj_controller.selected);
obj_controller.cooldown=8;

if (obj_controller.zoomed=1){obj_controller.zoomed=0;__view_set( e__VW.Visible, 0, true );__view_set( e__VW.Visible, 1, false );obj_cursor.image_xscale=1;obj_cursor.image_yscale=1;}

// Pass variables to obj_controller.temp[t]=""; here
with(obj_fleet_select){instance_destroy();}
instance_create(x,y,obj_fleet_select);
obj_fleet_select.owner=self.owner;
obj_fleet_select.target=self.id;
obj_fleet_select.escort=escort_number;
obj_fleet_select.frigate=frigate_number;
obj_fleet_select.capital=capital_number;


var ship_count = array_length(ships);
for (var i = 0; i < ship_count; i++) {
	ships[i].selected = true;
	
	if (obj_controller.fest_scheduled > 0 && obj_controller.fest_sid == ships[i]){
		ships[i].selected = false;
	}
}

/*var ii;ii=0;ii+=capital_number;ii+=round((frigate_number/2));ii+=round((escort_number/4));
if (ii<=1) then ii=1;image_index=ii;*/


/* */
/*  */
