

if (num>0){// Hmmmmmmm
    var stah;stah=instance_nearest(x,y,obj_star);
    obj_controller.menu=0;
    
    if (stah.p_problem[num,1]="recon") or (stah.p_problem[num,2]="recon") or (stah.p_problem[num,3]="recon") or (stah.p_problem[num,4]="recon"){
        var pop;
        pop=instance_create(0,0,obj_popup);
        pop.image="inquisition";
        pop.title="Investigation Completed";
        pop.text="Your marines have scouted out "+string(stah.name)+" "+string(scr_roman(num))+" and satisfied the mission requirements.";
        
        pop.option1="Reload Marines";pop.option2="Do Nothing";
        
        scr_event_log("","Inquisition Mission Completed: Your Astartes have succesfully scouted "+string(stah.name)+" "+scr_roman(num)+".");
        
        if (stah.p_problem[num,1]="recon"){stah.p_problem[num,1]="";stah.p_timer[num,1]=-1;}
        if (stah.p_problem[num,2]="recon"){stah.p_problem[num,2]="";stah.p_timer[num,2]=-1;}
        if (stah.p_problem[num,3]="recon"){stah.p_problem[num,3]="";stah.p_timer[num,3]=-1;}
        if (stah.p_problem[num,4]="recon"){stah.p_problem[num,4]="";stah.p_timer[num,4]=-1;}
    }
}

