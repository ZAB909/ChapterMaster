

if (menu=1) and (managing>0){
    var f;f=0;
    
    var cap,apo,chap,bear,tct,assa,dev,sco,hon,ve,ter,oth,drea,vdrea,codi,lexi,lib,tech;
    cap=0;apo=0;chap=0;bear=0;tct=0;assa=0;dev=0;sco=0;hon=0;ve=0;ter=0;oth=0;drea=0;vdrea=0;codi=0;lexi=0;lib=0;tech=0;
    
    var rhi,pre,lrad,lspi,whi;
    rhi=0;pre=0;lrad=0;lspi=0;whi=0;
    
    otha=0;
    
    var manz,vanz,stahp;
    manz=0;vanz=0;stahp=0;
    
    repeat(man_max){
        f+=1;// cooldown=8;
        
        if (man_sel[f]=1){
            
            if (ma_promote[f]=0) then sel_promoting=-1;
            
            
            if (ma_role[f]="Ork Sniper") or (ma_role[f]="Flash Git") or (ma_role[f]="Crusader") or (ma_role[f]="Skitarii") then otha=1;
            if (ma_role[f]="Sister of Battle") or (ma_role[f]="Sister Hospitaler") or (ma_role[f]="Ranger") then otha=1;
            if (otha>0) then stahp=1;
            
            // if (ma_promote[f]=1) and (man[f]="man"){
            if (man[f]="man"){
                manz+=1;
                
                if (ma_role[f]=obj_ini.role[100,5]) then cap+=1;
                if (ma_role[f]=obj_ini.role[100,15]) then apo+=1;
                if (ma_role[f]=obj_ini.role[100,14]) then chap+=1;
                if (ma_role[f]=obj_ini.role[100,17]) then lib+=1;
                if (ma_role[f]=obj_ini.role[100,16]) then tech+=1;
                
                if (ma_role[f]=obj_ini.role[100,6]) or (ma_role[f]="Venerable "+string(obj_ini.role[100,6])) then drea+=1;
                
                if (ma_role[f]="Standard Bearer") then bear+=1;
                if (ma_role[f]=obj_ini.role[100,8]) then tct+=1;if (ma_role[f]=obj_ini.role[100,10]) then assa+=1;
                if (ma_role[f]=obj_ini.role[100,9]) then dev+=1;
                if (ma_role[f]=obj_ini.role[100,12]) then sco+=1;if (ma_role[f]=obj_ini.role[100,2]) then hon+=1;
                if (ma_role[f]=obj_ini.role[100,3]) then ve+=1;
                if (ma_role[f]=obj_ini.role[100,4]) then ter+=1;if (ma_role[f]=obj_ini.role[100,6]) then drea+=1;
                if (ma_role[f]="Venerable "+string(obj_ini.role[100,6])) then vdrea+=1;
                if (ma_role[f]="Codiciery") then codi+=1;if (ma_role[f]="Lexicanum") then lexi+=1;
                
            }
            if (man[f]="vehicle"){// vanz+=1;// This needs to be extended to accomodate the selection text like the man ones
                vanz+=1;
                
                if (ma_role[f]="Land Raider") then lrad+=1;
                if (ma_role[f]="Rhino") then rhi+=1;
                if (ma_role[f]="Predator") then pre+=1;
                if (ma_role[f]="Land Speeder") then lspi+=1;
                if (ma_role[f]="Whirlwind") then whi+=1;
            }
        }
        
    }// End repeat
    
    var heh;heh=0;selecting_dudes="";
    heh=cap;if (heh>0){selecting_dudes+=string(heh)+" "+string(obj_ini.role[100,5]);if (heh>1) then selecting_dudes+="s";selecting_dudes+=", ";}
    heh=chap;if (heh>0){selecting_dudes+=string(heh)+" "+string(obj_ini.role[100,14]);if (heh>1) then selecting_dudes+="s";selecting_dudes+=", ";}
    heh=apo;if (heh>0){selecting_dudes+=string(heh)+" "+string(obj_ini.role[100,15]);if (heh>1) then selecting_dudes+="s";selecting_dudes+=", ";}
    heh=lib;if (heh>0){selecting_dudes+=string(heh)+" "+string(obj_ini.role[100,17]);if (heh>1) then selecting_dudes+="s";selecting_dudes+=", ";}
    heh=codi;if (heh>0){selecting_dudes+=string(heh)+" Codiciery";if (heh>1) then selecting_dudes+="s";selecting_dudes+=", ";}
    heh=lexi;if (heh>0){selecting_dudes+=string(heh)+" Lexicanum";if (heh>1) then selecting_dudes+="s";selecting_dudes+=", ";}
    heh=bear;if (heh>0){selecting_dudes+=string(heh)+" Standard Bearer";if (heh>1) then selecting_dudes+="s";selecting_dudes+=", ";}
    
    heh=hon;if (heh>0){selecting_dudes+=string(heh)+" "+string(obj_ini.role[100,2]);if (heh>1) then selecting_dudes+="s";selecting_dudes+=", ";}
    
    heh=tech;if (heh>0){selecting_dudes+=string(heh)+" "+string(obj_ini.role[100,16]);if (heh>1) then selecting_dudes+="s";selecting_dudes+=", ";}
    heh=ter;if (heh>0){selecting_dudes+=string(heh)+" Terminator";if (heh>1) then selecting_dudes+="s";selecting_dudes+=", ";}
    heh=ve;if (heh>0){selecting_dudes+=string(heh)+" "+string(obj_ini.role[100,3]);if (heh>1) then selecting_dudes+="s";selecting_dudes+=", ";}
    heh=tct;if (heh>0){selecting_dudes+=string(heh)+" "+string(obj_ini.role[100,8]);if (heh>1) then selecting_dudes+="s";selecting_dudes+=", ";}
    heh=dev;if (heh>0){selecting_dudes+=string(heh)+" "+string(obj_ini.role[100,9]);if (heh>1) then selecting_dudes+="s";selecting_dudes+=", ";}
    heh=sco;if (heh>0){selecting_dudes+=string(heh)+" "+string(obj_ini.role[100,12]);if (heh>1) then selecting_dudes+="s";selecting_dudes+=", ";}
    heh=drea;if (heh>0){selecting_dudes+=string(heh)+" "+string(obj_ini.role[100,6]);if (heh>1) then selecting_dudes+="s";selecting_dudes+=", ";}
    
    
    heh=lrad;if (heh>0){selecting_dudes+=string(heh)+" Land Raider";if (heh>1) then selecting_dudes+="s";selecting_dudes+=", ";}
    heh=pre;if (heh>0){selecting_dudes+=string(heh)+" Predator";if (heh>1) then selecting_dudes+="s";selecting_dudes+=", ";}
    heh=rhi;if (heh>0){selecting_dudes+=string(heh)+" Rhino";if (heh>1) then selecting_dudes+="s";selecting_dudes+=", ";}
    heh=whi;if (heh>0){selecting_dudes+=string(heh)+" Whirlwind";if (heh>1) then selecting_dudes+="s";selecting_dudes+=", ";}
    heh=lspi;if (heh>0){selecting_dudes+=string(heh)+" Land Speeder";if (heh>1) then selecting_dudes+="s";selecting_dudes+=", ";}
    
    if (string_length(selecting_dudes)>0) then selecting_dudes=string_delete(selecting_dudes,string_length(selecting_dudes),2);
    
    if (man_size=0) then selecting_location="";
    
    if (vanz>0) and (manz=0) and (stahp=0){sel_promoting=1;alarm[6]=15;exit;}
    if (drea+vdrea>0) then sel_promoting=-1;
    // if (cap+apo+chap+bear+tct+assa+dev+sco+hon+ve+ter+oth+drea+vdrea!=1) then sel_promoting=0;
    if (cap+apo+chap+bear+tct+assa+dev+sco+hon+ve+ter+oth+lib+codi+lexi+tech>=1) and (sel_promoting!=-1) then sel_promoting=1;
    if (manz>0) and (vanz>0) then sel_promoting=-1;
    if (man_size=0) then sel_promoting=-1;
    
    if (lib>0) and (lexi+codi+cap+apo+chap+bear+tct+assa+dev+sco+hon+ve+ter+oth+drea+vdrea+tech>0) then sel_promoting=-1;if (lib>1) then sel_promoting=-1;
    if (codi>0) and (lexi+lib+cap+apo+chap+bear+tct+assa+dev+sco+hon+ve+ter+oth+drea+vdrea+tech>0) then sel_promoting=-1;if (codi>1) then sel_promoting=-1;
    if (lexi>0) and (codi+lib+cap+apo+chap+bear+tct+assa+dev+sco+hon+ve+ter+oth+drea+vdrea+tech>0) then sel_promoting=-1;if (lexi>1) then sel_promoting=-1;
    if (apo>0) and (lib+lexi+codi+cap+chap+bear+tct+assa+dev+sco+hon+ve+ter+oth+drea+vdrea+tech>0) then sel_promoting=-1;if (apo>1) then sel_promoting=-1;
    if (chap>0) and (lib+lexi+codi+cap+apo+bear+tct+assa+dev+sco+hon+ve+ter+oth+drea+vdrea+tech>0) then sel_promoting=-1;if (chap>1) then sel_promoting=-1;

    if (stahp>0) then sel_promoting-=1;
    
    if (sel_promoting=-1) then sel_promoting=0;
    alarm[6]=7; 
}

