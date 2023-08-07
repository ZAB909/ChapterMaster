
keyboard_string="";

ini_open("saves.ini");
master_volume=ini_read_real("Settings","master_volume",1);
effect_volume=ini_read_real("Settings","effect_volume",1);
music_volume=ini_read_real("Settings","music_volume",1);
large_text=ini_read_real("Settings","large_text",0);
settings_heresy=ini_read_real("Settings","settings_heresy",0);
settings_fullscreen=ini_read_real("Settings","fullscreen",1);
settings_window_data=ini_read_string("Settings","window_data","fullscreen");
ini_close();

window_data=string(window_get_x())+"|"+string(window_get_y())+"|"+string(window_get_width())+"|"+string(window_get_height())+"|";
window_old=window_data;if (window_get_fullscreen()=1){window_old="fullscreen";window_data="fullscreen";}
restarted=0;custom_icon=0;


audio_stop_all();
audio_play_sound(snd_diboz,0,true);
audio_sound_gain(snd_diboz, 0, 0);
var nope;nope=0;if (master_volume=0) or (music_volume=0) then nope=1;
if (nope!=1){audio_sound_gain(snd_diboz,0.25*master_volume*music_volume,2000);}

global.load=0;

skip=false;
premades=true;

fade_in=50;
slate1=80;
slate2=0;
slate3=-2;
slate4=0;
slate5=0;
slate6=0;
mouse_left=0;
mouse_right=0;
change_slide=0;
goto_slide=1;
highlight=0;
highlighting=0;
old_highlight=0;
slide=1;
slide_show=1;
cooldown=0;
name_bad=0;
heheh=0;
icons_top=1;
icons_max=0;

scrollbar_engaged=0;

text_selected="none";
text_bar=0;
tooltip="";
tooltip2="";
popup="";
temp=0;
target_gear=0;
tab=0;
role_names_all="";

// 
chapter="Unnamed";
chapter_string="Unnamed";
chapter_year=0;
icon=1;icon_name="da";custom=0;
founding=1;
chapter_tooltip="";
points=0;maxpoints=100;
fleet_type=1;
strength=5;cooperation=5;
purity=5;stability=5;
var i;i=-1;repeat(6){i+=1;adv[i]="";adv_num[i]=0;dis[i]="";dis_num[i]=0;}
homeworld="Temperate";homeworld_name=scr_star_name();
recruiting="Death";recruiting_name=scr_star_name();
flagship_name=scr_ship_name("imperial");
recruiting_exists=1;
homeworld_exists=1;
homeworld_rule=1;
aspirant_trial="Blood Duel";
discipline="default";

battle_cry="For the Emperor";

main_color=1;secondary_color=1;trim_color=1;
pauldron2_color=1;pauldron_color=1;// Left/Right pauldron
lens_color=1;weapon_color=1;col_special=0;trim=1;
skin_color=0;

color_to_main="";
color_to_secondary="";
color_to_trim="";
color_to_pauldron="";
color_to_pauldron2="";
color_to_lens="";
color_to_weapon="";

hapothecary=scr_marine_name();
hchaplain=scr_marine_name();
clibrarian=scr_marine_name();
fmaster=scr_marine_name();
recruiter=scr_marine_name();
admiral=scr_marine_name();

equal_specialists=0;
load_to_ships=2;

successors=0;

mutations=0;mutations_selected=0;
preomnor=0;voice=0;doomed=0;lyman=0;omophagea=0;ossmodula=0;membrane=0;
zygote=0;betchers=0;catalepsean=0;secretions=0;occulobe=0;mucranoid=0;

disposition[0]=0;
disposition[1]=0;// Prog
disposition[2]=0;// Imp
disposition[3]=0;// Mech
disposition[4]=0;// Inq
disposition[5]=0;// Ecclesiarchy
disposition[6]=0;// Astartes
disposition[7]=0;// Reserved

chapter_master_name=scr_marine_name();
chapter_master_melee=1;
chapter_master_ranged=1;
chapter_master_specialty=2;


var i;i=-1;
repeat(60){i+=1;chapter_id[i]="";chapter_tooltip[i]="Error: The tooltip is missing.";company_title[i]="";}
chapter_id[1]="Dark Angels";
chapter_tooltip[1]="The Dark Angels claim complete allegiance and service to the Emperor of Mankind, though their actions and secret goals seem to run counter to this- above all other things they strive to atone for an ancient crime of betrayal.";

