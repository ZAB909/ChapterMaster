// Shows the selected units to land or raid a planet
if (menu==1) and (managing>0){
    // TODO look to serialize the vars in here and in the rest of the code with a data structure.
    // marine types    
    var cap=0,apo=0,chap=0,bear=0,tct=0,assa=0,dev=0,sco=0,hon=0,ve=0,ter=0,oth=0,drea=0,vdrea=0,codi=0,lexi=0,lib=0,tech=0,sgt=0,vet_sgt=0;
    // vehicle types
    var rhi=0,pre=0,lrad=0,lspi=0,whi=0;
    // non chapter units
    otha=0;
    
    var manz=0,vanz=0,stahp=0;
    
    for(var f=1; f<=man_max; f++){
        // cooldown=8;
        if (man_sel[f]==1){
            
            if (ma_promote[f]==0) then sel_promoting=-1;
            
            if (ma_role[f]=="Ork Sniper") or (ma_role[f]=="Flash Git") or (ma_role[f]=="Crusader") or (ma_role[f]=="Skitarii") then otha=1;
            if (ma_role[f]=="Sister of Battle") or (ma_role[f]=="Sister Hospitaler") or (ma_role[f]=="Ranger") then otha=1;
            if (otha>0) then stahp=1;
            
            // sets up count for the marines
            if (man[f]=="man"){
                manz+=1;
                if (ma_role[f]==obj_ini.role[100][5]) then cap+=1;
                if (ma_role[f]==obj_ini.role[100][15]) then apo+=1;
                if (ma_role[f]==obj_ini.role[100][14]) then chap+=1;
                if (ma_role[f]==obj_ini.role[100,17]) then lib+=1;
                if (ma_role[f]==obj_ini.role[100][16]) then tech+=1;
                if (ma_role[f]==obj_ini.role[100][6]) or (ma_role[f]=="Venerable "+string(obj_ini.role[100][6])) then drea+=1;
                if (ma_role[f]=="Standard Bearer") then bear+=1;
                if (ma_role[f]==obj_ini.role[100][8]) then tct+=1;
                if (ma_role[f]==obj_ini.role[100][10]) then assa+=1;
                if (ma_role[f]==obj_ini.role[100][9]) then dev+=1;
                if (ma_role[f]==obj_ini.role[100][12]) then sco+=1;
                if (ma_role[f]==obj_ini.role[100][2]) then hon+=1;
                if (ma_role[f]==obj_ini.role[100][3]) then ve+=1;
                if (ma_role[f]==obj_ini.role[100][4]) then ter+=1;
                if (ma_role[f]==obj_ini.role[100][6]) then drea+=1;
				if (ma_role[f]==obj_ini.role[100][18]) then sgt++;
                if (ma_role[f]==obj_ini.role[100][19]) then vet_sgt++;
                if (ma_role[f]=="Venerable "+string(obj_ini.role[100][6])) then vdrea+=1;
                if (ma_role[f]=="Codiciery") then codi+=1;
                if (ma_role[f]=="Lexicanum") then lexi+=1;
            }
            // sets up count for the vehicles
            // TODO This needs to be extended to accomodate the selection text like the man ones
            if (man[f]="vehicle"){
                vanz+=1;
                if (ma_role[f]="Land Raider") then lrad+=1;
                if (ma_role[f]="Rhino") then rhi+=1;
                if (ma_role[f]="Predator") then pre+=1;
                if (ma_role[f]="Land Speeder") then lspi+=1;
                if (ma_role[f]="Whirlwind") then whi+=1;
            }
        }
    }
    
    selecting_dudes="";
    // Infantry text
    if (cap>0){
        selecting_dudes+=string(cap)+" "+string(obj_ini.role[100][5]);
        if (cap>1) then selecting_dudes+="s";
        selecting_dudes+=", ";
    }
    if (chap>0){
        selecting_dudes+=string(chap)+" "+string(obj_ini.role[100][14]);
        if (chap>1) then selecting_dudes+="s";
        selecting_dudes+=", ";
    }
    if (apo>0){
        selecting_dudes+=string(apo)+" "+string(obj_ini.role[100][15]);
        if (apo>1) then selecting_dudes+="s";
        selecting_dudes+=", ";
    }
    if (lib>0){
        selecting_dudes+=string(lib)+" "+string(obj_ini.role[100,17]);
        if (lib>1) then selecting_dudes+="s";
        selecting_dudes+=", ";
    }
    if (codi>0){
        selecting_dudes+=string(codi)+" Codiciery";
        if (codi>1) then selecting_dudes+="s";
        selecting_dudes+=", ";
    }
    if (lexi>0){
        selecting_dudes+=string(lexi)+" Lexicanum";
        if (lexi>1) then selecting_dudes+="s";
        selecting_dudes+=", ";
    }
    if (bear>0){
        selecting_dudes+=string(bear)+" Standard Bearer";
        if (bear>1) then selecting_dudes+="s";
        selecting_dudes+=", ";
    }
    if (hon>0){
        selecting_dudes+=string(hon)+" "+string(obj_ini.role[100][2]);
        if (hon>1) then selecting_dudes+="s";
        selecting_dudes+=", ";
    }
    if (tech>0){
        selecting_dudes+=string(tech)+" "+string(obj_ini.role[100][16]);
        if (tech>1) then selecting_dudes+="s";
        selecting_dudes+=", ";
    }
    if (ter>0){
        selecting_dudes+=string(ter)+" Terminator";
        if (ter>1) then selecting_dudes+="s";
        selecting_dudes+=", ";
    }
    if (ve>0){
        selecting_dudes+=string(ve)+" "+string(obj_ini.role[100][3]);
        if (ve>1) then selecting_dudes+="s";
        selecting_dudes+=", ";
    }
    if (tct>0){
        selecting_dudes+=string(tct)+" "+string(obj_ini.role[100][8]);
        if (tct>1) then selecting_dudes+="s";
        selecting_dudes+=", ";
    }
    if (dev>0){
        selecting_dudes+=string(dev)+" "+string(obj_ini.role[100][9]);
        if (dev>1) then selecting_dudes+="s";
        selecting_dudes+=", ";
    }
    if (sco>0){
        selecting_dudes+=string(sco)+" "+string(obj_ini.role[100][12]);
        if (sco>1) then selecting_dudes+="s";
        selecting_dudes+=", ";
    }
    if (drea>0){
        selecting_dudes+=string(drea)+" "+string(obj_ini.role[100][6]);
        if (drea>1) then selecting_dudes+="s";
        selecting_dudes+=", ";
    }
    if (sgt>0){
        selecting_dudes+=string(sgt)+" "+string(obj_ini.role[100][18]);
        if (sgt>1) then selecting_dudes+="s";
        selecting_dudes+=", ";
    }
    if (vet_sgt>0){
        selecting_dudes+=string(vet_sgt)+" "+string(obj_ini.role[100][19]);
        if (vet_sgt>1) then selecting_dudes+="s";
        selecting_dudes+=", ";
    }    
    // Vehicle text
    if (lrad>0){
        selecting_dudes+=string(lrad)+" Land Raider";
        if (lrad>1) then selecting_dudes+="s";
        selecting_dudes+=", ";
    }
    if (pre>0){
        selecting_dudes+=string(pre)+" Predator";
        if (pre>1) then selecting_dudes+="s";
        selecting_dudes+=", ";
    }
    if (rhi>0){
        selecting_dudes+=string(rhi)+" Rhino";
        if (rhi>1) then selecting_dudes+="s";
        selecting_dudes+=", ";
    }
    if (whi>0){
        selecting_dudes+=string(whi)+" Whirlwind";
        if (whi>1) then selecting_dudes+="s";
        selecting_dudes+=", ";
    }
    if (lspi>0){
        selecting_dudes+=string(lspi)+" Land Speeder";
        if (lspi>1) then selecting_dudes+="s";
        selecting_dudes+=", ";
    }
    
    if (string_length(selecting_dudes)>0) then selecting_dudes=string_delete(selecting_dudes,string_length(selecting_dudes),2);
    
    if (man_size==0) then selecting_location="";
    
    if (vanz>0) and (manz==0) and (stahp==0){
        sel_promoting=1;
        alarm[6]=15;
        exit;
    }
    if ((drea+vdrea)>0) then sel_promoting=-1;
    if ((cap+apo+chap+bear+tct+assa+dev+sco+hon+ve+ter+oth+lib+codi+lexi+tech)>=1) and (sel_promoting!=-1) then sel_promoting=1;
    if (manz>0) and (vanz>0) then sel_promoting=-1;
    if (man_size==0) then sel_promoting=-1;
    
    if (lib>0) and ((lexi+codi+cap+apo+chap+bear+tct+assa+dev+sco+hon+ve+ter+oth+drea+vdrea+tech)>0) then sel_promoting=-1;
    if (lib>1) then sel_promoting=-1;
    if (codi>0) and ((lexi+lib+cap+apo+chap+bear+tct+assa+dev+sco+hon+ve+ter+oth+drea+vdrea+tech)>0) then sel_promoting=-1;
    if (codi>1) then sel_promoting=-1;
    if (lexi>0) and ((codi+lib+cap+apo+chap+bear+tct+assa+dev+sco+hon+ve+ter+oth+drea+vdrea+tech)>0) then sel_promoting=-1;
    if (lexi>1) then sel_promoting=-1;
    if (apo>0) and ((lib+lexi+codi+cap+chap+bear+tct+assa+dev+sco+hon+ve+ter+oth+drea+vdrea+tech)>0) then sel_promoting=-1;
    if (apo>1) then sel_promoting=-1;
    if (chap>0) and ((lib+lexi+codi+cap+apo+bear+tct+assa+dev+sco+hon+ve+ter+oth+drea+vdrea+tech)>0) then sel_promoting=-1;
    if (chap>1) then sel_promoting=-1;

    if (stahp>0) then sel_promoting-=1;
    
    if (sel_promoting=-1) then sel_promoting=0;
    alarm[6]=7; 
}
