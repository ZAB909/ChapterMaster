



if (company>10) then company=0;

i=0;
repeat(obj_controller.man_max){
    i+=1;
    
    n_wep1="Assortment";n_wep2="Assortment";n_armour="Assortment";n_gear="Assortment";n_mobi="Assortment";
    
    if (obj_controller.man[i]!="") and (obj_controller.man_sel[i]=1) and (vehicle_equipment=0) and (obj_controller.man[i]="man"){
        var check,ih,gi;check=0;ih=0;gi="";
        
        if (obj_controller.ma_role[i]=obj_ini.role[100][2]) then ih=2;
        if (obj_controller.ma_role[i]=obj_ini.role[100][3]) then ih=3;
        if (obj_controller.ma_role[i]=obj_ini.role[100][4]) then ih=4;
        if (obj_controller.ma_role[i]=obj_ini.role[100][6]) then ih=6;
        if (obj_controller.ma_role[i]=obj_ini.role[100][8]) then ih=8;
        if (obj_controller.ma_role[i]=obj_ini.role[100][9]) then ih=9;
        if (obj_controller.ma_role[i]=obj_ini.role[100][10]) then ih=10;
        if (obj_controller.ma_role[i]=obj_ini.role[100][12]) then ih=12;
        if (obj_controller.ma_role[i]=obj_ini.role[100][14]) then ih=14;
        if (obj_controller.ma_role[i]=obj_ini.role[100][15]) then ih=5;
        if (obj_controller.ma_role[i]=obj_ini.role[100][16]) then ih=16;
        if (obj_controller.ma_role[i]=obj_ini.role[100,17]) then ih=17;
        if (ih!=0){
            gi=obj_ini.wep1[100,ih];if (gi!="") then n_wep1=gi;
            if (gi="Heavy Ranged"){
                var onceh;onceh=0;
                if (scr_item_count("Missile Launcher")>0) and (onceh=0){n_wep1="Missile Launcher";onceh=1;}
                if (scr_item_count("Lascannon")>0) and (onceh=0){n_wep1="Lascannon";onceh=1;}
                if (scr_item_count("Heavy Bolter")>0) and (onceh=0){n_wep1="Heavy Bolter";onceh=1;}
                if (onceh=0) then n_wep1="";
            }
            gi=obj_ini.wep2[100,ih];if (gi!="") then n_wep2=gi;
            gi=obj_ini.armour[100,ih];if (gi!="") then n_armour=gi;gi=obj_ini.gear[100,ih];if (gi!="") then n_gear=gi;
            gi=obj_ini.mobi[100,ih];if (gi!="") then n_mobi=gi;
        }
        
        
        if (n_armour=obj_controller.ma_armour[i]) then check=1;
        if (check=0) and (n_armour!=obj_controller.ma_armour[i]) and (n_armour!="Assortment"){
            if (string_count("Dread",obj_ini.armour[company,obj_controller.ide[i]])=0){
                if (obj_ini.armour[company,obj_controller.ide[i]]!="") then scr_add_item(obj_ini.armour[company,obj_controller.ide[i]],1);
                obj_controller.ma_armour[i]="";obj_ini.armour[company,obj_controller.ide[i]]="";
                scr_add_item(n_armour,-1);
                obj_controller.ma_armour[i]=n_armour;obj_ini.armour[company,obj_controller.ide[i]]=n_armour;
            }
        }
        // End swap armour
        
        
        // if (n_wep1=n_wep2) and (
        
        
        if (n_wep1=obj_controller.ma_wep2[i]) and (n_wep2!="Assortment") and (n_wep1!="Assortment"){
            var temp;temp="";
            temp=obj_controller.ma_wep1[i];// Get temp
            obj_controller.ma_wep1[i]=obj_controller.ma_wep2[i];
            obj_ini.wep1[company,obj_controller.ide[i]]=obj_ini.wep2[company,obj_controller.ide[i]];// Wep2 -> Wep1
            obj_controller.ma_wep2[i]=temp;
            obj_ini.wep2[company,obj_controller.ide[i]]=temp;
        }
        if (n_wep2=obj_controller.ma_wep1[i]) and (n_wep2!="Assortment") and (n_wep1!="Assortment"){
            var temp;temp="";
            temp=obj_controller.ma_wep2[i];// Get temp
            obj_controller.ma_wep2[i]=obj_controller.ma_wep1[i];
            obj_ini.wep2[company,obj_controller.ide[i]]=obj_ini.wep1[company,obj_controller.ide[i]];// Wep1 -> Wep2
            obj_controller.ma_wep1[i]=temp;
            obj_ini.wep1[company,obj_controller.ide[i]]=temp;
        }
        
        
        
        check=0;
        if (obj_controller.ma_role[i]="Standard Bearer"){
            if (obj_controller.ma_wep1[i]="Company Standard") and (n_wep1!="Company Standard") and (n_wep2!="Company Standard") then check=1;
        }
        if (n_wep1=obj_controller.ma_wep1[i]) or (n_wep1="Assortment") then check=1;
        if (check=0) and (obj_controller.ma_wep1[i]!=n_wep1) and (obj_controller.ma_wep1[i]!=n_wep2) and (n_wep1!="Assortment"){
            if (obj_ini.wep1[company,obj_controller.ide[i]]!="") and (obj_controller.ma_wep1[i]!=n_wep1){
                scr_add_item(obj_ini.wep1[company,obj_controller.ide[i]],1);
                obj_controller.ma_wep1[i]="";obj_ini.wep1[company,obj_controller.ide[i]]="";
            }
            if (n_wep1!=""){
                scr_add_item(n_wep1,-1);
                obj_controller.ma_wep1[i]=n_wep1;obj_ini.wep1[company,obj_controller.ide[i]]=n_wep1;
            }
            /*if (obj_ini.wep1[company,obj_controller.ide[i]]!="") and (obj_controller.ma_wep1[i]=""){
                obj_controller.ma_wep1[i]=n_wep1;obj_ini.wep1[company,obj_controller.ide[i]]=n_wep1;
                scr_add_item(n_wep1,-1);check=5;
            }*/
        }
        /*if (check=0) and (obj_controller.ma_wep2[i]=n_wep1) and (n_wep1!="Assortment"){
            var temp;temp="";temp=obj_controller.ma_wep1[i];// Get temp
            obj_controller.ma_wep1[i]=obj_controller.ma_wep2[i];obj_ini.wep1[company,obj_controller.ide[i]]=obj_ini.wep2[company,obj_controller.ide[i]];// Wep2 -> Wep1
            obj_controller.ma_wep2[i]=temp;obj_ini.wep2[company,obj_controller.ide[i]]=temp;check=5;
        }*/
        // End swap weapon
        
        check=0;
        if (obj_controller.ma_role[i]="Standard Bearer"){
            if (obj_controller.ma_wep2[i]="Company Standard") and (n_wep1!="Company Standard") and (n_wep2!="Company Standard") then check=1;
        }
        if (n_wep2=obj_controller.ma_wep2[i]) or (n_wep2="Assortment") then check=1;
        if (check=0) and (n_wep2!=obj_controller.ma_wep2[i]) and (n_wep1!=obj_controller.ma_wep2[i]) and (n_wep2!="Assortment"){
            if (obj_ini.wep2[company,obj_controller.ide[i]]!="") and (obj_controller.ma_wep2[i]!=n_wep2){
                scr_add_item(obj_ini.wep2[company,obj_controller.ide[i]],1);
                obj_controller.ma_wep2[i]="";obj_ini.wep2[company,obj_controller.ide[i]]="";
            }
            if (n_wep2!=""){
                scr_add_item(n_wep2,-1);
                obj_controller.ma_wep2[i]=n_wep2;obj_ini.wep2[company,obj_controller.ide[i]]=n_wep2;
            }
            /*if (obj_ini.wep2[company,obj_controller.ide[i]]!="") and (obj_controller.ma_wep2[i]=""){
                obj_controller.ma_wep2[i]=n_wep2;obj_ini.wep2[company,obj_controller.ide[i]]=n_wep2;
                scr_add_item(n_wep2,-1);check=5;
            }*/
        }
        /*if (check=0) and (n_wep1=obj_controller.ma_wep2[i]) and (n_wep2!="Assortment"){
            var temp;temp="";temp=obj_controller.ma_wep2[i];// Get temp
            obj_controller.ma_wep2[i]=obj_controller.ma_wep2[i];obj_ini.wep2[company,obj_controller.ide[i]]=obj_ini.wep1[company,obj_controller.ide[i]];// Wep2 -> Wep1
            obj_controller.ma_wep1[i]=temp;obj_ini.wep1[company,obj_controller.ide[i]]=temp;
        }*/
        // End swap weapon
        
        check=0;
        if (n_gear=obj_controller.ma_gear[i]) then check=1;
        if (check=0) and (n_gear!=obj_controller.ma_gear[i]) and (n_gear!="Assortment"){
            if (obj_ini.gear[company,obj_controller.ide[i]]!="") then scr_add_item(obj_ini.gear[company,obj_controller.ide[i]],1);
            obj_controller.ma_gear[i]="";obj_ini.gear[company,obj_controller.ide[i]]="";
            if (n_gear!="(None") and (n_gear!=""){obj_controller.ma_gear[i]=n_gear;obj_ini.gear[company,obj_controller.ide[i]]=n_gear;}
            if (n_gear!="") then scr_add_item(n_gear,-1);
        }
        // End swap gear
        
        check=0;
        if (n_mobi=obj_controller.ma_mobi[i]) then check=1;
        if (check=0) and (n_mobi!=obj_controller.ma_mobi[i]) and (n_mobi!="Assortment"){
            if (string_count("Terminator",obj_ini.armour[company,obj_controller.ide[i]])=0) and (obj_ini.armour[company,obj_controller.ide[i]]!="Tartaros"){
                if (obj_ini.mobi[company,obj_controller.ide[i]]!="") then scr_add_item(obj_ini.mobi[company,obj_controller.ide[i]],1);
                obj_controller.ma_mobi[i]="";obj_ini.mobi[company,obj_controller.ide[i]]="";
                obj_controller.ma_mobi[i]=n_mobi;obj_ini.mobi[company,obj_controller.ide[i]]=n_mobi;
                if (n_mobi!="") then scr_add_item(n_mobi,-1);
            }
        }
        // End mobility
        
        /*
        if (obj_controller.ma_wep1[i]="(None)") then obj_controller.ma_wep1[i]="";
        if (obj_controller.ma_wep2[i]="(None)") then obj_controller.ma_wep2[i]="";
        if (obj_controller.ma_armour[i]="(None)") then obj_controller.ma_armour[i]="";
        if (obj_controller.ma_gear[i]="(None)") then obj_controller.ma_gear[i]="";
        if (obj_controller.ma_mobi[i]="(None)") then obj_controller.ma_mobi[i]="";
        if (obj_ini.wep1[company,obj_controller.ide[i]]="(None)") then obj_ini.wep1[company,obj_controller.ide[i]]="";
        if (obj_ini.wep2[company,obj_controller.ide[i]]="(None)") then obj_ini.wep2[company,obj_controller.ide[i]]="";
        if (obj_ini.armour[company,obj_controller.ide[i]]="(None)") then obj_ini.armour[company,obj_controller.ide[i]]="";
        if (obj_ini.gear[company,obj_controller.ide[i]]="(None)") then obj_ini.gear[company,obj_controller.ide[i]]="";
        if (obj_ini.mobi[company,obj_controller.ide[i]]="(None)") then obj_ini.mobi[company,obj_controller.ide[i]]="";
        */
        
    }// End that [i]
    
}// End repeat

obj_controller.cooldown=10;
instance_destroy();exit;

/* */
/*  */
