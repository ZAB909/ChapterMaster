function scr_random_marine(argument0, argument1) {

	// argument0 : role
	// argument1: exp



	var man_c, man_i, c, i, r_size, good, him;
	man_c=0;man_i=0;c=0;i=0;r_size=0;good=0;him=0;



	i=-1;co=-1;
	repeat(11){
	    co+=1;i=0;
	    repeat(305){
	        i+=1;man_c[i]=0;man_i[i]=0;
	    }
	}



	c=-1;i=0;
	repeat(11){
	    c+=1;i=0;
	    if (c<=10){
	        repeat(300){
	            i+=1;
	            if ((obj_ini.role[c,i]=argument0) or (argument0="")) and (obj_ini.name[c,i]!="") and (obj_ini.experience[c,i]>=argument1){// Match
	                r_size+=1;man_c[r_size]=c;man_i[r_size]=i;
	            }
	        }
	        if (string_count("Aspirant",argument0)>0) then c=15;
	    }
	}

	// show_message(string(r_size));

	if (r_size>0){
	    him=floor(random(r_size))+1;
    
	    repeat(10){
	        if (man_c[him]=0) and (man_i[him]=1) and (argument0="") then him=floor(random(r_size))+1;
	        if (man_c[him]>10) and (him>1) then him-=1;
	    }
    
	    if (man_c[him]>10) then show_message("Fuck me");
    
	    if (man_c[him]!=0) then return(man_i[him]+(man_c[him]/100));
	    if (man_c[him]=0) then return(man_i[him]);
	}


	/*
	if !(number mod 1)
	{whatever you wanna do}
	*/


}
