
if (obj_ncombat.started=0){
    if (men+dreads+veh=0) then instance_destroy();
    // if (veh+dreads>0) then instance_destroy();
    obj_ncombat.player_forces+=self.men+self.veh+self.dreads;
    obj_ncombat.player_max+=self.men+self.veh+self.dreads;
    
    
    if (men<=4) and (veh=0) and (dreads=0){// Squish leftt
        var leftt=instance_nearest(x-12,y,obj_pnunit);
        
    
    }
    
    
    
}

if (obj_ncombat.red_thirst>=2) and (obj_ncombat.battle_over=0){
    if (men>0){
        var raar,r_roll,miss,r_lost;
        raar=0;miss="";r_lost=0;
        
        repeat(men+dreads){
            raar+=1;r_roll=floor(random(1000))+1;
            if (obj_ncombat.player_forces<(obj_ncombat.player_max*0.75)) then r_roll-=8;
            if (obj_ncombat.player_forces<(obj_ncombat.player_max/2)) then r_roll-=10;
            if (obj_ncombat.player_forces<(obj_ncombat.player_max/4)) then r_roll-=24;
            if (obj_ncombat.player_forces<(obj_ncombat.player_max/7)) then r_roll-=104;
            if (obj_ncombat.player_forces<(obj_ncombat.player_max/10)) then r_roll-=350;
            
            
            if (marine_dead[raar]=0) and (marine_type[raar]!="Death Company") and (marine_type[raar]!="Chapter Master") and (r_roll<=4){
                r_lost+=1;
                marine_type[raar]="Death Company";
                //marine_attack[raar]+=1;
                marine_defense[raar]=0.75;
                //marine_ranged[raar]=0.75;
                obj_ncombat.red_thirst+=1;
                if (r_lost=1) then miss+="Battle Brother "+string(obj_ini.name[marine_co[raar],marine_id[raar]])+", ";
                if (r_lost>1) then miss+=string(obj_ini.name[marine_co[raar],marine_id[raar]])+", ";
            }
        }
        if (r_lost>1) then string_replace(miss,"Battle Brother","Battle Brothers");
        
        
        var woo;woo=string_length(miss);
        miss=string_delete(miss,woo-1,2);// remove last
        
        if (string_count(", ",miss)=1){
            /*var woo;woo=string_rpos(", ",miss);
            miss=string_insert(" and",miss,woo+1);*/
            
            miss=string_replace(miss,", "," and ");
        }
        if (string_count(", ",miss)>1){
            var woo;woo=string_rpos(", ",miss);
            
            miss=string_delete(miss,woo-1,3);
            if (r_lost>=3) then miss=string_insert(", and ",miss,woo-1);
            if (r_lost=2) then miss=string_insert(" and ",miss,woo-1);
        }
        
        
        if (r_lost=1) then miss+=" has been lost to the Red Thirst!";
        if (r_lost>1) then miss+=" have been lost to the Red Thirst!";
        
        if (r_lost>0){
            obj_ncombat.newline=miss;
            obj_ncombat.newline_color="red";obj_ncombat.timer_pause=2;with(obj_ncombat){scr_newtext();}
        }
    }
}



if (obj_ncombat.started>=1){
    // Assault jump here
    
    // instance_deactivate_object(obj_cursor);
    
    /*
    var jump1,jump2,jumps;jump1=0;jump2=0;jumps=0;
    jump1=instance_nearest(x+20,y,obj_pnunit);
    jump2=string(marine_mobi);
    if (string_count("Jump Pack",jump2)>0){
        if (collision_point(jump1.x+10,jump1.y,obj_enunit,0,1)) and (jump1.id!=self.id) and (jump1.men>0){
            var jj,targ_manz;jj=0;targ_manz=jump1.men;
            repeat(700){
                jj+=1;
                
                if (marine_hp[jj]>0) and (marine_gear[jj]="Jump Pack"){
                    targ_manz+=1;jumps+=1;men-=1;jump1.men+=1;
                    
                    jump1.marine_type[targ_manz]=marine_type[jj];
                    jump1.marine_co[targ_manz]=marine_co[jj];
                    jump1.marine_id[targ_manz]=marine_id[jj];
                    jump1.marine_hp[targ_manz]=marine_hp[jj];
                    jump1.marine_ac[targ_manz]=marine_ac[jj];
                    jump1.marine_exp[targ_manz]=marine_exp[jj];
                    jump1.marine_wep1[targ_manz]=marine_wep1[jj];
                    jump1.marine_wep2[targ_manz]=marine_wep2[jj];
                    jump1.marine_armour[targ_manz]=marine_armour[jj];
                    jump1.marine_gear[targ_manz]=marine_gear[jj];
                    jump1.marine_mobi[targ_manz]=marine_mobi[jj];
                    jump1.marine_powers[targ_manz]=marine_powers[jj];
                    
                    marine_type[jj]="";
                    marine_co[jj]=0;
                    marine_id[jj]=0;
                    marine_hp[jj]=0;
                    marine_ac[jj]=0;
                    marine_exp[jj]=0;
                    marine_wep1[jj]="";
                    marine_wep2[jj]="";
                    marine_armour[jj]="";
                    marine_gear[jj]="";
                    marine_mobi[jj]="";
                    marine_powers[jj]="";
                }
            }
            
            
            if (jumps>0){
                obj_ncombat.newline="Jump-Packs rev and scream as "+(string(jumps)+" Marines take to the air, jumping towards the front lines.");
                obj_ncombat.newline_color="purple";obj_ncombat.timer_pause=2;with(obj_ncombat){scr_newtext();}
            }
            with(obj_pnunit){
                if (alarm[0]>-1) then alarm[0]+=4;
                if (alarm[1]>-1) then alarm[1]+=4;
            }
        }
    }
    // instance_activate_object(obj_cursor);
    
    if (men+veh+dreads<=0){jetpack_destroy=1;// instance_destroy();
        x=-100;instance_deactivate_object(id);
    }
    
    */
    
    // Should probably have the option under deployment to say 'Should Assault Marines enter the fray with vehicles?'   [ ]
}


// Right here execute some sort of check- if left is open, and engaged, and enemy is only vehicles, and no weapons to hurt them...

if (instance_exists(obj_enunit)){
    if (collision_point(x+10,y,obj_enunit,0,1)) and (!collision_point(x-10,y,obj_pnunit,0,1)){
        var neares;neares=instance_nearest(x+10,y,obj_enunit);
        
        if (neares.men=0) and (neares.veh>0){
            var norun;
            norun=0;
            
            var i;i=0;
            repeat(20){i+=1;
                if (apa[i]>=30) then norun=1;
            }
            
            
            if (norun=0){
                x-=10;engaged=0;
            }
        
        }
    }
}

/* */
/*  */
