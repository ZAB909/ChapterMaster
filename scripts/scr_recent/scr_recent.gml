function scr_recent(argument0, argument1, argument2) {

	// argument0: type
	// argument1: keyword
	// argument2: number, if applicable

	// Add an entry to the end of the array
	if (string(argument0)!="") and (string(argument1)!=""){
	    var i;i=0;
	    obj_controller.recent_happenings+=1;
	    i=obj_controller.recent_happenings;
    
	    obj_controller.recent_type[i]=argument0;
	    obj_controller.recent_keyword[i]=argument1;
	    obj_controller.recent_turn[i]=obj_controller.turn;
	    obj_controller.recent_number[i]=argument2;
	}


	// Squish the array when asked to
	if (string(argument0)="") and (string(argument1)="") and (real(argument2)=0){
	    var i;i=0;obj_controller.recent_happenings-=1;    
	    repeat(499){i+=1;
	        if (obj_controller.recent_type[i]="") and (obj_controller.recent_type[i+1]!=""){
	            obj_controller.recent_type[i]=obj_controller.recent_type[i+1];
	            obj_controller.recent_keyword[i]=obj_controller.recent_keyword[i+1];
	            obj_controller.recent_turn[i]=obj_controller.recent_turn[i+1];
	            obj_controller.recent_number[i]=obj_controller.recent_number[i+1];
            
	            obj_controller.recent_type[i+1]="";obj_controller.recent_keyword[i+1]="";
	            obj_controller.recent_turn[i+1]=0;obj_controller.recent_number[i+1]=0;
	        }
	    }
	}


}
