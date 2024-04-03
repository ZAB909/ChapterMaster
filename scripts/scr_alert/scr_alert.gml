function scr_alert(colour, alert_type, alert_text, xx=00, yy=00) {

	// color / type / text /x/y

	// Quenes up one of the ALERT lines of text to be displayed by the obj_turn_end object
	// If the Y argument is >0 then the exclamation popup (obj_alert) is also created on the map



	// if (obj_turn_end.alerts>0){
	if (instance_exists(obj_turn_end)){
	    if (obj_turn_end.alert_type[obj_turn_end.alerts]!="-"+string(alert_text)) and (alert_type!="blank") and (colour!="blank"){
	        obj_turn_end.alerts+=1;
	        obj_turn_end.alert[obj_turn_end.alerts]=1;
	        obj_turn_end.alert_color[obj_turn_end.alerts]=colour;
	        // if (colour="purple") then obj_turn_end.alert_color[obj_turn_end.alerts]="red";
	        obj_turn_end.alert_type[obj_turn_end.alerts]=alert_type;
	        obj_turn_end.alert_text[obj_turn_end.alerts]="-"+string(alert_text);
	        obj_turn_end.alert[obj_turn_end.alerts]=1;
	    }
	}


	if (yy>0) or (yy<-10000){
	    var new_obj
    
	    if (xx<-15000){xx+=20000;yy+=20000;}
	    if (xx<-15000){xx+=20000;yy+=20000;}
	    if (xx<-15000){xx+=20000;yy+=20000;}
	    if (xx<-15000){xx+=20000;yy+=20000;}
	    if (xx<-15000){xx+=20000;yy+=20000;}
	    if (xx<-15000){xx+=20000;yy+=20000;}
	    if (xx<-15000){xx+=20000;yy+=20000;}
	    if (xx<-15000){xx+=20000;yy+=20000;}
    
	    new_obj=instance_create(xx+16,yy-24,obj_star_event);
	    new_obj.col=colour;
	}


}
