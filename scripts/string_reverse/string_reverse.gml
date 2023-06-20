function string_reverse(argument0) {
	/*
	Reverse String
	  Reverse a string with ease
  
	Argument0 - String
	*/

	var str,length,i,out,char;
	str=argument0
	out=""
	length=string_length(argument0)
	for(i=0;i<string_length(argument0);i+=1){
	 char=string_char_at(str,length-i)
	 out+=char
	}
	return out;


}
