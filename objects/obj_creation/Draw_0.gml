

// 850,860

var xx,yy;
xx=375;yy=10;

tooltip="";tooltip2="";
draw_set_alpha(1);
// draw_sprite(spr_creation_slate,0,xx,yy);
scr_image("slate",0,xx,yy,850,860);
draw_set_alpha(1-(slate1/30));
// draw_sprite(spr_creation_slate,1,xx,yy);
scr_image("slate",1,xx,yy,850,860);

draw_set_color(5998382);
if (slate2>0){
    if (slate2<=10) then draw_set_alpha(slate2/10);
    if (slate2>10) then draw_set_alpha(1-((slate2-10)/10));
    draw_line(xx+30,yy+70+(slate2*36),xx+790,yy+70+(slate2*36));
}
if (slate3>0){
    if (slate3<=10) then draw_set_alpha(slate3/10);
    if (slate3>10) then draw_set_alpha(1-((slate3-10)/10));
    draw_line(xx+30,yy+70+(slate3*36),xx+790,yy+70+(slate3*36));
}



draw_set_alpha(slate4/30);
if (slate4>0){
    if (slide=1){
        draw_set_color(38144);
        draw_set_font(fnt_40k_30b);
        draw_set_halign(fa_center);
        draw_text(800,80,string_hash_to_newline("Select Chapter"));
        
        draw_set_font(fnt_40k_30b);
        draw_set_halign(fa_left);
        draw_text_transformed(440,133,string_hash_to_newline("Founding Chapters"),0.75,0.75,0);
        draw_text_transformed(440,363,string_hash_to_newline("Existing Chapters"),0.75,0.75,0);
        draw_text_transformed(440,593,string_hash_to_newline("Other"),0.75,0.75,0);
        
        var x2,y2,i,new_hover,tool;
        x2=441;y2=167;i=1;new_hover=highlight;tool=0;
        
        repeat(9){
            
            draw_sprite(spr_creation_icon,0,x2,167);
            scr_image("creation",i,x2,167,48,48);
            // draw_sprite_stretched(spr_icon,i,x2,167,48,48);
            
            if (mouse_x>=x2) and (mouse_y>=167) and (mouse_x<x2+48) and (mouse_y<167+48) and (slate4>=30){
                if (old_highlight!=highlight) and (highlight!=i) and (goto_slide!=2){old_highlight=highlight;highlighting=1;}
                if (goto_slide!=2){highlight=i;tool=1;}
                draw_set_alpha(0.1);draw_set_color(c_white);
                draw_rectangle(x2,167,x2+48,167+48,0);
                draw_set_alpha(slate4/30);
                if (mouse_left>=1) and (cooldown<=0) and (change_slide<=0) and (premades=true){
                    cooldown=8000;chapter=chapter_id[i];scr_chapter_new(chapter);
                    if (chapter!="nopw_nopw"){icon=i;custom=0;change_slide=1;goto_slide=2;chapter_string=chapter;}
                }
            }
            i+=1;x2+=53;
        }
        
        x2=441;y2=397;i=10;new_hover=highlight;
        repeat(7){
        
            draw_sprite(spr_creation_icon,0,x2,397);
            // draw_sprite_stretched(spr_icon,i,x2,397,48,48);
            scr_image("creation",i,x2,397,48,48);
            
            if (mouse_x>=x2) and (mouse_y>=397) and (mouse_x<x2+48) and (mouse_y<397+48) and (slate4>=30){
                if (old_highlight!=highlight) and (highlight!=i) and (goto_slide!=2){old_highlight=highlight;highlighting=1;}
                if (goto_slide!=2){highlight=i;tool=1;}
                draw_set_alpha(0.1);draw_set_color(c_white);
                draw_rectangle(x2,397,x2+48,397+48,0);
                draw_set_alpha(slate4/30);
                if (mouse_left>=1) and (cooldown<=0) and (change_slide<=0) and (premades=true){
                    cooldown=8000;chapter=chapter_id[i];scr_chapter_new(chapter);
                    if (chapter!="nopw_nopw"){icon=i;custom=0;change_slide=1;goto_slide=2;chapter_string=chapter;}
                }
            }
            i+=1;x2+=53;
        }
        
        x2=441;y2=627;i=17;new_hover=highlight;
        repeat(4){
        
            draw_sprite(spr_creation_icon,0,x2,y2);
            // draw_sprite_stretched(spr_icon,i,x2,y2,48,48);
            scr_image("creation",i,x2,y2,48,48);
            
            if (mouse_x>=x2) and (mouse_y>=y2) and (mouse_x<x2+48) and (mouse_y<y2+48) and (slate4>=30){
                if (old_highlight!=highlight) and (highlight!=i) and (goto_slide!=2){old_highlight=highlight;highlighting=1;}
                if (goto_slide!=2){highlight=i;tool=1;}
                draw_set_alpha(0.1);draw_set_color(c_white);
                draw_rectangle(x2,y2,x2+48,y2+48,0);
                draw_set_alpha(slate4/30);
                if (mouse_left>=1) and (cooldown<=0) and (change_slide<=0) and (premades=true){
                    cooldown=8000;chapter=chapter_id[i];scr_chapter_new(chapter);
                    if (chapter!="nopw_nopw"){icon=i;custom=0;change_slide=1;goto_slide=2;chapter_string=chapter;}
                }
            }
            i+=1;x2+=53;
        }
        
        x2+=53;i=1001;
        repeat(2){
        
            draw_sprite(spr_creation_icon,0,x2,y2);
            draw_sprite_stretched(spr_icon_chapters,i-1001,x2,y2,48,48);
            
            if (mouse_x>=x2) and (mouse_y>=y2) and (mouse_x<x2+48) and (mouse_y<y2+48) and (slate4>=30){
                if (old_highlight!=highlight) and (highlight!=i) and (goto_slide!=2){old_highlight=highlight;highlighting=1;}
                if (goto_slide!=2){highlight=i;tool=1;}
                draw_set_alpha(0.1);draw_set_color(c_white);
                draw_rectangle(x2,y2,x2+48,y2+48,0);
                draw_set_alpha(slate4/30);
                if (mouse_left>=1) and (cooldown<=0) and (change_slide<=0){
                    cooldown=8000;icon=1;icon_name="da";change_slide=1;goto_slide=2;
                    if (i=1001){custom=2;scr_chapter_random(0);}
                    if (i=1002){custom=1;scr_chapter_random(1);}
                }
            }
            i+=1;x2+=53;
        }
        
        if (tool=1) and (highlighting<30) then highlighting+=1;
        if (tool=0) and (highlighting>0) then highlighting-=1;
        // if (new_hover=0) then highlight=0;
        
        if ((highlight>0) and (highlighting>0)) or ((change_slide>0) and (goto_slide!=1)){
            draw_set_alpha(min(slate4/30,highlighting/30));
            if (change_slide>0) then draw_set_alpha(1);
            
            
            if (highlight<=9) then scr_image("main_splash",highlight-1,0,68,374,713);
            if (highlight>9) and (highlight<=16) and (highlight!=15) then scr_image("existing_splash",highlight-10,0,68,374,713);
            if (highlight=15) then scr_image("other_splash",6,0,68,374,713);
            if (highlight=17) then scr_image("other_splash",0,0,68,374,713);
            if (highlight=18) then scr_image("other_splash",6,0,68,374,713);
            if (highlight=19) then scr_image("other_splash",2,0,68,374,713);
            if (highlight=20) then scr_image("other_splash",6,0,68,374,713);
            
            if (highlight=1001) then scr_image("other_splash",4,0,68,374,713);
            if (highlight=1002) then scr_image("other_splash",5,0,68,374,713);
            
            /*if (highlight<=9) then draw_sprite(spr_creation_founding,highlight-1,0,68);
            if (highlight>9) and (highlight<=16) and (highlight!=15) then draw_sprite(spr_creation_existing,highlight-10,0,68);
            if (highlight=15) then draw_sprite(spr_creation_nosplash,0,0,68);
            if (highlight=17) then draw_sprite(spr_creation_other,0,0,68);
            if (highlight=18) then draw_sprite(spr_creation_nosplash,0,0,68);
            if (highlight=19) then draw_sprite(spr_creation_other,2,0,68);
            if (highlight=20) then draw_sprite(spr_creation_nosplash,0,0,68);
            
            if (highlight=1001) then draw_sprite(spr_creation_other,4,0,68);
            if (highlight=1002) then draw_sprite(spr_creation_other,5,0,68);*/
            
            draw_set_alpha(slate4/30);
            draw_set_color(38144);
            draw_rectangle(0,68,374,781,1);
        }
        draw_set_alpha(slate4/30);
        
        
        
        
        if (instance_exists(obj_cursor)){obj_cursor.image_index=0;}
        if (tool=1) and (change_slide<=0){
            if (instance_exists(obj_cursor)){obj_cursor.image_index=1;}
            
            draw_set_alpha(1);
            draw_set_color(0);
            draw_set_halign(fa_left);
            
            if (highlight<=25){
                tooltip=chapter_id[highlight];
                tooltip2=chapter_tooltip[highlight];
            }
            if (highlight=1001) then tooltip="Custom";
            if (highlight=1002) then tooltip="Randomize";
            if (highlight=1001) then tooltip2="Create your own customized Chapter, deciding the origins, strength, and weaknesses.  Custom Chapters are weaker than Founding Chapters.";
            if (highlight=1002) then tooltip2="Randomly generate a Chapter to play.  The origins, strength, and weaknesses are all random.  Random Chapters are normally weaker than Founding Chapters. ";
        }
        
        
        
    }
}


/* */

var yar;yar=0;


if (slide>=2){
    tooltip="";tooltip2="";
    
    if (goto_slide!=1){
        if (icon<=9) then draw_sprite(spr_creation_founding,icon-1,0,68);
        if (icon>9) and (icon<=16) and (icon!=15) then draw_sprite(spr_creation_existing,icon-10,0,68);
        if (icon=15) then draw_sprite(spr_creation_nosplash,0,0,68);
        if (icon=17) then draw_sprite(spr_creation_other,0,0,68);
        if (icon=18) then draw_sprite(spr_creation_nosplash,0,0,68);
        if (icon=19) then draw_sprite(spr_creation_other,2,0,68);
        if (icon=20) then draw_sprite(spr_creation_nosplash,0,0,68);
        
        if (custom=2) then draw_sprite(spr_creation_other,4,0,68);
        if (custom=1) then draw_sprite(spr_creation_other,5,0,68);
        
        draw_set_color(38144);
        draw_rectangle(0,68,374,781,1);
    }
    
    draw_set_color(0);
    draw_rectangle(436,74,436+128,74+128,0);
    // if (icon<=20) then draw_sprite_stretched(spr_icon,icon,436,74,128,128);
    if (icon<=20) then scr_image("creation",icon,436,74,128,128);
    if (icon>20) then draw_sprite_stretched(spr_icon_chapters,icon-19,436,74,128,128);
    
    obj_cursor.image_index=0;
    if (scr_hit(436,74,436+128,74+128)=true) and (popup=""){obj_cursor.image_index=1;
        tooltip="Chapter Icon";tooltip2="Your Chapter's icon.  Click to edit.";
        
        /*if (cooldown<=0) and (mouse_left=1){
            popup="icons";cooldown=8000;
        }*/
    }
    
    var i;i=0;
    repeat(290){i+=1;
        if (icon_name="custom"+string(i)) and (obj_cuicons.spr_custom[i]>0){
            if (sprite_exists(obj_cuicons.spr_custom_icon[i])){
                draw_sprite_stretched(obj_cuicons.spr_custom_icon[i],0,436,74,128,128);
                
                
                // obj_cuicons.spr_custom_icon[ic-78]
            }
        }
    }
    
    // draw_set_color(c_orange);
    // draw_text(436+64,74-30,string(icon_name));
    
    
    if (slide=2){
        /*if (scr_hit(548,149,584,193)=true){obj_cursor.image_index=1;
            if (cooldown<=0) and (mouse_left>=1){cooldown=8000;scr_icon("-");}
        }
        if (scr_hit(595,149,634,193)=true){obj_cursor.image_index=1;
            if (cooldown<=0) and (mouse_left>=1){cooldown=8000;scr_icon("+");}
        }*/
        
        
        if (founding!=0){
            draw_set_font(fnt_40k_30b);
            // draw_text_transformed(
        
            draw_set_alpha(0.33);
            // if (founding<10) then draw_sprite_stretched(spr_icon,founding,1164-128,74,128,128);
            if (founding<10) then scr_image("creation",founding,1164-128,74,128,128);
            if (founding=10) then draw_sprite_stretched(spr_icon_chapters,0,1164-128,74,128,128);
            draw_set_alpha(1);
            
            if (scr_hit(1164-128,74,1164,74+128)=true){tooltip="Founding Chapter";tooltip2="The parent Chapter whos Gene-Seed your own originates from.";}
            
            if (custom>1){
                draw_sprite_stretched(spr_creation_arrow,0,1164-194,160,32,32);
                draw_sprite_stretched(spr_creation_arrow,1,1164-144,160,32,32);
                
                if (scr_hit(1164-194,149,1164-162,193)=true){obj_cursor.image_index=1;
                    if (cooldown<=0) and (mouse_left>=1){cooldown=8000;founding-=1;if (founding=0) then founding=10;}
                }
                if (scr_hit(1164-144,149,1164-112,193)=true){obj_cursor.image_index=1;
                    if (cooldown<=0) and (mouse_left>=1){cooldown=8000;founding+=1;if (founding=11) then founding=1;}
                }
            }
            
            
        }
        
        
        
    }
    
    
}


