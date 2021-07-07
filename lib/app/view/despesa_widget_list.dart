import 'package:app/app/database/entities/despesa.dart';
import 'package:app/app/database/sqlite/DAO/despesa_DAO_impl.dart';
import 'package:flutter/material.dart';


import '../my_app.dart';

class DespesaWidgetList extends StatelessWidget {
  final listadespesa = [
    {'descricao':'Lanche','valor':'6,00', 'data':'20/06/2021'},
    {'descricao':'Refrigerante','valor':'6,00', 'data':'20/06/2021'},
  ];

  Future<List<Despesa>>_buscar()async{
    return DespesaDAOImpl().find(); 
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _buscar(),
      builder: (context, futuro){
        if(futuro.hasData){
          List<Despesa>lista = futuro.data;
          return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Despesas'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.of(context).pushNamed(MyApp.DESPESA_FORM);
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: listadespesa.length,
        itemBuilder: (context, i){
          var receita = listadespesa[i];
          var listTile = ListTile(
            title: Text(receita['descricao']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                  Text(receita["data"]),
                  Text(receita["valor"]),
              ],
            ),
            trailing: Container(
              width: 100,
              child: Row(
                children: [
                  IconButton(icon: Icon(Icons.edit), onPressed: null),
                  IconButton(icon: Icon(Icons.delete), onPressed: null),
                ],
              )
            ),
            isThreeLine: true,
          );
          return listTile;
        },
      ),
    );
        }else{
          return Scaffold();
        }
      }
    );
  }
}