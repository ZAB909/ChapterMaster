




if (p_type[1]="Craftworld") and (obj_controller.known[6]=0){
    draw_set_alpha(0);draw_set_color(255);
    draw_circle(old_x,old_y,5,0);draw_set_alpha(1);
    exit;
}






var show;
show=name;
// show=string(name)+" "+string(p_tyranids[1])+string(p_tyranids[2])+string(p_tyranids[3])+string(p_tyranids[4]);
// if (space_hulk=1) then show="Space Hulk";
// show=string(name)+"|"+string(p_player[1]+p_player[2]+p_player[3]+p_player[4]);
// show=string(name)+"|"+string(dispo[1])+"|"+string(dispo[2])+"|"+string(dispo[3])+"|"+string(dispo[4]);
// show=string(p_problem[1,1])+"|"+string(p_timer[1,1]);
// show=string(p_tyranids[1])+"|"+string(p_tyranids[2])+"|"+string(p_tyranids[3])+"|"+string(p_tyranids[4]);
// if (global.cheat_debug=true) then show=string(name)+"#"+string(p_problem[1,1])+string(p_problem[2,1])+string(p_problem[3,1])+string(p_problem[4,1])+"#"+string(p_problem[1,2])+string(p_problem[2,2])+string(p_problem[3,2])+string(p_problem[4,2]);
if (global.cheat_debug=true) then show=string(name)+"#"+string(p_problem[1,1])+":"+string(p_timer[1,1])+"#"+string(p_problem[1,2])+":"+string(p_timer[1,2])+"#"+string(p_problem[1,3])+":"+string(p_timer[1,3]);
// if (space_hulk=1) then show="Space Hulk|"+string(p_owner[1]);
// show=string(name)+"|"+string(p_player[1]+p_player[2]+p_player[3]+p_player[4]);
// show=string(name)+"|"+string(p_player[1]+p_player[2]+p_player[3]+p_player[4])+"|"+string(p_problem[1,1])+string(p_problem[2,1])+string(p_problem[3,1])+string(p_problem[4,1]);
// show=string(p_eldar[1]+p_eldar[2]+p_eldar[3]+p_eldar[4])+" | H:"+string(p_heresy[1]+p_heresy[2]+p_heresy[3]+p_heresy[4]);
// show=string(p_tyranids[1]+p_tyranids[2]+p_tyranids[3]+p_tyranids[4]);
// show=string(present_fleet[1]+present_fleet[2]+present_fleet[3]+present_fleet[4]+present_fleet[6]+present_fleet[8]+present_fleet[9]+present_fleet[10]+present_fleet[13])+", O:"+string(present_fleet[7]);
// show=string(name)+" "+string(present_fleet[6]);
// show=string(name)+" ("+string(p_feature[2])+")";
// show=string(instance_number(obj_star_select));
// show=string(obj_controller.cooldown);
// show=string(present_fleet[20]);


draw_set_color(c_white);
draw_set_alpha(0.25);
if (x2!=0) then draw_line(x,y,x2,y2);
if (craftworld=0) and (vision=1) then draw_self();
if (craftworld=1) then draw_sprite_ext(spr_craftworld,0,x,y,1,1,point_direction(x,y,room_width/2,room_height/2)+90,c_white,1);
if (space_hulk=1) then draw_sprite_ext(spr_star_hulk,0,x,y,1,1,0,c_white,1);

if (storm>0) then draw_sprite_ext(spr_warp_storm,storm_image,x,y,0.75,0.75,0,c_white,1);


// if (vision=1) then draw_set_alpha(0.5);
// if (vision=0) then draw_set_alpha(0.3);

draw_set_halign(fa_center);
draw_set_font(fnt_menu);
draw_set_color(38144);
if (owner=1) then draw_set_color(c_white);
if (owner=2) then draw_set_color(c_gray);
if (owner=3) then draw_set_color(c_red); // toaster fuckers 
if (owner=5) then draw_set_color(c_white);
if (owner=6) then draw_set_color(33023);
if (owner=7) then draw_set_color(38144); // waagh
if (owner=8) then draw_set_color(117758); // the greater good
if (owner=9) then draw_set_color(7492269); //bug boys
if (owner=10) then draw_set_color(c_purple); // chaos
if (owner=13) then draw_set_color(65408); //Sleepy robots
if (space_hulk=1) then draw_set_color(255);
// if (explored=0){draw_set_color(38144);show="????";}


if (owner!=1){
    draw_set_alpha(0.5);
    if (obj_controller.zoomed=0) then draw_text_transformed(x,y+16,string_hash_to_newline(string(show)),1.3,1.3,0);
    if (obj_controller.zoomed=1) then draw_text_transformed(x,y+16,string_hash_to_newline(string(show)),2,2,0);// was 1.65
}
if (owner=1){
    var siz;draw_set_alpha(1);
    if (obj_controller.zoomed=0) then siz=1.3;
    if (obj_controller.zoomed=1) then siz=2;
    
    draw_set_color(c_blue);
    draw_text_transformed(x-1,y+15,string_hash_to_newline(show),siz,siz,0);
    draw_text_transformed(x+1,y+17,string_hash_to_newline(show),siz,siz,0);
    draw_set_color(c_white);
    draw_text_transformed(x,y+16,string_hash_to_newline(show),siz,siz,0);
}
/*if (owner=13){
    var siz;draw_set_alpha(1);
    if (obj_controller.zoomed=0) then siz=0.75;
    if (obj_controller.zoomed=1) then siz=1.5;
    
    draw_set_color(65408);
    draw_text_transformed(x-1,y+15,show,siz,siz,0);
    draw_text_transformed(x+1,y+17,show,siz,siz,0);
    draw_set_color(c_black);
    draw_text_transformed(x,y+16,show,siz,siz,0);
}*/

draw_set_alpha(1);

/* */
/*  */
