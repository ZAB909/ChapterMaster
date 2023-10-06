


var i;i=-1;
repeat(8){i+=1;
    hover[i]=0;glow[i]=0;glowing[i]=1;
}
var path = working_directory+ "JSON_files/gear.JSON"
show_debug_message("{0}", path);
var gear =get_open_filename("*.JSON;", "gear.JSON");

show_debug_message("{0}", gear);
gear = file_text_read_string(gear);
global.gear = json_decode(gear);
show_debug_message("{0}", global.gear);
cooldown=0;
button=0;

fade=0;
fading=0;
crap=0;
oth=0;

mouse_left=0;




