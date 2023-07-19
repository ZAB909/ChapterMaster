var __b__;
__b__ = action_if_number(obj_saveload, 0, 0);
if __b__
{
__b__ = action_if_number(obj_drop_select, 0, 0);
if __b__
{
__b__ = action_if_variable(obj_controller.diplomacy, 0, 0);
if __b__
{

draw_set_font(fnt_fancy);
draw_set_halign(fa_center);
draw_set_color(0);

if (obj_controller.menu=60) then exit;

var xx, yy, temp1, dist, close;
xx=__view_get( e__VW.XView, 0 )+0;
yy=__view_get( e__VW.YView, 0 )+0;
dist=999;close=false;




if (debug!=0) then exit;


if (instance_exists(obj_fleet_select)){
    var free,z;free=1;z=obj_fleet_select;
    if (mouse_x>=__view_get( e__VW.XView, 0 )+z.void_x) and (mouse_y>=__view_get( e__VW.YView, 0 )+z.void_y) 
    and (mouse_x<__view_get( e__VW.XView, 0 )+z.void_x+z.void_wid) and (mouse_y<__view_get( e__VW.YView, 0 )+z.void_y+z.void_hei) and (obj_controller.fleet_minimized=0) then free=0;
    
    if (mouse_x>=__view_get( e__VW.XView, 0 )+z.void_x) and (mouse_y>=__view_get( e__VW.YView, 0 )+z.void_y) 
    and (mouse_x<__view_get( e__VW.XView, 0 )+z.void_x+z.void_wid) and (mouse_y<__view_get( e__VW.YView, 0 )+137) and (obj_controller.fleet_minimized=1) then free=0;
    if (free=0) then exit;
}



if (obj_controller.selecting_planet>0) and (obj_controller.cooldown<=0){
    var pppp, butt;
    pppp=obj_controller.selecting_planet;
    butt="";
    
    
    /*if (obj_controller.recruiting_worlds_bought>0) and (target.p_owner[obj_controller.selecting_planet]<=5) and (obj_controller.faction_status[target.p_owner[obj_controller.selecting_planet]]!="War"){
        if (mouse_x>=xx+348) and (mouse_y>=yy+601) and (mouse_x<xx+348+246) and (mouse_y<yy+627) and (string_count("Recr",target.p_feature[obj_controller.selecting_planet])=0){
            obj_controller.cooldown=8000;
            obj_controller.recruiting_worlds_bought-=1;
            target.p_feature[obj_controller.selecting_planet]+="Recruiting World|";
            
            if (obj_controller.selecting_planet=1) then obj_controller.recruiting_worlds+=string(target.name)+" I|";
            if (obj_controller.selecting_planet=2) then obj_controller.recruiting_worlds+=string(target.name)+" II|";
            if (obj_controller.selecting_planet=3) then obj_controller.recruiting_worlds+=string(target.name)+" III|";
            if (obj_controller.selecting_planet=4) then obj_controller.recruiting_worlds+=string(target.name)+" IV|";
            
            obj_controller.income_recruiting=(obj_controller.recruiting*-2)*string_count("|",obj_controller.recruiting_worlds);
            
            // 135 ; popup?
        }
    }*/
    
    if (button1!="") and (debug=0){
        if (mouse_x>=xx+348) and (mouse_y>=yy+461) and (mouse_x<xx+348+246) and (mouse_y<yy+461+26){
            butt=button1;obj_controller.cooldown=8000;
        }
    }
    if (button2!="") and (debug=0){
        if (mouse_x>=xx+348) and (mouse_y>=yy+489) and (mouse_x<xx+348+246) and (mouse_y<yy+489+26){
            butt=button2;obj_controller.cooldown=8000;
        }
    }
    if (button3!="") and (debug=0){
        if (mouse_x>=xx+348) and (mouse_y>=yy+517) and (mouse_x<xx+348+246) and (mouse_y<yy+517+26){
            butt=button3;obj_controller.cooldown=8000;
        }
    }
    if (button4!="") and (debug=0){
        if (mouse_x>=xx+348) and (mouse_y>=yy+545) and (mouse_x<xx+348+246) and (mouse_y<yy+545+26){
            butt=button4;obj_controller.cooldown=8000;
        }
    }

    // These need work?
    if (butt="Build"){
        var him;him=instance_create(x,y,obj_temp_build);
        him.target=self.target;him.planet=obj_controller.selecting_planet;
        if (string_count("Lair",target.p_upgrades[obj_controller.selecting_planet])>0) then him.lair=1;
        if (string_count("Arsenal",target.p_upgrades[obj_controller.selecting_planet])>0) then him.arsenal=1;
        if (string_count("Gene",target.p_upgrades[obj_controller.selecting_planet])>0) then him.gene_vault=1;
        
        if (string_count(".0|",target.p_upgrades[obj_controller.selecting_planet])=0){
            if (string_count(".3|",target.p_upgrades[obj_controller.selecting_planet])=1){
                him.lair=him.lair*-3;him.arsenal=him.arsenal*-3;him.gene_vault=him.gene_vault*-3;
            }
            if (string_count(".2|",target.p_upgrades[obj_controller.selecting_planet])=1){
                him.lair=him.lair*-2;him.arsenal=him.arsenal*-2;him.gene_vault=him.gene_vault*-2;
            }
            if (string_count(".1|",target.p_upgrades[obj_controller.selecting_planet])=1){
                him.lair=him.lair*-1;him.arsenal=him.arsenal*-1;him.gene_vault=him.gene_vault*-1;
            }
        }
        
        obj_controller.temp[104]=string(scr_master_loc());
        obj_controller.cooldown=8000;obj_controller.menu=60;
        with(obj_star_select){instance_destroy();}
    }
    if (butt="Raid"){
        instance_create(x,y,obj_drop_select);
        obj_drop_select.p_target=self.target;
        obj_drop_select.sh_target=instance_nearest(x+24,y-24,obj_p_fleet);
        if (instance_nearest(x+24,y-24,obj_p_fleet).acted>1) then with(obj_drop_select){instance_destroy();}
    }
    if (butt="Attack"){
        instance_create(x,y,obj_drop_select);
        obj_drop_select.p_target=self.target;obj_drop_select.attack=1;
        if (target.present_fleet[1]=0) then obj_drop_select.sh_target=-50;
        if (target.present_fleet[1]>0){
            obj_drop_select.sh_target=instance_nearest(x+24,y-24,obj_p_fleet);
            if (instance_nearest(x+24,y-24,obj_p_fleet).acted>=2) then with(obj_drop_select){instance_destroy();}
        }
    }
    if (butt="Purge"){
        instance_create(x,y,obj_drop_select);
        obj_drop_select.p_target=self.target;obj_drop_select.purge=1;
        if (target.present_fleet[1]=0) then obj_drop_select.sh_target=-50;
        if (target.present_fleet[1]>0){
            obj_drop_select.sh_target=instance_nearest(x+24,y-24,obj_p_fleet);
            if (instance_nearest(x+24,y-24,obj_p_fleet).acted>0) then with(obj_drop_select){instance_destroy();}
        }
    }
    if (butt="Bombard"){
        instance_create(x,y,obj_bomb_select);
        if (instance_exists(obj_bomb_select)){
            obj_bomb_select.p_target=self.target;
            obj_bomb_select.sh_target=instance_nearest(x+24,y-24,obj_p_fleet);
            if (instance_nearest(x+24,y-24,obj_p_fleet).acted=0) then instance_create(target.x,target.y,obj_temp3);
            if (instance_nearest(x+24,y-24,obj_p_fleet).acted>0) then with(obj_bomb_select){instance_destroy();}
        }
    }
    if (butt="+Recruiting"){
    if (obj_controller.recruiting_worlds_bought>0) and (target.p_owner[obj_controller.selecting_planet]<=5) and (obj_controller.faction_status[target.p_owner[obj_controller.selecting_planet]]!="War"){
        if (planet_feature_bool(target.p_feature[obj_controller.selecting_planet],P_features.Recruiting_World)==0){
            obj_controller.cooldown=8000;
            obj_controller.recruiting_worlds_bought-=1;
            target.p_feature[obj_controller.selecting_planet]+="Recruiting World|";
			array_push(target.p_feature[obj_controller.selecting_planet] ,new new_planet_feature(P_features.Recruiting_World))
            
            if (obj_controller.selecting_planet=1) then obj_controller.recruiting_worlds+=string(target.name)+" I|";
            if (obj_controller.selecting_planet=2) then obj_controller.recruiting_worlds+=string(target.name)+" II|";
            if (obj_controller.selecting_planet=3) then obj_controller.recruiting_worlds+=string(target.name)+" III|";
            if (obj_controller.selecting_planet=4) then obj_controller.recruiting_worlds+=string(target.name)+" IV|";
            
            obj_controller.income_recruiting=(obj_controller.recruiting*-2)*string_count("|",obj_controller.recruiting_worlds);
            if (obj_controller.recruiting_worlds_bought=0){
                if (button1="+Recruiting") then button1="";if (button2="+Recruiting") then button2="";
                if (button3="+Recruiting") then button3="";if (button4="+Recruiting") then button4="";
            }
            // 135 ; popup?
        }
    }}
    if (butt="Cyclonic Torpedo"){
        obj_controller.cooldown=6000;
        scr_destroy_planet(2);
    }    
}






if (obj_controller.selecting_planet>0){// Lose focus on no button click
    if (mouse_x>=__view_get( e__VW.XView, 0 )+348) and (mouse_y>=__view_get( e__VW.YView, 0 )+461) and (mouse_x<__view_get( e__VW.XView, 0 )+348+246) and (mouse_y<__view_get( e__VW.YView, 0 )+461+26){
        if (instance_exists(obj_star_select)){
            if (obj_star_select.button1!="") then exit;
            if (obj_star_select.button1="") then close=true;
        }
    }
    if (mouse_x>=__view_get( e__VW.XView, 0 )+348) and (mouse_y>=__view_get( e__VW.YView, 0 )+489) and (mouse_x<__view_get( e__VW.XView, 0 )+348+246) and (mouse_y<__view_get( e__VW.YView, 0 )+489+26){
        if (instance_exists(obj_star_select)){
            if (obj_star_select.button2!="") then exit;
            if (obj_star_select.button2="") then close=true;
        }
    }
    if (mouse_x>=__view_get( e__VW.XView, 0 )+348) and (mouse_y>=__view_get( e__VW.YView, 0 )+517) and (mouse_x<__view_get( e__VW.XView, 0 )+348+246) and (mouse_y<__view_get( e__VW.YView, 0 )+517+26){
        if (instance_exists(obj_star_select)){
            if (obj_star_select.button2!="") then exit;
            if (obj_star_select.button2="") then close=true;
        }
    }
    if (mouse_x>=__view_get( e__VW.XView, 0 )+348) and (mouse_y>=__view_get( e__VW.YView, 0 )+545) and (mouse_x<__view_get( e__VW.XView, 0 )+348+246) and (mouse_y<__view_get( e__VW.YView, 0 )+545+26){
        if (instance_exists(obj_star_select)){
            if (obj_star_select.button2!="") then exit;
            if (obj_star_select.button2="") then close=true;
        }
    }
}


if (obj_controller.menu=0) and (obj_controller.zoomed=0) and (!instance_exists(obj_bomb_select)) and (!instance_exists(obj_drop_select)) and (obj_controller.cooldown<=0){
    var closes,sta1,sta2;closes=0;;sta1=0;sta2=0;
    sta1=instance_nearest(mouse_x,mouse_y,obj_star);
    sta2=point_distance(mouse_x,mouse_y,sta1.x,sta1.y);

    if (sta2>15){
        if (scr_hit(xx+27,yy+165,xx+27+320,yy+165+294)=false) then closes+=1;
        if (obj_controller.selecting_planet>0){
            if (scr_hit(xx+27+381,yy+165,xx+27+320+381,yy+165+294)=false) then closes+=1;
        }
        if ((closes=1) and (obj_controller.selecting_planet=0)) or (closes=2){cooldown=0;
            obj_controller.sel_system_x=0;obj_controller.sel_system_y=0;
            obj_controller.selecting_planet=0;obj_controller.popup=0;
            obj_controller.cooldown=0;instance_destroy();
        }
    }
}



if (loading=0){
    if (instance_exists(target)){
        if (target.planets>=1) and (obj_controller.cooldown<=0){
            dist=point_distance(xx+159,yy+287,mouse_x,mouse_y);   
            if (dist<=16) then obj_controller.selecting_planet=1;
        }
        if (target.planets>=2) and (obj_controller.cooldown<=0){
            dist=point_distance(xx+200,yy+287,mouse_x,mouse_y);   
            if (dist<=16) then obj_controller.selecting_planet=2; 
        }
        if (target.planets>=3) and (obj_controller.cooldown<=0){
            dist=point_distance(xx+241,yy+287,mouse_x,mouse_y);   
            if (dist<=16) then obj_controller.selecting_planet=3; 
        }
        if (target.planets>=4) and (obj_controller.cooldown<=0){
            dist=point_distance(xx+282,yy+287,mouse_x,mouse_y);   
            if (dist<=16) then obj_controller.selecting_planet=4; 
        }
    }

    // Exit button
    if (mouse_x>=xx+274) and (mouse_y>=yy+426) and (mouse_x<xx+337) and (mouse_y<yy+451) and (obj_controller.cooldown<=0){
        obj_controller.sel_system_x=0;obj_controller.sel_system_y=0;
        obj_controller.popup=0;obj_controller.cooldown=8000;obj_controller.selecting_planet=0;
        instance_destroy();
    }

}

if (obj_controller.cooldown<=0) and (loading=1){
    if (mouse_x>=xx+274) and (mouse_y>=yy+426) and (mouse_x<xx+337) and (mouse_y<yy+451){
        obj_controller.selecting_planet=0;
        obj_controller.cooldown=8000;
        instance_destroy();
    }
    
    if (obj_controller.selecting_planet>0){
        obj_controller.cooldown=8000;
        obj_controller.unload=obj_controller.selecting_planet;
        obj_controller.return_object=target;
        obj_controller.return_size=obj_controller.man_size;
        
        // 135 ; SPECIAL PLANET CRAP HERE
        
        // Recon Stuff
        var recon;recon=0;
        if (target.p_problem[obj_controller.selecting_planet,1]="recon") then recon=1;
        if (target.p_problem[obj_controller.selecting_planet,2]="recon") then recon=1;
        if (target.p_problem[obj_controller.selecting_planet,3]="recon") then recon=1;
        if (target.p_problem[obj_controller.selecting_planet,4]="recon") then recon=1;
        if (recon=1){
            var arti;arti=instance_create(target.x,target.y,obj_temp7);// Unloading / artifact crap
            arti.num=obj_controller.selecting_planet;arti.alarm[0]=1;
            arti.loc=obj_controller.selecting_location;
            arti.managing=obj_controller.managing;arti.type="recon";
            // Right here should pass the man_sel variables
            // var i;i=-1;repeat(150){i+=1;arti.man_sel[i]=obj_controller.man_sel[i];}
            var i;i=-1;
            repeat(150){i+=1;
                arti.man_sel[i]=0;arti.ide[i]=0;arti.man[i]="";
                if (obj_controller.man_sel[i]!=0){
                    arti.man_sel[i]=obj_controller.ma_lid[i];
                    arti.ide[i]=obj_controller.ide[i];
                    arti.man[i]=obj_controller.man[i];
                }
            }
        }
        
        // Artifact Grab
        if (planet_feature_bool(target.p_feature[obj_controller.selecting_planet], P_features.Artifact) == 1) and (recon=0){
	
            var arti;arti=instance_create(target.x,target.y,obj_temp4);// Unloading / artifact crap
            arti.num=obj_controller.selecting_planet;arti.alarm[0]=1;
            arti.loc=obj_controller.selecting_location;
            arti.managing=obj_controller.managing;
            // Right here should pass the man_sel variables
            // var i;i=-1;repeat(150){i+=1;arti.man_sel[i]=obj_controller.man_sel[i];}
            var i;i=-1;
            repeat(150){i+=1;
                arti.man_sel[i]=0;arti.ide[i]=0;arti.man[i]="";
                if (obj_controller.man_sel[i]!=0){
                    arti.man_sel[i]=obj_controller.ma_lid[i];
                    arti.ide[i]=obj_controller.ide[i];
                    arti.man[i]=obj_controller.man[i];
                }
            }
        }
        
        // STC Grab
        if (planet_feature_bool(target.p_feature[obj_controller.selecting_planet], P_features.STC_Fragment) == 1) and (recon=0){
            var i,tch,mch;i=0;tch=0;mch=0;
            repeat(300){i+=1;
                if (obj_controller.man[i]!="") and (obj_controller.man_sel[i]=1){
                    if (obj_controller.ma_role[i]=obj_ini.role[100,16]) or ((obj_controller.ma_role[i]="Forge Master")){
                        tch+=1;
                    }
                    if (obj_controller.ma_role[i]="Techpriest"){
                        mch+=1;
                    }
                }
            }
            if (tch+mch>0){
                var arti;arti=instance_create(target.x,target.y,obj_temp4);// Unloading / artifact crap
                arti.num=obj_controller.selecting_planet;arti.alarm[0]=1;
                arti.loc=obj_controller.selecting_location;
                arti.managing=obj_controller.managing;
                arti.tch=tch;arti.mch=mch;
                // Right here should pass the man_sel variables
                // var i;i=-1;repeat(150){i+=1;arti.man_sel[i]=obj_controller.man_sel[i];}
                var i;i=-1;
                repeat(150){i+=1;
                    arti.man_sel[i]=0;arti.ide[i]=0;arti.man[i]="";
                    if (obj_controller.man_sel[i]!=0){
                        arti.man_sel[i]=obj_controller.ma_lid[i];
                        arti.ide[i]=obj_controller.ide[i];
                        arti.man[i]=obj_controller.man[i];
                    }
                }
            }
        }
        
        // Ancient Ruins
        if (planet_feature_bool(target.p_feature[obj_controller.selecting_planet], P_features.Ancient_Ruins) == 1){
            var pip,arti;pip=instance_create(0,0,obj_popup);pip.title="Ancient Ruins";
            
            var nu;nu=string(target.name);
            if (obj_controller.selecting_planet=1) then nu+=" I";if (obj_controller.selecting_planet=2) then nu+=" II";
            if (obj_controller.selecting_planet=3) then nu+=" III";if (obj_controller.selecting_planet=4) then nu+=" IV";
            pip.text="Located upon "+string(nu)+" is a sprawling expanse of ancient ruins, dating back to times long since forgotten.  Locals are superstitious about the place- as a result the ruins are hardly explored.  What they might contain, and any potential threats, are unknown.  What is thy will?";
            pip.option1="Explore the ruins.";pip.option2="Do nothing.";pip.option3="Return your marines to the ship.";pip.image="ancient_ruins";
            
            arti=instance_create(target.x,target.y,obj_temp4);
            arti.num=obj_controller.selecting_planet;arti.alarm[0]=1;
            arti.loc=obj_controller.selecting_location;
            arti.battle_loc=target.name;
            arti.manag=obj_controller.managing;
            arti.obj=target;
            var i;i=-1;
            repeat(150){i+=1;
                arti.man_sel[i]=0;arti.ide[i]=0;arti.man[i]="";
                if (obj_controller.man_sel[i]!=0){
                    arti.man_sel[i]=obj_controller.ma_lid[i];
                    arti.ide[i]=obj_controller.ide[i];
                    arti.man[i]=obj_controller.man[i];
                }
            }
            arti.ship_id=obj_controller.ma_lid[1];
        }
        
        
        
        
        
        
        with(obj_controller.return_object){// This marks that there are forces upon this planet
            p_player[obj_controller.unload]+=obj_controller.man_size;
        }
        
        
        
        instance_destroy();
    }
}


attack=0;bombard=0;raid=0;purge=0;button1="";button2="";button3="";


/*if (obj_controller.selecting_planet>0){
    if (target.p_type[obj_controller.selecting_planet]="Dead") then exit;
}*/












/*

if (target.craftworld=1) or (target.space_hulk=1){
    // 135 ;
    obj_controller.selecting_planet=1;

    if (instance_exists(obj_p_fleet)){
        var targ_targ;targ_targ=instance_nearest(target.x+24,target.y-24,obj_p_fleet);
        
        if (instance_exists(targ_targ)){
            if (targ_targ.action="") and (point_distance(target.x+24,target.y-24,targ_targ.x,targ_targ.y)<=40){
                
                // if (target.p_owner[obj_controller.selecting_planet]>5){
                    if (button1!=""){button1="Raid";if (targ_targ.capital_number>0) or (targ_targ.frigate_number>0) then button2="Bombard";}
                    if (button1=""){button2="Raid";if (targ_targ.capital_number>0) or (targ_targ.frigate_number>0) then button3="Bombard";}
                // }
            }
        }
    }
}



if (obj_controller.selecting_planet>0){
    if (target.p_orks[obj_controller.selecting_planet]>0) or (target.p_tau[obj_controller.selecting_planet]>0) or (target.p_traitors[obj_controller.selecting_planet]>0){
        if (target.p_player[obj_controller.selecting_planet]>0) then button1="Attack";
    }
    if (target.p_type[obj_controller.selecting_planet]="Dead") and ((target.present_fleet[1]>0) or (target.p_player[obj_controller.selecting_planet]>0)){
        if (target.p_feature[obj_controller.selecting_planet]=""){var chock;chock=1;
            if (target.p_orks[obj_controller.selecting_planet]>0) then chock=0;
            if (target.p_chaos[obj_controller.selecting_planet]>0) then chock=0;
            if (target.p_tyranids[obj_controller.selecting_planet]>0) then chock=0;
            if (target.p_necrons[obj_controller.selecting_planet]>0) then chock=0;
            if (target.p_tau[obj_controller.selecting_planet]>0) then chock=0;
            if (target.p_demons[obj_controller.selecting_planet]>0) then chock=0;
            if (chock=1) then button1="Build";
        }
    }
}

if (instance_exists(obj_p_fleet)){
    var targ_targ;
    targ_targ=instance_nearest(target.x+24,target.y-24,obj_p_fleet);
    // 135 buttons
    
    if (targ_targ.owner=1) and (targ_targ.action="") and (point_distance(target.x+24,target.y-24,targ_targ.x,targ_targ.y)<=40){
        if (obj_controller.selecting_planet>0){
            
            if (target.p_owner[obj_controller.selecting_planet]>=7) or (target.p_owner[obj_controller.selecting_planet]=10){
                if (button1!=""){button1="Raid";if (targ_targ.capital_number>0) or (targ_targ.frigate_number>0) then button2="Bombard";}
                if (button1=""){button2="Raid";if (targ_targ.capital_number>0) or (targ_targ.frigate_number>0) then button3="Bombard";}
            }
            /*if (target.p_owner[obj_controller.selecting_planet]=6) or (target.p_owner[obj_controller.selecting_planet]=8){
                if (button1!=""){button1="Raid";if (targ_targ.capital_number>0) or (targ_targ.frigate_number>0) then button2="Bombard";}
                if (button1=""){button2="Raid";if (targ_targ.capital_number>0) or (targ_targ.frigate_number>0) then button3="Bombard";}
            }
            
            if (target.p_owner[obj_controller.selecting_planet]<=3) and (target.p_owner[obj_controller.selecting_planet]!=0){
                button1="Raid";
                
                if (target.p_orks[obj_controller.selecting_planet]>0) and (target.p_player[obj_controller.selecting_planet]>0){button1="Attack";button2="Raid";button3="Purge";}
                if (target.p_tau[obj_controller.selecting_planet]>0) and (target.p_player[obj_controller.selecting_planet]>0){button1="Attack";button2="Raid";button3="Purge";}
                if (target.p_traitors[obj_controller.selecting_planet]>0) and (target.p_player[obj_controller.selecting_planet]>0){button1="Attack";button2="Raid";button3="Purge";}
                if (target.p_tyranids[obj_controller.selecting_planet]>4) and (target.p_player[obj_controller.selecting_planet]>0){button1="Attack";button2="Raid";button3="Purge";}
                if (target.p_tyranids[obj_controller.selecting_planet]>0) and (target.p_player[obj_controller.selecting_planet]>0){
                    if (target.p_problem[obj_controller.selecting_planet,1]="tyranid_org"){button1="Attack";button2="Raid";button3="Purge";}
                    if (target.p_problem[obj_controller.selecting_planet,2]="tyranid_org"){button1="Attack";button2="Raid";button3="Purge";}
                    if (target.p_problem[obj_controller.selecting_planet,3]="tyranid_org"){button1="Attack";button2="Raid";button3="Purge";}
                    if (target.p_problem[obj_controller.selecting_planet,4]="tyranid_org"){button1="Attack";button2="Raid";button3="Purge";}
                }
                
            }
        }
    }
}



*/






if (player_fleet>0) and (imperial_fleet+mechanicus_fleet+inquisitor_fleet+eldar_fleet+ork_fleet+tau_fleet+heretic_fleet>0) and (obj_controller.cooldown<=0){
    var i,x3,y3;i=0;
    // x3=xx+46;y3=yy+252;
    x3=xx+49;y3=yy+441;
    
    var combating;combating=0;
    
    repeat(7){i+=1;
        if (en_fleet[i]>0) and (mouse_x>=x3-24) and (mouse_y>=y3-24) and (mouse_x<x3+48) and (mouse_y<y3+48) and (obj_controller.cooldown<=0){
            obj_controller.cooldown=8;combating=en_fleet[i];
        }
        x3+=64;
    }
    
    if (combating>0){
        obj_controller.combat=combating;
    
        var ii, xx, yy, good, pfleet, enemy_fleet, allied_fleet, ecap, efri, eesc, acap, afri, aesc, e1,e2,e3;
        ii=0;xx=0;yy=0;good=0;pfleet=0;enemy_fleet=0;allied_fleet=0;ecap=0;efri=0;eesc=0;e1=0;e2=0;e3=0;
        ii=-1;repeat(20){ii+=1;enemy_fleet[ii]=0;allied_fleet[ii]=0;ecap[ii]=0;efri[ii]=0;eesc[ii]=0;acap[ii]=0;afri[ii]=0;aesc[ii]=0;}
        
        ii=0;good=1;
        
        obj_controller.temp[1099]=target.name;
        with(obj_p_fleet){if (action!=""){x-=20000;y-=20000;}}
        pfleet=instance_nearest(target.x,target.y,obj_p_fleet);
        with(obj_p_fleet){if (x<-6000) and (y<-6000){x+=20000;y+=20000;}}
        ii=target;
        
        with(obj_temp3){instance_destroy();}
        
        if (good=1){// trying to find the star
            instance_activate_object(obj_star);
            obj_controller.x=ii.x;obj_controller.y=ii.y;// show=current_battle;
            
            strin[1]=string(pfleet.capital_number);
            strin[2]=string(pfleet.frigate_number);
            strin[3]=string(pfleet.escort_number);
            // pull health values here
            strin[4]=string(pfleet.capital_health);
            strin[5]=string(pfleet.frigate_health);
            strin[6]=string(pfleet.escort_health);
            
            // pull enemy ships here
            
            var e;e=1;
            repeat(9){e+=1;
                if (target.present_fleet[e]>0){
                    obj_controller.temp[1070]=target.id;
                    obj_controller.temp[1071]=e;
                    obj_controller.temp[1072]=0;
                    obj_controller.temp[1073]=0;
                    obj_controller.temp[1074]=0;
                    
                    with(obj_temp2){instance_destroy();}
                    with(obj_temp3){instance_destroy();}
                    with(obj_en_fleet){
                        if (orbiting=obj_controller.temp[1070]) and (owner=obj_controller.temp[1071]){
                            obj_controller.temp[1072]+=capital_number;
                            obj_controller.temp[1073]+=frigate_number;
                            obj_controller.temp[1074]+=escort_number;
                            if (string_count("BLOOD",trade_goods)>0) then instance_create(x,y,obj_temp2);
                            if (string_lower(trade_goods)="csm") then instance_create(x,y,obj_temp3);
                        }
                    }
                    
                    var l1,l2;l1=0;l2=0;
                    if (obj_controller.faction_status[e]!="War") and (e!=combating){
                        repeat(10){l1+=1;if (allied_fleet[l1]=0) and (l2=0) then l2=l1;}
                        allied_fleet[l2]=e;
                        acap[l2]=obj_controller.temp[1072];
                        afri[l2]=obj_controller.temp[1073];
                        aesc[l2]=obj_controller.temp[1074];
                    }
                    if (obj_controller.faction_status[e]="War") or (e=9) or (e=combating){
                        repeat(10){l1+=1;if (enemy_fleet[l1]=0) and (l2=0) then l2=l1;}
                        enemy_fleet[l2]=e;
                        ecap[l2]=obj_controller.temp[1072];
                        efri[l2]=obj_controller.temp[1073];
                        eesc[l2]=obj_controller.temp[1074];
                    }
                }
            }
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        obj_controller.cooldown=8000;
        
        // Start battle here
        
        combating=1;
        
        instance_deactivate_all(true);
        instance_activate_object(obj_controller);
        instance_activate_object(obj_ini);
        // instance_activate_object(battle_object[current_battle]);
        instance_activate_object(pfleet);
        instance_activate_object(obj_star);
        
        instance_create(0,0,obj_fleet);
        obj_fleet.star_name=target.name;
        // 
        obj_fleet.enemy[1]=enemy_fleet[1];
        obj_fleet.enemy_status[1]=-1;
        
        obj_fleet.en_capital[1]=ecap[1];
        obj_fleet.en_frigate[1]=efri[1];
        obj_fleet.en_escort[1]=eesc[1];
        
        // Plug in all of the enemies first
        // And then plug in the allies after then with their status set to positive
        
        if (instance_exists(obj_temp3)){
            obj_fleet.csm_exp=1;
            with(obj_temp3){instance_destroy();}
        }
        if (instance_exists(obj_temp2)){
            obj_fleet.csm_exp=2;
            with(obj_temp2){instance_destroy();}
        }
        
        
        stahr=target;
        if (planet_feature_bool(target.p_feature[obj_controller.selecting_planet], P_features.Monastery) == 1) then obj_fleet.player_lasers=stahr.p_lasers[1];
        if (planet_feature_bool(target.p_feature[obj_controller.selecting_planet], P_features.Monastery) == 1) then obj_fleet.player_lasers=stahr.p_lasers[2];
        if (planet_feature_bool(target.p_feature[obj_controller.selecting_planet], P_features.Monastery) == 1) then obj_fleet.player_lasers=stahr.p_lasers[3];
        if (planet_feature_bool(target.p_feature[obj_controller.selecting_planet], P_features.Monastery) == 1) then obj_fleet.player_lasers=stahr.p_lasers[4];
        instance_deactivate_object(obj_star);
        
        
        
        
        
        // 
        
        
        var i;i=0;
        repeat(8){
            i+=1;if (pfleet.capital[i]!="") then obj_fleet.fighting[pfleet.capital_num[i]]=1;
        }
        
        i=0;
        repeat(30){
            i+=1;if (pfleet.frigate[i]!="") then obj_fleet.fighting[pfleet.frigate_num[i]]=1;
        }
        
        i=0;
        repeat(30){
            i+=1;if (pfleet.escort[i]!="") then obj_fleet.fighting[pfleet.escort_num[i]]=1;
        }
        
        // instance_deactivate_object(battle_object[current_battle]);
        instance_deactivate_object(pfleet);
        
        
        
        obj_controller.combat=1;
        obj_fleet.player_started=1;
        obj_fleet.pla_fleet=pfleet;
        obj_fleet.ene_fleet=target;
        
        
        
        
    }
}



/* */
}
}
}
/*  */
