function string_to_integer(argument0) {

	// Argument0: string

	// This script converts a word or longer string into an integer, with each letter
	// corresponding to a value from 1-26.  The purpose of this is to allow a marine's
	// name to generate a semi-unique variable for the future display of veterency
	// decorations when inspected in management.  Whether it is odd, from 0-9, and so
	// on can determine what shows on their picture at certain experience values.

	var lol,m1,val;
	lol=argument0;val=0;
	m1=string_length(lol);

	repeat(m1){
	    if (string_lower(string_char_at(lol,0))="a") then val+=1;
	    if (string_lower(string_char_at(lol,0))="b") then val+=2;
	    if (string_lower(string_char_at(lol,0))="c") then val+=3;
	    if (string_lower(string_char_at(lol,0))="d") then val+=4;
	    if (string_lower(string_char_at(lol,0))="e") then val+=5;
	    if (string_lower(string_char_at(lol,0))="f") then val+=6;
	    if (string_lower(string_char_at(lol,0))="g") then val+=7;
	    if (string_lower(string_char_at(lol,0))="h") then val+=8;
	    if (string_lower(string_char_at(lol,0))="i") then val+=9;
	    if (string_lower(string_char_at(lol,0))="j") then val+=10;
	    if (string_lower(string_char_at(lol,0))="k") then val+=11;
	    if (string_lower(string_char_at(lol,0))="l") then val+=12;
	    if (string_lower(string_char_at(lol,0))="m") then val+=13;
	    if (string_lower(string_char_at(lol,0))="n") then val+=14;
	    if (string_lower(string_char_at(lol,0))="o") then val+=15;
	    if (string_lower(string_char_at(lol,0))="p") then val+=16;
	    if (string_lower(string_char_at(lol,0))="q") then val+=17;
	    if (string_lower(string_char_at(lol,0))="r") then val+=18;
	    if (string_lower(string_char_at(lol,0))="s") then val+=19;
	    if (string_lower(string_char_at(lol,0))="t") then val+=20;
	    if (string_lower(string_char_at(lol,0))="u") then val+=21;
	    if (string_lower(string_char_at(lol,0))="v") then val+=22;
	    if (string_lower(string_char_at(lol,0))="w") then val+=23;
	    if (string_lower(string_char_at(lol,0))="x") then val+=24;
	    if (string_lower(string_char_at(lol,0))="y") then val+=25;
	    if (string_lower(string_char_at(lol,0))="z") then val+=26;
	    lol=string_delete(lol,0,1);
	}
	return(val);


}
