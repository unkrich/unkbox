function formSwitchTo(id) {
	if (id == 'sign_in') {
	    document.getElementById('sign_up').style = "display:none;";
	    document.getElementById('sign_in').style = "display:content;";
	} else {
	    document.getElementById('sign_in').style = "display:none;";
	    document.getElementById('sign_up').style = "display:content;";
	}
}