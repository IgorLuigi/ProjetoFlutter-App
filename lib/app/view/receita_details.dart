import 'package:app/app/database/entities/receita.dart';
import 'package:app/app/view/receita_details_back.dart';
import 'package:flutter/material.dart';

class ReceitaDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var _back = ReceitaDetailsBack(context);
    Receita receita = _back.receita;

    return LayoutBuilder(
      builder:(BuildContext context, BoxConstraints constraints){
        var width = constraints.biggest.width;
        var height = constraints.biggest.width;  

        return Scaffold(
          backgroundColor: Color.fromRGBO(139, 0, 139, 0.8),
          body: ListView(
            children: [
              Center(
                child: Text('${receita.descricao}', style: TextStyle(fontSize: 30, backgroundColor: Colors.white),),
              ),
              Card(
                child: ListTile(
                  title: Text('Data:'),
                  subtitle: Text('${receita.data}'),
                ), 
              ),
              Card(
                child: ListTile(
                  title: Text('Valor:'),
                  subtitle: Text('${receita.valor}'),
                ), 
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: (){
              _back.goToBack();
            },
          ),
        );
      },
    );
  }
}