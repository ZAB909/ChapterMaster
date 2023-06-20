function scr_powers_new(argument0, argument1) {

	// Argument0: Company
	// Argument1: Marine ID

	// This script checks if the marine is capable of using psychic powers, and if so, assigns them based on experience

	var random_learn;
	random_learn=false;

	var let,letmax,powers_should_have,powers_have;
	let="";letmax=0;

	if (obj_ini.psy_powers="default"){let="D";letmax=7;}
	if (obj_ini.psy_powers="biomancy"){let="B";letmax=5;}
	if (obj_ini.psy_powers="pyromancy"){let="P";letmax=5;}
	if (obj_ini.psy_powers="telekinesis"){let="T";letmax=5;}
	if (obj_ini.psy_powers="rune Magick") or (obj_ini.psy_powers="Rune Magick"){let="R";letmax=5;}



	powers_should_have=floor((obj_ini.experience[argument0,argument1]-30)/30)+1;// +1 for the primary
	powers_have=string_count(string(let),obj_ini.spe[argument0,argument1]);




	if (powers_have<powers_should_have) and (powers_have<(letmax)+1) and (random_learn=true){
	    var newpow;newpow=0;
	    repeat(100){if (powers_have<powers_should_have)and (powers_have<(letmax)+1){
	        var tha;tha=floor(random(letmax))+1;
	        if (string_count(string(tha),obj_ini.spe[argument0,argument1])=0){
	            powers_have+=1;obj_ini.spe[argument0,argument1]+=string(let)+string(tha)+"|";
	        }
	    }}
	}


	if (powers_have<powers_should_have) and (powers_have<(letmax)+1) and (random_learn=false){
	    // Used to work like this.  I removed it because I was too lazy to have powers chance to be cast be based on experience.
	    // Should you wish to have powers be randomly learned simply change random_learn to true and write the rest of the code.
    
	    var newpow;newpow=0;
	    repeat(100){if (powers_have<powers_should_have) and (powers_have<(letmax)+1){
	        var tha;tha=powers_have;
	        if (string_count(string(tha),obj_ini.spe[argument0,argument1])=0){
	            powers_have+=1;obj_ini.spe[argument0,argument1]+=string(let)+string(tha)+"|";
	        }
	    }}
	}


	// show_message(string(obj_ini.role[argument0,argument1])+": "+string(obj_ini.spe[argument0,argument1]));


}
