import 'package:app/app/database/entities/despesa.dart';
import 'package:flutter/material.dart';
import 'despesa_details_back.dart';

class DespesaDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var _back = DespesaDetailsBack(context);
    Despesa despesa = _back.despesa;

    return LayoutBuilder(
      builder:(BuildContext context, BoxConstraints constraints){
        var width = constraints.biggest.width;
        var height = constraints.biggest.width;  

        return Scaffold(
          backgroundColor: Color.fromRGBO(139, 0, 139, 0.8),
          body: ListView(
            children: [
              Center(
                child: Text('${despesa.descricao}', style: TextStyle(fontSize: 30, backgroundColor: Colors.white),),
              ),
              Card(
                child: ListTile(
                  title: Text('Data:'),
                  subtitle: Text('${despesa.data}'),
                ), 
              ),
              Card(
                child: ListTile(
                  title: Text('Valor:'),
                  subtitle: Text('${despesa.valor}'),
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