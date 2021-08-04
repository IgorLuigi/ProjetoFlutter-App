

import 'package:app/app/database/entities/receita.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ReceitaDetailsBack{
  BuildContext context; 
  Receita receita;
  
  ReceitaDetailsBack(this.context){
    receita = ModalRoute.of(context).settings.arguments;
  } 
   
  goToBack(){
    Navigator.of(context).pop();
  }

  _launchApp(String url, Function(BuildContext context) showModalError) async{
    await canLaunch(url) ? launch(url):showModalError(context);
  }

 launchLink(Function(BuildContext context) showModalError){
   _launchApp('http://www.calculadoraonline.com.br/basica', showModalError);
 }

}