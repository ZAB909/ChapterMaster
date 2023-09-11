function scr_convert_company_to_string(company_number){
	var romanNumerals=scr_roman_numerals();
	var answer="";

	if(company_number < 0 || company_number > 10) {
		return "";	
	} else {
		answer = romanNumerals[company_number-1]+ "co.";
	}
	return answer;
}