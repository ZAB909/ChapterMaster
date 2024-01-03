/// @description Insert description here
// You can write your code in this editor



if (!finished)and (countdown==0){
	if (!management_entered){		// enter manage area
		with (obj_controller){
		        scr_management(1);
		        menu=1;
		        onceh=1;
		        cooldown=8000;
		        click=1;
		        popup=0;
		        selected=0;
		        hide_banner=1;
		        with(obj_star_select){instance_destroy();}
		        with(obj_fleet_select){instance_destroy();}
		    }
        management_entered =true;
        completed_company=true;
	} else if (!management_finished) and (obj_controller.cooldown<=0){
		if(current_manage>=0 && current_manage<16){ //company loop
			if (completed_company){
				current_manage++;
				obj_controller.managing++;
				cooldown=8000;
				with (obj_controller){//reset company variables
					if (managing!=0) and (managing<=15){
			            man_size=0;
			            selecting_location="";
			            selecting_types="";
			            selecting_ship=0;
			            selecting_planet=0;
			            sel_uid=0;
			            for(var i=0; i<501; i++){
			                man[i]="";
			                ide[i]=0;
			                man_sel[i]=0;
			                ma_lid[i]=0;
			                ma_wid[i]=0;
			                ma_uid[i]=0;
			                ma_race[i]=0;
			                ma_loc[i]="";
			                ma_name[i]="";
			                ma_role[i]="";
			                ma_wep1[i]="";
			                ma_wep2[i]="";
			                ma_armour[i]="";
			                ma_health[i]=100;
			                ma_chaos[i]=0;
			                ma_exp[i]=0;
			                ma_promote[i]=0;
			                sh_ide[i]=0;
			                sh_uid[i]=0;
			                sh_name[i]="";
			                sh_class[i]="";
			                sh_loc[i]="";
			                sh_hp[i]="";
			                sh_cargo[i]=0;
			                sh_cargo_max[i]="";
			                squad[i]=0;
			            }
			            alll=0;
			            if (managing<=10) then scr_company_view(managing);
			            if (managing>10) then scr_special_view(managing);
			            cooldown=10;
			            sel_loading=0;
			            unload=0;
			            alarm[6]=7;
			        }
			        countdown=10 // add timer to wait until alarm[6] (above) has completed
		        }				
				completed_company=false;
			} else if (!completed_select_buttons) and (obj_controller.cooldown<=0){//test selecting and deselecting units
				if (!select_all){//test selecting all units in a given company
					while (counter<500){
						counter++
						while (obj_controller.man[counter]=="hide") and (counter<500){counter++;}
						if (obj_controller.man[counter]=="man"){
							obj_controller.man_sel[counter]=1;
							cooldown=8;
						};
					}
					if (counter>=500){
						select_all=true;
						counter=0;
					}
				} else if (!deselect_all){//test deslecting all units in a given company
					while (counter<500){
						counter++
						while (obj_controller.man[counter]=="hide") and (counter<500){counter++;}
						if (obj_controller.man[counter]=="man"){
							obj_controller.man_sel[counter]=0;
							cooldown=8;
						};
					}
					if (counter>=500){
						deselect_all=true;
						counter=0;
					}					
				} else {
					completed_select_buttons=true; //finish selcetion testing for company
				}
			} else if(completed_select_buttons){//finish selcting units and deselcting units
				completed_select_buttons=false
				deselect_all=false;
				select_all=false;
				completed_company=true;  //finish testing in current company
				if (current_manage==15){//complete testing all companies and reset variables
					management_finished =true;
					finished = false;
					obj_controller.managing=0;
					managing=0;
		            cooldown=8000;
		            scr_ui_refresh();
		            scr_management(1);
		            cooldown=8000;
		            click=1;
		            popup=0;
		            selected=0;
		            hide_banner=1;
				}			
			}
		}
	}else if (management_finished){
		finished=true;//finish test sequence
        menu=0;
        onceh=1;
        cooldown=8000;
        click=1;
        hide_banner=0;
		show_message("test completed");
	}
}
if (countdown>0){
	countdown--;
}