if (slide=2){
    draw_set_color(38144);
    draw_set_font(fnt_40k_30b);
    draw_set_halign(fa_center);
    
    obj_cursor.image_index=0;
    
    if (name_bad=1) then draw_set_color(c_red);
    if (text_selected!="chapter") or (custom!=2) then draw_text(800,80,string_hash_to_newline(string(chapter)));
    if (custom=2){
        if (text_selected="chapter") and (text_bar>30) then draw_text(800,80,string_hash_to_newline(string(chapter)));
        if (text_selected="chapter") and (text_bar<=30) then draw_text(805,80,string_hash_to_newline(string(chapter)+"|"));
        if (scr_text_hit(800,80,true,chapter)=true){
            obj_cursor.image_index=2;
            if (cooldown<=0) and (mouse_left>=1){text_selected="chapter";cooldown=8000;keyboard_string=chapter;}
        }
        if (text_selected="chapter") then chapter=keyboard_string;
        draw_set_alpha(0.75);draw_rectangle(580,80,1020,118,1);draw_set_alpha(1);
    }
    
    draw_set_color(38144);
    draw_text_transformed(800,120,string_hash_to_newline("Points: "+string(points)+"/"+string(maxpoints)),0.6,0.6,0);
    
    
    obj_cursor.image_index=0;
    if (custom>0) and (restarted=0){
        if (scr_hit(436,74,436+128,74+128)=true) and (popup=""){obj_cursor.image_index=1;
            if (cooldown<=0) and (mouse_left=1){
                popup="icons";cooldown=8000;
            }
        }
    }
    
    /*if (custom>0) and (restarted=0){
        draw_sprite_stretched(spr_creation_arrow,0,550,160,32,32);
        draw_sprite_stretched(spr_creation_arrow,1,597,160,32,32);
    }*/
    
    draw_set_color(38144);
    draw_line(445,200,1125,200);
    draw_line(445,201,1125,201);
    draw_line(445,202,1125,202);
    
    if (popup=""){
        if (custom<2) then draw_set_alpha(0.5);
        draw_text_transformed(800,211,string_hash_to_newline("Chapter Type"),0.6,0.6,0);
        draw_set_halign(fa_left);
        
        if (scr_hit(516,242,674,266)=true){tooltip="Homeworld";tooltip2="Your chapter has a homeworld that they base on.  Contained upon it is a massive Fortress Monastery, which provides high levels of defense and automated weapons.";}
        if (scr_hit(768,242,866,266)=true){tooltip="Fleet Based";tooltip2="Rather than a homeworld your chapter begins near their recruiting world.  The fleet includes a Battle Barge, which serves as a mobile base, and powerful ship.";}
        if (scr_hit(952,242,1084,266)=true){tooltip="Penitent";tooltip2="As with Fleet Based, but you must crusade and fight until your penitence meter runs out.  Note that recruiting is disabled until then.";}// Avoiding fights will result in excomunicatus traitorus.
        
        if (custom<2) then draw_set_alpha(0.5);
        yar=0;if (fleet_type=1) then yar=1;draw_sprite(spr_creation_check,yar,519,239);yar=0;
        if (scr_hit(519,239,519+32,239+32)=true) and (cooldown<=0) and (mouse_left>=1) and (custom=2){cooldown=8000;
            if (points+20<=maxpoints) and (fleet_type=3){points+=20;fleet_type=1;}
            if (fleet_type=2){fleet_type=1;}
        }
        draw_text_transformed(551,239,string_hash_to_newline("Homeworld"),0.6,0.6,0);
        
        yar=0;if (fleet_type=2) then yar=1;draw_sprite(spr_creation_check,yar,771,239);yar=0;
        if (scr_hit(771,239,771+32,239+32)=true) and (cooldown<=0) and (mouse_left>=1) and (custom=2){cooldown=8000;
            if (points+20<=maxpoints) and (fleet_type=3){points+=20;fleet_type=2;}
            if (fleet_type=1){fleet_type=2;}
        }
        draw_text_transformed(804,239,string_hash_to_newline("Fleet Based"),0.6,0.6,0);
        
        yar=0;if (fleet_type=3) then yar=1;draw_sprite(spr_creation_check,yar,958,239);yar=0;
        if (scr_hit(958,239,958+32,239+32)=true) and (cooldown<=0) and (mouse_left>=1) and (custom=2){if (fleet_type!=3) then points-=20;fleet_type=3;cooldown=8000;}
        draw_text_transformed(990,239,string_hash_to_newline("Penitent"),0.6,0.6,0);
        draw_set_alpha(1);
        
        draw_line(445,289,1125,289);
        draw_line(445,290,1125,290);
        draw_line(445,291,1125,291);
        
        draw_set_halign(fa_center);
        draw_text_transformed(800,301,string_hash_to_newline("Chapter Stats"),0.6,0.6,0);
        draw_set_halign(fa_right);
        
        draw_text_transformed(617,332,string_hash_to_newline("Strength ("+string(strength)+")"),0.5,0.5,0);
        draw_text_transformed(617,387,string_hash_to_newline("Cooperation ("+string(cooperation)+")"),0.5,0.5,0);
        draw_text_transformed(617,442,string_hash_to_newline("GeneSeed Purity ("+string(purity)+")"),0.5,0.5,0);
        draw_text_transformed(617,497,string_hash_to_newline("GeneSeed Stability ("+string(stability)+")"),0.5,0.5,0);
        
        if (custom=2) then draw_sprite_stretched(spr_arrow,0,625,325,32,32);
        if (scr_hit(625,325,657,357)=true){obj_cursor.image_index=1;if (cooldown<=0) and (custom=2) and (strength>1) and (mouse_left>=1){strength-=1;points-=10;cooldown=8000;}}
        if (custom=2) then draw_sprite_stretched(spr_arrow,0,625,380,32,32);
        if (scr_hit(625,380,657,412)=true){obj_cursor.image_index=1;if (cooldown<=0) and (custom=2) and (cooperation>1) and (mouse_left>=1){cooperation-=1;points-=10;cooldown=8000;}}
        if (custom=2) then draw_sprite_stretched(spr_arrow,0,625,435,32,32);
        if (scr_hit(625,435,657,467)=true){obj_cursor.image_index=1;if (cooldown<=0) and (custom=2) and (purity>1) and (mouse_left>=1){purity-=1;points-=10;cooldown=8000;}}
        if (custom=2) then draw_sprite_stretched(spr_arrow,0,625,490,32,32);
        if (scr_hit(625,490,657,522)=true){obj_cursor.image_index=1;if (cooldown<=0) and (custom=2) and (stability>1) and (mouse_left>=1){stability-=1;points-=10;cooldown=8000;}}
        
        if (custom=2) then draw_sprite_stretched(spr_arrow,1,1135,325,32,32);
        if (scr_hit(1135,325,1167,357)=true){obj_cursor.image_index=1;if (cooldown<=0) and (custom=2) and (strength<10) and (points+10<=maxpoints) and (mouse_left>=1){strength+=1;points+=10;cooldown=8000;}}
        if (custom=2) then draw_sprite_stretched(spr_arrow,1,1135,380,32,32);
        if (scr_hit(1135,380,1167,412)=true){obj_cursor.image_index=1;if (cooldown<=0) and (custom=2) and (cooperation<10) and (points+10<=maxpoints) and (mouse_left>=1){cooperation+=1;points+=10;cooldown=8000;}}
        if (custom=2) then draw_sprite_stretched(spr_arrow,1,1135,435,32,32);
        if (scr_hit(1135,435,1167,467)=true){obj_cursor.image_index=1;if (cooldown<=0) and (custom=2) and (purity<10) and (points+10<=maxpoints) and (mouse_left>=1){purity+=1;points+=10;cooldown=8000;}}
        if (custom=2) then draw_sprite_stretched(spr_arrow,1,1135,490,32,32);
        if (scr_hit(1135,490,1167,522)=true){obj_cursor.image_index=1;if (cooldown<=0) and (custom=2) and (stability<10) and (points+10<=maxpoints) and (mouse_left>=1){stability+=1;points+=10;cooldown=8000;}}
        
        if (scr_hit(532,325,1166,357)=true){tooltip="Strength";tooltip2="How many companies your chapter begins with.  For every score below five a company will be removed; conversely, each score higher grants 50 additional astartes.";}
        if (scr_hit(486,380,1166,412)=true){tooltip="Cooperation";tooltip2="How diplomatic your chapter is.  A low score will lower starting dispositions of Imperial factions and make disposition increases less likely to occur.";}
        if (scr_hit(442,435,1166,467)=true){tooltip="Purity";tooltip2="A measure of how pure and mutation-free your chapter's gene-seed is.  A perfect score means no mutations must be chosen.  The lower the score, the more mutations.";}
        if (scr_hit(423,490,1166,522)=true){tooltip="Stability";tooltip2="A measure of how easily new mutations and corruption can occur with your chapter-gene seed.  A perfect score makes the gene-seed almost perfectly stable.";}
        
        draw_rectangle(668,330,1125,351,1);
        draw_rectangle(668,330,668+(strength*45.7),351,0);
        draw_rectangle(668,385,1125,406,1);
        draw_rectangle(668,385,668+(cooperation*45.7),406,0);
        draw_rectangle(668,440,1125,461,1);
        draw_rectangle(668,440,668+(purity*45.7),461,0);
        draw_rectangle(668,495,1125,516,1);
        draw_rectangle(668,495,668+(stability*45.7),516,0);
    }
    
    if (popup!="icons"){
        draw_line(445,551,1125,551);
        draw_line(445,552,1125,552);
        draw_line(445,553,1125,553);
    }
    
    if (popup!="") or (custom<2) then draw_set_alpha(0.5);
    
    
    if (popup!="icons"){
        draw_set_halign(fa_left);draw_set_font(fnt_40k_30b);
        draw_text_transformed(436,564,string_hash_to_newline("Chapter Advantages"),0.5,0.5,0);draw_set_font(fnt_40k_14);
        if (adv_num[1]=0) then draw_text(436,590,string_hash_to_newline("[+]"));if (adv_num[1]>0) then draw_text(436,590,string_hash_to_newline("[-] "+string(adv[1])));
        if (adv_num[2]=0) and (adv_num[1]>0) then draw_text(436,610,string_hash_to_newline("[+]"));if (adv_num[2]>0) then draw_text(436,610,string_hash_to_newline("[-] "+string(adv[2])));
        if (adv_num[3]=0) and (adv_num[2]>0) then draw_text(436,630,string_hash_to_newline("[+]"));if (adv_num[3]>0) then draw_text(436,630,string_hash_to_newline("[-] "+string(adv[3])));
        if (adv_num[4]=0) and (adv_num[3]>0) then draw_text(436,650,string_hash_to_newline("[+]"));if (adv_num[4]>0) then draw_text(436,650,string_hash_to_newline("[-] "+string(adv[4])));
        
        draw_set_font(fnt_40k_30b);draw_text_transformed(810,564,string_hash_to_newline("Chapter Disadvantages"),0.5,0.5,0);draw_set_font(fnt_40k_14);
        if (dis_num[1]=0) then draw_text(810,590,string_hash_to_newline("[+]"));if (dis_num[1]>0) then draw_text(810,590,string_hash_to_newline("[-] "+string(dis[1])));
        if (dis_num[2]=0) and (dis_num[1]>0) then draw_text(810,610,string_hash_to_newline("[+]"));if (dis_num[2]>0) then draw_text(810,610,string_hash_to_newline("[-] "+string(dis[2])));
        if (dis_num[3]=0) and (dis_num[2]>0) then draw_text(810,630,string_hash_to_newline("[+]"));if (dis_num[3]>0) then draw_text(810,630,string_hash_to_newline("[-] "+string(dis[3])));
        if (dis_num[4]=0) and (dis_num[3]>0) then draw_text(810,650,string_hash_to_newline("[+]"));if (dis_num[4]>0) then draw_text(810,650,string_hash_to_newline("[-] "+string(dis[4])));
        
        if (scr_hit(436,564,631,583)=true){tooltip="Chapter Advantages";tooltip2="Advantages cost 20 points, and improve the performance of your chapter in a specific domain.";}
        if (scr_hit(810,564,1030,583)=true){tooltip="Chapter Disadvantages";tooltip2="Disadvantages Grant 20 additional points, and penalize the performance of your chapter.";}
    }
    
    if (popup!="icons"){
        if (scr_hit(436,590,640,619)=true){
            if (adv_num[1]!=0){tooltip=advantage[adv_num[1]];tooltip2=advantage_tooltip[adv_num[1]];}
            if (mouse_left>=1) and (cooldown<=0) and (points+20<=maxpoints) and (adv_num[1]=0) and (popup="") and (custom>1){popup="advantages";cooldown=8000;temp=1;}
            if (mouse_left>=1) and (mouse_x<=456) and (adv_num[1]>0) and (adv_num[2]=0) and (cooldown<=0) and (custom>1){points-=20;adv[1]="";adv_num[1]=0;cooldown=8000;}
        }
        if (scr_hit(436,610,640,639)=true){
            if (adv_num[2]!=0){tooltip=advantage[adv_num[2]];tooltip2=advantage_tooltip[adv_num[2]];}
            if (mouse_left>=1) and (cooldown<=0) and (points+20<=maxpoints) and (adv_num[2]=0) and (adv_num[1]!=0) and (popup="") and (custom>1){popup="advantages";cooldown=8000;temp=2;}
            if (mouse_left>=1) and (mouse_x<=456) and (adv_num[2]>0) and (adv_num[3]=0) and (cooldown<=0) and (custom>1){points-=20;adv[2]="";adv_num[2]=0;cooldown=8000;}
        }
        if (scr_hit(436,630,640,659)=true){
            if (adv_num[3]!=0){tooltip=advantage[adv_num[3]];tooltip2=advantage_tooltip[adv_num[3]];}
            if (mouse_left>=1) and (cooldown<=0) and (points+20<=maxpoints) and (adv_num[3]=0) and (adv_num[2]!=0) and (popup="") and (custom>1){popup="advantages";cooldown=8000;temp=3;}
            if (mouse_left>=1) and (mouse_x<=456) and (adv_num[3]>0) and (adv_num[4]=0) and (cooldown<=0) and (custom>1){points-=20;adv[3]="";adv_num[3]=0;cooldown=8000;}
        }
        if (scr_hit(436,650,640,679)=true){
            if (adv_num[4]!=0){tooltip=advantage[adv_num[4]];tooltip2=advantage_tooltip[adv_num[4]];}
            if (mouse_left>=1) and (cooldown<=0) and (points+20<=maxpoints) and (adv_num[4]=0) and (adv_num[3]!=0) and (popup="") and (custom>1){popup="advantages";cooldown=8000;temp=4;}
            if (mouse_left>=1) and (mouse_x<=456) and (adv_num[4]>0) and (cooldown<=0) and (custom>1){points-=20;adv[4]="";adv_num[4]=0;cooldown=8000;}
        }
        
        if (scr_hit(810,590,1014,619)=true){
            if (dis_num[1]!=0){tooltip=disadvantage[dis_num[1]];tooltip2=dis_tooltip[dis_num[1]];}
            if (mouse_left>=1) and (cooldown<=0) and (dis_num[1]=0) and (dis_num[2]=0) and (popup="") and (custom>1){popup="disadvantages";cooldown=8000;temp=1;}
            if (mouse_left>=1) and (mouse_x<=830) and (dis_num[1]>0) and (dis_num[2]=0) and (cooldown<=0) and (points+20<=maxpoints) and (custom>1){points+=20;dis[1]="";dis_num[1]=0;cooldown=8000;}
        }
        if (scr_hit(810,610,1014,639)=true){
            if (dis_num[2]!=0){tooltip=disadvantage[dis_num[2]];tooltip2=dis_tooltip[dis_num[2]];}
            if (mouse_left>=1) and (cooldown<=0) and (dis_num[2]=0) and (dis_num[3]=0) and (dis_num[1]>0) and (popup="") and (custom>1){popup="disadvantages";cooldown=8000;temp=2;}
            if (mouse_left>=1) and (mouse_x<=830) and (dis_num[2]>0) and (dis_num[3]=0) and (cooldown<=0) and (points+20<=maxpoints) and (custom>1){points+=20;dis[2]="";dis_num[2]=0;cooldown=8000;}
        }
        if (scr_hit(810,630,1014,659)=true){
            if (dis_num[3]!=0){tooltip=disadvantage[dis_num[3]];tooltip2=dis_tooltip[dis_num[3]];}
            if (mouse_left>=1) and (cooldown<=0) and (dis_num[3]=0) and (dis_num[4]=0) and (dis_num[2]>0) and (popup="") and (custom>1){popup="disadvantages";cooldown=8000;temp=3;}
            if (mouse_left>=1) and (mouse_x<=830) and (dis_num[3]>0) and (dis_num[4]=0) and (cooldown<=0) and (points+20<=maxpoints) and (custom>1){points+=20;dis[3]="";dis_num[3]=0;cooldown=8000;}
        }
        if (scr_hit(810,650,1014,679)=true){
            if (dis_num[4]!=0){tooltip=disadvantage[dis_num[4]];tooltip2=dis_tooltip[dis_num[4]];}
            if (mouse_left>=1) and (cooldown<=0) and (dis_num[4]=0) and (popup="") and (dis_num[3]>0) and (custom>1){popup="disadvantages";cooldown=8000;temp=4;}
            if (mouse_left>=1) and (mouse_x<=830) and (dis_num[4]>0) and (cooldown<=0) and (points+20<=maxpoints) and (custom>1){points+=20;dis[4]="";dis_num[4]=0;cooldown=8000;}
        }
        
        draw_set_alpha(1);
    }
    
    
    
    if (popup="icons"){
        draw_set_alpha(1);
        draw_set_color(0);
        draw_rectangle(450,206,1144,711,0);
        
        draw_set_color(38144);
        draw_line(445,727,1125,727);
        draw_line(445,728,1125,728);
        draw_line(445,729,1125,729);
        
        draw_set_font(fnt_40k_30b);draw_set_halign(fa_center);
        draw_text_transformed(800,211,string_hash_to_newline("Select an Icon"),0.6,0.6,0);
        draw_text_transformed(800,687,string_hash_to_newline("Cancel"),0.6,0.6,0);
        
        var cw,ch;
        cw=string_width(string_hash_to_newline("Cancel"))*0.6;
        ch=string_height(string_hash_to_newline("Cancel"))*0.6;
        
        if (scr_hit(800,687,800+cw,687+ch)=true){
            draw_set_color(c_white);draw_set_alpha(0.25);
            draw_text_transformed(800,687,string_hash_to_newline("Cancel"),0.6,0.6,0);
            draw_set_color(38144);draw_set_alpha(1);
            
            if (mouse_left=1) and (cooldown<=0){
                cooldown=8000;popup="";
            }
        }
        
        draw_set_font(fnt_40k_14b);draw_set_halign(fa_left);
        
        // repeat here
        
        var i,ic,x3,y3,row;
        i=0;ic=icons_top-1;x3=445-110;y3=245;row=0;
        
        repeat(24){
            i+=1;ic+=1;row+=1;
            
            if (row=7){
                row=1;x3=445-110;y3+=110;
            }
            
            x3+=110;
            
            if (ic<=(76+global.custom_icons)){
                // if (ic=21) then ic=23;
                
                // draw_rectangle(x3,y3,x3+96,y3+96,0);
                // if (ic<=20) then draw_sprite_stretched(spr_icon,ic,x3,y3,96,96);
                if (ic<=20) then scr_image("creation",ic,x3,y3,96,96);
                if (ic>20) and (ic<=76) then draw_sprite_stretched(spr_icon_chapters,ic-19,x3,y3,96,96);
                if (ic>76) and (obj_cuicons.spr_custom[ic-76]>0) and (obj_cuicons.spr_custom_icon[ic-76]!=-1){
                    draw_sprite_stretched(obj_cuicons.spr_custom_icon[ic-76],0,x3,y3,96,96);
                }
                
                if (scr_hit(x3,y3,x3+96,y3+96)=true){
                    draw_set_blend_mode(bm_add);draw_set_alpha(0.25);draw_set_color(16119285);
                    // if (ic<=20) then draw_sprite_stretched(spr_icon,ic,x3,y3,96,96);
                    if (ic<=20) then scr_image("creation",ic,x3,y3,96,96);
                    if (ic>20) and (ic<=76) then draw_sprite_stretched(spr_icon_chapters,ic-19,x3,y3,96,96);
                    if (ic>76) and (obj_cuicons.spr_custom[ic-76]>0) and (obj_cuicons.spr_custom_icon[ic-76]!=-1){
                        draw_sprite_stretched(obj_cuicons.spr_custom_icon[ic-76],0,x3,y3,96,96);
                    }
                    draw_set_blend_mode(bm_normal);
                    draw_set_alpha(1);draw_set_color(38144);
                    
                    if (mouse_left=1) and (cooldown<=0){
                        cooldown=8000;popup="";icon=ic;icon_name="";scr_icon("");
                        if (ic>76) then custom_icon=ic-76;
                        // show_message(string(icon_name));
                    }
                    
                }
                
                // draw_set_color(c_orange);
                // draw_text(x3+48,y3+64,string(ic));
                draw_set_color(38144);
            }
            
        }
        
        
        var x1,x2,x3,x4,x6,y1,y2,y3,y4,y6,bs,see_size,total_max,current,top;
        
        x1=1111;y1=245;x2=1131;y2=671;bs=245;
        draw_rectangle(x1,y1,x2,y2,1);
        
        total_max=77+global.custom_icons;
        see_size=(671-245)/total_max;
        
        x3=1111;x4=1131;
        current=icons_top;
        top=current*see_size;
        y3=top;y4=y3+(24*see_size)-see_size;
        
        
        if (scrollbar_engaged=0) then draw_rectangle(x3,y3+bs,x4,y4+bs,0);
        
        if (scrollbar_engaged>0){
            y3=mouse_y-scrollbar_engaged;
            // y3=mouse_y-scrollbar_engaged
            y4=y3+(24*see_size);
            
            if (y3<y1){y3=y1;y4=y3+(24*see_size);}
            if (y4>y2){y4=y2;y3=y2-(24*see_size);}
            
            draw_rectangle(x3,y3,x4,y4,0);
        }
        
        
        if (scr_hit(x3,y3+bs,x4,y4+bs)=true) and (cooldown<=0) and (scrollbar_engaged<=0) and (mouse_left=1){// Click within the scrollbar grip area
            scrollbar_engaged=mouse_y-(y3+bs);cooldown=8000;
        }
        
        
        
    }
    
    
    
    
    if (popup="advantages"){
        draw_set_font(fnt_40k_30b);draw_set_halign(fa_center);
        draw_text_transformed(800,211,string_hash_to_newline("Select an Advantage"),0.6,0.6,0);
        draw_set_font(fnt_40k_14b);draw_set_halign(fa_left);
        
        var i,ha,ha2,disable;i=0;ha=string(adv[1])+string(adv[2])+string(adv[3])+string(adv[4]);ha2=string(dis[1])+string(dis[2])+string(dis[3])+string(dis[4]);
        repeat(14){i+=1;disable=0;
            if (advantage[i]!=""){
                draw_set_color(38144);draw_set_alpha(1);if (string_count(advantage[i],ha)>0) then draw_set_alpha(0.5);
                
                if (advantage[i]="Psyker Abundance") and (string_count("Psyker Intolerant",ha2)>0){disable=1;draw_set_alpha(0.5);} 
                if (advantage[i]="Reverent Guardians") and (string_count("Suspicious",ha2)>0){disable=1;draw_set_alpha(0.5);} 
                if (advantage[i]="Tech-Brothers") and (string_count("Tech-Heresy",ha2)>0){disable=1;draw_set_alpha(0.5);}
                
                draw_text(436,230+(i*20),string_hash_to_newline(advantage[i]));
                
                if (scr_hit(436,230+(i*20),436+string_width(string_hash_to_newline(advantage[i])),249+(i*20))=true) and (cooldown<=0) and (mouse_left>=1) and (advantage[i]="Cancel"){
                    cooldown=8000;popup="";
                }
                if (scr_hit(436,230+(i*20),436+string_width(string_hash_to_newline(advantage[i])),249+(i*20))=true){tooltip=advantage[i];tooltip2=advantage_tooltip[i];draw_set_color(c_white);draw_set_alpha(0.2);draw_text(436,230+(i*20),string_hash_to_newline(advantage[i]));}
                if (scr_hit(436,230+(i*20),436+string_width(string_hash_to_newline(advantage[i])),249+(i*20))=true) and (cooldown<=0) and (mouse_left>=1) and (string_count(advantage[i],ha)=0){
                    if (disable=0){cooldown=8000;adv[temp]=advantage[i];adv_num[temp]=i;popup="";points+=20;}
        }}}
        repeat(14){i+=1;disable=0;
            if (advantage[i]!=""){
                draw_set_color(38144);draw_set_alpha(1);if (string_count(advantage[i],ha)>0) then draw_set_alpha(0.5);
                
                if (advantage[i]="Psyker Abundance") and (string_count("Psyker Intolerant",ha2)>0){disable=1;draw_set_alpha(0.5);} 
                if (advantage[i]="Reverent Guardians") and (string_count("Suspicious",ha2)>0){disable=1;draw_set_alpha(0.5);} 
                if (advantage[i]="Tech-Brothers") and (string_count("Tech-Heresy",ha2)>0){disable=1;draw_set_alpha(0.5);} 
                
                draw_text(670,230+((i-14)*20),string_hash_to_newline(advantage[i]));
                
                if (scr_hit(670,230+((i-14)*20),670+string_width(string_hash_to_newline(advantage[i])),249+((i-14)*20))=true) and (cooldown<=0) and (mouse_left>=1) and (advantage[i]="Cancel"){
                    cooldown=8000;popup="";
                }
                if (scr_hit(670,230+((i-14)*20),670+string_width(string_hash_to_newline(advantage[i])),249+((i-14)*20))=true){tooltip=advantage[i];tooltip2=advantage_tooltip[i];draw_set_color(c_white);draw_set_alpha(0.2);draw_text(670,230+((i-14)*20),string_hash_to_newline(advantage[i]));}
                if (scr_hit(670,230+((i-14)*20),670+string_width(string_hash_to_newline(advantage[i])),249+((i-14)*20))=true) and (cooldown<=0) and (mouse_left>=1) and (string_count(advantage[i],ha)=0){
                    if (disable=0){cooldown=8000;adv[temp]=advantage[i];adv_num[temp]=i;popup="";points+=20;}
        }}}
        repeat(14){i+=1;disable=0;
            if (advantage[i]!=""){
                draw_set_color(38144);draw_set_alpha(1);if (string_count(advantage[i],ha)>0) then draw_set_alpha(0.5);
                
                if (advantage[i]="Psyker Abundance") and (string_count("Psyker Intolerant",ha2)>0){disable=1;draw_set_alpha(0.5);} 
                if (advantage[i]="Reverent Guardians") and (string_count("Suspicious",ha2)>0){disable=1;draw_set_alpha(0.5);} 
                if (advantage[i]="Tech-Brothers") and (string_count("Tech-Heresy",ha2)>0){disable=1;draw_set_alpha(0.5);}
                
                draw_text(904,230+((i-28)*20),string_hash_to_newline(advantage[i]));
                
                if (scr_hit(904,230+((i-28)*20),904+string_width(string_hash_to_newline(advantage[i])),249+((i-28)*20))=true) and (cooldown<=0) and (mouse_left>=1) and (advantage[i]="Cancel"){
                    cooldown=8000;popup="";
                }
                if (scr_hit(904,230+((i-28)*20),904+string_width(string_hash_to_newline(advantage[i])),249+((i-28)*20))=true){tooltip=advantage[i];tooltip2=advantage_tooltip[i];draw_set_color(c_white);draw_set_alpha(0.2);draw_text(904,230+((i-28)*20),string_hash_to_newline(advantage[i]));}
                if (scr_hit(904,230+((i-28)*20),904+string_width(string_hash_to_newline(advantage[i])),249+((i-28)*20))=true) and (cooldown<=0) and (mouse_left>=1) and (string_count(advantage[i],ha)>0){
                    if (disable=0){cooldown=8000;adv[temp]=advantage[i];adv_num[temp]=i;popup="";points+=20;}
        }}}
    }
    /*if (popup="advantages"){
        draw_set_font(fnt_40k_30b);draw_set_halign(fa_center);
        draw_text_transformed(800,211,"Select an Advantage",0.6,0.6,0);
        draw_set_font(fnt_40k_14b);draw_set_halign(fa_left);
        
        var i;i=0;
        repeat(14){i+=1;
            if (advantage[i]!=""){
                draw_text(436,230+(i*20),advantage[i]);
                if (scr_hit(436,230+(i*20),436+string_width(advantage[i]),249+(i*20))=true){tooltip=advantage[i];tooltip2=advantage_tooltip[i];}
                if (scr_hit(436,230+(i*20),436+string_width(advantage[i]),249+(i*20))=true) and (cooldown<=0) and (mouse_left>=1){
                    cooldown=8000;adv[temp]=advantage[i];adv_num[temp]=i;popup="";points+=20;
        }}}
        repeat(14){i+=1;
            if (advantage[i]!=""){
                draw_text(670,230+((i-14)*20),advantage[i]);
                if (scr_hit(670,230+((i-14)*20),670+string_width(advantage[i]),249+((i-14)*20))=true){tooltip=advantage[i];tooltip2=advantage_tooltip[i];}
                if (scr_hit(670,230+((i-14)*20),670+string_width(advantage[i]),249+((i-14)*20))=true) and (cooldown<=0) and (mouse_left>=1){
                    cooldown=8000;adv[temp]=advantage[i];adv_num[temp]=i;popup="";points+=20;
        }}}
        repeat(14){i+=1;
            if (advantage[i]!=""){
                draw_text(904,230+((i-28)*20),advantage[i]);
                if (scr_hit(904,230+((i-28)*20),904+string_width(advantage[i]),249+((i-28)*20))=true){tooltip=advantage[i];tooltip2=advantage_tooltip[i];}
                if (scr_hit(904,230+((i-28)*20),904+string_width(advantage[i]),249+((i-28)*20))=true) and (cooldown<=0) and (mouse_left>=1){
                    cooldown=8000;adv[temp]=advantage[i];adv_num[temp]=i;popup="";points+=20;
        }}}
    }*/
    if (popup="disadvantages"){
        draw_set_font(fnt_40k_30b);draw_set_halign(fa_center);
        draw_text_transformed(800,211,string_hash_to_newline("Select a Disadvantage"),0.6,0.6,0);
        draw_set_font(fnt_40k_14b);draw_set_halign(fa_left);
        
        var i,ha,ha2,disable;i=0;ha=string(dis[1])+string(dis[2])+string(dis[3])+string(dis[4]);ha2=string(adv[1])+string(adv[2])+string(adv[3])+string(adv[4]);
        repeat(14){i+=1;disable=0;
            if (disadvantage[i]!=""){
                draw_set_color(38144);draw_set_alpha(1);if (string_count(disadvantage[i],ha)>0) then draw_set_alpha(0.5);
                
                if (disadvantage[i]="Psyker Intolerant") and (string_count("Psyker Abundance",ha2)>0){disable=1;draw_set_alpha(0.5);}
                if (disadvantage[i]="Suspicious") and (string_count("Reverent Guardians",ha2)>0){disable=1;draw_set_alpha(0.5);}
                if (disadvantage[i]="Tech-Heresy") and (string_count("Tech-Brothers",ha2)>0){disable=1;draw_set_alpha(0.5);}
                if (disadvantage[i]="Blood Debt") and (fleet_type=3){disable=1;draw_set_alpha(0.5);}
                
                draw_text(436,230+(i*20),string_hash_to_newline(disadvantage[i]));
                
                if (scr_hit(436,230+(i*20),436+string_width(string_hash_to_newline(disadvantage[i])),249+(i*20))=true) and (cooldown<=0) and (mouse_left>=1) and (disadvantage[i]="Cancel"){
                    cooldown=8000;popup="";
                }
                if (scr_hit(436,230+(i*20),436+string_width(string_hash_to_newline(disadvantage[i])),249+(i*20))=true){tooltip=disadvantage[i];tooltip2=dis_tooltip[i];draw_set_color(c_white);draw_set_alpha(0.2);draw_text(436,230+(i*20),string_hash_to_newline(disadvantage[i]));}
                if (scr_hit(436,230+(i*20),436+string_width(string_hash_to_newline(disadvantage[i])),249+(i*20))=true) and (cooldown<=0) and (mouse_left>=1) and (string_count(disadvantage[i],ha)=0){
                    if (disable=0){cooldown=8000;dis[temp]=disadvantage[i];dis_num[temp]=i;popup="";points-=20;}
        }}}
        repeat(14){i+=1;disable=0;
            if (disadvantage[i]!=""){
                draw_set_color(38144);draw_set_alpha(1);if (string_count(disadvantage[i],ha)>0) then draw_set_alpha(0.5);
                
                if (disadvantage[i]="Psyker Intolerant") and (string_count("Psyker Abundance",ha2)>0){disable=1;draw_set_alpha(0.5);}
                if (disadvantage[i]="Suspicious") and (string_count("Reverent Guardians",ha2)>0){disable=1;draw_set_alpha(0.5);}
                if (disadvantage[i]="Tech-Heresy") and (string_count("Tech-Brothers",ha2)>0){disable=1;draw_set_alpha(0.5);}
                if (disadvantage[i]="Blood Debt") and (fleet_type=3){disable=1;draw_set_alpha(0.5);}
                
                draw_text(670,230+((i-14)*20),string_hash_to_newline(disadvantage[i]));
                if (scr_hit(670,230+((i-14)*20),670+string_width(string_hash_to_newline(disadvantage[i])),249+((i-14)*20))=true) and (cooldown<=0) and (mouse_left>=1) and (disadvantage[i]="Cancel"){
                    cooldown=8000;popup="";
                }
                if (scr_hit(670,230+((i-14)*20),670+string_width(string_hash_to_newline(disadvantage[i])),249+((i-14)*20))=true){tooltip=disadvantage[i];tooltip2=dis_tooltip[i];draw_set_color(c_white);draw_set_alpha(0.2);draw_text(670,230+((i-14)*20),string_hash_to_newline(disadvantage[i]));}
                if (scr_hit(670,230+((i-14)*20),670+string_width(string_hash_to_newline(disadvantage[i])),249+((i-14)*20))=true) and (cooldown<=0) and (mouse_left>=1) and (string_count(disadvantage[i],ha)=0){
                    if (disable=0){cooldown=8000;dis[temp]=disadvantage[i];dis_num[temp]=i;popup="";points-=20;}
        }}}
        repeat(14){i+=1;disable=0;
            if (disadvantage[i]!=""){
                draw_set_color(38144);draw_set_alpha(1);if (string_count(disadvantage[i],ha)>0) then draw_set_alpha(0.5);
                
                if (disadvantage[i]="Psyker Intolerant") and (string_count("Psyker Abundance",ha2)>0){disable=1;draw_set_alpha(0.5);}
                if (disadvantage[i]="Suspicious") and (string_count("Reverent Guardians",ha2)>0){disable=1;draw_set_alpha(0.5);}
                if (disadvantage[i]="Tech-Heresy") and (string_count("Tech-Brothers",ha2)>0){disable=1;draw_set_alpha(0.5);}
                if (disadvantage[i]="Blood Debt") and (fleet_type=3){disable=1;draw_set_alpha(0.5);}
                
                draw_text(904,230+((i-28)*20),string_hash_to_newline(disadvantage[i]));
                if (scr_hit(904,230+((i-28)*20),904+string_width(string_hash_to_newline(disadvantage[i])),249+((i-28)*20))=true) and (cooldown<=0) and (mouse_left>=1) and (disadvantage[i]="Cancel"){
                    cooldown=8000;popup="";
                }
                if (scr_hit(904,230+((i-28)*20),904+string_width(string_hash_to_newline(disadvantage[i])),249+((i-28)*20))=true){tooltip=disadvantage[i];tooltip2=dis_tooltip[i];draw_set_color(c_white);draw_set_alpha(0.2);draw_text(904,230+((i-28)*20),string_hash_to_newline(disadvantage[i]));}
                if (scr_hit(904,230+((i-28)*20),904+string_width(string_hash_to_newline(disadvantage[i])),249+((i-28)*20))=true) and (cooldown<=0) and (mouse_left>=1) and (string_count(disadvantage[i],ha)=0){
                    if (disable=0){cooldown=8000;dis[temp]=disadvantage[i];dis_num[temp]=i;popup="";points-=20;}
        }}}
    }
    if (popup!="") and ((mouse_left>=1) or (mouse_right=1)) and (cooldown<=0){
        if ((mouse_x<445) or (mouse_x>1125) or (mouse_y<200) or (mouse_y>552)) and (popup!="icons"){
            cooldown=8000;popup="";
        }
        if ((mouse_x<445) or (mouse_x>1125) or (mouse_y<200) or (mouse_y>719)) and (popup="icons"){
            cooldown=8000;popup="";
        }
    }
    
}

