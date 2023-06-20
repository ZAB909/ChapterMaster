var __b__;
__b__ = action_if_number(obj_popup, 0, 0);
if __b__
{
__b__ = action_if_variable(cd, 1, 1);
if __b__
{
__b__ = action_if_variable(fix_timer, 1, 1);
if __b__
{


// with(ob_ennt){shomesge(string(dudes[1])+"|"+string(dudes_num[1])+"|"+string(men+medi)+"|"+string(dudes_hp[1]));}

// 135;
// instance_activate_object(obj_cursor);



if (started>=2) then instance_activate_object(obj_pnunit);

if (started=3){
    instance_activate_all();
    instance_activate_object(obj_pnunit);
    instance_activate_object(obj_enunit);
    if (instance_exists(obj_pnunit)){obj_pnunit.alarm[6]=1;}
    
    alarm[7]=2;
    fix_timer=15;
}

// if (done>=1) then exit;

if ((started=2) or (started=4)){
    instance_activate_object(obj_pnunit);instance_activate_object(obj_enunit);
    // started=3;alarm[5]=3;obj_pnunit.alarm[4]=1;obj_pnunit.alarm[5]=2;obj_enunit.alarm[1]=3;
    started=3;
    // obj_pnunit.alarm[4]=2;obj_pnunit.alarm[5]=3;obj_enunit.alarm[1]=1;
    if (instance_exists(obj_pnunit)){
        obj_pnunit.alarm[4]=2;
        obj_pnunit.alarm[5]=3;
    }
    if (instance_exists(obj_enunit)){obj_enunit.alarm[1]=1;}
    instance_activate_object(obj_star);
    instance_activate_object(obj_event_log);
    alarm[5]=6;fix_timer=15;
    
    fack=1;
    
    newline="------------------------------------------------------------------------------";scr_newtext();
    newline="------------------------------------------------------------------------------";scr_newtext();
}

if (fadein<0) and (fadein>-100) and (started=0){
    fadein=-500;started=1;timer_speed=1;timer_stage=1;timer=100;
    
    if (enemy=30) then timer_stage=3;
    if (battle_special="ship_demon") then timer_stage=3;
}


if (started>0){// This might be causing problems?
    if (instance_exists(obj_pnunit)) then obj_pnunit.alarm[8]=8;
    if (instance_exists(obj_enunit)) then obj_enunit.alarm[8]=8;
}


if (timer_stage=1) or (timer_stage=5){
    if (global_perils>0) then global_perils-=4;
    if (global_perils<0) then global_perils=0;
    turns+=1;
    
    four_show=0;fix_timer=15;
    // if (battle_over!=1) then alarm[8]=15;

    if (enemy!=6){
        if (instance_exists(obj_pnunit)){
            obj_pnunit.alarm[3]=2;
            obj_pnunit.alarm[1]=3;
            obj_pnunit.alarm[0]=4;
        }
        if (instance_exists(obj_enunit)){obj_enunit.alarm[1]=1;}
        // alarm[9]=5;
        var i;i=0;messages=0;messages_to_show=8;largest=0;random_messages=0;priority=0;messages_shown=0;
        repeat(60){i+=1;
            message[i]="";
            message_sz[i]=0;
            message_priority[i]=0;
        }
        timer_stage=2;timer=0;done=0;messages_shown=0;
    }
    if (enemy=6){
        if (instance_exists(obj_enunit)){
            obj_enunit.alarm[1]=2;
            obj_enunit.alarm[0]=3;
        }
        if (instance_exists(obj_pnunit)){obj_pnunit.alarm[1]=1;}
        var i;i=0;messages=0;messages_to_show=8;largest=0;random_messages=0;priority=0;messages_shown=0;
        repeat(60){i+=1;
            message[i]="";
            message_sz[i]=0;
            message_priority[i]=0;
        }
        timer_stage=2;timer=0;done=0;messages_shown=0;
    }
}



if (timer_stage=3){
    if (battle_over!=1) then alarm[8]=15;
    fix_timer=15;

    if (enemy!=6){
        if (instance_exists(obj_pnunit)){obj_pnunit.alarm[1]=1;}
        if (instance_exists(obj_enunit)){
            obj_enunit.alarm[1]=2;
            obj_enunit.alarm[0]=3;
            obj_enunit.alarm[8]=4;
            turns+=1;
        }
        var i;i=0;messages=0;messages_to_show=8;largest=0;random_messages=0;priority=0;messages_shown=0;
        repeat(60){i+=1;
            message[i]="";
            message_sz[i]=0;
            message_priority[i]=0;
        }
        timer_stage=4;timer=0;done=0;messages_shown=0;
    }
    if (enemy=6){
        if (instance_exists(obj_pnunit)){
            obj_pnunit.alarm[3]=2;
            obj_pnunit.alarm[1]=3;
            obj_pnunit.alarm[0]=4;
            turns+=1;
        }
        if (instance_exists(obj_enunit)){obj_enunit.alarm[1]=1;}
        // alarm[9]=5;
        var i;i=0;messages=0;messages_to_show=8;largest=0;random_messages=0;priority=0;messages_shown=0;
        repeat(60){i+=1;
            message[i]="";
            message_sz[i]=0;
            message_priority[i]=0;
        }
        timer_stage=4;timer=0;done=0;messages_shown=0;
    }
}



}
}
}
