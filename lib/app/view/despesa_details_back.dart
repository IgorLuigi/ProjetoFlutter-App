import 'package:app/app/database/entities/despesa.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DespesaDetailsBack{
  BuildContext context; 
  Despesa despesa;

  DespesaDetailsBack(this.context){
    despesa = ModalRoute.of(context).settings.arguments;
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