/* */

var yar;yar=0;

if (slide=3){
    draw_set_color(38144);
    draw_set_font(fnt_40k_30b);
    draw_set_halign(fa_center);
    
    tooltip="";tooltip2="";
    obj_cursor.image_index=0;
    
    draw_text(800,80,string_hash_to_newline(string(chapter)));
    
    draw_set_color(38144);
    draw_line(445,200,1125,200);
    draw_line(445,201,1125,201);
    draw_line(445,202,1125,202);
    
    
    
    
    
    if (fleet_type=1) then draw_text_transformed(644,218,string_hash_to_newline("Homeworld"),0.6,0.6,0);
    if (fleet_type!=1) then draw_text_transformed(644,218,string_hash_to_newline("Flagship"),0.6,0.6,0);
    var eh,eh2;eh=0;eh2=0;name_bad=0;
    
    if (homeworld="Lava") then eh=0;
    if (homeworld="Desert") then eh=2;
    if (homeworld="Forge") then eh=3;
    if (homeworld="Hive") then eh=4;
    if (homeworld="Death") then eh=5;
    if (homeworld="Agri") then eh=6;
    if (homeworld="Feudal") then eh=7;
    if (homeworld="Temperate") then eh=8;
    if (homeworld="Ice") then eh=9;
    if (homeworld="Dead") then eh=10;
    if (homeworld="Shrine") then eh=16;
    if (fleet_type!=1) then eh=15;
    
    if (fleet_type=1){
        scr_image("planet",eh,580,244,128,128);
        // draw_sprite(spr_planet_splash,eh,580,244);
        
        draw_text_transformed(644,378,string_hash_to_newline(string(homeworld)),0.5,0.5,0);
        // draw_text_transformed(644,398,string(homeworld_name),0.5,0.5,0);
        if (text_selected!="home_name") or (custom<2) then draw_text_transformed(644,398,string_hash_to_newline(string(homeworld_name)),0.5,0.5,0);
        if (custom>1){
            if (text_selected="home_name") and (text_bar>30) then draw_text_transformed(644,398,string_hash_to_newline(string(homeworld_name)),0.5,0.5,0);
            if (text_selected="home_name") and (text_bar<=30) then draw_text_transformed(644,398,string_hash_to_newline(string(homeworld_name)+"|"),0.5,0.5,0);
            if (scr_text_hit(644,398,true,homeworld_name)=true){
                obj_cursor.image_index=2;
                if (cooldown<=0) and (mouse_left>=1){text_selected="home_name";cooldown=8000;keyboard_string=homeworld_name;}
            }
            if (text_selected="home_name") then homeworld_name=keyboard_string;
            draw_set_alpha(0.75);draw_rectangle(525,398,760,418,1);draw_set_alpha(1);
        }
        
        if (custom>1) then draw_sprite_stretched(spr_creation_arrow,0,525,285,32,32);// Left Arrow
        if (scr_hit(525,285,525+32,285+32)=true) and (mouse_left>=1) and (cooldown<=0) and (custom>1){
            var onceh;onceh=0;cooldown=8000;
            if (homeworld="Dead") and (onceh=0){homeworld="Ice";onceh=1;}
            if (homeworld="Ice") and (onceh=0){homeworld="Temperate";onceh=1;}
            if (homeworld="Temperate") and (onceh=0){homeworld="Feudal";onceh=1;}
            if (homeworld="Feudal") and (onceh=0){homeworld="Shrine";onceh=1;}
            if (homeworld="Shrine") and (onceh=0){homeworld="Agri";onceh=1;}
            if (homeworld="Agri") and (onceh=0){homeworld="Death";onceh=1;}
            if (homeworld="Death") and (onceh=0){homeworld="Hive";onceh=1;}
            if (homeworld="Hive") and (onceh=0){homeworld="Forge";onceh=1;}
            if (homeworld="Forge") and (onceh=0){homeworld="Desert";onceh=1;}
            if (homeworld="Desert") and (onceh=0){homeworld="Lava";onceh=1;}
            if (homeworld="Lava") and (onceh=0){homeworld="Dead";onceh=1;}
        }
        if (custom>1) then draw_sprite_stretched(spr_creation_arrow,1,725,285,32,32);// Right Arrow
        if (scr_hit(725,285,725+32,285+32)=true) and (mouse_left>=1) and (cooldown<=0) and (custom>1){
            var onceh;onceh=0;cooldown=8000;
            if (homeworld="Lava") and (onceh=0){homeworld="Desert";onceh=1;}
            if (homeworld="Desert") and (onceh=0){homeworld="Forge";onceh=1;}
            if (homeworld="Forge") and (onceh=0){homeworld="Hive";onceh=1;}
            if (homeworld="Hive") and (onceh=0){homeworld="Death";onceh=1;}
            if (homeworld="Death") and (onceh=0){homeworld="Agri";onceh=1;}
            if (homeworld="Agri") and (onceh=0){homeworld="Shrine";onceh=1;}
            if (homeworld="Shrine") and (onceh=0){homeworld="Feudal";onceh=1;}
            if (homeworld="Feudal") and (onceh=0){homeworld="Temperate";onceh=1;}
            if (homeworld="Temperate") and (onceh=0){homeworld="Ice";onceh=1;}
            if (homeworld="Ice") and (onceh=0){homeworld="Dead";onceh=1;}
            if (homeworld="Dead") and (onceh=0){homeworld="Lava";onceh=1;}
        }
    }
    if (fleet_type!=1){
        // draw_sprite(spr_planet_splash,eh,580,244);
        scr_image("planet",eh,580,244,128,128);
        
        draw_text_transformed(644,378,string_hash_to_newline("Battle Barge"),0.5,0.5,0);
        // draw_text_transformed(644,398,string(homeworld_name),0.5,0.5,0);
        if (text_selected!="flagship_name") or (custom=0) then draw_text_transformed(644,398,string_hash_to_newline(string(flagship_name)),0.5,0.5,0);
        if (custom>1){
            if (text_selected="flagship_name") and (text_bar>30) then draw_text_transformed(644,398,string_hash_to_newline(string(flagship_name)),0.5,0.5,0);
            if (text_selected="flagship_name") and (text_bar<=30) then draw_text_transformed(644,398,string_hash_to_newline(string(flagship_name)+"|"),0.5,0.5,0);
            if (scr_text_hit(644,398,true,flagship_name)=true){
                obj_cursor.image_index=2;
                if (cooldown<=0) and (mouse_left>=1){text_selected="flagship_name";cooldown=8000;keyboard_string=flagship_name;}
            }
            if (text_selected="flagship_name") then flagship_name=keyboard_string;
            draw_set_alpha(0.75);draw_rectangle(525,398,760,418,1);draw_set_alpha(1);
        }
    }
    
    
    
    
    
    if (fleet_type!=3){
        if (fleet_type!=1) or (custom<2) then draw_set_alpha(0.5);
        yar=0;if (recruiting_exists=1) then yar=1;draw_sprite(spr_creation_check,yar,858,221);yar=0;
        if (scr_hit(858,221,858+32,221+32)=true) and (cooldown<=0) and (mouse_left>=1) and (custom>1) and (fleet_type=1){cooldown=8000;var onceh;onceh=0;
            if (recruiting_exists=1) and (onceh=0){recruiting_exists=0;onceh=1;}
            if (recruiting_exists=0) and (onceh=0){recruiting_exists=1;onceh=1;}
        }
        draw_set_alpha(1);draw_text_transformed(644+333,218,string_hash_to_newline("Recruiting World"),0.6,0.6,0);
        
        if (recruiting_exists=1){
            if (recruiting="Lava") then eh2=0;
            if (recruiting="Desert") then eh2=2;
            if (recruiting="Forge") then eh2=3;
            if (recruiting="Hive") then eh2=4;
            if (recruiting="Death") then eh2=5;
            if (recruiting="Agri") then eh2=6;
            if (recruiting="Feudal") then eh2=7;
            if (recruiting="Temperate") then eh2=8;
            if (recruiting="Ice") then eh2=9;
            if (recruiting="Dead") then eh2=10;
            if (recruiting="Shrine") then eh2=16;
            
            if (custom>1) then draw_sprite_stretched(spr_creation_arrow,0,865,285,32,32);// Left Arrow
            if (scr_hit(865,285,865+32,285+32)=true) and (mouse_left>=1) and (cooldown<=0) and (custom>1){
                var onceh;onceh=0;cooldown=8000;
                if (recruiting="Dead") and (onceh=0){recruiting="Ice";onceh=1;}
                if (recruiting="Ice") and (onceh=0){recruiting="Temperate";onceh=1;}
                if (recruiting="Temperate") and (onceh=0){recruiting="Feudal";onceh=1;}
                if (recruiting="Feudal") and (onceh=0){recruiting="Shrine";onceh=1;}
                if (recruiting="Shrine") and (onceh=0){recruiting="Agri";onceh=1;}
                if (recruiting="Agri") and (onceh=0){recruiting="Death";onceh=1;}
                if (recruiting="Death") and (onceh=0){recruiting="Hive";onceh=1;}
                if (recruiting="Hive") and (onceh=0){recruiting="Forge";onceh=1;}
                if (recruiting="Forge") and (onceh=0){recruiting="Desert";onceh=1;}
                if (recruiting="Desert") and (onceh=0){recruiting="Lava";onceh=1;}
                if (recruiting="Lava") and (onceh=0){recruiting="Dead";onceh=1;}
            }
            if (custom>1) then draw_sprite_stretched(spr_creation_arrow,1,1055,285,32,32);// Right Arrow
            if (scr_hit(1055,285,1055+32,285+32)=true) and (mouse_left>=1) and (cooldown<=0) and (custom>1){
                var onceh;onceh=0;cooldown=8000;
                if (recruiting="Dead") and (onceh=0){recruiting="Lava";onceh=1;}
                if (recruiting="Lava") and (onceh=0){recruiting="Desert";onceh=1;}
                if (recruiting="Desert") and (onceh=0){recruiting="Forge";onceh=1;}
                if (recruiting="Forge") and (onceh=0){recruiting="Hive";onceh=1;}
                if (recruiting="Hive") and (onceh=0){recruiting="Death";onceh=1;}
                if (recruiting="Death") and (onceh=0){recruiting="Agri";onceh=1;}
                if (recruiting="Agri") and (onceh=0){recruiting="Shrine";onceh=1;}
                if (recruiting="Shrine") and (onceh=0){recruiting="Feudal";onceh=1;}
                if (recruiting="Feudal") and (onceh=0){recruiting="Temperate";onceh=1;}
                if (recruiting="Temperate") and (onceh=0){recruiting="Ice";onceh=1;}
                if (recruiting="Ice") and (onceh=0){recruiting="Dead";onceh=1;}
            }
            
            // draw_sprite(spr_planet_splash,eh2,580+333,244);
            scr_image("planet",eh2,580+333,244,128,128);
            
            draw_text_transformed(644+333,378,string_hash_to_newline(string(recruiting)),0.5,0.5,0);
            // draw_text_transformed(644+333,398,string(recruiting_name),0.5,0.5,0);
            
            if (fleet_type=1) and (homeworld_name=recruiting_name) then name_bad=1;
            
            if (name_bad=1) then draw_set_color(c_red);
            if (text_selected!="recruiting_name") or (custom<2) then draw_text_transformed(644+333,398,string_hash_to_newline(string(recruiting_name)),0.5,0.5,0);
            if (custom>1){
                if (text_selected="recruiting_name") and (text_bar>30) then draw_text_transformed(644+333,398,string_hash_to_newline(string(recruiting_name)),0.5,0.5,0);
                if (text_selected="recruiting_name") and (text_bar<=30) then draw_text_transformed(644+333,398,string_hash_to_newline(string(recruiting_name)+"|"),0.5,0.5,0);
                if (scr_text_hit(644+333,398,true,recruiting_name)=true){
                    obj_cursor.image_index=2;
                    if (cooldown<=0) and (mouse_left>=1){text_selected="recruiting_name";cooldown=8000;keyboard_string=recruiting_name;}
                }
                if (text_selected="recruiting_name") then recruiting_name=keyboard_string;
                draw_set_alpha(0.75);draw_rectangle(525+333,398,760+333,418,1);draw_set_alpha(1);
            }
        }
    }
    
    if (recruiting_exists=0) and (homeworld_exists=1){
        // draw_sprite(spr_planet_splash,eh,580+333,244);
        scr_image("planet",eh,580+333,244,128,128);
        
        draw_set_alpha(0.5);
        draw_text_transformed(644+333,378,string_hash_to_newline(string(homeworld)),0.5,0.5,0);
        draw_text_transformed(644+333,398,string_hash_to_newline(string(homeworld_name)),0.5,0.5,0);
        draw_set_alpha(1);
    }
    
    
    if (scr_hit(575,216,710,242)=true){
        if (fleet_type!=1){tooltip="Battle Barge";tooltip2="The name of your Flagship Battle Barge.";}
        if (fleet_type=1){tooltip="Homeworld";tooltip2="The world that your Chapter's Fortress Monastery is located upon.  More civilized worlds are more easily defensible but the citizens may pose a risk or be a nuisance.";}
    }
    if (scr_hit(895,216,1075,242)=true){
        tooltip="Recruiting World";tooltip2="The world that your Chapter selects recruits from.  More harsh worlds provide recruits with more grit and warrior mentality.  If you are a homeworld-based Chapter, you may uncheck 'Recruiting World' to recruit from your homeworld instead.";
    }
    
    draw_line(445,455,1125,455);
    draw_line(445,456,1125,456);
    draw_line(445,457,1125,457);
    
    // homeworld_rule=0;
    // aspirant_trial="Blood Duel";
    
    draw_set_halign(fa_left);
    
    if (fleet_type=1){
        if (custom<2) then draw_set_alpha(0.5);
        draw_text_transformed(445,480,string_hash_to_newline("Homeworld Rule"),0.6,0.6,0);
        draw_text_transformed(485,512,string_hash_to_newline("Planetary Governer"),0.5,0.5,0);
        draw_text_transformed(485,544,string_hash_to_newline("Passive Supervision"),0.5,0.5,0);
        draw_text_transformed(485,576,string_hash_to_newline("Personal Rule"),0.5,0.5,0);
        
        yar=0;if (homeworld_rule=1) then yar=1;draw_sprite(spr_creation_check,yar,445,512);yar=0;
        if (scr_hit(445,512,445+32,512+32)=true) and (cooldown<=0) and (mouse_left>=1) and (custom>1) and (homeworld_rule!=1){cooldown=8000;homeworld_rule=1;}
        if (scr_hit(445,512,670,512+32)=true){tooltip="Planetary Governer";tooltip2="Your Chapter's homeworld is ruled by a single Planetary Governer, who does with the planet mostly as they see fit.  While heavily influenced by your Astartes the planet is sovereign.";}
        
        yar=0;if (homeworld_rule=2) then yar=1;draw_sprite(spr_creation_check,yar,445,544);yar=0;
        if (scr_hit(445,544,445+32,544+32)=true) and (cooldown<=0) and (mouse_left>=1) and (custom>1) and (homeworld_rule!=2){cooldown=8000;homeworld_rule=2;}
        if (scr_hit(445,544,620,544+32)=true){tooltip="Passive Supervision";tooltip2="Instead of a Planetary Governer the planet is broken up into many countries or clans.  The people are less united but happier, and see your illusive Astartes as semi-divine beings.";}
        
        yar=0;if (homeworld_rule=3) then yar=1;draw_sprite(spr_creation_check,yar,445,576);yar=0;
        if (scr_hit(445,576,445+32,576+32)=true) and (cooldown<=0) and (mouse_left>=1) and (custom>1) and (homeworld_rule!=3){cooldown=8000;homeworld_rule=3;}
        if (scr_hit(445,576,670,576+32)=true){tooltip="Planetary Governer";tooltip2="You personally take the rule of the Planetary Governer, ruling over your homeworld with an iron fist.  Your every word and directive, be they good or bad, are absolute law.";}
    }
    
    
    draw_text_transformed(800,480,string_hash_to_newline("Aspirant Trial"),0.6,0.6,0);
    draw_text_transformed(830,512,string_hash_to_newline(string(aspirant_trial)),0.5,0.5,0);
    
    var asp_info;asp_info="";
    if (aspirant_trial="Blood Duel") then asp_info="-10-30% More recruits#-2-4 Years shorter training time#-10% Chance to burn gene-seed per speed";
    if (aspirant_trial="Hunting the Hunter") then asp_info="-Planet Bonus': Desert, Ice, Death#-Up to 15 bonus XP on Neophytes";
    if (aspirant_trial="Survival of the Fittest") then asp_info="-Planet Bonus': Desert, Ice, Death, Lava#-(+10-30% recruits)#-Planet Bonus: Feudal (+20-50% recruits)";
    if (aspirant_trial="Exposure") then asp_info="-Planet Bonus':#- Desert, Ice, Forge, Lava, Death#-1-3 Years shorter training time";
    if (aspirant_trial="Knowledge of Self") then asp_info="-Planet Bonus: Temperate (up to 10 bonus xp)#-1.5-3 Years longer training#-Up to bonus 25 XP on Neophytes.";
    if (aspirant_trial="Challenge") then asp_info="-Standard generic choice #-Heroic Neophytes gain bonus 10-20 XP";
    if (aspirant_trial="Apprenticeship") then asp_info="-Planet Bonus: Lava (+10-50% recruits)#-4-5 Years longer training time#-Almost able for immediate promotion";
    draw_text_ext_transformed(850,544,string_hash_to_newline(string(asp_info)),64,999,0.5,0.5,0);
     
    if (scr_hit(800,480,1000,510)=true){tooltip="Aspirant Trial";tooltip2="A special challenge is needed for Aspirants to be judged worthy of becoming Astartes.  After completing the Trial they then become a Neophyte, beginning implantation and training.";}
    
    if (custom>1) then draw_sprite_stretched(spr_creation_arrow,0,750,502,32,32);
    if (scr_hit(750,502,750+32,502+32)=true) and (mouse_left>=1) and (cooldown<=0) and (custom>1){
        var onceh;onceh=0;cooldown=8000;
        if (aspirant_trial="Apprenticeship") and (onceh=0){aspirant_trial="Challenge";onceh=1;}
        if (aspirant_trial="Challenge") and (onceh=0){aspirant_trial="Knowledge of Self";onceh=1;}
        if (aspirant_trial="Knowledge of Self") and (onceh=0){aspirant_trial="Exposure";onceh=1;}
        if (aspirant_trial="Exposure") and (onceh=0){aspirant_trial="Survival of the Fittest";onceh=1;}
        if (aspirant_trial="Survival of the Fittest") and (onceh=0){aspirant_trial="Hunting the Hunter";onceh=1;}
        if (aspirant_trial="Hunting the Hunter") and (onceh=0){aspirant_trial="Blood Duel";onceh=1;}
        if (aspirant_trial="Blood Duel") and (onceh=0){aspirant_trial="Apprenticeship";onceh=1;}
    }
    
    if (custom>1) then draw_sprite_stretched(spr_creation_arrow,1,788,502,32,32);
    if (scr_hit(788,502,788+32,502+32)=true) and (mouse_left>=1) and (cooldown<=0) and (custom>1){
        var onceh;onceh=0;cooldown=8000;
        if (aspirant_trial="Blood Duel") and (onceh=0){aspirant_trial="Hunting the Hunter";onceh=1;}
        if (aspirant_trial="Hunting the Hunter") and (onceh=0){aspirant_trial="Survival of the Fittest";onceh=1;}
        if (aspirant_trial="Survival of the Fittest") and (onceh=0){aspirant_trial="Exposure";onceh=1;}
        if (aspirant_trial="Exposure") and (onceh=0){aspirant_trial="Knowledge of Self";onceh=1;}
        if (aspirant_trial="Knowledge of Self") and (onceh=0){aspirant_trial="Challenge";onceh=1;}
        if (aspirant_trial="Challenge") and (onceh=0){aspirant_trial="Apprenticeship";onceh=1;}
        if (aspirant_trial="Apprenticeship") and (onceh=0){aspirant_trial="Blood Duel";onceh=1;}
    }
    
    
    draw_line(445,640,1125,640);
    draw_line(445,641,1125,641);
    draw_line(445,642,1125,642);
    
    if (race[100,17]!=0){
        draw_text_transformed(445,665,string_hash_to_newline("Psychic Discipline"),0.6,0.6,0);
        if (scr_hit(445,665,620,690)=true){tooltip="Psychic Discipline";tooltip2="The Psychic Discipline that your psykers will use by default.";}
        
        var fug,fug2;fug=string_delete(discipline,2,string_length(discipline));
        fug2=string_delete(discipline,1,1);draw_text_transformed(513,697,string_hash_to_newline(string_upper(fug)+string(fug2)),0.5,0.5,0);
        
        var psy_info;psy_info="";
        if (discipline="default") then psy_info="-Psychic Blasts and Barriers";
        if (discipline="biomancy") then psy_info="-Manipulates Biology to Buff or Heal";
        if (discipline="pyromancy") then psy_info="-Unleashes Blasts and Walls of Flame";
        if (discipline="telekinesis") then psy_info="-Manipulates Gravity to Throw or Shield";
        if (discipline="rune Magick") then psy_info="-Summons Deadly Elements and Feral Spirits";
        draw_text_transformed(533,729,string_hash_to_newline(string(psy_info)),0.5,0.5,0);
        
        if (custom<2) then draw_set_alpha(0.5);
        if (custom=2) then draw_sprite_stretched(spr_creation_arrow,0,437,688,32,32);
        if (custom=2) then draw_sprite_stretched(spr_creation_arrow,1,475,688,32,32);
        draw_set_alpha(1);
        
        if (scr_hit(437,688,437+32,688+32)=true) and (mouse_left>=1) and (cooldown<=0) and (custom>1){
            var onceh;onceh=0;cooldown=8000;
            if (discipline="default") and (onceh=0){discipline="rune Magick";onceh=1;}
            if (discipline="rune Magick") and (onceh=0){discipline="telekinesis";onceh=1;}
            if (discipline="telekinesis") and (onceh=0){discipline="pyromancy";onceh=1;}
            if (discipline="pyromancy") and (onceh=0){discipline="biomancy";onceh=1;}
            if (discipline="biomancy") and (onceh=0){discipline="default";onceh=1;}
        }
        if (scr_hit(475,688,475+32,688+32)=true) and (mouse_left>=1) and (cooldown<=0) and (custom>1){
            var onceh;onceh=0;cooldown=8000;
            if (discipline="default") and (onceh=0){discipline="biomancy";onceh=1;}
            if (discipline="biomancy") and (onceh=0){discipline="pyromancy";onceh=1;}
            if (discipline="pyromancy") and (onceh=0){discipline="telekinesis";onceh=1;}
            if (discipline="telekinesis") and (onceh=0){discipline="rune Magick";onceh=1;}
            if (discipline="rune Magick") and (onceh=0){discipline="default";onceh=1;}
        }
         
    }
}