chapter_id[2]="White Scars";
//chapter_tooltip[2]="Known and feared for their highly mobile way of war, the White Scars are the masters of lightning strikes and hit-and-run tactics.  They are particularly adept in the use of Attack Bikes and field large numbers of them.";

chapter_id[3]="Space Wolves";
chapter_tooltip[3]="Brave sky warriors hailing from the icy deathworld of Fenris, the Space Wolves are a non-Codex compliant chapter, and deadly in close combat.  They fight on their own terms and damn any who wish otherwise.";

chapter_id[4]="Imperial Fists";
//chapter_tooltip[4]="Siege-masters of utmost excellence, the Imperial Fists stoicism has lead them to great victories and horrifying defeats. To them, the idea of a tactical retreat is utterly unconsiderable. They hold ground on Terra vigilantly, refusing to back down from any fight.";

chapter_id[5]="Blood Angels";
chapter_tooltip[5]="One of the most noble and renowned chapters, their combat record belies a dark flaw in their gene-seed caused by the death of their primarch. Their primarch had wings and a propensity for close combat, and this shows in their extensive use of jump packs and close quarters weapons.";

chapter_id[6]="Iron Hands";
chapter_tooltip[6]="The flesh is weak, and the weak shall perish. Such is the creed of these mercilessly efficient cyborg warriors. A chapter with strong ties to the Mechanicum, they crush the foes of the Emperor and Machine God alike with a plethora of exotic technology and ancient weaponry.";

chapter_id[7]="Ultramarines";
chapter_tooltip[7]="An honorable and venerated chapter, the Ultramarines are considered to be amongst the best of the best. Their Primarch was the author of the great tome of the “Codex Astartes”, and they are considered exemplars of what a perfect Space Marine Chapter should be like.";

chapter_id[8]="Salamanders";
chapter_tooltip[8]="Followers of the Promethean Cult, the jet-black skinned Salamanders are forgemasters of legend. They are armed with the best wargear available and prefer flame based weaponry. Their only drawback is their low numbers and slow recruiting.";

chapter_id[9]="Raven Guard";
//chapter_tooltip[9]="Clinging to the shadows and riding the edge of lightning the Raven Guard strike out at the hated enemy with stealth and speed. Using lightning strikes, hit and run tactics, and guerrilla warfare, they are known for being there one second and gone the next.";

chapter_id[10]="Black Templars";
//chapter_tooltip[10]="Not adhering to the Codex Astartes, Black Templars are a Chapter on an Eternal Crusade with unique organization and high numbers. Masters of assault, they charge at the enemy with zeal unmatched. They hate psykers, and as such, have no Librarians.";

chapter_id[11]="Minotaurs";
//chapter_tooltip[11]="Bronze-clad Astartes of unknown Founding, the Minotaurs prefer to channel their righteous fury in a massive storm of fire, with tanks and artillery. They could be considered the Inquisition’s attack dog, since they often attack fellow chapters suspected of heresy.";

chapter_id[12]="Blood Ravens";
chapter_tooltip[12]="Of unknown origins and Founding, the origins of the Blood Ravens are shrouded in mystery and are believed to be tied to a dark truth. This elusive Chapter is drawn to the pursuit of knowledge and ancient lore and produces an unusually high number of Librarians.";

chapter_id[13]="Crimson Fists";
//chapter_tooltip[13]="An Imperial Fists descendant, the Crimson Fists are more level-minded than their Progenitor and brother chapters.  They suffer the same lacking zygotes as their ancestors, and more resemble the Ultramarines in their balanced approach to combat.";

chapter_id[14]="Lamenters";
chapter_tooltip[14]="The Lamenter's accursed and haunted legacy seems to taint much of what they have achieved; their victories often become bitter ashes in their hands.  Nearly extinct, they fight their last days on behalf of the common folk in a crusade of endless penitence.";

chapter_id[15]="Carcharodons";
//chapter_tooltip[15]="Rumored to be Successors of the Raven Guard, these Astartes are known for their sudden attacks and shock assaults. Travelling through the Imperium via self-sufficient Nomad-Predation based fleets, no enemy is safe from the fury of these bloodthirsty Space Marines.";

