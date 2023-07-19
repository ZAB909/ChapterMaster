// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_convert_company_to_string(company_number){
	if(company_number < 0 || company_number > 10) {
		return "";	
	}

	var answer;

	switch (company_number)
	{
		case 0:
			answer = "";
			break;
		case 1:
			answer = "1st co.";
			break;
		case 2:
			answer = "2nd co.";
			break;
		case 3:
			answer = "3rd co.";
			break;
		default:
			answer = string(company_number) + "th co.";
			break;
	}
	return answer;
}