/* */


if (slide=4){
    draw_set_color(38144);
    draw_set_font(fnt_40k_30b);
    draw_set_halign(fa_center);
    draw_set_alpha(1);
    
    tooltip="";tooltip2="";
    obj_cursor.image_index=0;
    
    draw_text(800,80,string_hash_to_newline(string(chapter)));

    draw_rectangle(444,252,444+167,252+232,0);

    if( shader_is_compiled(sReplaceColor)){
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
        
        //Rejoice!
        
        if (col_special=0) then draw_sprite(spr_aquila_colors,10,444,252);
        if (col_special=1) then draw_sprite(spr_aquila_colors,11,444,252);
        if (col_special>=2) then draw_sprite(spr_aquila_colors,12,444,252);
        
        draw_sprite(spr_aquila_colors,col_special,444,252);
        if (col_special<=1){draw_sprite(spr_aquila_colors,6,444,252);draw_sprite(spr_aquila_colors,8,444,252);}
        if (col_special>=2){draw_sprite(spr_aquila_colors,6,444,252);draw_sprite(spr_aquila_colors,9,444,252);}
        if (trim=0) and (col_special<=1) then draw_sprite(spr_aquila_colors,4,444,252);
        if (trim=0) and (col_special>=2) then draw_sprite(spr_aquila_colors,5,444,252);
        
        
        draw_sprite(spr_weapon_colors,0,444,252);
        shader_reset();
        
    }else{
        draw_text(444,252,string_hash_to_newline("Color swap shader#did not compile"));
    }
    
    draw_set_color(38144);draw_set_halign(fa_left);
    draw_text_transformed(580,118,string_hash_to_newline("Battle Cry:"),0.6,0.6,0);draw_set_font(fnt_40k_14b);
    if (text_selected!="battle_cry") or (custom<2) then draw_text_ext(580,144,string_hash_to_newline(string(battle_cry)+"!"),-1,580);
    if (custom>1){
        if (text_selected="battle_cry") and (text_bar>30) then draw_text_ext(580,144,string_hash_to_newline(string(battle_cry)+"!"),-1,580);
        if (text_selected="battle_cry") and (text_bar<=30) then draw_text_ext(580,144,string_hash_to_newline(string(battle_cry)+"|!"),-1,580);
        var str_width=max(580,string_width_ext(string_hash_to_newline(battle_cry),-1,580));
        var hei=string_height_ext(string_hash_to_newline(battle_cry),-1,580);
        if (scr_hit(580-2,144-2,582+str_width,146+hei)){obj_cursor.image_index=2;
            if (mouse_left>=1) and (cooldown<=0) and (!instance_exists(obj_creation_popup)){text_selected="battle_cry";cooldown=8000;keyboard_string=battle_cry;}
        }
        if (text_selected="battle_cry") then battle_cry=keyboard_string;
        draw_rectangle(580-2,144-2,582+580,146+hei,1);
    }
    
    
    
    
    draw_line(445,200,1125,200);
    draw_line(445,201,1125,201);
    draw_line(445,202,1125,202);
    
    draw_set_font(fnt_40k_30b);
    draw_text_transformed(444,215,string_hash_to_newline("Livelry"),0.6,0.6,0);
    var str,str_width,hei,x8,y8;x8=0;y8=0;
    
    
    draw_set_color(38144);draw_set_alpha(1);if (custom<2) then draw_set_alpha(0.5);
    str="Primary: "+string(col[main_color]);x8=620;y8=252;
    str_width=(string_width(string_hash_to_newline(str))/2)+4;hei=(string_height(string_hash_to_newline(str))/2)+4;
    draw_rectangle(x8,y8,x8+str_width,y8+hei,0);draw_set_color(0);
    draw_text_transformed(x8+2,y8+2,string_hash_to_newline(string(str)),0.5,0.5,0);
    if (scr_hit(x8,y8,x8+str_width,y8+hei)=true) and (!instance_exists(obj_creation_popup)){
        tooltip="Primary";tooltip2="The main color of your Astartes and their vehicles.";
        draw_set_color(c_white);if (custom=2) then draw_set_alpha(0.2);if (custom<2) then draw_set_alpha(0.1);draw_rectangle(x8,y8,x8+str_width,y8+hei,0);draw_set_alpha(1);
        if (mouse_left>=1) and (cooldown<=0) and (custom>1){cooldown=8000;var pp;pp=instance_create(0,0,obj_creation_popup);pp.type=1;}
    }
    
    y8+=35;
    draw_set_color(38144);draw_set_alpha(1);if (custom<2) then draw_set_alpha(0.5);
    str="Secondary: "+string(col[secondary_color]);
    str_width=(string_width(string_hash_to_newline(str))/2)+4;hei=(string_height(string_hash_to_newline(str))/2)+4;
    draw_rectangle(x8,y8,x8+str_width,y8+hei,0);draw_set_color(0);
    draw_text_transformed(x8+2,y8+2,string_hash_to_newline(string(str)),0.5,0.5,0);
    if (scr_hit(x8,y8,x8+str_width,y8+hei)=true) and (!instance_exists(obj_creation_popup)){
        tooltip="Secondary";tooltip2="The secondary color of your Astartes and their vehicles.";
        draw_set_color(c_white);if (custom=2) then draw_set_alpha(0.2);if (custom<2) then draw_set_alpha(0.1);draw_rectangle(x8,y8,x8+str_width,y8+hei,0);draw_set_alpha(1);
        if (mouse_left>=1) and (cooldown<=0) and (custom>1){cooldown=8000;var pp;pp=instance_create(0,0,obj_creation_popup);pp.type=2;}
    }
    
    y8+=35;
    draw_set_color(38144);draw_set_alpha(1);if (custom<2) then draw_set_alpha(0.5);
    str="Pauldron 1: "+string(col[pauldron2_color]);
    str_width=(string_width(string_hash_to_newline(str))/2)+4;hei=(string_height(string_hash_to_newline(str))/2)+4;
    draw_rectangle(x8,y8,x8+str_width,y8+hei,0);draw_set_color(0);
    draw_text_transformed(x8+2,y8+2,string_hash_to_newline(string(str)),0.5,0.5,0);
    if (scr_hit(x8,y8,x8+str_width,y8+hei)=true) and (!instance_exists(obj_creation_popup)){
        tooltip="First Pauldron";tooltip2="The color of your Astartes' right Pauldron.  Normally this Pauldron displays their rank and designation.";
        draw_set_color(c_white);if (custom=2) then draw_set_alpha(0.2);if (custom<2) then draw_set_alpha(0.1);draw_rectangle(x8,y8,x8+str_width,y8+hei,0);draw_set_alpha(1);
        if (mouse_left>=1) and (cooldown<=0) and (custom>1){cooldown=8000;var pp;pp=instance_create(0,0,obj_creation_popup);pp.type=3;}
    }
    
    y8+=35;
    draw_set_color(38144);draw_set_alpha(1);if (custom<2) then draw_set_alpha(0.5);
    str="Pauldron 2: "+string(col[pauldron_color]);
    str_width=(string_width(string_hash_to_newline(str))/2)+4;hei=(string_height(string_hash_to_newline(str))/2)+4;
    draw_rectangle(x8,y8,x8+str_width,y8+hei,0);draw_set_color(0);
    draw_text_transformed(x8+2,y8+2,string_hash_to_newline(string(str)),0.5,0.5,0);
    if (scr_hit(x8,y8,x8+str_width,y8+hei)=true) and (!instance_exists(obj_creation_popup)){
        tooltip="Second Pauldron";tooltip2="The color of your Astartes' left Pauldron.  Normally this Pauldron contains the Chapter Insignia.";
        draw_set_color(c_white);if (custom=2) then draw_set_alpha(0.2);if (custom<2) then draw_set_alpha(0.1);draw_rectangle(x8,y8,x8+str_width,y8+hei,0);draw_set_alpha(1);
        if (mouse_left>=1) and (cooldown<=0) and (custom>1){cooldown=8000;var pp;pp=instance_create(0,0,obj_creation_popup);pp.type=4;}
    }
    
    y8+=35;
    draw_set_color(38144);draw_set_alpha(1);if (custom<2) then draw_set_alpha(0.5);
    str="Trim: "+string(col[trim_color]);
    str_width=(string_width(string_hash_to_newline(str))/2)+4;hei=(string_height(string_hash_to_newline(str))/2)+4;
    draw_rectangle(x8,y8,x8+str_width,y8+hei,0);draw_set_color(0);
    draw_text_transformed(x8+2,y8+2,string_hash_to_newline(string(str)),0.5,0.5,0);
    if (scr_hit(x8,y8,x8+str_width,y8+hei)=true) and (!instance_exists(obj_creation_popup)){
        tooltip="Trim";tooltip2="The trim color that appears on the Pauldrons, armour plating, and any decorations.";
        draw_set_color(c_white);if (custom=2) then draw_set_alpha(0.2);if (custom<2) then draw_set_alpha(0.1);draw_rectangle(x8,y8,x8+str_width,y8+hei,0);draw_set_alpha(1);
        if (mouse_left>=1) and (cooldown<=0) and (custom>1){cooldown=8000;var pp;pp=instance_create(0,0,obj_creation_popup);pp.type=5;}
    }
    
    y8+=35;
    draw_set_color(38144);draw_set_alpha(1);if (custom<2) then draw_set_alpha(0.5);
    str="Lens: "+string(col[lens_color]);
    str_width=(string_width(string_hash_to_newline(str))/2)+4;hei=(string_height(string_hash_to_newline(str))/2)+4;
    draw_rectangle(x8,y8,x8+str_width,y8+hei,0);draw_set_color(0);
    draw_text_transformed(x8+2,y8+2,string_hash_to_newline(string(str)),0.5,0.5,0);
    if (scr_hit(x8,y8,x8+str_width,y8+hei)=true) and (!instance_exists(obj_creation_popup)){
        tooltip="Lens";tooltip2="The color of your Astartes' lenses.  Most of the time this will be the visor color.";
        draw_set_color(c_white);if (custom=2) then draw_set_alpha(0.2);if (custom<2) then draw_set_alpha(0.1);draw_rectangle(x8,y8,x8+str_width,y8+hei,0);draw_set_alpha(1);
        if (mouse_left>=1) and (cooldown<=0) and (custom>1){cooldown=8000;var pp;pp=instance_create(0,0,obj_creation_popup);pp.type=6;}
    }
    
    y8+=35;
    draw_set_color(38144);draw_set_alpha(1);if (custom<2) then draw_set_alpha(0.5);
    str="Weapon: "+string(col[weapon_color]);
    str_width=(string_width(string_hash_to_newline(str))/2)+4;hei=(string_height(string_hash_to_newline(str))/2)+4;
    draw_rectangle(x8,y8,x8+str_width,y8+hei,0);draw_set_color(0);
    draw_text_transformed(x8+2,y8+2,string_hash_to_newline(string(str)),0.5,0.5,0);
    if (scr_hit(x8,y8,x8+str_width,y8+hei)=true) and (!instance_exists(obj_creation_popup)){
        tooltip="Weapon";tooltip2="The primary color of your Astartes' weapons.";
        draw_set_color(c_white);if (custom=2) then draw_set_alpha(0.2);if (custom<2) then draw_set_alpha(0.1);draw_rectangle(x8,y8,x8+str_width,y8+hei,0);draw_set_alpha(1);
        if (mouse_left>=1) and (cooldown<=0) and (custom>1){cooldown=8000;var pp;pp=instance_create(0,0,obj_creation_popup);pp.type=7;}
    }
    
    
    draw_set_color(38144);
    
    draw_set_alpha(1);if (custom<2) then draw_set_alpha(0.5);
    yar=0;if (col_special=1) then yar=1;draw_sprite(spr_creation_check,yar,437,500);yar=0;
    if (scr_hit(437,500,437+32,500+32)=true) and (cooldown<=0) and (mouse_left>=1) and (custom>1) and (!instance_exists(obj_creation_popup)){
        cooldown=8000;var onceh;onceh=0;
        if (col_special=1) and (onceh=0){col_special=0;onceh=1;}
        if (col_special!=1) and (onceh=0){col_special=1;onceh=1;}
    }draw_text_transformed(437+30,500+4,string_hash_to_newline("Breastplate"),0.4,0.4,0);
    
    draw_set_alpha(1);if (custom<2) then draw_set_alpha(0.5);
    yar=0;if (col_special=2) then yar=1;draw_sprite(spr_creation_check,yar,554,500);yar=0;
    if (scr_hit(554,500,554+32,500+32)=true) and (cooldown<=0) and (mouse_left>=1) and (custom>1) and (!instance_exists(obj_creation_popup)){
        cooldown=8000;var onceh;onceh=0;
        if (col_special=2) and (onceh=0){col_special=0;onceh=1;}
        if (col_special!=2) and (onceh=0){col_special=2;onceh=1;}
    }draw_text_transformed(554+30,500+4,string_hash_to_newline("Vertical"),0.4,0.4,0);
    
    draw_set_alpha(1);if (custom<2) then draw_set_alpha(0.5);
    yar=0;if (col_special=3) then yar=1;draw_sprite(spr_creation_check,yar,662,500);yar=0;
    if (scr_hit(662,500,662+32,500+32)=true) and (cooldown<=0) and (mouse_left>=1) and (custom>1) and (!instance_exists(obj_creation_popup)){
        cooldown=8000;var onceh;onceh=0;
        if (col_special=3) and (onceh=0){col_special=0;onceh=1;}
        if (col_special!=3) and (onceh=0){col_special=3;onceh=1;}
    }draw_text_transformed(662+30,500+4,string_hash_to_newline("Quadrant"),0.4,0.4,0);
    
    draw_set_alpha(1);if (custom<2) then draw_set_alpha(0.5);
    yar=0;if (trim=1) then yar=1;draw_sprite(spr_creation_check,yar,770,500);yar=0;
    if (scr_hit(770,500,770+32,500+32)=true) and (cooldown<=0) and (mouse_left>=1) and (custom>1) and (!instance_exists(obj_creation_popup)){
        cooldown=8000;var onceh;onceh=0;
        if (trim=1) and (onceh=0){trim=0;onceh=1;}
        if (trim=0) and (onceh=0){trim=1;onceh=1;}
    }draw_text_transformed(770+30,500+4,string_hash_to_newline("Trim"),0.4,0.4,0);
    draw_set_alpha(1);
    
    draw_line(844,204,844,740);
    draw_line(845,204,845,740);
    draw_line(846,204,846,740);
    draw_text_transformed(862,215,string_hash_to_newline("Astartes Role Settings"),0.6,0.6,0);
    draw_set_font(fnt_40k_14b);var c,ide,spacing;c=100;spacing=30;
    draw_set_halign(fa_left);var xxx,yyy;xxx=862;yyy=255-spacing;
    
    
    var derpaderp;
    derpaderp=0;
    
    repeat(13){derpaderp+=1;
        if (derpaderp=1) then ide=15;
        if (derpaderp=2) then ide=14;
        if (derpaderp=3) then ide=17;
        if (derpaderp=4) then ide=16;
        if (derpaderp=5) then ide=5;
        if (derpaderp=6) then ide=2;
        if (derpaderp=7) then ide=4;
        if (derpaderp=8) then ide=3;
        if (derpaderp=9) then ide=6;
        if (derpaderp=10) then ide=8;
        if (derpaderp=11) then ide=9;
        if (derpaderp=12) then ide=10;
        if (derpaderp=13) then ide=12;
        
        draw_set_alpha(1);
        if (race[c,ide]!=0){
            if (custom<2) then draw_set_alpha(0.5);
            yyy+=spacing;draw_set_color(38144);draw_rectangle(xxx,yyy,1150,yyy+20,0);
            draw_set_color(0);draw_text(xxx,yyy,string_hash_to_newline(role[c,ide]));
            if (scr_hit(xxx,yyy,1150,yyy+20)=true) and (!instance_exists(obj_creation_popup)){if (custom=2) then draw_set_alpha(0.2);if (custom<2) then draw_set_alpha(0.1);draw_set_color(c_white);draw_rectangle(xxx,yyy,1150,yyy+20,0);
                draw_set_alpha(1);tooltip=string(role[c,ide])+" Settings";tooltip2="Click to open the settings for this unit.";
                if (mouse_left>=1) and (custom>0) and (cooldown<=0) and (custom=2){var pp;pp=instance_create(0,0,obj_creation_popup);pp.type=ide+100;cooldown=8000;}
            }
        }
    }

    
    
    
    
    draw_set_color(38144);draw_set_alpha(1);draw_set_font(fnt_40k_30b);
    
    if (custom<2) then draw_set_alpha(0.5);
    yar=0;if (equal_specialists=1) then yar=1;draw_sprite(spr_creation_check,yar,860,645);yar=0;
    if (scr_hit(860,645,1150,765)=true) and (!instance_exists(obj_creation_popup)){tooltip="Specialist Distribution";tooltip2="Check if you wish for your Companies to be uniform and each contain "+string(role[100][10])+"s and "+string(role[100][9])+"s.";}
    if (scr_hit(860,650,860+32,650+32)=true) and (cooldown<=0) and (mouse_left>=1) and (custom>1) and (!instance_exists(obj_creation_popup)){
        cooldown=8000;var onceh;onceh=0;
        if (equal_specialists=1) and (onceh=0){equal_specialists=0;onceh=1;}
        if (equal_specialists!=1) and (onceh=0){equal_specialists=1;onceh=1;}
    }draw_text_transformed(860+30,650+4,string_hash_to_newline("Equal Specialist Distribution"),0.4,0.4,0);
    draw_set_alpha(1);
    
    yar=0;if (load_to_ships[0]=1) then yar=1;draw_sprite(spr_creation_check,yar,860,645+40);yar=0;
    if (scr_hit(860,645+40,1005,765+40)=true) and (!instance_exists(obj_creation_popup)){tooltip="Load to Ships";tooltip2="Check to have your Astartes automatically loaded into ships when the game starts.";}
    if (scr_hit(860,645+40,860+32,645+32+40)=true) and (cooldown<=0) and (mouse_left>=1) and (!instance_exists(obj_creation_popup)){
        cooldown=8000;var onceh;onceh=0;
        if (load_to_ships[0]=1) and (onceh=0){load_to_ships[0]=0;onceh=1;}
        if (load_to_ships[0]!=1) and (onceh=0){load_to_ships[0]=1;onceh=1;}
    }draw_text_transformed(860+30,645+4+40,string_hash_to_newline("Load to Ships"),0.4,0.4,0);
    
    yar=0;if (load_to_ships[0]=2) then yar=1;draw_sprite(spr_creation_check,yar,1010,645+40);yar=0;
    if (scr_hit(1010,645+40,1150,665+40)=true) and (!instance_exists(obj_creation_popup)){tooltip="Load (Sans Escorts)";tooltip2="Check to have your Astartes automatically loaded into ships, except for Escorts, when the game starts.";}
    if (scr_hit(1010,645+40,1020+32,645+32+40)=true) and (cooldown<=0) and (mouse_left>=1) and (!instance_exists(obj_creation_popup)){
        cooldown=8000;var onceh;onceh=0;
        if (load_to_ships[0]=2) and (onceh=0){load_to_ships[0]=0;onceh=1;}
        if (load_to_ships[0]!=2) and (onceh=0){load_to_ships[0]=2;onceh=1;}
    }draw_text_transformed(1010+30,645+4+40,string_hash_to_newline("Load (Sans Escorts)"),0.4,0.4,0);
	
	yar=0;
	if (load_to_ships[0] > 0){
		if (load_to_ships[1] == 1){
			yar=1;
		}
		draw_sprite(spr_creation_check,yar,860,645+80);yar=0;
    	if (scr_hit(860,645+80,1005,765+80)=true) and (!instance_exists(obj_creation_popup)){tooltip="Distribute Scouts";tooltip2="Check to have your Scouts split across ships in the fleet.";}
    	if (scr_hit(860,645+80,860+32,645+32+80)=true) and (cooldown<=0) and (mouse_left>=1) and (!instance_exists(obj_creation_popup)){
    		 cooldown=8000;var onceh;onceh=0;
    		 if (load_to_ships[1]=0) and (onceh=0){load_to_ships[1]=1;onceh=1;}
     		 if (load_to_ships[1]=1) and (onceh=0){load_to_ships[1]=0;onceh=1;}   		 
    	}
    	draw_text_transformed(860+30,645+4+80,string_hash_to_newline("Distribute Scouts"),0.4,0.4,0);	
	
		yar=0;
		if (load_to_ships[2] == 1){
			yar=1;
		}
		draw_sprite(spr_creation_check,yar,1010,645+80);yar=0;
    	if (scr_hit(1010,645+80,1150,765+80)=true) and (!instance_exists(obj_creation_popup)){tooltip="Distribute Veterans";tooltip2="Check to have your Veterans split across the fleet.";}
    	if (scr_hit(1010,645+80,1020+32,645+32+80)=true) and (cooldown<=0) and (mouse_left>=1) and (!instance_exists(obj_creation_popup)){
    		 cooldown=8000;var onceh;onceh=0;
    		 if (load_to_ships[2]=0) and (onceh=0){load_to_ships[2]=1;onceh=1;}
     		 if (load_to_ships[2]=1) and (onceh=0){load_to_ships[2]=0;onceh=1;}   		 
    	}
    	draw_text_transformed(1010+30,645+4+80,string_hash_to_newline("Distribute Veterans"),0.4,0.4,0);	
	}	
    
    
    
    
    draw_line(433,535,844,535);
    draw_line(433,536,844,536);
    draw_line(433,537,844,537);
    
    if (!instance_exists(obj_creation_popup)){
    
        if (scr_hit(540,547,800,725)=true){tooltip="Advisor Names";tooltip2="The names of your main Advisors.  They provide useful information and reports on the divisions of your Chapter.";}
    
        draw_text_transformed(444,550,string_hash_to_newline("Advisor Names"),0.6,0.6,0);
        draw_set_font(fnt_40k_14b);
        draw_set_halign(fa_right);
        if (race[100,15]!=0) then draw_text(594,575,string_hash_to_newline("Chief Apothecary: "));
        if (race[100,14]!=0) then draw_text(594,597,string_hash_to_newline("High Chaplain: "));
        if (race[100,17]!=0) then draw_text(594,619,string_hash_to_newline("Chief Librarian: "));
        if (race[100,16]!=0) then draw_text(594,641,string_hash_to_newline("Forge Master: "));
        draw_text(594,663,string_hash_to_newline("Master of Recruits: "));
        draw_text(594,685,string_hash_to_newline("Master of the Fleet: "));
        draw_set_halign(fa_left);
        
        if (race[100,15]!=0){
            draw_set_color(38144);if (hapothecary="") then draw_set_color(c_red);
            if (text_selected!="apoth") or (custom<2) then draw_text_ext(600,575,string_hash_to_newline(string(hapothecary)),-1,580);
            if (custom>1){
                if (text_selected="capoth") and (text_bar>30) then draw_text_ext(600,575,string_hash_to_newline(string(hapothecary)),-1,580);
                if (text_selected="capoth") and (text_bar<=30) then draw_text_ext(600,575,string_hash_to_newline(string(hapothecary)+"|"),-1,580);
                var str_width,hei;str_width=0;hei=string_height_ext(string_hash_to_newline(hapothecary),-2,580);
                if (scr_hit(600,575,785,575+hei)){obj_cursor.image_index=2;
                    if (mouse_left>=1) and (cooldown<=0) and (!instance_exists(obj_creation_popup)){text_selected="capoth";cooldown=8000;keyboard_string=hapothecary;}
                }
                if (text_selected="capoth") then hapothecary=keyboard_string;
                draw_rectangle(600-1,575-1,785,575+hei,1);
            }
        }
        
        if (race[100,14]!=0){
            draw_set_color(38144);if (hchaplain="") then draw_set_color(c_red);
            if (text_selected!="chap") or (custom<2) then draw_text_ext(600,597,string_hash_to_newline(string(hchaplain)),-1,580);
            if (custom>1){
                if (text_selected="chap") and (text_bar>30) then draw_text_ext(600,597,string_hash_to_newline(string(hchaplain)),-1,580);
                if (text_selected="chap") and (text_bar<=30) then draw_text_ext(600,597,string_hash_to_newline(string(hchaplain)+"|"),-1,580);
                var str_width,hei;str_width=0;hei=string_height_ext(string_hash_to_newline(hchaplain),-2,580);
                if (scr_hit(600,597,785,597+hei)){obj_cursor.image_index=2;
                    if (mouse_left>=1) and (cooldown<=0) and (!instance_exists(obj_creation_popup)){text_selected="chap";cooldown=8000;keyboard_string=hchaplain;}
                }
                if (text_selected="chap") then hchaplain=keyboard_string;
                draw_rectangle(600-1,597-1,785,597+hei,1);
            }
        }
        
        if (race[100,17]!=0){
            draw_set_color(38144);if (clibrarian="") then draw_set_color(c_red);
            if (text_selected!="libra") or (custom<2) then draw_text_ext(600,619,string_hash_to_newline(string(clibrarian)),-1,580);
            if (custom>1){
                if (text_selected="libra") and (text_bar>30) then draw_text_ext(600,619,string_hash_to_newline(string(clibrarian)),-1,580);
                if (text_selected="libra") and (text_bar<=30) then draw_text_ext(600,619,string_hash_to_newline(string(clibrarian)+"|"),-1,580);
                var str_width,hei;str_width=0;hei=string_height_ext(string_hash_to_newline(clibrarian),-2,580);
                if (scr_hit(600,619,785,619+hei)){obj_cursor.image_index=2;
                    if (mouse_left>=1) and (cooldown<=0) and (!instance_exists(obj_creation_popup)){text_selected="libra";cooldown=8000;keyboard_string=clibrarian;}
                }
                if (text_selected="libra") then clibrarian=keyboard_string;
                draw_rectangle(600-1,619-1,785,619+hei,1);
            }
        }
        
        if (race[100,16]!=0){
            draw_set_color(38144);if (fmaster="") then draw_set_color(c_red);
            if (text_selected!="forge") or (custom<2) then draw_text_ext(600,641,string_hash_to_newline(string(fmaster)),-1,580);
            if (custom>1){
                if (text_selected="forge") and (text_bar>30) then draw_text_ext(600,641,string_hash_to_newline(string(fmaster)),-1,580);
                if (text_selected="forge") and (text_bar<=30) then draw_text_ext(600,641,string_hash_to_newline(string(fmaster)+"|"),-1,580);
                var str_width,hei;str_width=0;hei=string_height_ext(string_hash_to_newline(fmaster),-2,580);
                if (scr_hit(600,641,785,641+hei)){obj_cursor.image_index=2;
                    if (mouse_left>=1) and (cooldown<=0) and (!instance_exists(obj_creation_popup)){text_selected="forge";cooldown=8000;keyboard_string=fmaster;}
                }
                if (text_selected="forge") then fmaster=keyboard_string;
                draw_rectangle(600-1,641-1,785,641+hei,1);
            }
        }
        
        draw_set_color(38144);if (recruiter="") then draw_set_color(c_red);
        if (text_selected!="recr") or (custom<2) then draw_text_ext(600,663,string_hash_to_newline(string(recruiter)),-1,580);
        if (custom>1){
            if (text_selected="recr") and (text_bar>30) then draw_text_ext(600,663,string_hash_to_newline(string(recruiter)),-1,580);
            if (text_selected="recr") and (text_bar<=30) then draw_text_ext(600,663,string_hash_to_newline(string(recruiter)+"|"),-1,580);
            var str_width,hei;str_width=0;hei=string_height_ext(string_hash_to_newline(recruiter),-2,580);
            if (scr_hit(600,663,785,663+hei)){obj_cursor.image_index=2;
                if (mouse_left>=1) and (cooldown<=0) and (!instance_exists(obj_creation_popup)){text_selected="recr";cooldown=8000;keyboard_string=recruiter;}
            }
            if (text_selected="recr") then recruiter=keyboard_string;
            draw_rectangle(600-1,663-1,785,663+hei,1);
        }
        
        draw_set_color(38144);if (admiral="") then draw_set_color(c_red);
        if (text_selected!="admi") or (custom<2) then draw_text_ext(600,685,string_hash_to_newline(string(admiral)),-1,580);
        if (custom>1){
            if (text_selected="admi") and (text_bar>30) then draw_text_ext(600,685,string_hash_to_newline(string(admiral)),-1,580);
            if (text_selected="admi") and (text_bar<=30) then draw_text_ext(600,685,string_hash_to_newline(string(admiral)+"|"),-1,580);
            var str_width,hei;str_width=0;hei=string_height_ext(string_hash_to_newline(admiral),-2,580);
            if (scr_hit(600,685,785,685+hei)){obj_cursor.image_index=2;
                if (mouse_left>=1) and (cooldown<=0) and (!instance_exists(obj_creation_popup)){text_selected="admi";cooldown=8000;keyboard_string=admiral;}
            }
            if (text_selected="admi") then admiral=keyboard_string;
            draw_rectangle(600-1,685-1,785,685+hei,1);
        }
        
        
    
    }
    
    
}

