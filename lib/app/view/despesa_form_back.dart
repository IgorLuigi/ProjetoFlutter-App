
import 'package:app/app/database/entities/despesa.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part'despesa_form_back.g.dart';

class DespesaFormBack = _DespesaFormBack with _$DespesaFormBack;

abstract class _DespesaFormBack with Store{

  Despesa despesa;

  //diferenciar novo com a alteração 
  _DespesaFormBack(BuildContext context){
    var parameter = ModalRoute.of(context).settings.arguments;
    despesa = (parameter == null) ? Despesa():parameter;
  }


  //salvar


  //validações

}