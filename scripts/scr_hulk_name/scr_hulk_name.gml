function scr_hulk_name() {

	var nm,rand;
	nm="";

	rand=floor(random(19))+1;
	if (rand=1) then nm+="Captor of ";
	if (rand=2) then nm+="Blasphemous ";
	if (rand=3) then nm+="Broken ";
	if (rand=4) then nm+="Crimson ";
	if (rand=5) then nm+="Damnatio ";
	if (rand=6) then nm+="Death of ";
	if (rand=7) then nm+="Devourer of ";
	if (rand=8) then nm+="Fatum ";
	if (rand=9) then nm+="Hell's Last ";
	if (rand=10) then nm+="Harbringer of ";
	if (rand=11) then nm+="Judgement of ";
	if (rand=12) then nm+="Monolith of ";
	if (rand=13) then nm+="Mote of ";
	if (rand=14) then nm+="Nightmare of ";
	if (rand=15) then nm+="Prison of ";
	if (rand=16) then nm+="Scion of ";
	if (rand=17) then nm+="Spawn of ";
	if (rand=18) then nm+="Soul of ";
	if (rand=19) then nm+="Unholy ";

	rand=floor(random(18))+1;
	if (rand=1) then nm+="Carrion";
	if (rand=2) then nm+="Death";
	if (rand=3) then nm+="Damnation";
	if (rand=4) then nm+="Sin";
	if (rand=5) then nm+="Savagery";
	if (rand=6) then nm+="Tidings";
	if (rand=7) then nm+="Harvest";
	if (rand=8) then nm+="Posterus";
	if (rand=9) then nm+="Woe";
	if (rand=10) then nm+="Grief";
	if (rand=11) then nm+="Oblivion";
	if (rand=12) then nm+="Darkness";
	if (rand=13) then nm+="Paradox";
	if (rand=14) then nm+="Lost Souls";
	if (rand=15) then nm+="Anguish";
	if (rand=16) then nm+="Execration";
	if (rand=17) then nm+="Pus";
	if (rand=18) then nm+="Torment";


	return(string(nm));


}