/* */


if (slide=5){
    draw_set_color(38144);
    draw_set_font(fnt_40k_30b);
    draw_set_halign(fa_center);
    draw_set_alpha(1);
    
    tooltip="";tooltip2="";
    obj_cursor.image_index=0;
    
    draw_text(800,80,string_hash_to_newline(string(chapter)));


    draw_set_color(38144);draw_set_halign(fa_left);
    draw_text_transformed(580,118,string_hash_to_newline("Successor Chapters: "+string(successors)),0.6,0.6,0);
    draw_set_font(fnt_40k_14b);
    
    
    draw_line(445,200,1125,200);
    draw_line(445,201,1125,201);
    draw_line(445,202,1125,202);
    
    draw_set_font(fnt_40k_30b);
    draw_text_transformed(503,210,string_hash_to_newline("Gene-Seed Mutations"),0.6,0.6,0);
    if (mutations>mutations_selected) then draw_text_transformed(585,230,string_hash_to_newline("Select "+string(mutations-mutations_selected)+" More"),0.5,0.5,0);
    
    var x1,y1,spac;spac=34;
    
    if (custom<2) then draw_set_alpha(0.5);
    
    x1=450;y1=260;yar=0;if (preomnor=1) then yar=1;draw_sprite(spr_creation_check,yar,x1,y1);yar=0;
    if (scr_hit(x1,y1,x1+32,y1+32)=true) and (cooldown<=0) and (mouse_left>=1) and (custom>1) and (!instance_exists(obj_creation_popup)){
        cooldown=8000;var onceh;onceh=0;
        if (preomnor=1) and (onceh=0){preomnor=0;mutations_selected-=1;onceh=1;}
        if (preomnor!=1) and (onceh=0) and (mutations>mutations_selected){preomnor=1;mutations_selected+=1;onceh=1;}
    }draw_text_transformed(x1+30,y1+4,string_hash_to_newline("Anemic Preomnor"),0.4,0.4,0);
    if (scr_hit(x1,y1,700,y1+20)=true){tooltip="Anemic Preomnor";tooltip2="Your Astartes lack the detoxifying gland called the Preomnor- they are more susceptible to poisons and toxins.";}
    
    y1+=spac;yar=0;if (voice=1) then yar=1;draw_sprite(spr_creation_check,yar,x1,y1);yar=0;
    if (scr_hit(x1,y1,x1+32,y1+32)=true) and (cooldown<=0) and (mouse_left>=1) and (custom>1) and (!instance_exists(obj_creation_popup)){
        cooldown=8000;var onceh;onceh=0;
        if (voice=1) and (onceh=0){voice=0;mutations_selected-=1;onceh=1;disposition[2]+=8;}
        if (voice!=1) and (onceh=0) and (mutations>mutations_selected){voice=1;mutations_selected+=1;onceh=1;disposition[2]-=8;}
    }draw_text_transformed(x1+30,y1+4,string_hash_to_newline("Disturbing Voice"),0.4,0.4,0);
    if (scr_hit(x1,y1,700,y1+20)=true){tooltip="Disturbing Voice";tooltip2="Your Astartes have a voice like a creaking door or a rumble.  Decreases Imperium and Imperial Guard disposition.";}
    
    y1+=spac;yar=0;if (doomed=1) then yar=1;draw_sprite(spr_creation_check,yar,x1,y1);yar=0;
    if (scr_hit(x1,y1,x1+32,y1+32)=true) and (cooldown<=0) and (mouse_left>=1) and (custom>1) and (!instance_exists(obj_creation_popup)){
        cooldown=8000;var onceh;onceh=0;
        if (doomed=1) and (onceh=0){doomed=0;mutations_selected-=4;onceh=1;disposition[1]+=8;disposition[6]-=8;}
        if (doomed!=1) and (onceh=0) and (mutations>mutations_selected){doomed=1;mutations_selected+=4;onceh=1;disposition[1]-=8;disposition[6]+=8;}
    }draw_text_transformed(x1+30,y1+4,string_hash_to_newline("Doomed"),0.4,0.4,0);
    if (scr_hit(x1,y1,700,y1+20)=true){tooltip="Doomed";tooltip2="Your Chapter cannot make more Astartes until enough research is generated.  Counts as four mutations.";}
    
    y1+=spac;yar=0;if (lyman=1) then yar=1;draw_sprite(spr_creation_check,yar,x1,y1);yar=0;
    if (scr_hit(x1,y1,x1+32,y1+32)=true) and (cooldown<=0) and (mouse_left>=1) and (custom>1) and (!instance_exists(obj_creation_popup)){
        cooldown=8000;var onceh;onceh=0;
        if (lyman=1) and (onceh=0){lyman=0;mutations_selected-=1;onceh=1;}
        if (lyman!=1) and (onceh=0) and (mutations>mutations_selected){lyman=1;mutations_selected+=1;onceh=1;}
    }draw_text_transformed(x1+30,y1+4,string_hash_to_newline("Faulty Lyman's Ear"),0.4,0.4,0);
    if (scr_hit(x1,y1,700,y1+20)=true){tooltip="Faulty Lyman's Ear";tooltip2="Lacking a working Lyman's ear, all deep-striked Astartes recieve moderate penalties to both attack and defense.";}
    
    y1+=spac;yar=0;if (omophagea=1) then yar=1;draw_sprite(spr_creation_check,yar,x1,y1);yar=0;
    if (scr_hit(x1,y1,x1+32,y1+32)=true) and (cooldown<=0) and (mouse_left>=1) and (custom>1) and (!instance_exists(obj_creation_popup)){
        cooldown=8000;var onceh;onceh=0;
        if (omophagea=1) and (onceh=0){omophagea=0;mutations_selected-=1;onceh=1;}
        if (omophagea!=1) and (onceh=0) and (mutations>mutations_selected){omophagea=1;mutations_selected+=1;onceh=1;}
    }draw_text_transformed(x1+30,y1+4,string_hash_to_newline("Hyper-Stimulated Omophagea"),0.4,0.4,0);
    if (scr_hit(x1,y1,700,y1+20)=true){tooltip="Hyper-Stimulated Omophagea";tooltip2="After every battle the Astartes have a chance to feast upon their fallen enemies, or seldom, their allies.";}
    
    y1+=spac;yar=0;if (ossmodula=1) then yar=1;draw_sprite(spr_creation_check,yar,x1,y1);yar=0;
    if (scr_hit(x1,y1,x1+32,y1+32)=true) and (cooldown<=0) and (mouse_left>=1) and (custom>1) and (!instance_exists(obj_creation_popup)){
        cooldown=8000;var onceh;onceh=0;
        if (ossmodula=1) and (onceh=0){ossmodula=0;mutations_selected-=1;onceh=1;}
        if (ossmodula!=1) and (onceh=0) and (mutations>mutations_selected){ossmodula=1;mutations_selected+=1;onceh=1;}
    }draw_text_transformed(x1+30,y1+4,string_hash_to_newline("Hyperactive Ossmodula"),0.4,0.4,0);
    if (scr_hit(x1,y1,700,y1+20)=true){tooltip="Hyperactive Ossmodula";tooltip2="Instead of wound tissue bone is generated; Apothecaries must spend twice the normal time healing your Astartes.";}
    
    y1+=spac;yar=0;if (zygote=1) then yar=1;draw_sprite(spr_creation_check,yar,x1,y1);yar=0;
    if (scr_hit(x1,y1,x1+32,y1+32)=true) and (cooldown<=0) and (mouse_left>=1) and (custom>1) and (!instance_exists(obj_creation_popup)){
        cooldown=8000;var onceh;onceh=0;
        if (zygote=1) and (onceh=0){zygote=0;mutations_selected-=2;onceh=1;}
        if (zygote!=1) and (onceh=0) and (mutations>mutations_selected){zygote=1;mutations_selected+=2;onceh=1;}
    }draw_text_transformed(x1+30,y1+4,string_hash_to_newline("Lost Zygote"),0.4,0.4,0);
    if (scr_hit(x1,y1,700,y1+20)=true){tooltip="Lost Zygote";tooltip2="One of the Zygotes is faulty or missing.  The Astartes only have one each and generate half the normal Gene-Seed.";}
    
    x1=750;y1=260-spac;
    
    y1+=spac;yar=0;if (membrane=1) then yar=1;draw_sprite(spr_creation_check,yar,x1,y1);yar=0;
    if (scr_hit(x1,y1,x1+32,y1+32)=true) and (cooldown<=0) and (mouse_left>=1) and (custom>1) and (!instance_exists(obj_creation_popup)){
        cooldown=8000;var onceh;onceh=0;
        if (membrane=1) and (onceh=0){membrane=0;mutations_selected-=1;onceh=1;}
        if (membrane!=1) and (onceh=0) and (mutations>mutations_selected){membrane=1;mutations_selected+=1;onceh=1;}
    }draw_text_transformed(x1+30,y1+4,string_hash_to_newline("Inactive Sus-an Membrane"),0.4,0.4,0);
    if (scr_hit(x1,y1,1020,y1+20)=true){tooltip="Inactive Sus-an Membrane";tooltip2="Your Astartes do not have a Sus-an Membrane; they cannot enter suspended animation and recieve more casualties as a result.";}
    
    y1+=spac;yar=0;if (betchers=1) then yar=1;draw_sprite(spr_creation_check,yar,x1,y1);yar=0;
    if (scr_hit(x1,y1,x1+32,y1+32)=true) and (cooldown<=0) and (mouse_left>=1) and (custom>1) and (!instance_exists(obj_creation_popup)){
        cooldown=8000;var onceh;onceh=0;
        if (betchers=1) and (onceh=0){betchers=0;mutations_selected-=1;onceh=1;}
        if (betchers!=1) and (onceh=0) and (mutations>mutations_selected){betchers=1;mutations_selected+=1;onceh=1;}
    }draw_text_transformed(x1+30,y1+4,string_hash_to_newline("Missing Betchers Gland"),0.4,0.4,0);
    if (scr_hit(x1,y1,1020,y1+20)=true){tooltip="Missing Betchers Gland";tooltip2="Your Astartes cannot spit acid, and as a result, have slightly less attack in melee combat.";}
    
    y1+=spac;yar=0;if (catalepsean=1) then yar=1;draw_sprite(spr_creation_check,yar,x1,y1);yar=0;
    if (scr_hit(x1,y1,x1+32,y1+32)=true) and (cooldown<=0) and (mouse_left>=1) and (custom>1) and (!instance_exists(obj_creation_popup)){
        cooldown=8000;var onceh;onceh=0;
        if (catalepsean=1) and (onceh=0){catalepsean=0;mutations_selected-=1;onceh=1;}
        if (catalepsean!=1) and (onceh=0) and (mutations>mutations_selected){catalepsean=1;mutations_selected+=1;onceh=1;}
    }draw_text_transformed(x1+30,y1+4,string_hash_to_newline("Mutated Catalepsean Node"),0.4,0.4,0);
    if (scr_hit(x1,y1,1020,y1+20)=true){tooltip="Mutated Catalepsean Node";tooltip2="Your Astartes cannot sleep portions of their brains at a time, or generally at all.  They have a slight decrease to attack.";}
    
    y1+=spac;yar=0;if (secretions=1) then yar=1;draw_sprite(spr_creation_check,yar,x1,y1);yar=0;
    if (scr_hit(x1,y1,x1+32,y1+32)=true) and (cooldown<=0) and (mouse_left>=1) and (custom>1) and (!instance_exists(obj_creation_popup)){
        cooldown=8000;var onceh;onceh=0;
        if (secretions=1) and (onceh=0){secretions=0;mutations_selected-=1;onceh=1;disposition[2]+=8;}
        if (secretions!=1) and (onceh=0) and (mutations>mutations_selected){secretions=1;mutations_selected+=1;onceh=1;disposition[2]-=8;}
    }draw_text_transformed(x1+30,y1+4,string_hash_to_newline("Oolitic Secretions"),0.4,0.4,0);
    if (scr_hit(x1,y1,1020,y1+20)=true){tooltip="Oolitic Secretions";tooltip2="Either by secretions or radiation, your Astartes have an unusual or strange skin color.  Decreases disposition.";}
    
    y1+=spac;yar=0;if (occulobe=1) then yar=1;draw_sprite(spr_creation_check,yar,x1,y1);yar=0;
    if (scr_hit(x1,y1,x1+32,y1+32)=true) and (cooldown<=0) and (mouse_left>=1) and (custom>1) and (!instance_exists(obj_creation_popup)){
        cooldown=8000;var onceh;onceh=0;
        if (occulobe=1) and (onceh=0){occulobe=0;mutations_selected-=1;onceh=1;}
        if (occulobe!=1) and (onceh=0) and (mutations>mutations_selected){occulobe=1;mutations_selected+=1;onceh=1;}
    }draw_text_transformed(x1+30,y1+4,string_hash_to_newline("Oversensitive Occulobe"),0.4,0.4,0);
    if (scr_hit(x1,y1,1020,y1+20)=true){tooltip="Oversensitive Occulobe";tooltip2="Your Astartes are no longer immune to stun grenades, bright lights, and have a massive penalty during morning battles.";}
    
    y1+=spac;yar=0;if (mucranoid=1) then yar=1;draw_sprite(spr_creation_check,yar,x1,y1);yar=0;
    if (scr_hit(x1,y1,x1+32,y1+32)=true) and (cooldown<=0) and (mouse_left>=1) and (custom>1) and (!instance_exists(obj_creation_popup)){
        cooldown=8000;var onceh;onceh=0;
        if (mucranoid=1) and (onceh=0){mucranoid=0;mutations_selected-=1;onceh=1;disposition[1]+=4;disposition[2]+=4;disposition[3]+=4;disposition[5]+=4;disposition[6]+=4;}
        if (mucranoid!=1) and (onceh=0) and (mutations>mutations_selected){mucranoid=1;mutations_selected+=1;onceh=1;disposition[1]-=4;disposition[2]-=4;disposition[3]-=4;disposition[5]-=4;disposition[6]-=4;}
    }draw_text_transformed(x1+30,y1+4,string_hash_to_newline("Rampant Mucranoid"),0.4,0.4,0);
    if (scr_hit(x1,y1,1020,y1+20)=true){tooltip="Rampant Mucranoid";tooltip2="Your Astartes' Mucranoid cannot be turned off; the slime lowers most dispositions and occasionally damages their armour.";}
    
    draw_set_alpha(1);
    
    draw_line(445,505,1125,505);
    draw_line(445,506,1125,505);
    draw_line(445,507,1125,507);
    
    draw_set_font(fnt_40k_30b);
    draw_text_transformed(444,515,string_hash_to_newline("Starting Disposition"),0.6,0.6,0);
    
    draw_set_font(fnt_40k_14b);
    draw_set_halign(fa_right);
    
    draw_text(650,550,string_hash_to_newline("Imperium ("+string(disposition[2])+")"));
    draw_text(650,575,string_hash_to_newline("Adeptus Mechanicus ("+string(disposition[3])+")"));
    draw_text(650,600,string_hash_to_newline("Ecclesiarchy ("+string(disposition[5])+")"));
    draw_text(650,625,string_hash_to_newline("Inquisition ("+string(disposition[4])+")"));
    if (founding!=0) then draw_text(650,650,string_hash_to_newline("Progenitor ("+string(disposition[1])+")"));
    draw_text(650,675,string_hash_to_newline("Adeptus Astartes ("+string(disposition[6])+")"));
    
    draw_rectangle(655,552,1150,567,1);
    draw_rectangle(655,552+25,1150,567+25,1);
    draw_rectangle(655,552+50,1150,567+50,1);
    draw_rectangle(655,552+75,1150,567+75,1);
    if (founding!=0) then draw_rectangle(655,552+100,1150,567+100,1);
    draw_rectangle(655,552+125,1150,567+125,1);
    if (disposition[2]>0) then draw_rectangle(655,552,655+(disposition[2]*4.95),567,0);
    if (disposition[3]>0) then draw_rectangle(655,552+25,655+(disposition[3]*4.95),567+25,0);
    if (disposition[5]>0) then draw_rectangle(655,552+50,655+(disposition[5]*4.95),567+50,0);
    if (disposition[4]>0) then draw_rectangle(655,552+75,655+(disposition[4]*4.95),567+75,0);
    if (disposition[1]>0) and (founding!=0) then draw_rectangle(655,552+100,655+(disposition[1]*4.95),567+100,0);
    if (disposition[6]>0) then draw_rectangle(655,552+125,655+(disposition[6]*4.95),567+125,0);
    
    
}

