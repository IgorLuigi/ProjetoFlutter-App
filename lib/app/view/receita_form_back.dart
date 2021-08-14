
import 'package:app/app/database/entities/receita.dart';
import 'package:app/app/domain/interfaces/services/receita_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';




class ReceitaFormBack {
  Receita receita;
  var _service = GetIt.I.get<ReceitaService>();  
  bool _descricaoIsValid = true;
  //bool _dataIsValid = true;
  //bool _valorIsValid = true;


  bool get isValid => _descricaoIsValid; //&& _dataIsValid && _valorIsValid;

  //diferenciar novo com a alteração 
  ReceitaFormBack(BuildContext context){
    var parameter = ModalRoute.of(context).settings.arguments;
    receita = (parameter == null) ? Receita():parameter;
  }


  //salvar
  save() async {
    await _service.save(receita);
  }

  //validações
  String validateDescricao(String descricao){
    try{
      _service.validateDescricao(descricao);
      _descricaoIsValid = true;
      return null;
    }
    catch(e){
      _descricaoIsValid = false;
      return e.toString();
    }
  }

  

  // String validateData(String data){
  //   try{ 
  //     _service.validateData(data);
  //     _dataIsValid = true;
  //     return null;
  //   },
  //   catch(e){
  //     _dataIsValid = false;
  //     return e;
  //   }
  // }

  // String validateValor(String valor){
  //   try{ 
  //     _service.validateValor(valor);
  //     _valorIsValid = true;
  //     return null;
  //   }
  //   catch(e){
  //     _valorIsValid = false;
  //     return e;
  //   }
  // }

}