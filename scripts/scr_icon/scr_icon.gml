function scr_icon(argument0) {

	var i;i=0;

	if (icon_name!=""){
	    if (icon_name="start") then icon=i;i+=1;// 0
	    if (icon_name="da") then icon=i;i+=1;// 1
	    if (icon_name="ws") then icon=i;i+=1;
	    if (icon_name="sw") then icon=i;i+=1;
	    if (icon_name="if") then icon=i;i+=1;
	    if (icon_name="ba") then icon=i;i+=1;
	    if (icon_name="ih") then icon=i;i+=1;
	    if (icon_name="um") then icon=i;i+=1;
	    if (icon_name="sl") then icon=i;i+=1;
	    if (icon_name="rg") then icon=i;i+=1;// 9
	    if (icon_name="bt") then icon=i;i+=1;// 10
	    if (icon_name="min") then icon=i;i+=1;// 11
	    if (icon_name="se") then icon=i;i+=1;
	    if (icon_name="lam") then icon=i;i+=1;
	    if (icon_name="en") then icon=i;i+=1;
	    if (icon_name="am") then icon=i;i+=1;
	    if (icon_name="sk") then icon=i;i+=1;// 16
	    if (icon_name="am") then icon=i;i+=1;// 17
	    if (icon_name="emn") then icon=i;i+=1;// 18
	    if (icon_name="sk") then icon=i;i+=1;// 19
	    if (icon_name="con") then icon=i;i+=1;// 20
	    if (icon_name="mec") then icon=i;i+=1;
	    if (icon_name="flr") then icon=i;i+=1;
	    if (icon_name="eag") then icon=i;i+=1;
	    if (icon_name="tal") then icon=i;i+=1;
	    if (icon_name="eye") then icon=i;i+=1;
	    if (icon_name="ank") then icon=i;i+=1;
	    if (icon_name="kno") then icon=i;i+=1;
	    if (icon_name="anv") then icon=i;i+=1;
	    if (icon_name="dorf1") then icon=i;i+=1;
	    if (icon_name="dorf2") then icon=i;i+=1;
	    if (icon_name="dorf3") then icon=i;i+=1;
	    if (icon_name="haz") then icon=i;i+=1;
	    if (icon_name="misc") then icon=i;i+=1;
	    if (icon_name="leaf") then icon=i;i+=1;
	    if (icon_name="usa") then icon=i;i+=1;
	    if (icon_name="conf") then icon=i;i+=1;
	    if (icon_name="badteeth") then icon=i;i+=1;
	    if (icon_name="korea") then icon=i;i+=1;
	    if (icon_name="comm") then icon=i;i+=1;
	    if (icon_name="gay") then icon=i;i+=1;
	    if (icon_name="lee") then icon=i;i+=1;
	    if (icon_name="coca") then icon=i;i+=1;
	    if (icon_name="ludi") then icon=i;i+=1;
	    if (icon_name="wea") then icon=i;i+=1;
	    if (icon_name="ooga") then icon=i;i+=1;
	    if (icon_name="peace") then icon=i;i+=1;
	    if (icon_name="pot") then icon=i;i+=1;
	    if (icon_name="jew") then icon=i;i+=1;
	    if (icon_name="art") then icon=i;i+=1;
	    if (icon_name="satan1") then icon=i;i+=1;
	    if (icon_name="satan2") then icon=i;i+=1;
	    if (icon_name="satan3") then icon=i;i+=1;
	    if (icon_name="ac") then icon=i;i+=1;
	    if (icon_name="football") then icon=i;i+=1;
	    if (icon_name="nrfs") then icon=i;i+=1;
	    if (icon_name="fish") then icon=i;i+=1;
	    if (icon_name="an1") then icon=i;i+=1;
	    if (icon_name="an2") then icon=i;i+=1;
	    if (icon_name="an3") then icon=i;i+=1;
	    if (icon_name="an4") then icon=i;i+=1;
	    if (icon_name="an5") then icon=i;i+=1;
	    if (icon_name="an6") then icon=i;i+=1;
	    if (icon_name="an7") then icon=i;i+=1;
	    if (icon_name="an8") then icon=i;i+=1;
	    if (icon_name="an9") then icon=i;i+=1;
	    if (icon_name="an10") then icon=i;i+=1;
	    if (icon_name="an11") then icon=i;i+=1;
	    if (icon_name="an12") then icon=i;i+=1;
	    if (icon_name="an13") then icon=i;i+=1;
	    if (icon_name="an14") then icon=i;i+=1;
	    if (icon_name="an15") then icon=i;i+=1;
	    if (icon_name="an16") then icon=i;i+=1;
	    if (icon_name="an17") then icon=i;i+=1;
	    if (icon_name="an18") then icon=i;i+=1;
	    if (icon_name="an19") then icon=i;i+=1;
	    if (icon_name="an20") then icon=i;i+=1;
	    // if (icon_name="an21") then icon=i;i+=1;
    
	    var q;q=0;if (instance_exists(obj_cuicons)) then repeat(290){
	        q+=1;if (icon_name="custom"+string(q)) then icon=i;i+=1;
	    }
    
	    /*if (icon_name="custom1") then icon=i;i+=1;
	    if (icon_name="custom2") then icon=i;i+=1;
	    if (icon_name="custom3") then icon=i;i+=1;
	    if (icon_name="custom4") then icon=i;i+=1;*/
	}

	if (argument0="-"){icon-=1;if (icon<0) then icon=80;if (icon>=17) and (icon<=20) then icon=16;}
	if (argument0="+"){icon+=1;if (icon>80) then icon=0;if (icon>=17) and (icon<=20) then icon=21;}
	if (argument0="=") then icon+=0;
	if (argument0="random") then icon=random(floor(33))+2;


	i=0;
	if (icon=i) then icon_name="start";i+=1;
	if (icon=i) then icon_name="da";i+=1;
	if (icon=i) then icon_name="ws";i+=1;
	if (icon=i) then icon_name="sw";i+=1;
	if (icon=i) then icon_name="if";i+=1;
	if (icon=i) then icon_name="ba";i+=1;
	if (icon=i) then icon_name="ih";i+=1;
	if (icon=i) then icon_name="um";i+=1;
	if (icon=i) then icon_name="sl";i+=1;
	if (icon=i) then icon_name="rg";i+=1;
	if (icon=i) then icon_name="bt";i+=1;
	// 10 ^
	if (icon=i) then icon_name="min";i+=1;
	if (icon=i) then icon_name="se";i+=1;
	if (icon=i) then icon_name="lam";i+=1;
	if (icon=i) then icon_name="en";i+=1;
	if (icon=i) then icon_name="am";i+=1;
	if (icon=i) then icon_name="sk";i+=1;
	if (icon=i) then icon_name="am";i+=1;
	if (icon=i) then icon_name="emn";i+=1;
	if (icon=i) then icon_name="sk";i+=1;
	if (icon=i) then icon_name="con";i+=1;
	// 20^
	if (icon=i) then icon_name="mec";i+=1;
	if (icon=i) then icon_name="flr";i+=1;
	if (icon=i) then icon_name="eag";i+=1;
	if (icon=i) then icon_name="tal";i+=1;
	if (icon=i) then icon_name="eye";i+=1;
	if (icon=i) then icon_name="ank";i+=1;
	if (icon=i) then icon_name="kno";i+=1;
	if (icon=i) then icon_name="anv";i+=1;
	if (icon=i) then icon_name="dorf1";i+=1;
	if (icon=i) then icon_name="dorf2";i+=1;
	// 30^
	if (icon=i) then icon_name="dorf3";i+=1;
	if (icon=i) then icon_name="haz";i+=1;
	if (icon=i) then icon_name="misc";i+=1;
	if (icon=i) then icon_name="leaf";i+=1;
	if (icon=i) then icon_name="usa";i+=1;
	if (icon=i) then icon_name="conf";i+=1;
	if (icon=i) then icon_name="badteeth";i+=1;
	if (icon=i) then icon_name="korea";i+=1;
	if (icon=i) then icon_name="comm";i+=1;
	if (icon=i) then icon_name="gay";i+=1;
	if (icon=i) then icon_name="lee";i+=1;
	if (icon=i) then icon_name="coca";i+=1;
	if (icon=i) then icon_name="ludi";i+=1;
	if (icon=i) then icon_name="wea";i+=1;
	if (icon=i) then icon_name="ooga";i+=1;
	if (icon=i) then icon_name="peace";i+=1;
	if (icon=i) then icon_name="pot";i+=1;
	if (icon=i) then icon_name="jew";i+=1;
	if (icon=i) then icon_name="art";i+=1;
	if (icon=i) then icon_name="satan1";i+=1;
	if (icon=i) then icon_name="satan2";i+=1;
	if (icon=i) then icon_name="satan3";i+=1;
	if (icon=i) then icon_name="ac";i+=1;
	if (icon=i) then icon_name="football";i+=1;
	if (icon=i) then icon_name="nrfs";i+=1;
	if (icon=i) then icon_name="fish";i+=1;
	if (icon=i) then icon_name="an1";i+=1;
	if (icon=i) then icon_name="an2";i+=1;
	if (icon=i) then icon_name="an3";i+=1;
	if (icon=i) then icon_name="an4";i+=1;
	if (icon=i) then icon_name="an5";i+=1;
	if (icon=i) then icon_name="an6";i+=1;
	if (icon=i) then icon_name="an7";i+=1;
	if (icon=i) then icon_name="an8";i+=1;
	if (icon=i) then icon_name="an9";i+=1;
	if (icon=i) then icon_name="an10";i+=1;
	if (icon=i) then icon_name="an11";i+=1;
	if (icon=i) then icon_name="an12";i+=1;
	if (icon=i) then icon_name="an13";i+=1;
	if (icon=i) then icon_name="an14";i+=1;
	if (icon=i) then icon_name="an15";i+=1;
	if (icon=i) then icon_name="an16";i+=1;
	if (icon=i) then icon_name="an17";i+=1;
	if (icon=i) then icon_name="an18";i+=1;
	if (icon=i) then icon_name="an19";i+=1;
	if (icon=i) then icon_name="an20";i+=1;
	// if (icon=i) then icon_name="an21";i+=1;


	var q;q=0;if (instance_exists(obj_cuicons)) then repeat(290){
	    q+=1;if (icon=i) then icon_name="custom"+string(q);i+=1;
	}


	/*var q;q=0;if (instance_exists(obj_cuicons)) then repeat(290){
	    q+=1;if (icon_name="custom"+string(q)) then icon=i;i+=1;
	}*/

	/*if (icon=i) then icon_name="custom1";i+=1;
	if (icon=i) then icon_name="custom2";i+=1;
	if (icon=i) then icon_name="custom3";i+=1;
	if (icon=i) then icon_name="custom4";i+=1;*/


}
