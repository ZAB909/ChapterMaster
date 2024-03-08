function scr_void_click() {

	var good;good=true;
	var xx,yy;xx=__view_get( e__VW.XView, 0 )+0;yy=__view_get( e__VW.YView, 0 )+0;

	if (obj_controller.cooldown>0) then good=false;
	if ((obj_controller.zoomed=0) and (mouse_y<__view_get( e__VW.YView, 0 )+62)) or (obj_controller.menu!=0) then good=false;
	if ((obj_controller.zoomed=0) and (mouse_y>__view_get( e__VW.YView, 0 )+830)) or (obj_controller.menu!=0) then good=false;


    if (instance_exists(obj_fleet_select)){
         if (obj_fleet_select.currently_entered) then good=false;
    }


	if (instance_exists(obj_star_select)){
	    if (obj_controller.selecting_planet>0){// This prevents clicking onto a new star by pressing the buttons or planet panel
	        if (scr_hit(xx+27,yy+166,xx+727,yy+458)) and (instance_exists(obj_star_select)){if (obj_star_select.button1!="") then good=false;}
	        if (scr_hit(xx+348,yy+461,xx+348+246,yy+461+26)) and (instance_exists(obj_star_select)){if (obj_star_select.button1!="") then good=false;}
	        if (scr_hit(xx+348,yy+489,xx+348+246,yy+489+26)) and (instance_exists(obj_star_select)){if (obj_star_select.button2!="") then good=false;}
	        if (scr_hit(xx+348,yy+517,xx+348+246,yy+517+26)) and (instance_exists(obj_star_select)){if (obj_star_select.button3!="") then good=false;}
	        if (scr_hit(xx+348,yy+545,xx+348+246,yy+545+26)) and (instance_exists(obj_star_select)){if (obj_star_select.button4!="") then good=false;}
	    }
	}

	if (obj_controller.popup=3){// Prevent hitting through the planet select
	    if (scr_hit(xx+27,yy+165,xx+347,yy+459)=true) then good=false;
	    if (obj_controller.selecting_planet>0){
	        if (scr_hit(xx+27,yy+165,xx+728,yy+459)=true) then good=false;// The area with the planetary info
	    }
	}

	if (obj_controller.menu=60) and (scr_hit(xx+27,yy+165,xx+651,yy+597)=true) then good=false;// Build menu


	return(good);


}