chapter_id[16]="Soul Drinkers";
chapter_tooltip[16]="Sharing ancestry of the Black Templars or Crimson fists. As proud sons of Dorn they share the strong void combat traditions, fielding a large amount of Battle Barges. As well as being fearsome in close combat. Whispers of the Ruinous Powers are however quite enticing."


chapter_id[17]="Angry Marines";
//chapter_tooltip[17]="Frothing with pathological rage since the day their Primarch emerged from his pod with naught but a dented copy of battletoads.  Every last Angry Marine is a homicidal, suicidal berserker with a voice that projects, and are always angry, all the time.  A /tg/ classic.";

chapter_id[18]="Emperor's Nightmare";
//chapter_tooltip[18]="The Emperor's Nightmare bear the curse of a bizarre mutation within their gene-seed. The Catalepsean Node is in a state of decay and thus do not sleep for months at a time until falling asleep suddenly. They prefer shock and awe tactics with stealth.";

chapter_id[19]="Star Krakens";
//chapter_tooltip[19]="In darkness, they dwell in The Deep. The Star Krakens stand divided in individual companies but united in the form of the Ten-Flag Council. They utilize boarding tactics and are the sole guardians of the ancient sensor array called “The Lighthouse”.";

chapter_id[20]="Conservators";
//chapter_tooltip[20]="Hailing from the Asharn Marches and having established their homeworld on the planet Dekara, these proud sons of Dorn suffer from an extreme lack of supplies, Ork raids, and more. Though under strength and lacking equipment, they managed to forge an interstellar kingdom loyal to both Emperor and Imperium.";

i=-1;
repeat(61){i+=1;advantage[i]="";advantage_tooltip[i]="";disadvantage[i]="";dis_tooltip[i]="";}

i=1;
advantage[i]="Ambushers";advantage_tooltip[i]="Your chapter is especially trained with ambushing foes; they have a bonus to attack during the start of a battle.";i+=1;
advantage[i]="Battle Cousins";advantage_tooltip[i]="NOT IMPLEMENTED YET.";i+=1;
advantage[i]="Boarders";advantage_tooltip[i]="Boarding other ships is routine for the chapter.  Your infantry have a bonus to attack when boarding ships.";i+=1;
advantage[i]="Bolter Drilling";advantage_tooltip[i]="Bolter drills are sacred to your chapter; all marines have increased attack with Bolter weaponry.";i+=1;
advantage[i]="Brothers, All";advantage_tooltip[i]="Your chapter places great emphasis on camradery and loyalty.  You start with a well-equip Honor Guard.";i+=1;
advantage[i]="Comrades in Arms";advantage_tooltip[i]="NOT IMPLEMENTED YET.";i+=1;
advantage[i]="Crafters";advantage_tooltip[i]="Your chapter views artifacts as sacred; you start with better gear and maintain all equipment with more ease.";i+=1;
advantage[i]="Daemon Binders";advantage_tooltip[i]="Powers are replaced with a more powerful Witchfire variant.  Perils are also less likely to occur but are more disasterous when they do.";i+=1;
advantage[i]="Enemy: Eldar";advantage_tooltip[i]="Eldar are particularly hated by your chapter.  When fighting Eldar damage is increased.";i+=1;
advantage[i]="Enemy: Fallen";advantage_tooltip[i]="Chaos Marines are particularly hated by your chapter.  When fighting the traitors damage is increased.";i+=1;
advantage[i]="Enemy: Necrons";advantage_tooltip[i]="NOT IMPLEMENTED YET.";i+=1;
advantage[i]="Enemy: Orks";advantage_tooltip[i]="Orks are particularly hated by your chapter.  When fighting Orks damage is increased.";i+=1;
advantage[i]="Enemy: Tau";advantage_tooltip[i]="Tau are particularly hated by your chapter.  When fighting Tau damage is increased.";i+=1;
advantage[i]="Enemy: Tyranids";advantage_tooltip[i]="Tyranids are particularly hated by your chapter.  When fighting Tyranids damage is increased.";i+=1;
advantage[i]="Kings of Space";advantage_tooltip[i]="Veterans of naval combat, your ships have bonus offense, defense, and may always be controlled regardless of whether or not the Chapter Master is present.";i+=1;
advantage[i]="Lightning Warriors";advantage_tooltip[i]="Your marines' only concern in battle is dealing the maximum amount of damage.  Infantry have boosted attack but less defense.";i+=1;
advantage[i]="Paragon";advantage_tooltip[i]="You are a pale shadow of the primarchs.  Larger, stronger, faster, your Chapter Master is on a higher level than most, gaining additional health and combat effectiveness.";i+=1;
advantage[i]="Psyker Abundance";advantage_tooltip[i]="The Psyker mutation runs rampant in your chapter.  Librarians train in 60% the normal time and recieve bonus experience.";i+=1;
advantage[i]="Reverent Guardians";advantage_tooltip[i]="Your chapter places great faith in the Imperial Cult; you start with more Chaplains and any Ecclesiarchy disposition increases are enhanced.";i+=1;
advantage[i]="Tech-Brothers";advantage_tooltip[i]="Your chapter has better ties to the mechanicus; you have more techmarines and higher mechanicus disposition.";i+=1;
advantage[i]="Scavengers";advantage_tooltip[i]="Your Astartes have a knack for finding what has been lost.  Items and wargear are periodically found and added to the Armamentarium.";i+=1;
advantage[i]="Siege Masters";advantage_tooltip[i]="Your chapter is familiar with the ins-and-outs of fortresses.  They are better at defending and attacking fortifications.";i+=1;
advantage[i]="Slow and Purposeful";advantage_tooltip[i]="Careful and steady is your chapters doctrine; all infantry have slightly less attack but boosted defenses.";i+=1;
advantage[i]="Melee Enthusiasts";advantage_tooltip[i]="Rip and tear!  Your marines and dreadnoughts have boosted attack with melee weapons.";i+=1;
i+=1;
advantage[i]="Cancel";advantage_tooltip[i]="";

