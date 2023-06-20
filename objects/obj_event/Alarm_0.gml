
var intro;intro="";

if (obj_controller.fest_type="Great Feast"){
    if (obj_controller.fest_feasts=0) then obj_controller.fest_feasts+=1;
    
    if (obj_controller.fest_lav<4) then intro="Once all are seated Chapter Serfs begin to ferry the covered main dish";
    if (obj_controller.fest_lav>=4) then intro="Once all are seated Chapter Serfs begin to ferry the first of several dishes";
    
    if (obj_controller.fest_feature2=1) and (obj_controller.fest_feature3=0) then intro+=" and alcohol";
    if (obj_controller.fest_feature2=0) and (obj_controller.fest_feature3=1) then intro+=" and drugs";
    if (obj_controller.fest_feature2=1) and (obj_controller.fest_feature3=1) then intro+=", booze, and drugs";
    
    intro+=" into the room.  This is ";
    
    if (obj_controller.fest_feature2+obj_controller.fest_feature3>0) then intro+="all ";
    intro+="placed front and center.  A silver cloche is then removed, revealing ";
    
    if (obj_controller.fest_lav<=1){
        if (attendants<=50) then intro+="a large vat of stew, made up of Triglyceride Gel and grox meat.";
        if (attendants>50) then intro+="several large vats of stew, made up of Triglyceride Gel and grox meat.";
    }
    if (obj_controller.fest_lav=2){
        if (attendants<=50) then intro+="an entire roast Grox, finely seasoned and flavored.  Vegtables lay around the belly and feet of the beast.";
        if (attendants>50) then intro+="several roast Grox, each finely seasoned and flavored.  Vegtables lay around the bellies and feet of the beasts.";
    }
    if (obj_controller.fest_lav=3){
        if (attendants<=105) then intro+="a massive, roasted Borreron Terrorwing, maronated in Dammassine and filled with stuffing.";
        if (attendants>105) then intro+="a pair of roasted Borreron Terrorwings, each maronated in Dammassine and filled with stuffing.";
    }
    if (obj_controller.fest_lav=4){
        intro+="cheese and wine Hors d'oeuvre and pasties, the small, bite-size edibles decorated with a flourish.";
        part2="fish";
    }
    if (obj_controller.fest_lav>=5){
        if (attendants<=50) then intro+="a large plater of mediterranean Grox salad, with nuts and sliced pears.";
        if (attendants>50) then intro+="several platers of mediterranean Grox salad, with nuts and sliced pears.";
        part2="fruit";part3="lobster";
    }
    
    
    if (obj_controller.fest_feature2=1){
        var boozer_type;boozer_type=1;
        if (global.chapter_name="Space Wolves") or (obj_ini.progenitor=3) then boozer_type=2;
        if (global.chapter_name="Blood Angels") or (obj_ini.progenitor=5) then boozer_type=3;
        
        if (boozer_type=1) then intro+="  Also provided is well-aged, finely distilled Amasec.";
        if (boozer_type=2) and (global.chapter_name!="Space Wolves") then intro+="  Also provided is Fenrir-imported Mjod, favored by the sons of Russ.";
        if (boozer_type=2) and (global.chapter_name="Space Wolves") then intro+="  Also provided is Mjod, favored by the sons of Russ.";
        if (boozer_type=3) then intro+="  Many types of alcohol have also been provided in small tasting glasses.  Amasec, Dammassine, and half a dozen other kinds have all been provided.";        
    }
    
    scr_event_newlines(intro);
}


