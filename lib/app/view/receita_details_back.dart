

import 'package:app/app/database/entities/receita.dart';
import 'package:flutter/material.dart';

class ReceitaDetailsBack{
  BuildContext context; 
  Receita receita;
  
  ReceitaDetailsBack(this.context){
    receita = ModalRoute.of(context).settings.arguments;
  } 
   
  goToBack(){
    Navigator.of(context).pop();
  }

}