i=1;
disadvantage[i]="Black Rage";dis_tooltip[i]="Your marines are successible to Black Rage, having a chance each battle to become Death Company.  These units are locked as Assault Marines and are fairly suicidal.";i+=1;
disadvantage[i]="Blood Debt";dis_tooltip[i]="Prevents your Chapter from recruiting new Astartes until enough of your marines, or enemies, have been killed.  Incompatible with Penitent chapter types.";i+=1;
// disadvantage[i]="Embargo";dis_tooltip[i]="NOT IMPLEMENTED YET.";i+=1;// Greatly increases the cost of common wargear and disallows advanced items.
// disadvantage[i]="First In, Last Out";dis_tooltip[i]="NOT IMPLEMENTED YET.";i+=1;
disadvantage[i]="Fresh Blood";dis_tooltip[i]="Due to being newly created your chapter has little special wargear or psykers.";i+=1;
disadvantage[i]="Never Forgive";dis_tooltip[i]="In the past traitors broke off from your chapter.  They harbor incriminating secrets or heritical beliefs, and as thus, must be hunted down whenever possible.";i+=1;
disadvantage[i]="Psyker Intolerant";dis_tooltip[i]="Witches are hated by your chapter.  You cannot create Librarians but gain a little bonus attack against psykers.";i+=1;
// disadvantage[i]="Rival Brotherhood";dis_tooltip[i]="NOT IMPLEMENTED YET.";i+=1;
disadvantage[i]="Shitty Luck";dis_tooltip[i]="This is actually really helpful and beneficial for your chapter.  Trust me.";i+=1;
disadvantage[i]="Sieged";dis_tooltip[i]="A recent siege has reduced the number of your marines greatly.  You retain a normal amount of equipment but some is damaged.";i+=1;
disadvantage[i]="Splintered";dis_tooltip[i]="Your marines are unorganized and splintered.  You require greater time to respond to threats en masse.";i+=1;
disadvantage[i]="Suspicious";dis_tooltip[i]="Some of your chapter's past actions or current practices make the inquisition suspicious.  Their disposition is lowered.";i+=1;
disadvantage[i]="Tech-Heresy";dis_tooltip[i]="Your chapter does things that makes the Mechanicus upset.  Mechanicus disposition is lowered and you have less Tech Marines.";i+=1;
disadvantage[i]="Tolerant";dis_tooltip[i]="Your chapter is more lenient with xenos.  All xeno disposition is slightly increased and all Imperial disposition is lowered.";i+=1;
disadvantage[i]="Warp Touched";dis_tooltip[i]="Demons seem attracted to your chapter; perils of the warp happen more frequently and with more disasterous results.";i+=1;
i+=1;
disadvantage[i]="Cancel";dis_tooltip[i]="";

