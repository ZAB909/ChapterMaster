
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



var i;i=-1;
repeat(91){i+=1;
    if (i<=20) then capital_sel[i]=1;
    frigate_sel[i]=1;
    escort_sel[i]=1;
    
    if (obj_controller.fest_scheduled>0) and (obj_controller.fest_sid>0){
        if (i<=20){if (capital_num[i]=obj_controller.fest_sid) and (capital_sel[w]=1) then capital_sel[w]=0;}
        if (frigate_num[i]=obj_controller.fest_sid) and (frigate_sel[i]=1) then frigate_sel[i]=0;
        if (escort_num[i]=obj_controller.fest_sid) and (escort_sel[i]=1) then escort_sel[i]=0;
    }
}


/*var ii;ii=0;ii+=capital_number;ii+=round((frigate_number/2));ii+=round((escort_number/4));
if (ii<=1) then ii=1;image_index=ii;*/


/* */
/*  */