/* */









if (slide=6){
    draw_set_color(38144);
    draw_set_font(fnt_40k_30b);
    draw_set_halign(fa_center);
    draw_set_alpha(1);var yar;yar=0;
    
    tooltip="";tooltip2="";
    obj_cursor.image_index=0;
    
    draw_text(800,80,string_hash_to_newline(string(chapter)));

    
    draw_set_color(38144);draw_set_halign(fa_left);
    draw_text_transformed(580,118,string_hash_to_newline("Chapter Master Name: "),0.6,0.6,0);draw_set_font(fnt_40k_14b);
    
    if (text_selected!="cm") or (custom=0) then draw_text_ext(580,144,string_hash_to_newline(string(chapter_master_name)),-1,580);
    if (custom>0) and (restarted=0){
        if (text_selected="cm") and (text_bar>30) then draw_text(580,144,string_hash_to_newline(string(chapter_master_name)));
        if (text_selected="cm") and (text_bar<=30) then draw_text(580,144,string_hash_to_newline(string(chapter_master_name)+"|"));
        var str_width,hei;str_width=max(400,string_width(string_hash_to_newline(chapter_master_name)));hei=string_height(string_hash_to_newline(chapter_master_name));
        if (scr_hit(580-2,144-2,582+str_width,146+hei)){obj_cursor.image_index=2;
            if (mouse_left>=1) and (cooldown<=0) and (!instance_exists(obj_creation_popup)){text_selected="cm";cooldown=8000;keyboard_string=chapter_master_name;}
        }
        if (text_selected="cm") then chapter_master_name=keyboard_string;
        draw_rectangle(580-2,144-2,582+400,146+hei,1);
    }
    
    draw_line(445,200,1125,200);
    draw_line(445,201,1125,201);
    draw_line(445,202,1125,202);
    
    draw_set_font(fnt_40k_30b);
    draw_text_transformed(444,215,string_hash_to_newline("Select Two Weapons"),0.6,0.6,0);
    draw_text_transformed(444,240,string_hash_to_newline("Melee"),0.6,0.6,0);
    draw_text_transformed(800,240,string_hash_to_newline("Ranged"),0.6,0.6,0);
    
    
    var x6,y6,spac,h,it;
    x6=444;y6=265;spac=30;h=0;it="";
    if (custom=0) or (restarted>0) then draw_set_alpha(0.5);
    
    repeat(7){h+=1;
        if (h=1) then it="Power Fists";
        if (h=2) then it="Relic Blade";
        if (h=3) then it="Master Crafted Thunder Hammer";
        if (h=4) then it="Master Crafted Power Sword";
        if (h=5) then it="Master Crafted Power Axe";
        if (h=6) then it="Master Crafted Eviscerator";
        if (h=7) then it="Master Crafted Force Weapon";
        
        yar=0;if (chapter_master_melee=h) then yar=1;draw_sprite(spr_creation_check,yar,x6,y6);yar=0;
        if (scr_hit(x6,y6,x6+32,y6+32)=true) and (cooldown<=0) and (mouse_left>=1) and (custom>0) and (restarted=0) and (!instance_exists(obj_creation_popup)){
            cooldown=8000;var onceh;onceh=0;
            if (chapter_master_melee=h) and (onceh=0){chapter_master_melee=0;onceh=1;}
            if (chapter_master_melee!=h) and (onceh=0){chapter_master_melee=h;onceh=1;}
        }
        draw_text_transformed(x6+30,y6+4,string_hash_to_newline(it),0.4,0.4,0);
        y6+=spac;
    }
    
    x6=800;y6=265;h=0;it="";
    repeat(7){h+=1;
        if (h=1) then it="Integrated Bolters";
        if (h=2) then it="Infernus Pistol";
        if (h=3) then it="Plasma Pistol";
        if (h=4) then it="Plasma Gun";
        if (h=5) then it="Master Crafted Heavy Bolter";
        if (h=6) then it="Master Crafted Meltagun";
        if (h=7) then it="Storm Shield";
        
        yar=0;if (chapter_master_ranged=h) then yar=1;draw_sprite(spr_creation_check,yar,x6,y6);yar=0;
        if (scr_hit(x6,y6,x6+32,y6+32)=true) and (cooldown<=0) and (mouse_left>=1) and (custom>0) and (restarted=0) and (!instance_exists(obj_creation_popup)){
            cooldown=8000;var onceh;onceh=0;
            if (chapter_master_ranged=h) and (onceh=0){chapter_master_ranged=0;onceh=1;}
            if (chapter_master_ranged!=h) and (onceh=0){chapter_master_ranged=h;onceh=1;}
        }
        draw_text_transformed(x6+30,y6+4,string_hash_to_newline(it),0.4,0.4,0);
        y6+=spac;
    }
    
    draw_set_alpha(1);
    
    draw_line(445,490,1125,490);
    draw_line(445,491,1125,491);
    draw_line(445,492,1125,492);
    
    draw_set_font(fnt_40k_30b);
    // draw_text_transformed(444,505,"Select Speciality",0.6,0.6,0);
    draw_set_halign(fa_center);
    
    var ha2;ha2=string(dis[1])+string(dis[2])+string(dis[3])+string(dis[4]);
    if (chapter_master_specialty=3) and ((race[100,17]=0) or (string_count("Psyker Intolerant",ha2)>0)) then chapter_master_speciality=choose(1,2);
    x6=474;y6=500;h=0;it="";
    
    repeat(3){h+=1;
        draw_set_alpha(1);
        if ((race[100,17]=0) or (string_count("Psyker Intolerant",ha2)>0)) and (h=3) then draw_set_alpha(0.5);
        if (custom<2) or (restarted>0) then draw_set_alpha(0.5);
        
        // draw_sprite(spr_cm_specialty,h-1,x6,y6);
        scr_image("commander",h-1,x6,y6,162,208);
        
        if (h=1) then draw_text_transformed(x6+81,y6+214,string_hash_to_newline("Born Leader"),0.5,0.5,0);
        if (h=2) then draw_text_transformed(x6+81,y6+214,string_hash_to_newline("Champion"),0.5,0.5,0);
        if (h=3) then draw_text_transformed(x6+81,y6+214,string_hash_to_newline("Psyker"),0.5,0.5,0);
        
        yar=0;if (chapter_master_specialty=h) then yar=1;draw_sprite(spr_creation_check,yar,x6,y6+214);yar=0;
        
        var nope;nope=0;if (h=3) and ((race[100,17]=0) or (string_count("Psyker Intolerant",ha2)>0)) then nope=1;
        
        if (scr_hit(x6,y6+214,x6+32,y6+32+214)=true) and (cooldown<=0) and (mouse_left>=1) and (custom>1) and (restarted=0) and (nope=0){
            cooldown=8000;var onceh;onceh=0;
            if (chapter_master_specialty!=h) and (onceh=0){chapter_master_specialty=h;onceh=1;}
        }
        if (scr_hit(x6,y6+214,x6+162,y6+234)=true) and (nope=0){
            if (h=1){tooltip="Born Leader";tooltip2="You always know the right words to inspire your men or strike doubt in the hearts of the enemy.  Increases Disposition and Grants a +10% Requisition Income Bonus.";}
            if (h=2){tooltip="Champion";tooltip2="Even before your rise to Chapter Master you were a renowned warrior, nearly without compare.  Increases Chapter Master Experience, Melee Damage, and Ranged Damage.";}
            if (h=3){tooltip="Psyker";tooltip2="The impossible is nothing to you; despite being a Psyker you have slowly risen to lead a Chapter.  Chapter Master gains every Power within the chosen Discipline.";}
        }
        
        x6+=240;draw_set_alpha(1);
    }
    
    
    
    
}

