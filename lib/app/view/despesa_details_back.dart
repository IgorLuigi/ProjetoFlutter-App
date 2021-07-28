import 'package:app/app/database/entities/despesa.dart';
import 'package:flutter/material.dart';

class DespesaDetailsBack{
  BuildContext context; 
  Despesa despesa;

  DespesaDetailsBack(this.context){
    despesa = ModalRoute.of(context).settings.arguments;
  } 

  goToBack(){
    Navigator.of(context).pop();
  }

}