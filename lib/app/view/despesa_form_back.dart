
import 'package:app/app/database/entities/despesa.dart';
import 'package:app/app/domain/interfaces/services/despesa_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part'despesa_form_back.g.dart';

class DespesaFormBack = _DespesaFormBack with _$DespesaFormBack;

abstract class _DespesaFormBack with Store{
  Despesa despesa;
  var _service = GetIt.I.get<DespesaService>();  
  bool _descricaoIsValid;
  bool _dataIsValid;
  bool _valorIsValid;

  @action
  bool get isValid => _descricaoIsValid && _dataIsValid && _valorIsValid;
  

  //diferenciar novo com a alteração 
  _DespesaFormBack(BuildContext context){
    var parameter = ModalRoute.of(context).settings.arguments;
    despesa = (parameter == null) ? Despesa():parameter;
  }

  //salvar
  save() async {
    await _service.save(despesa);
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