/* */


// 850,860

var xx,yy;
xx=375;yy=10;


if (change_slide>0){
    draw_set_color(c_black);
    if (change_slide=3){
        if (slate5<=0) then slate5=1;
        if (slate5>=5) and (slate6=0) then slate6=1;
    }
    if (change_slide<=30) then draw_set_alpha(change_slide/30);
    if (change_slide>40) then draw_set_alpha(2.33-(change_slide/30));
    draw_rectangle(430,66,702,750,0);
    draw_rectangle(703,80,1171,750,0);
    draw_rectangle(518,750,1075,820,0);
}


draw_set_color(5998382);
if (slate5>0){
    if (slate5<=30) then draw_set_alpha(slate5/30);
    if (slate5>30) then draw_set_alpha(1-((slate5-30)/30));
    draw_line(xx+30,yy+70+(slate5*12),xx+790,yy+70+(slate5*12));
}
if (slate6>0){
    if (slate6<=30) then draw_set_alpha(slate6/30);
    if (slate6>30) then draw_set_alpha(1-((slate6-30)/30));
    draw_line(xx+30,yy+70+(slate6*12),xx+790,yy+70+(slate6*12));
}

if (fade_in>0){
    draw_set_alpha(fade_in/50);
    draw_set_color(0);
    draw_rectangle(0,0,room_width,room_height,0);
}
draw_set_alpha(1);
// draw_set_color(c_red);
// draw_text(mouse_x+20,mouse_y+20,string(change_slide));




