function string_rpos(argument0, argument1) {
	/*
	**  Usage:
	**      string_rpos(substr,str)
	**
	**  Arguments:
	**      substr      a substring of text
	**      str         a string of text
	**
	**  Returns:
	**      the right-most position of the given
	**      substring within the given string
	*/
	{
	    var sub,str,pos,ind;
	    sub = argument0;
	    str = argument1;
	    pos = 0;
	    ind = 0;
	    do {
	        pos += ind;
	        ind = string_pos(sub,str);
	        str = string_delete(str,1,ind);
	    } until (ind == 0);
	    return pos;
	}


}
