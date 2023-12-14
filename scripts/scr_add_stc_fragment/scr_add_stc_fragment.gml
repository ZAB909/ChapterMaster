function scr_add_stc_fragment() {

	var wik,onk;onk=-1;
	repeat(100){wik=choose(1,2,3,4);
	    if (wik=4) and (onk<=-1){
	        if (obj_controller.stc_wargear>obj_controller.stc_vehicles) and (obj_controller.stc_wargear>obj_controller.stc_ships){
	            wik=1;onk=0;
	        }
	        if (obj_controller.stc_vehicles>obj_controller.stc_wargear) and (obj_controller.stc_vehicles>obj_controller.stc_ships){
	            wik=2;onk=0;
	        }
	        if (obj_controller.stc_ships>obj_controller.stc_wargear) and (obj_controller.stc_ships>obj_controller.stc_vehicles){
	            wik=3;onk=0;
	        }
	    }

	    if (wik=1) and (obj_controller.stc_wargear_un+obj_controller.stc_wargear=MAX_STC_PER_SUBCATEGORY) then wik=2;
	    if (wik=2) and (obj_controller.stc_vehicles_un+obj_controller.stc_vehicles=MAX_STC_PER_SUBCATEGORY) then wik=3;
	    if (wik=3) and (obj_controller.stc_ships_un+obj_controller.stc_ships=MAX_STC_PER_SUBCATEGORY) then wik=1;
    
	    if (wik=1) and (onk<=0){obj_controller.stc_wargear_un+=1;onk=1;}
	    if (wik=2) and (onk<=0){obj_controller.stc_vehicles_un+=1;onk=1;}
	    if (wik=3) and (onk<=0){obj_controller.stc_ships_un+=1;onk=1;}
    
	    if (onk!=1) then onk=-1;
	}
	obj_controller.stc_un_total+=1;// found_stc+=1;

	scr_recent("stc","stc",obj_controller.stc_un_total);




}
