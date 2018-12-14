function Validar(tela){
    
    var ret = true;
    
    switch(tela){
        case 1:
            if($("codempresa").val().trim() == ''){
                ret = false;
                $("#val_codempresa").show();
                $("#val_codempresa").html("Preencher campo obrigatório");
            }else{
                $("#val_codempresa").hide();
            }
            if($("matricula").val().trim() == ''){
                ret = false;
                $("#val_matricula").show();
                $("#val_matricula").html("Preencher campo obrigatório");
            }else{
                $("#val_matricula").hide();
            }
            if($("senha").val().trim() == ''){
                ret = false;
                $("#val_senha").show();
                $("#val_senha").html("Preencher campo obrigatório");
            }else{
                $("#val_senha").hide();
            }
            break;
    }
}

