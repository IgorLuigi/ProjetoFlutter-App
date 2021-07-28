
import 'package:app/app/view/despesa_details.dart';
import 'package:app/app/view/despesa_widget_form.dart';
import 'package:app/app/view/despesa_widget_list.dart';
import 'package:app/app/view/principal_page.dart';
import 'package:app/app/view/receita_details.dart';
import 'package:app/app/view/receita_widget_form.dart';
import 'package:app/app/view/receita_widget_list.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  static const HOME = '/';
  static const RECEITA_FORM = 'receita-widget-form';
  static const RECEITA_LIST = 'receita-widget-list';
  static const DESPESA_FORM = 'despesa-widget-form';
  static const DESPESA_LIST= 'despesa-widget-list';
  static const RECEITA_DETAILS = 'receita-details';
  static const DESPESA_DETAILS = 'despesa-details';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue, 
      ),
      routes: {
        HOME: (context) => Principal(),
        RECEITA_FORM: (context) => ReceitaWidgetForm(),
        RECEITA_LIST: (context) => ReceitaWidgetList(),
        DESPESA_FORM: (context) => DespesaWidgetForm(),
        DESPESA_LIST: (context) => DespesaWidgetList(),
        RECEITA_DETAILS: (context) => ReceitaDetails(),
        DESPESA_DETAILS: (context) => DespesaDetails(),
      },
    );
  }
}