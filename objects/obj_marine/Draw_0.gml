/*
// if (wounded>0) then d3d_set_fog(true,16645629,0,0);
if (wounded>0) then d3d_set_fog(true,255,0,0);
if (wounded<=0){
    if(shader_is_compiled(sReplaceColor)){
        shader_set(sReplaceColor);
        shader_set_uniform_f(colour_to_find1, sourceR1,sourceG1,sourceB1 );       
        shader_set_uniform_f(colour_to_set1, targetR1,targetG1,targetB1 );
        shader_set_uniform_f(colour_to_find2, sourceR2,sourceG2,sourceB2 );       
        shader_set_uniform_f(colour_to_set2, targetR2,targetG2,targetB2 );
        shader_set_uniform_f(colour_to_find3, sourceR3,sourceG3,sourceB3 );       
        shader_set_uniform_f(colour_to_set3, targetR3,targetG3,targetB3 );
        shader_set_uniform_f(colour_to_find4, sourceR4,sourceG4,sourceB4 );       
        shader_set_uniform_f(colour_to_set4, targetR4,targetG4,targetB4 );
        shader_set_uniform_f(colour_to_find5, sourceR5,sourceG5,sourceB5 );
        shader_set_uniform_f(colour_to_set5, targetR5,targetG5,targetB5 );
        shader_set_uniform_f(colour_to_find6, sourceR6,sourceG6,sourceB6 );
        shader_set_uniform_f(colour_to_set6, targetR6,targetG6,targetB6 );
        shader_set_uniform_f(colour_to_find7, sourceR7,sourceG7,sourceB7 );
        shader_set_uniform_f(colour_to_set7, targetR7,targetG7,targetB7 );
    }
}

if (animation="") or (animation="settle"){
    if (col_special=0){
        draw_sprite(spr_mar_walk_legs1,0,x,y);
        draw_sprite(spr_mar_walk_body1,0,x,y);
    }
    if (col_special=1){
        draw_sprite(spr_mar_walk_legs1,0,x,y);
        draw_sprite(spr_mar_walk_body2,0,x,y);
    }
    if (col_special=2){
        draw_sprite(spr_mar_walk_legs3,0,x,y);
        draw_sprite(spr_mar_walk_body3,0,x,y);
    }
    if (col_special=3){
        draw_sprite(spr_mar_walk_legs4,0,x,y);
        draw_sprite(spr_mar_walk_body3,0,x,y);
    }
    if (trim=0) then draw_sprite(spr_mar_walk_pauldron1,0,x,y);
    if (trim=1) then draw_sprite(spr_mar_walk_pauldron2,0,x,y);
}
if (animation="walk"){
    if (col_special=0){
        draw_sprite(spr_mar_walk_legs1,ii,x,y);
        draw_sprite(spr_mar_walk_body1,ii,x,y);
    }
    if (col_special=1){
        draw_sprite(spr_mar_walk_legs1,ii,x,y);
        draw_sprite(spr_mar_walk_body2,ii,x,y);
    }
    if (col_special=2){
        draw_sprite(spr_mar_walk_legs3,ii,x,y);
        draw_sprite(spr_mar_walk_body3,ii,x,y);
    }
    if (col_special=3){
        draw_sprite(spr_mar_walk_legs4,ii,x,y);
        draw_sprite(spr_mar_walk_body3,ii,x,y);
    }
    if (trim=0) then draw_sprite(spr_mar_walk_pauldron1,ii,x,y);
    if (trim=1) then draw_sprite(spr_mar_walk_pauldron2,ii,x,y);
}
if (animation="fire"){
    if (col_special=0){
        draw_sprite(spr_mar_walk_legs1,0,x,y);
        draw_sprite(spr_mar_fire_body1,ii,x,y);
    }
    if (col_special=1){
        draw_sprite(spr_mar_walk_legs1,0,x,y);
        draw_sprite(spr_mar_fire_body2,ii,x,y);
    }
    if (col_special=2){
        draw_sprite(spr_mar_walk_legs3,0,x,y);
        draw_sprite(spr_mar_fire_body3,ii,x,y);
    }
    if (col_special=3){
        draw_sprite(spr_mar_walk_legs4,0,x,y);
        draw_sprite(spr_mar_fire_body3,ii,x,y);
    }
    if (trim=0) then draw_sprite(spr_mar_fire_pauldron1,ii,x,y);
    if (trim=1) then draw_sprite(spr_mar_fire_pauldron2,ii,x,y);
}

if (wounded<=0) then shader_reset();
// if (wounded>0) then d3d_set_fog(false,16645629,0,0);
if (wounded>0) then d3d_set_fog(false,255,0,0);

if (wounded>0) then wounded-=1;

/*
draw_set_color(0);
draw_set_font(fnt_small);
draw_set_halign(fa_left);
draw_text(x-150,y-16,"Ammo:"+string(marine_wep1_clip[8])+"("+string(marine_wep1_ammo[8])+"), Reload:"+string(marine_wep1_reload[8]));
*/


/* */
/*  */
