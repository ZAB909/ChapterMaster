
fading=1;fade_alpha=0;textt="";
time_min=0;lines_acted=0;liness=0;
time_at=0;time_min=0;time_max=100;
part2="";part3="";
exit_fade=-1;closing=false;


attendants=0;avatars=0;
var i;i=-1;
repeat(2501){i+=1;
    attend_co[i]=0;attend_id[i]=0;attend_mood[i]="";attend_corrupted[i]=0;
    attend_feasted[i]=0;attend_drunk[i]=0;attend_high[i]=0;attend_confused[i]=0;attend_actioned[i]=0;
    attend_corruption[i]=0;attend_race[i]=0;attend_displayed[i]=0;// Set to 1
    
    if (i<=10){
        avatar_name[i]="";
        avatar_rank[i]="";
        avatar_image[i]=0;
        avatar_co[i]=0;
        avatar_id[i]=0;
    }
    if (i<=20){
        line[i]="";
    }
}
lines=0;


main_color=obj_ini.main_color;
secondary_color=obj_ini.secondary_color;
trim_color=obj_ini.trim_color;
pauldron2_color=obj_ini.pauldron2_color;
pauldron_color=obj_ini.pauldron_color;
lens_color=obj_ini.lens_color;
weapon_color=obj_ini.weapon_color;
col_special=obj_ini.col_special;
trim=obj_ini.trim;

stage=5;ticks=-120;ticked=0;
next_display=90;total_displayed=0;

scr_colors_initialize();
scr_shader_initialize();


if (obj_controller.fest_display>0){var q,yep;q=0;yep=0;
    if (obj_ini.artifact_tags[obj_controller.fest_display]!=obj_controller.fest_display_tags){
        repeat(20){q+=1;if (yep=0){if (obj_ini.artifact_tags[q]=obj_controller.fest_display_tags) then yep=q;}}
        if (yep>0) then obj_controller.fest_display=q;
        if (yep=0) then obj_controller.fest_display=0;
    }
}



