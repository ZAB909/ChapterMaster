function scr_convert_company_to_string(company_num, possessive = false, flavour=false){
	var _company_num = company_num;
	var _suffixes = ["st", "nd", "rd", "th", "th", "th", "th", "th", "th", "th", "th"];
	var _flavours = ["Veteran", "Battle", "Battle", "Battle", "Battle", "Reserve", "Reserve", "Reserve", "Reserve", "Scout"];
	var _str_company = possessive ? "Company's" : "Company";

	if (_company_num < 1) || (_company_num > 10) {
		return "";	
	} else {
		var _flavour_text = flavour ? _flavours[_company_num - 1] : "";
		_company_num = string(_company_num) + _suffixes[_company_num - 1];
		var _converted_string = string_join(" ", _company_num, _flavour_text, _str_company);
		return _converted_string;
	}
}
