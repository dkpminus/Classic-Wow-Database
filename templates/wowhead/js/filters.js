<!--

// This is the check script

function filter_is_int(input){ 

  if((parseFloat(input.value) == parseInt(input.value)) && !isNaN(input.value)){

      input.className = 'smalltextbox2';

  } else { 

      input.className = 'smalltextbox2 q10';

      input.value = '';

  } 

}

function ci(a){

	if((parseFloat(a) == parseInt(a)) && !isNaN(a)){

			return true;

		}

		else{

			return false;

		}

}

function url_filter() {

    var data = new Array;

    if(location.search) {

    	var filterstring = location.search.replace("filter=", "");

    	var filterstring = filterstring.split('&');

        var pair = filterstring[1].split(';');

        for(var i = 0; i < pair.length; i ++) {

            var param = pair[i].split('=');

            data[i] = [param[0], param[1]];

            //data.i.name = param[0];

            //data.i.value = param[1];

        }

    }

    return data;

}

function url_filterz() {

	

	filters = url_filter();

		for(var i = 0; i < filters.length -1; i++) {

		switch(filters[i][0]){

			case 'na':

			case 'minl':

			case 'minrl':

			case 'maxl':

			case 'maxrl':

			document.forms["fi"][filters[i][0]].value = filters[i][1];

			break;

			case 'qu':

			case 'ty':

			case 'sl':

			filters[i][1] = filters[i][1].split(':');

			for(var n = 0; n < filters[i][1].length; n++) {

				for(var f = 0; f < document.forms["fi"][filters[i][0]].length; f++){

					if(document.forms["fi"][filters[i][0]][f].value == filters[i][1][n]){

						document.forms["fi"][filters[i][0]][f].selected = true;

					}

				}

			}

		}

	}

}

function filterz()

{

	// In textstring I gather the data that are finally written to the textarea.



	var filterstring = '';



	// First of all, have all the text boxes been filled in?

	// This part is treated in the normal page.

	// I put all boxes and their values in textstring

for (i = 1;i < 30;i++) {

	var box = document.forms['fi'].elements[i];

	if(box)
	{
		if (box.type != 'submit' && 
			box.type != 'button' && 
			box.value &&
			box.name != 'gb' &&
			box.name != 'qu' &&
			box.name != 'sl' &&
			box.name != 'ty' &&
			box.name != 'statTypA' && 
			box.name != 'statAA' && 
			box.name != 'statAB' &&
			box.name != 'statTypB' && 
			box.name != 'statBA' && 
			box.name != 'statBB' &&
			box.name != 'statTypC' && 
			box.name != 'statCA' && 
			box.name != 'statCB')
		{

			if(box.name != "na")
				filterstring += box.name + "=" + parseInt(box.value) + ";";
			else
				filterstring += box.name + "=" + box.value + ";";

		}
	}
}

if (document.forms['fi'].qu && document.forms['fi'].qu.selectedIndex != -1)
{
	filterstring += "qu=";

	for (i=0;i<document.forms['fi'].qu.length;i++) {

			if (document.forms['fi'].qu[i].selected) {

				filterstring += + document.forms['fi'].qu[i].value + ":";

			}
	}

	filterstring += ";";
}

if (document.forms['fi'].statTypA && document.forms['fi'].statTypA.selectedIndex != 0)
{
	console.log(document.forms['fi'].statTypA.selectedIndex);
	var min = 0;

	if(document.forms['fi'].statAA.value.length > 0) 
		min = document.forms['fi'].statAA.value;

	var max = 0;

	if(document.forms['fi'].statAB.value.length > 0) 
		max = document.forms['fi'].statAB.value;

	filterstring += "MOD_A="+document.forms['fi'].statTypA.value+":"+min+":"+max+";";
}

if (document.forms['fi'].statTypB && document.forms['fi'].statTypB.selectedIndex != 0)
{
	var min = 0;

	if(document.forms['fi'].statBA.value.length > 0) 
		min = document.forms['fi'].statBA.value;

	var max = 0;

	if(document.forms['fi'].statBB.value.length > 0) 
		max = document.forms['fi'].statBB.value;

	filterstring += "MOD_B="+document.forms['fi'].statTypB.value+":"+min+":"+max+";";
}

if (document.forms['fi'].statTypC && document.forms['fi'].statTypC.selectedIndex != 0)
{
	var min = 0;

	if(document.forms['fi'].statCA.value.length > 0) 
		min = document.forms['fi'].statCA.value;

	var max = 0;

	if(document.forms['fi'].statCB.value.length > 0) 
		max = document.forms['fi'].statCB.value;

	filterstring += "MOD_B="+document.forms['fi'].statTypB.value+":"+min+":"+max+";";
}

if (document.forms['fi'].sl && document.forms['fi'].sl.selectedIndex != -1)

{

	filterstring += "sl=";

for (i=0;i<document.forms['fi'].sl.length;i++) {

	if (document.forms['fi'].sl[i].selected) {

		filterstring += + document.forms['fi'].sl[i].value + ":";

}

}

	filterstring += ";";

}

if (document.forms['fi'].ty && document.forms['fi'].ty.selectedIndex != -1)

{

	filterstring += "ty=";

for (i=0;i<document.forms['fi'].ty.length;i++) {

	if (document.forms['fi'].ty[i].selected) {

		filterstring += + document.forms['fi'].ty[i].value + ":";

}

}

	filterstring += ";";

}

//selected_filters = [document.forms['fi'].qu, document.forms['fi'].sl, document.forms['fi'].ty];

//for (n in selected_filters){

//		if (n.selectedIndex != -1)

//{

//	filterstring += n.name + "=";

//for (i=0;i<n.length;i++) {

//	if (n[i].selected) {

//		filterstring += + i + ":";

//}

//}

//	filterstring += ";";

//}

//}

filterstring = filterstring.replace(/:;/gi, ";");

if (filterstring){

var brokenstring = window.location.search.split("&", 1);

window.location = "http://" + window.location.hostname + brokenstring[0] + "&filter="+filterstring;

}

//window.location =+ filterstring;

	// Get value of the 'Why' radio buttons.

//

//	user_input = ''

//	textstring += 'Why: ' + user_input + '\n';

//

//	// Get value of the 'How' select box.

//

//	user_input = document.example.refer.options[document.example.refer.selectedIndex].value

//	textstring += 'How: ' + user_input + '\n';

//

//	// See what checkboxes are checked. They are elements 9-12

//

//	textstring += 'More info: ';

//	for (i=9;i<13;i++) {

//		if (document.example.elements[i].checked) {

//			textstring += document.example.elements[i].name + ' ';

//		}

//	}

//

//	// Write textstring to the textarea.

//

//	document.forms['example'].output.value = textstring;

//	alert(textstring);

}

 -->