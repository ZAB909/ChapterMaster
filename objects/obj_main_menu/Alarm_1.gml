// var str;
ini_open("pass.ini");
blog_url = ini_read_string("Data", "blog", "Error");
word_from_duke = ini_read_string("Data", "message", "blank");
word_from_duke2 = ini_read_string("Data", "message2", "blank");
version = ini_read_real("Data", "version", 0);
ini_close();
// show_message(str);


/*

if (version>global.version){
    fade=0;out_of_date=120;
    
    audio_stop_all();
    audio_play_sound(snd_redownload,0,true);    
}

/* */
/*  */