// Default Marine Loadouts
var ye,i;
ye=99;i=-1;repeat(51){i+=1;
    race[ye,i]=1;loc[ye,i]="";role[ye,i]="";wep1[ye,i]="";wep2[ye,i]="";armor[ye,i]="";gear[ye,i]="";mobi[ye,i]="";experience[ye,i]=0;
}
ye=100;i=-1;repeat(51){i+=1;
    race[ye,i]=1;loc[ye,i]="";role[ye,i]="";wep1[ye,i]="";wep2[ye,i]="";armor[ye,i]="";gear[ye,i]="";mobi[ye,i]="";experience[ye,i]=0;
}
ye=101;i=-1;repeat(51){i+=1;
    race[ye,i]=1;loc[ye,i]="";role[ye,i]="";wep1[ye,i]="";wep2[ye,i]="";armor[ye,i]="";gear[ye,i]="";mobi[ye,i]="";experience[ye,i]=0;
}
ye=102;i=-1;repeat(51){i+=1;
    race[ye,i]=1;loc[ye,i]="";role[ye,i]="";wep1[ye,i]="";wep2[ye,i]="";armor[ye,i]="";gear[ye,i]="";mobi[ye,i]="";experience[ye,i]=0;
}
ye=103;i=-1;repeat(51){i+=1;
    race[ye,i]=1;loc[ye,i]="";role[ye,i]="";wep1[ye,i]="";wep2[ye,i]="";armor[ye,i]="";gear[ye,i]="";mobi[ye,i]="";experience[ye,i]=0;
}



i=99;
repeat(3){i+=1;// First is for the correct slot, second is for default
    race[i,2]=1;role[i,2]="Honor Guard";wep1[i,2]="Power Sword";wep2[i,2]="Bolter";armor[i,2]="Power Armour";
    race[i,3]=1;role[i,3]="Veteran";wep1[i,3]="Chainsword";wep2[i,3]="Bolter";armor[i,3]="Power Armour";
    race[i,4]=1;role[i,4]="Terminator";wep1[i,4]="Power Fist";wep2[i,4]="Storm Bolter";armor[i,4]="Terminator Armour";
    race[i,5]=1;role[i,5]="Captain";wep1[i,5]="Power Fist";wep2[i,5]="Bolt Pistol";armor[i,5]="Power Armour";gear[i,5]="";
    race[i,6]=1;role[i,6]="Dreadnought";wep1[i,6]="Close Combat Weapon";wep2[i,6]="Lascannon";armor[i,6]="Dreadnought";
    race[i,7]=1;role[i,7]="Company Champion";wep1[i,7]="Power Sword";wep2[i,7]="Storm Shield";armor[i,7]="Power Armour";
    race[i,8]=1;role[i,8]="Tactical Marine";wep1[i,8]="Bolter";wep2[i,8]="Chainsword";armor[i,8]="Power Armour";
    race[i,9]=1;role[i,9]="Devastator";wep1[i,9]="Heavy Ranged";wep2[i,9]="Combat Knife";armor[i,9]="Power Armour";
    race[i,10]=1;role[i,10]="Assault Marine";wep1[i,10]="Chainsword";wep2[i,10]="Bolt Pistol";armor[i,10]="Power Armour";mobi[i,10]="Jump Pack";
    race[i,12]=1;role[i,12]="Scout";wep1[i,12]="Sniper Rifle";wep2[i,12]="Combat Knife";armor[i,12]="Scout Armour";
    race[i,14]=1;role[i,14]="Chaplain";wep1[i,14]="Power Sword";wep2[i,14]="Storm Bolter";armor[i,14]="Power Armour";gear[i,14]="Rosarius";
    race[i,15]=1;role[i,15]="Apothecary";wep1[i,15]="Power Sword";wep2[i,15]="Storm Bolter";armor[i,15]="Power Armour";gear[i,15]="Narthecium";
    race[i,16]=1;role[i,16]="Techmarine";wep1[i,16]="Power Axe";wep2[i,16]="Storm Bolter";armor[i,16]="Power Armour";gear[i,16]="Servo Arms";
    race[i,17]=1;role[i,17]="Librarian";wep1[i,17]="Force Weapon";wep2[i,17]="Storm Bolter";armor[i,17]="Power Armour";gear[i,17]="Psychic Hood";
}



