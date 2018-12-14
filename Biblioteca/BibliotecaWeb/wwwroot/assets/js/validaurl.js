var urlInput = {};

urlInput.keyPress = function (e) {
	var e = e || window.event;
	var key = e.charCode;
	if (key === undefined)
		key = e.keyCode;

	//maiusculas, minusculas, números e traço
	if ((key >= 65 && key <= 90) || (key >= 97 && key <= 122) || (key >= 48 && key <= 57) || (key == 45) || (key == 32))
		return true;

	//Não imprime letra
	if (key == 0)
		return true;

	return false;
}

urlInput.keyUp = function (txt) {
	txt.value = txt.value.replace(/[\s]/gi, '-'); //Transforma espaço em traço
	txt.value = txt.value.toLowerCase();
	txt.value = txt.value.replace(/[^a-z0-9--]/gi, ''); //Remove tudo que não for letras, números ou traço
	return true;
}