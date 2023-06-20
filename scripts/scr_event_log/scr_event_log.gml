function scr_event_log(argument0, argument1) {

	// argument0: color
	// argument1: text

	if (instance_exists(obj_event_log)){
    
	    var o;o=599;
	    repeat(1000){o-=1;
	        if (o>=1){
	            if (obj_event_log.event_text[o]!=""){
	                obj_event_log.event_text[o+1]=obj_event_log.event_text[o];
	                obj_event_log.event_date[o+1]=obj_event_log.event_date[o];
	                obj_event_log.event_turn[o+1]=obj_event_log.event_turn[o];
	                obj_event_log.event_color[o+1]=obj_event_log.event_color[o];
                
	                obj_event_log.event_text[o]="";
	                obj_event_log.event_date[o]="";
	                obj_event_log.event_turn[o]=0;
	                obj_event_log.event_color[o]="";
	            }
	        }
	    }
    
	    obj_event_log.event_color[1]=argument0;
	    obj_event_log.event_turn[1]=obj_controller.turn;
    
	    var yf;yf="";
	    if (obj_controller.year_fraction<10) then yf="00"+string(obj_controller.year_fraction);
	    if (obj_controller.year_fraction>=10) and (obj_controller.year_fraction<100) then yf="0"+string(obj_controller.year_fraction);
	    if (obj_controller.year_fraction>=100) then yf=string(obj_controller.year_fraction);
    
	    obj_event_log.event_date[1]=string(obj_controller.check_number)+" "+string(yf)+" "+string(obj_controller.year)+".M"+string(obj_controller.millenium);
	    obj_event_log.event_text[1]=argument1;


	}


}