if (global.restart>0){
    fade_in=-1;
    slate1=-1;
    slate=21;
    slate3=21;
    slate4=50;
    
    change_slide=0;
    slide=2;
    slide_show=2;
    
    scr_restart_variables(4);
    with(obj_restart_vars){instance_destroy();}
    global.restart=0;
}


if (skip=true){
    fade_in=-1;
    slate1=-1;
    slate=21;
    slate3=21;
    slate4=50;
    global.version=500;
    
    change_slide=0;
    slide=6;
    slide_show=slide;
    
    icon_name="ih";
    icon=6;founding=6;
    
    chapter="Sons of Duke";
    custom=2;
    battle_cry="The flesh is weak!  The flesh is weak!  The flesh is weak!  The flesh is weak!  The flesh is weak";
    
    purity=5;
    
    /*main_color=5;secondary_color=5;trim_color=2;
    pauldron2_color=5;// Left pauldron
    pauldron_color=5;// Right pauldron
    lens_color=7;weapon_color=2;col_special=0;*/
    
    main_color=7;secondary_color=5;trim_color=5;
    pauldron2_color=5;// Left pauldron
    pauldron_color=5;// Right pauldron
    lens_color=6;weapon_color=4;col_special=0;
    
    scr_chapter_new("Doom Benefactors");
}

/* */


scr_colors_initialize();


colour_to_find1 = shader_get_uniform(sReplaceColor, "f_Colour1");
colour_to_set1 = shader_get_uniform(sReplaceColor, "f_Replace1");
sourceR1 = 0/255;
sourceG1 = 0/255;
sourceB1 = 255/255;
targetR1 = col_r[main_color]/255;
targetG1 = col_g[main_color]/255;
targetB1 = col_b[main_color]/255;

colour_to_find2 = shader_get_uniform(sReplaceColor, "f_Colour2");
colour_to_set2 = shader_get_uniform(sReplaceColor, "f_Replace2");
sourceR2 = 255/255;
sourceG2 = 0/255;
sourceB2 = 0/255;
targetR2 = col_r[secondary_color]/255;
targetG2 = col_g[secondary_color]/255;
targetB2 = col_b[secondary_color]/255;

colour_to_find3 = shader_get_uniform(sReplaceColor, "f_Colour3");
colour_to_set3 = shader_get_uniform(sReplaceColor, "f_Replace3");
sourceR3 = 255/255;
sourceG3 = 255/255;
sourceB3 = 0/255;
targetR3 = col_r[pauldron_color]/255;
targetG3 = col_g[pauldron_color]/255;
targetB3 = col_b[pauldron_color]/255;

colour_to_find4 = shader_get_uniform(sReplaceColor, "f_Colour4");
colour_to_set4 = shader_get_uniform(sReplaceColor, "f_Replace4");
sourceR4 = 0/255;
sourceG4 = 255/255;
sourceB4 = 0/255;
targetR4 = col_r[lens_color]/255;
targetG4 = col_g[lens_color]/255;
targetB4 = col_b[lens_color]/255;

colour_to_find5 = shader_get_uniform(sReplaceColor, "f_Colour5");
colour_to_set5 = shader_get_uniform(sReplaceColor, "f_Replace5");
sourceR5 = 255/255;
sourceG5 = 0/255;
sourceB5 = 255/255;
targetR5 = col_r[trim_color]/255;
targetG5 = col_g[trim_color]/255;
targetB5 = col_b[trim_color]/255;

colour_to_find6 = shader_get_uniform(sReplaceColor, "f_Colour6");
colour_to_set6 = shader_get_uniform(sReplaceColor, "f_Replace6");
sourceR6 = 250/255;
sourceG6 = 250/255;
sourceB6 = 250/255;
targetR6 = col_r[pauldron2_color]/255;
targetG6 = col_g[pauldron2_color]/255;
targetB6 = col_b[pauldron2_color]/255;

colour_to_find7 = shader_get_uniform(sReplaceColor, "f_Colour7");
colour_to_set7 = shader_get_uniform(sReplaceColor, "f_Replace7");
sourceR7 = 0/255;
sourceG7 = 255/255;
sourceB7 = 255/255;
targetR7 = col_r[weapon_color]/255;
targetG7 = col_g[weapon_color]/255;
targetB7 = col_b[weapon_color]/255;

/* */
action_set_alarm(30, 1);
/*  */
