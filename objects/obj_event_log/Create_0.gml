
top=1;
entries=0;
scroll_cool=0;

var t;t=-1;
repeat(601){t+=1;
    event_text[t]="";event_date[t]="";
    event_turn[t]=0;event_height[t]=0;
    event_color[t]=0;
}

// Get upon load?
t=0;

if (file_exists("save"+string(obj_controller.load_game)+"log.ini")) and (obj_controller.good_log=1){
    ini_open("save"+string(obj_controller.load_game)+"log.ini");
    
    repeat(500){t+=1;
        event_text[t]=ini_read_string("Log",string("a."+string(t)),"");
        event_date[t]=ini_read_string("Log",string("b."+string(t)),"");
        event_turn[t]=ini_read_real("Log",string("c."+string(t)),0);
        event_color[t]=ini_read_string("Log",string("d."+string(t)),"");
    }
    
    ini_close();
}

// 
help=0;
help_topics=0;
topic="";
info="";
strategy="";
main_info="";
topics[0]="";
related[0]="";
related[1]="";
related[2]="";
related[3]="";

var e;e=-1;
repeat(101){e+=1;
    topics[e]="";
}

if (file_exists("main\help.ini")){
    ini_open("main\help.ini");var ch;ch=0;
    repeat(100){ch+=1;
        if (ini_section_exists(string(ch))){help_topics+=1;
            topics[help_topics]=ini_read_string(string(ch),"topic","Error");
        }
    }
    ini_close();
}

if (help_topics=0) and (help!=0) then instance_destroy();


