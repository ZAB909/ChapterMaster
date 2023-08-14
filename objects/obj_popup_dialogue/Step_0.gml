
if (too_high>=0) then too_high-=1;
if (cooldown<10) and (cooldown>=0) then cooldown-=1;
if (instance_exists(obj_controller)){if (obj_controller.cooldown<=0) then obj_controller.cooldown=6;}

blink+=1;
if (blink>60) then blink=0;
inputing=string(keyboard_string);
if (value_is_string=false){inputing=string_digits(keyboard_string);}

var xx,yy;
xx=__view_get( e__VW.XView, 0 )+x;
yy=__view_get( e__VW.YView, 0 )+y;

if (scr_hit(xx+19,yy+46,xx+280,yy+70)=false) and (value_is_string=false){
    if (string_length(inputing) > 0 and is_real(real(inputing))){
        if (real(inputing)>maximum){inputing=string(maximum);keyboard_string=string(maximum);}
    }
}


if (fin=true) and (too_high>0) then fin=false;
if (fin=true) and (too_high<=0){fin=false;
    var stahp;stahp=false;
    if (value_is_string=false){
        if (string_length(inputing) > 0 and is_real(real(inputing))){
            if (real(inputing)>maximum) then too_high=60;
        }
        
        if (too_high<=0) and (inputing!="0") and (inputing!=""){// All checks out captain
            if (target="t1"){obj_controller.trade_tnum[1]=real(inputing);obj_controller.trade_take[1]=target2;with(obj_controller){scr_trade(false);}}
            if (target="t2"){obj_controller.trade_tnum[2]=real(inputing);obj_controller.trade_take[2]=target2;with(obj_controller){scr_trade(false);}}
            if (target="t3"){obj_controller.trade_tnum[3]=real(inputing);obj_controller.trade_take[3]=target2;with(obj_controller){scr_trade(false);}}
            if (target="t4"){obj_controller.trade_tnum[4]=real(inputing);obj_controller.trade_take[4]=target2;with(obj_controller){scr_trade(false);}}
            
            if (target="m1"){obj_controller.trade_mnum[1]=real(inputing);obj_controller.trade_give[1]=target2;with(obj_controller){scr_trade(false);}}
            if (target="m2"){obj_controller.trade_mnum[2]=real(inputing);obj_controller.trade_give[2]=target2;with(obj_controller){scr_trade(false);}}
            if (target="m3"){obj_controller.trade_mnum[3]=real(inputing);obj_controller.trade_give[3]=target2;with(obj_controller){scr_trade(false);}}
            if (target="m4"){obj_controller.trade_mnum[4]=real(inputing);obj_controller.trade_give[4]=target2;with(obj_controller){scr_trade(false);}}
            
            if (string_count("m",target)>0){
                if (target2="Requisition") then obj_controller.trade_req-=real(inputing);
                if (target2="Gene-Seed") then obj_controller.trade_gene-=real(inputing);
                if (target2="STC Fragment") then obj_controller.trade_chip-=real(inputing);
                if (target2="Info Chip") then obj_controller.trade_info-=real(inputing);
            }
            
            if instance_exists(obj_controller)
                obj_controller.cooldown = 8
            instance_destroy()
        }
    }

    else if (value_is_string == 1 && ischeatcode == 1) {
        if (target == "controller")
            scr_cheatcode(inputing)

        if instance_exists(obj_controller)
            obj_controller.cooldown = 8
        instance_destroy()
    }
}


