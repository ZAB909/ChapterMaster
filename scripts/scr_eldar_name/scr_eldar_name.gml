function scr_eldar_name(argument0) {



	var e1,e2,e3,n1,n2,n3,result;

	e1=floor(random(20))+1;
	e2=floor(random(19))+1;
	e3=floor(random(19))+1;
	e4=floor(random(20))+1;


	n1="";n2="";n3="";result="";


	if (e1=1) then n1="Ath";
	if (e1=2) then n1="Brim";
	if (e1=3) then n1="Cir";
	if (e1=4) then n1="Con";
	if (e1=5) then n1="Dor";
	if (e1=6) then n1="Ethil";
	if (e1=7) then n1="El";
	if (e1=8) then n1="Elo";
	if (e1=9) then n1="End";
	if (e1=10) then n1="For";
	if (e1=11) then n1="Gith";
	if (e1=12) then n1="Glor";
	if (e1=13) then n1="Hir";
	if (e1=14) then n1="In";
	if (e1=15) then n1="Lor";
	if (e1=16) then n1="Loth";
	if (e1=17) then n1="Nim";
	if (e1=18) then n1="Ra";
	if (e1=19) then n1="Sor";
	if (e1=20) then n1="Than";

	if (e2=1) then n2="a";
	if (e2=2) then n2="an";
	if (e2=3) then n2="at";
	if (e2=4) then n2="ath";
	if (e2=5) then n2="brod";
	if (e2=6) then n2="dia";
	if (e2=7) then n2="dor";
	if (e2=8) then n2="en";
	if (e2=9) then n2="fin";
	if (e2=10) then n2="for";
	if (e2=11) then n2="gol";
	if (e2=12) then n2="in";
	if (e2=13) then n2="lor";
	if (e2=14) then n2="mar";
	if (e2=15) then n2="ol";
	if (e2=16) then n2="rol";
	if (e2=17) then n2="sor";
	if (e2=18) then n2="than";
	if (e2=19) then n2="thiel";

	if (e3=1) then n3="anwe";
	if (e3=2) then n3="anfel";
	if (e3=3) then n3="ar";
	if (e3=4) then n3="ath";
	if (e3=5) then n3="del";
	if (e3=6) then n3="don";
	if (e3=7) then n3="dor";
	if (e3=8) then n3="gost";
	if (e3=9) then n3="in";
	if (e3=10) then n3="lun";
	if (e3=11) then n3="mar";
	if (e3=12) then n3="nost";
	if (e3=13) then n3="or";
	if (e3=14) then n3="ost";
	if (e3=15) then n3="oth";
	if (e3=16) then n3="rond";
	if (e3=17) then n3="tor";
	if (e3=18) then n3="uen";
	if (e3=19) then n3="und";

	if (argument0=1) then result=string(n1);
	if (argument0=2) then result=string(n1)+string(n2);
	if (argument0=3) then result=string(n1)+string(n2)+string(n3);
	return(result);


}
