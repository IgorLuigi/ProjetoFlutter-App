
import 'package:app/app/database/entities/receita.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part'receita_form_back.g.dart';

class ReceitaFormBack = _ReceitaFormBack with _$ReceitaFormBack;

abstract class _ReceitaFormBack with Store{
  Receita receita;

  //diferenciar novo com a alteração 
  _ReceitaFormBack(BuildContext context){
    var parameter = ModalRoute.of(context).settings.arguments;
    receita = (parameter == null) ? Receita():parameter;
  }


  //salvar


  //validações

}