if (slide=1){
    draw_set_alpha(slate4/30);
    if (slide=1) then draw_sprite(spr_creation_arrow,2,607,761);
    if (slide!=1) then draw_sprite(spr_creation_arrow,0,607,761);
    draw_sprite(spr_creation_arrow,3,927,761);
    
    var q,x3,y3;q=1;x3=(room_width/2)-65;y3=790;
    draw_set_color(38144);
    repeat(6){
        draw_circle(x3,y3,10,1);
        draw_circle(x3,y3,9.5,1);
        draw_circle(x3,y3,9,1);
        
        if (slide=q) then draw_circle(x3,y3,8.5,0);
        if (slide!=q) then draw_circle(x3,y3,8.5,1);
        x3+=25;q+=1;
    }
}



if (slide>=2) or (goto_slide>=2){
    draw_set_alpha(1);
    draw_sprite(spr_creation_arrow,0,607,761);
    draw_sprite(spr_creation_arrow,1,927,761);
    if (slide=1) then draw_sprite(spr_creation_arrow,2,607,761);
    
    
    if (slide>=2) and (slide<6) and (custom!=2){
        draw_set_alpha(0.8);
        if (popup="") and ((change_slide>=70) or (change_slide<=0)) and (scr_hit(927+64+12,761+12,927+128-12,761+64-12)=true) then draw_set_alpha(1);
        draw_sprite(spr_creation_arrow,4,927+64,761);
        if (popup="") and ((change_slide>=70) or (change_slide<=0)) and (cooldown<=0) and (mouse_left>=1){
            if (scr_hit(927+64+12,761+12,927+128-12,761+64-12)=true){
                scr_creation(2);scr_creation(3.5);scr_creation(4);
                scr_creation(5);scr_creation(6);
            }
        }
    }
    draw_set_alpha(1);
    
    
    var q,x3,y3;q=1;x3=(room_width/2)-65;y3=790;
    draw_set_color(38144);
    repeat(6){
        draw_circle(x3,y3,10,1);
        draw_circle(x3,y3,9.5,1);
        draw_circle(x3,y3,9,1);
        
        if (slide_show=q) then draw_circle(x3,y3,8.5,0);
        if (slide_show!=q) then draw_circle(x3,y3,8.5,1);
        x3+=25;q+=1;
    }
    
    
    
    if (popup="") and ((change_slide>=70) or (change_slide<=0)) and (cooldown<=0){
        if (mouse_x>925) and (mouse_y>756) and (mouse_x<997) and (mouse_y<824) and (mouse_left>=1) and (!instance_exists(obj_creation_popup)){// Next slide
            
            if (slide=2) then scr_creation(2);
            if (slide=3) then scr_creation(3);
            if (slide=4) then scr_creation(4);
            if (slide=5) then scr_creation(5);
            if (slide=6) then scr_creation(6);
            
        }
        
        
        if (mouse_x>604) and (mouse_y>756) and (mouse_x<675) and (mouse_y<824) and (mouse_left>=1) and (cooldown<=0) and (!instance_exists(obj_creation_popup)){// Previous slide
            cooldown=8000;change_slide=1;goto_slide=slide-1;popup="";
            if (goto_slide=1){
                highlight=0;highlighting=0;old_highlight=0;
            }
        }
    }
    
}




if (tooltip!="") and (tooltip2!="") and (change_slide<=0){
    draw_set_alpha(1);
    draw_set_font(fnt_40k_14);draw_set_halign(fa_left);draw_set_color(0);
    draw_rectangle(mouse_x+18,mouse_y+20,mouse_x+string_width_ext(string_hash_to_newline(tooltip2),-1,500)+24,mouse_y+44+string_height_ext(string_hash_to_newline(tooltip2),-1,500),0);
    draw_set_color(38144);
    draw_rectangle(mouse_x+18,mouse_y+20,mouse_x+string_width_ext(string_hash_to_newline(tooltip2),-1,500)+24,mouse_y+44+string_height_ext(string_hash_to_newline(tooltip2),-1,500),1);
    draw_set_font(fnt_40k_14b);draw_text(mouse_x+22,mouse_y+22,string_hash_to_newline(string(tooltip)));
    draw_set_font(fnt_40k_14);draw_text_ext(mouse_x+22,mouse_y+42,string_hash_to_newline(string(tooltip2)),-1,500);
}


/* */
/*  */
