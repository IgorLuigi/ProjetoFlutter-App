import 'package:app/app/database/entities/despesa.dart';
import 'package:flutter/material.dart';
import 'despesa_details_back.dart';

class DespesaDetails extends StatelessWidget {

  showModalError(BuildContext context){
    var alert = AlertDialog(
      title: Text('Alerta!'),
      content: Text('Não foi possível encontrar um aplicativo compatível'),
    );
    showDialog(
      context: context,
      builder: (BuildContext context){
        return alert;
      },
    );
  }

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
            padding: EdgeInsets.all(60),
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
                  trailing: Container(
                    width: width/4 ,
                    child: Row(
                      children: [
                        IconButton(
                          color: Colors.blue,
                          icon: Icon(Icons.calculate_rounded),
                          onPressed: (){
                            _back.launchLink(showModalError);
                          }
                        ),
                      ],
                    ),
                  ),
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